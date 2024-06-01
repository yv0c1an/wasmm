package org.dromara.system.errorLog.service;


import org.dromara.common.mybatis.core.page.PageQuery;
import org.dromara.common.mybatis.core.page.TableDataInfo;
import org.dromara.system.errorLog.domain.bo.ErrorLogBo;
import org.dromara.system.errorLog.domain.vo.ErrorLogVo;

import java.util.Collection;
import java.util.List;

/**
 * 错误日志Service接口
 *
 * @author ruoyi
 */
public interface IErrorLogService {

    /**
     * 查询错误日志
     */
    ErrorLogVo queryById(Long id);

    /**
     * 查询错误日志列表
     */
    TableDataInfo<ErrorLogVo> queryPageList(ErrorLogBo bo, PageQuery pageQuery);

    /**
     * 查询错误日志列表
     */
    List<ErrorLogVo> queryList(ErrorLogBo bo);

    /**
     * 修改错误日志
     */
    Boolean insertByBo(ErrorLogBo bo);

    /**
     * 修改错误日志
     */
    Boolean updateByBo(ErrorLogBo bo);

    /**
     * 校验并批量删除错误日志信息
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);


    /**
     * 导入数据
     */
    String importErrorLog(List<ErrorLogVo> excelList);

}
