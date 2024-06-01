package org.dromara.wasm.exchangeInfo.service;

import org.dromara.wasm.exchangeInfo.domain.WasmExchangeInfo;
import org.dromara.wasm.exchangeInfo.domain.vo.WasmExchangeInfoVo;
import org.dromara.wasm.exchangeInfo.domain.bo.WasmExchangeInfoBo;
import org.dromara.common.mybatis.core.page.TableDataInfo;
import org.dromara.common.mybatis.core.page.PageQuery;

import java.util.Collection;
import java.util.List;

/**
 * 交易记录Service接口
 *
 * @author ruoyi
 */
public interface IWasmExchangeInfoService {

    /**
     * 查询交易记录
     */
    WasmExchangeInfoVo queryById(Integer id);

    /**
     * 查询交易记录列表
     */
    TableDataInfo<WasmExchangeInfoVo> queryPageList(WasmExchangeInfoBo bo, PageQuery pageQuery);

    /**
     * 查询交易记录列表
     */
    List<WasmExchangeInfoVo> queryList(WasmExchangeInfoBo bo);

    /**
     * 新增交易记录
     */
    Boolean insertByBo(WasmExchangeInfoBo bo);

    /**
     * 修改交易记录
     */
    Boolean updateByBo(WasmExchangeInfoBo bo);

    /**
     * 校验并批量删除交易记录信息
     */
    Boolean deleteWithValidByIds(Collection<Integer> ids, Boolean isValid);


    /**
     * 导入数据
     */
    String importWasmExchangeInfo(List<WasmExchangeInfoVo> excelList);
}
