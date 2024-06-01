package org.dromara.system.oss.service;

import org.dromara.common.mybatis.core.page.PageQuery;
import org.dromara.common.mybatis.core.page.TableDataInfo;
import org.dromara.system.oss.domain.SysOss;
import org.dromara.system.oss.domain.bo.SysOssBo;
import org.dromara.system.oss.domain.vo.SysOssVo;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Collection;
import java.util.List;

/**
 * 文件上传 服务层
 *
 * @author Lion Li
 */
public interface ISysOssService {

    /**
     * 查询分页
     *
     * @param sysOss    SysOssBo
     * @param pageQuery PageQuery
     * @return 分页结果
     */
    TableDataInfo<SysOssVo> queryPageList(SysOssBo sysOss, PageQuery pageQuery);

    /**
     * 查询分页
     *
     * @param ossIds ossIds
     * @return SysOssVo数组
     */
    List<SysOssVo> listByIds(Collection<Long> ossIds);

    /**
     * 根据ossId查询sysOss
     *
     * @param ossId ossId
     * @return SysOss
     */
    SysOssVo getById(Long ossId);

    /**
     * 上传
     *
     * @param url    图片地址
     * @param suffix 后缀
     * @return SysOss
     */
    SysOssVo upload(String url, String suffix);

    /**
     * 上传
     *
     * @param file MultipartFile
     * @return SysOss
     */
    SysOssVo upload(MultipartFile file);

    /**
     * 上传
     *
     * @param file File
     * @return SysOss
     */
    SysOssVo upload(File file);

    /**
     * 上传
     *
     * @param inputStream 文件流
     * @param suffix      后缀
     * @return SysOss
     */
    SysOssVo upload(InputStream inputStream, String suffix);

    /**
     * 下载
     *
     * @param ossId    ossId
     * @param response HttpServletResponse
     * @throws IOException IOException
     */
    void download(Long ossId, HttpServletResponse response) throws IOException;

    /**
     * 根据id列表删除
     *
     * @param ids     ids
     * @param isValid 是否校验
     * @return 是否删除成功
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);

    /**
     * 更新文件状态
     *
     * @param bo SysOssBo
     * @return 成功数
     */
    int updateFileStatus(SysOssBo bo);

    /**
     * 上传字节数组
     */
    SysOss uploadBytes(byte[] bytes, String fileName);
}
