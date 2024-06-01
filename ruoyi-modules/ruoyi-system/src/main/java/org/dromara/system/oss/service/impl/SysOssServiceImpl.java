package org.dromara.system.oss.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.convert.Convert;
import cn.hutool.core.io.FileUtil;
import cn.hutool.core.io.IORuntimeException;
import cn.hutool.core.io.IoUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.http.HttpUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.dromara.common.core.config.RuoYiConfig;
import org.dromara.common.core.constant.CacheNames;
import org.dromara.common.core.constant.Constants;
import org.dromara.common.core.exception.ServiceException;
import org.dromara.common.core.service.OssService;
import org.dromara.common.core.utils.ServletUtils;
import org.dromara.common.core.utils.SpringUtils;
import org.dromara.common.core.utils.StreamUtils;
import org.dromara.common.core.utils.StringUtils;
import org.dromara.common.core.utils.file.FileUploadUtils;
import org.dromara.common.core.utils.file.FileUtils;
import org.dromara.common.core.utils.file.MimeTypeUtils;
import org.dromara.common.mybatis.core.page.PageQuery;
import org.dromara.common.mybatis.core.page.TableDataInfo;
import org.dromara.common.oss.constant.OssConstant;
import org.dromara.common.oss.core.OssClient;
import org.dromara.common.oss.entity.UploadResult;
import org.dromara.common.oss.enumd.AccessPolicyType;
import org.dromara.common.oss.factory.OssFactory;
import org.dromara.common.oss.properties.OssProperties;
import org.dromara.common.redis.utils.CacheUtils;
import org.dromara.system.oss.domain.SysOss;
import org.dromara.system.oss.domain.bo.SysOssBo;
import org.dromara.system.oss.domain.vo.SysOssVo;
import org.dromara.system.oss.mapper.SysOssMapper;
import org.dromara.system.oss.service.ISysOssService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 * 文件上传 服务层实现
 *
 * @author Lion Li
 */
@RequiredArgsConstructor
@Service
@Slf4j
public class SysOssServiceImpl implements ISysOssService, OssService {

    private final SysOssMapper baseMapper;

    @Override
    public TableDataInfo<SysOssVo> queryPageList(SysOssBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<SysOss> lqw = buildQueryWrapper(bo);
        Page<SysOssVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        List<SysOssVo> filterResult = StreamUtils.toList(result.getRecords(), this::matchingUrl);
        result.setRecords(filterResult);
        return TableDataInfo.build(result);
    }

    @Override
    public List<SysOssVo> listByIds(Collection<Long> ossIds) {
        List<SysOssVo> list = new ArrayList<>();
        for (Long id : ossIds) {
            SysOssVo vo = SpringUtils.getAopProxy(this).getById(id);
            if (ObjectUtil.isNotNull(vo)) {
                list.add(this.matchingUrl(vo));
            }
        }
        return list;
    }

    @Override
    public String selectUrlByIds(String ossIds) {
        List<String> list = new ArrayList<>();
        if (StringUtils.isBlank(ossIds)) {
            return StringUtils.EMPTY;
        }
        if (HttpUtil.isHttp(ossIds) || HttpUtil.isHttps(ossIds) || ossIds.contains(".")) {
            //说明是原始链接 直接返回
            return ossIds;
        }
        for (Long id : StringUtils.splitTo(ossIds, Convert::toLong)) {
            SysOssVo vo = SpringUtils.getAopProxy(this).getById(id);
            if (ObjectUtil.isNotNull(vo) && Constants.NORMAL.equals(vo.getStatus())) {
                //不为空且正常状态才返回 禁用的就不返回了
                list.add(this.matchingUrl(vo).getUrl());
            }
        }
        return String.join(StringUtils.SEPARATOR, list);
    }

