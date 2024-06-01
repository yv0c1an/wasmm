package org.dromara.wasm.profits.service;

import org.dromara.wasm.profits.domain.WasmProfits;
import org.dromara.wasm.profits.domain.vo.WasmProfitsVo;
import org.dromara.wasm.profits.domain.bo.WasmProfitsBo;
import org.dromara.common.mybatis.core.page.TableDataInfo;
import org.dromara.common.mybatis.core.page.PageQuery;

import java.util.Collection;
import java.util.List;

/**
 * 利润记录Service接口
 *
 * @author ruoyi
 */
public interface IWasmProfitsService {

    /**
     * 查询利润记录
     */
    WasmProfitsVo queryById(Integer id);

    /**
     * 查询利润记录列表
     */
    TableDataInfo<WasmProfitsVo> queryPageList(WasmProfitsBo bo, PageQuery pageQuery);

    /**
     * 查询利润记录列表
     */
    List<WasmProfitsVo> queryList(WasmProfitsBo bo);

    /**
     * 新增利润记录
     */
    Boolean insertByBo(WasmProfitsBo bo);

    /**
     * 修改利润记录
     */
    Boolean updateByBo(WasmProfitsBo bo);

    /**
     * 校验并批量删除利润记录信息
     */
    Boolean deleteWithValidByIds(Collection<Integer> ids, Boolean isValid);


    /**
     * 导入数据
     */
    String importWasmProfits(List<WasmProfitsVo> excelList);
}
