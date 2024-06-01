package org.dromara.wasm.notices.service;

import org.dromara.wasm.notices.domain.WasmNotices;
import org.dromara.wasm.notices.domain.vo.WasmNoticesVo;
import org.dromara.wasm.notices.domain.bo.WasmNoticesBo;
import org.dromara.common.mybatis.core.page.TableDataInfo;
import org.dromara.common.mybatis.core.page.PageQuery;

import java.util.Collection;
import java.util.List;

/**
 * 通知公告Service接口
 *
 * @author ruoyi
 */
public interface IWasmNoticesService {

    /**
     * 查询通知公告
     */
    WasmNoticesVo queryById(Integer id);

    /**
     * 查询通知公告列表
     */
    TableDataInfo<WasmNoticesVo> queryPageList(WasmNoticesBo bo, PageQuery pageQuery);

    /**
     * 查询通知公告列表
     */
    List<WasmNoticesVo> queryList(WasmNoticesBo bo);

    /**
     * 新增通知公告
     */
    Boolean insertByBo(WasmNoticesBo bo);

    /**
     * 修改通知公告
     */
    Boolean updateByBo(WasmNoticesBo bo);

    /**
     * 校验并批量删除通知公告信息
     */
    Boolean deleteWithValidByIds(Collection<Integer> ids, Boolean isValid);


    /**
     * 导入数据
     */
    String importWasmNotices(List<WasmNoticesVo> excelList);
}
