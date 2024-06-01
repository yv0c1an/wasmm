package org.dromara.common.oss.core;

import cn.hutool.core.io.FileUtil;
import cn.hutool.core.io.IoUtil;
import cn.hutool.core.net.NetUtil;
import cn.hutool.core.util.IdUtil;
import com.amazonaws.ClientConfiguration;
import com.amazonaws.HttpMethod;
import com.amazonaws.Protocol;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSCredentialsProvider;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.client.builder.AwsClientBuilder;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.*;
import lombok.Getter;
import org.dromara.common.core.config.RuoYiConfig;
import org.dromara.common.core.constant.Constants;
import org.dromara.common.core.utils.DateUtils;
import org.dromara.common.core.utils.ServletUtils;
import org.dromara.common.core.utils.SpringUtils;
import org.dromara.common.core.utils.StringUtils;
import org.dromara.common.core.utils.file.FileUploadUtils;
import org.dromara.common.core.utils.file.FileUtils;
import org.dromara.common.oss.constant.OssConstant;
import org.dromara.common.oss.entity.UploadResult;
import org.dromara.common.oss.enumd.AccessPolicyType;
import org.dromara.common.oss.enumd.PolicyType;
import org.dromara.common.oss.exception.OssException;
import org.dromara.common.oss.properties.OssProperties;

import javax.servlet.http.HttpServletRequest;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.InputStream;
import java.net.URL;
import java.util.Date;

/**
 * S3 存储协议 所有兼容S3协议的云厂商均支持
 * 阿里云 腾讯云 七牛云 minio
 *
 * @author Lion Li
 */
public class OssClient {

    @Getter
    private final String configKey;

    private final OssProperties properties;

    private final AmazonS3 client;

    public OssClient(String configKey, OssProperties ossProperties) {
        this.configKey = configKey;
        this.properties = ossProperties;
        //如果是local 代表是本地上传 则设置client为null
        if (Constants.LOCAL.equals(this.configKey)) {
            this.client = null;
            return;
        }
        try {
            AwsClientBuilder.EndpointConfiguration endpointConfig =
                new AwsClientBuilder.EndpointConfiguration(properties.getEndpoint(), properties.getRegion());

            AWSCredentials credentials = new BasicAWSCredentials(properties.getAccessKey(), properties.getSecretKey());
            AWSCredentialsProvider credentialsProvider = new AWSStaticCredentialsProvider(credentials);
            ClientConfiguration clientConfig = new ClientConfiguration();
            if (OssConstant.IS_HTTPS.equals(properties.getIsHttps())) {
                clientConfig.setProtocol(Protocol.HTTPS);
            } else {
                clientConfig.setProtocol(Protocol.HTTP);
            }
            AmazonS3ClientBuilder build = AmazonS3Client.builder()
                .withEndpointConfiguration(endpointConfig)
                .withClientConfiguration(clientConfig)
                .withCredentials(credentialsProvider)
                .disableChunkedEncoding();
            if (!StringUtils.containsAny(properties.getEndpoint(), OssConstant.CLOUD_SERVICE)) {
                // minio 使用https限制使用域名访问 需要此配置 站点填域名
                build.enablePathStyleAccess();
            }
            this.client = build.build();

            createBucket();
        } catch (Exception e) {
            if (e instanceof OssException) {
                throw e;
            }
            throw new OssException("配置错误! 请检查系统配置:[" + e.getMessage() + "]");
        }
    }

    public void createBucket() {
        try {
            //本地上传不需要创建bucket client为null
            if (Constants.LOCAL.equals(this.configKey)) {
                return;
            }
            String bucketName = properties.getBucketName();
            if (client.doesBucketExistV2(bucketName)) {
                return;
            }
            CreateBucketRequest createBucketRequest = new CreateBucketRequest(bucketName);
            AccessPolicyType accessPolicy = getAccessPolicy();
            createBucketRequest.setCannedAcl(accessPolicy.getAcl());
            client.createBucket(createBucketRequest);
            client.setBucketPolicy(bucketName, getPolicy(bucketName, accessPolicy.getPolicyType()));
        } catch (Exception e) {
            throw new OssException("创建Bucket失败, 请核对配置信息:[" + e.getMessage() + "]");
        }
    }

    public UploadResult upload(byte[] data, String path, String contentType) {
        return upload(new ByteArrayInputStream(data), path, contentType);
    }