    private LambdaQueryWrapper<SysOss> buildQueryWrapper(SysOssBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<SysOss> lqw = Wrappers.lambdaQuery();
        lqw.like(StringUtils.isNotBlank(bo.getFileName()), SysOss::getFileName, bo.getFileName());
        lqw.like(StringUtils.isNotBlank(bo.getOriginalName()), SysOss::getOriginalName, bo.getOriginalName());
        lqw.eq(StringUtils.isNotBlank(bo.getFileSuffix()), SysOss::getFileSuffix, bo.getFileSuffix());
        lqw.eq(StringUtils.isNotBlank(bo.getUrl()), SysOss::getUrl, bo.getUrl());
        lqw.between(params.get("beginCreateTime") != null && params.get("endCreateTime") != null,
            SysOss::getCreateTime, params.get("beginCreateTime"), params.get("endCreateTime"));
        lqw.eq(ObjectUtil.isNotNull(bo.getCreateBy()), SysOss::getCreateBy, bo.getCreateBy());
        lqw.eq(StringUtils.isNotBlank(bo.getStatus()), SysOss::getStatus, bo.getStatus());
        lqw.eq(StringUtils.isNotBlank(bo.getService()), SysOss::getService, bo.getService());
        return lqw;
    }

    @Cacheable(cacheNames = CacheNames.SYS_OSS, key = "#ossId")
    @Override
    public SysOssVo getById(Long ossId) {
        return baseMapper.selectVoById(ossId);
    }


    @Override
    public void download(Long ossId, HttpServletResponse response) throws IOException {
        SysOssVo sysOss = SpringUtils.getAopProxy(this).getById(ossId);
        if (ObjectUtil.isNull(sysOss)) {
            throw new ServiceException("文件数据不存在!");
        }
        FileUtils.setAttachmentResponseHeader(response, sysOss.getOriginalName());
        response.setContentType(MediaType.APPLICATION_OCTET_STREAM_VALUE + "; charset=UTF-8");
        OssClient storage = OssFactory.instance(sysOss.getService());
        try (InputStream inputStream = storage.getObjectContent(sysOss.getUrl())) {
            int available = inputStream.available();
            IoUtil.copy(inputStream, response.getOutputStream(), available);
            response.setContentLength(available);
        } catch (Exception e) {
            throw new ServiceException(e.getMessage());
        }
    }

    /**
     * 上传文件（先下载到本地再上传）
     *
     * @param url 在线文件地址
     * @param suffix 后缀
     * @return Oss信息
     */
    @Override
    public SysOssVo upload(String url, String suffix) {
        try {
            //下载文件到本地
            String path = RuoYiConfig.getUploadPath() + "/" + IdUtil.fastSimpleUUID() + "." + suffix;
            HttpUtil.downloadFile(url, FileUtil.file(path));
            File file = FileUtil.file(path);
            return upload(file);
        } catch (Exception ignored) {
        }
        return null;
    }



    /**
     * 上传文件
     *
     * @param file MultipartFile文件
     * @return Oss信息
     */
    @Override
    public SysOssVo upload(MultipartFile file) {
        String originalfileName = file.getOriginalFilename();
        String suffix = StringUtils.substring(originalfileName, originalfileName.lastIndexOf("."), originalfileName.length());
        OssClient storage = OssFactory.instance();
        UploadResult uploadResult;
        try {
            //上传方法
            uploadResult = storage.uploadSuffix(file.getBytes(), suffix, file.getContentType());
        } catch (IOException e) {
            throw new ServiceException(e.getMessage());
        }
        // 保存文件信息
        return buildResultEntity(originalfileName, suffix, storage.getConfigKey(), uploadResult);
    }

    /**
     * 上传文件
     *
     * @param file 文件
     * @return Oss信息
     */
    @Override
    public SysOssVo upload(File file) {
        String originalfileName = file.getName();
        String suffix = StringUtils.substring(originalfileName, originalfileName.lastIndexOf("."), originalfileName.length());
        OssClient storage = OssFactory.instance();
        UploadResult uploadResult = storage.uploadSuffix(file, suffix);
        // 保存文件信息
        return buildResultEntity(originalfileName, suffix, storage.getConfigKey(), uploadResult);
    }