    public UploadResult upload(InputStream inputStream, String path, String contentType) {
        if (!(inputStream instanceof ByteArrayInputStream)) {
            inputStream = new ByteArrayInputStream(IoUtil.readBytes(inputStream));
        }
        try {
            //本地上传
            if (Constants.LOCAL.equals(this.configKey)) {
                return localUploadSuffix(inputStream, path, contentType);
            }
            //为云上传
            ObjectMetadata metadata = new ObjectMetadata();
            metadata.setContentType(contentType);
            metadata.setContentLength(inputStream.available());
            PutObjectRequest putObjectRequest = new PutObjectRequest(properties.getBucketName(), path, inputStream, metadata);
            // 设置上传对象的 Acl 为公共读
            putObjectRequest.setCannedAcl(getAccessPolicy().getAcl());
            client.putObject(putObjectRequest);
        } catch (Exception e) {
            throw new OssException("上传文件失败，请检查配置信息:[" + e.getMessage() + "]");
        }
        return UploadResult.builder().url(getUrl() + "/" + path).filename(path).build();
    }

    public UploadResult upload(File file, String path) {
        try {
            if (Constants.LOCAL.equals(this.configKey)) {
                return localUploadSuffix(FileUtil.getInputStream(file), path, null);
            }
            PutObjectRequest putObjectRequest = new PutObjectRequest(properties.getBucketName(), path, file);
            // 设置上传对象的 Acl 为公共读
            putObjectRequest.setCannedAcl(getAccessPolicy().getAcl());
            client.putObject(putObjectRequest);
        } catch (Exception e) {
            throw new OssException("上传文件失败，请检查配置信息:[" + e.getMessage() + "]");
        }
        return UploadResult.builder().url(getUrl() + "/" + path).filename(path).build();
    }

    public void delete(String path) {
        path = path.replace(getUrl() + "/", "");
        try {
            if (Constants.LOCAL.equals(this.configKey)) {
                //本地删除
                FileUtils.del(RuoYiConfig.getProfile() + "/" + path.substring(8));
                return;
            }
            client.deleteObject(properties.getBucketName(), path);
        } catch (Exception e) {
            throw new OssException("删除文件失败，请检查配置信息:[" + e.getMessage() + "]");
        }
    }

    public UploadResult uploadSuffix(byte[] data, String suffix, String contentType) {
        return upload(data, getPath(properties.getPrefix(), suffix), contentType);
    }

    public UploadResult uploadSuffix(InputStream inputStream, String suffix, String contentType) {
        return upload(inputStream, getPath(properties.getPrefix(), suffix), contentType);
    }

    public UploadResult uploadSuffix(File file, String suffix) {
        return upload(file, getPath(properties.getPrefix(), suffix));
    }

    /**
     * 获取文件元数据
     *
     * @param path 完整文件路径
     */
    public ObjectMetadata getObjectMetadata(String path) {
        if (Constants.LOCAL.equals(this.configKey)) {
            return null;
        }
        path = path.replace(getUrl() + "/", "");
        S3Object object = client.getObject(properties.getBucketName(), path);
        return object.getObjectMetadata();
    }

    /**
     * 获取文件流
     */
    public InputStream getObjectContent(String path) {
        path = path.replace(getUrl() + "/", "");
        if (Constants.LOCAL.equals(this.configKey)) {
            return FileUtil.getInputStream(RuoYiConfig.getProfile() + "/" + path.substring(8));
        }
        S3Object object = client.getObject(properties.getBucketName(), path);
        return object.getObjectContent();
    }

    /**
     * 获取文件路径前部分
     */
    public String getUrl() {
        if (Constants.LOCAL.equals(this.configKey)) {
            if (!Constants.PROD.equals(SpringUtils.getActiveProfile()) || StringUtils.isBlank(properties.getDomain())) {
                //非生产环境则返回本地路径
                return Constants.HTTP + NetUtil.getLocalhostStr() + ":" + SpringUtils.getProperty("server.port");
            }
            //生产环境判断配置有域名则把ip替换为域名，没有则返回ip，有域名判断是否需要https
            HttpServletRequest request = ServletUtils.getRequest();
            StringBuffer url = request.getRequestURL();
            String contextPath = request.getServletContext().getContextPath();
            String res = url.delete(url.length() - request.getRequestURI().length(), url.length()).append(contextPath).toString();
            //有域名
            if (OssConstant.IS_HTTPS.equals(properties.getIsHttps())) {
                //需要https
                return res.replace(Constants.HTTP, Constants.HTTPS).replace(request.getServerName(), properties.getDomain());
            } else {
                //不需要https
                return res.replace(request.getServerName(), properties.getDomain());
            }
        }
        String domain = properties.getDomain();
        String endpoint = properties.getEndpoint();
        String header = OssConstant.IS_HTTPS.equals(properties.getIsHttps()) ? Constants.HTTPS : Constants.HTTP;
        // 云服务商直接返回
        if (StringUtils.containsAny(endpoint, OssConstant.CLOUD_SERVICE)) {
            if (StringUtils.isNotBlank(domain)) {
                return header + domain;
            }
            return header + properties.getBucketName() + "." + endpoint;
        }
        // minio 单独处理
        if (StringUtils.isNotBlank(domain)) {
            return header + domain + "/" + properties.getBucketName();
        }
        return header + endpoint + "/" + properties.getBucketName();
    }


    /**
     * 获取文件路径
     *
     * @param prefix 目录前缀
     * @param suffix 文件后缀
     * @return 文件路径
     */
    public String getPath(String prefix, String suffix) {
        // 生成uuid
        String uuid = IdUtil.fastSimpleUUID();
        // 文件路径
        String path = DateUtils.datePath() + "/" + uuid;
        if (StringUtils.isNotBlank(prefix)) {
            path = prefix + "/" + path;
        }
        return path + suffix;
    }


    /**
     * 获取私有URL链接
     *
     * @param objectKey 对象KEY
     * @param second    授权时间
     * @return 私有URL链接
     */
    public String getPrivateUrl(String objectKey, Integer second) {
        GeneratePresignedUrlRequest generatePresignedUrlRequest =
            new GeneratePresignedUrlRequest(properties.getBucketName(), objectKey)
                .withMethod(HttpMethod.GET)
                .withExpiration(new Date(System.currentTimeMillis() + 1000L * second));
        URL url = client.generatePresignedUrl(generatePresignedUrlRequest);
        return url.toString();
    }

    /**
     * 检查配置是否相同
     */
    public boolean checkPropertiesSame(OssProperties properties) {
        return this.properties.equals(properties);
    }

    /**
     * 获取当前桶权限类型
     *
     * @return 当前桶权限类型code
     */
    public AccessPolicyType getAccessPolicy() {
        return AccessPolicyType.getByType(properties.getAccessPolicy());
    }

    /**
     * 获取策略
     *
     * @param bucketName 桶名称
     * @param policyType 策略类型
     * @return 策略
     */
    private static String getPolicy(String bucketName, PolicyType policyType) {
        StringBuilder builder = new StringBuilder();
        builder.append("{\n\"Statement\": [\n{\n\"Action\": [\n");
        if (policyType == PolicyType.WRITE) {
            builder.append("\"s3:GetBucketLocation\",\n\"s3:ListBucketMultipartUploads\"\n");
        } else if (policyType == PolicyType.READ_WRITE) {
            builder.append("\"s3:GetBucketLocation\",\n\"s3:ListBucket\",\n\"s3:ListBucketMultipartUploads\"\n");
        } else {
            builder.append("\"s3:GetBucketLocation\"\n");
        }
        builder.append("],\n\"Effect\": \"Allow\",\n\"Principal\": \"*\",\n\"Resource\": \"arn:aws:s3:::");
        builder.append(bucketName);
        builder.append("\"\n},\n");
        if (policyType == PolicyType.READ) {
            builder.append("{\n\"Action\": [\n\"s3:ListBucket\"\n],\n\"Effect\": \"Deny\",\n\"Principal\": \"*\",\n\"Resource\": \"arn:aws:s3:::");
            builder.append(bucketName);
            builder.append("\"\n},\n");
        }
        builder.append("{\n\"Action\": ");
        switch (policyType) {
            case WRITE:
                builder.append("[\n\"s3:AbortMultipartUpload\",\n\"s3:DeleteObject\",\n\"s3:ListMultipartUploadParts\",\n\"s3:PutObject\"\n],\n");
                break;
            case READ_WRITE:
                builder.append("[\n\"s3:AbortMultipartUpload\",\n\"s3:DeleteObject\",\n\"s3:GetObject\",\n\"s3:ListMultipartUploadParts\",\n\"s3:PutObject\"\n],\n");
                break;
            default:
                builder.append("\"s3:GetObject\",\n");
                break;
        }
        builder.append("\"Effect\": \"Allow\",\n\"Principal\": \"*\",\n\"Resource\": \"arn:aws:s3:::");
        builder.append(bucketName);
        builder.append("/*\"\n}\n],\n\"Version\": \"2012-10-17\"\n}\n");
        return builder.toString();
    }


    /**
     * 本地上传方法
     *
     * @param inputStream 文件流
     * @param path        文件路径
     * @param contentType 文件类型
     * @return 上传结果
     */
    private UploadResult localUploadSuffix(InputStream inputStream, String path, String contentType) {
        // 声明文件名
        String fileName = FileUploadUtils.upload(inputStream, path, contentType);
        String url = getUrl() + fileName;
        return UploadResult.builder().filename(fileName).url(url).build();
    }


}