    /**
     * 上传文件
     *
     * @param inputStream 文件流
     * @param suffix      后缀
     * @return Oss信息
     */
    @Override
    public SysOssVo upload(InputStream inputStream, String suffix) {
        OssClient storage = OssFactory.instance();
        UploadResult uploadResult = storage.uploadSuffix(inputStream, "." + suffix, null);
        // 保存文件信息
        return buildResultEntity(uploadResult.getFilename(), suffix, storage.getConfigKey(), uploadResult);
    }

    private SysOssVo buildResultEntity(String originalfileName, String suffix, String configKey, UploadResult uploadResult) {
        SysOss oss = new SysOss();
        oss.setUrl(uploadResult.getUrl());
        oss.setFileSuffix(suffix);
        oss.setFileName(uploadResult.getFilename());
        oss.setOriginalName(originalfileName);
        oss.setService(configKey);
        baseMapper.insert(oss);
        SysOssVo sysOssVo = BeanUtil.toBean(oss, SysOssVo.class);
        return this.matchingUrl(sysOssVo);
    }

    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if (isValid) {
            // 做一些业务上的校验,判断是否需要校验
        }
        List<SysOss> list = baseMapper.selectBatchIds(ids);
        for (SysOss sysOss : list) {
            try {
                OssClient storage = OssFactory.instance(sysOss.getService());
                storage.delete(sysOss.getUrl());
                //删除一下缓存数据
                CacheUtils.evict(CacheNames.SYS_OSS, sysOss.getOssId());
            } catch (Exception e) {
                log.info("删除时获取OssClient有误");
            }
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }

    /**
     * 匹配Url
     *
     * @param oss OSS对象
     * @return oss 匹配Url的OSS对象
     */
    private SysOssVo matchingUrl(SysOssVo oss) {
        if (Constants.LOCAL.equals(oss.getService())) {
            return oss;
        }
        try {
            OssClient storage = OssFactory.instance(oss.getService());
            // 仅修改桶类型为 private 的URL，临时URL时长为120s
            if (AccessPolicyType.PRIVATE == storage.getAccessPolicy()) {
                oss.setUrl(storage.getPrivateUrl(oss.getFileName(), 120));
            }
        } catch (Exception e) {
            System.out.println(oss.getUrl() + "获取OssClient有误");
        }
        return oss;
    }

    /**
     * 修改ossId对应的状态
     */
    @Override
    public int updateFileStatus(SysOssBo bo) {
        int row = baseMapper.update(null, new LambdaUpdateWrapper<SysOss>()
            .eq(SysOss::getOssId, bo.getOssId())
            .set(SysOss::getStatus, bo.getStatus()));
        if (row > 0) {
            //删除一下缓存数据
            CacheUtils.evict(CacheNames.SYS_OSS, bo.getOssId());
        }
        return row;
    }

    /**
     * 上传字节数组
     */
    @Override
    public SysOss uploadBytes(byte[] bytes, String fileName) {
        String suffix = StringUtils.substring(fileName, fileName.lastIndexOf("."), fileName.length());
        //获取OssClient （创建实例需要从缓存或数据拿到configKey）
        OssClient storage = OssFactory.instance();
        UploadResult uploadResult;
        uploadResult = storage.uploadSuffix(bytes, suffix, MimeTypeUtils.IMAGE_JPEG);
        // 保存文件信息
        SysOss oss = new SysOss();
        oss.setUrl(uploadResult.getUrl());
        oss.setFileSuffix(suffix);
        oss.setFileName(uploadResult.getFilename());
        oss.setOriginalName(fileName);
        oss.setService(storage.getConfigKey());
        baseMapper.insert(oss);
        return oss;
    }
}
