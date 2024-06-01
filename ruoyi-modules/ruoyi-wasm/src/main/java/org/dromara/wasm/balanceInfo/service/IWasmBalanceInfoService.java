package org.dromara.wasm.balanceInfo.service;

import org.dromara.wasm.balanceInfo.domain.WasmBalanceInfo;
import org.dromara.wasm.balanceInfo.domain.vo.WasmBalanceInfoVo;
import org.dromara.wasm.balanceInfo.domain.bo.WasmBalanceInfoBo;
import org.dromara.common.mybatis.core.page.TableDataInfo;
import org.dromara.common.mybatis.core.page.PageQuery;

import java.util.Collection;
import java.util.List;

/**
 * 余额信息Service接口
 *
 * @author ruoyi
 */
public interface IWasmBalanceInfoService {

    /**
     * 查询余额信息
     */
    WasmBalanceInfoVo queryById(Integer id);

    /**
     * 查询余额信息列表
     */
    TableDataInfo<WasmBalanceInfoVo> queryPageList(WasmBalanceInfoBo bo, PageQuery pageQuery);

    /**
     * 查询余额信息列表
     */
    List<WasmBalanceInfoVo> queryList(WasmBalanceInfoBo bo);

    /**
     * 新增余额信息
     */
    Boolean insertByBo(WasmBalanceInfoBo bo);

    /**
     * 修改余额信息
     */
    Boolean updateByBo(WasmBalanceInfoBo bo);

    Boolean updateByAddressAndCoin(String address, String coin, WasmBalanceInfoBo bo);

    /**
     * 校验并批量删除余额信息信息
     */
    Boolean deleteWithValidByIds(Collection<Integer> ids, Boolean isValid);


    /**
     * 导入数据
     */
    String importWasmBalanceInfo(List<WasmBalanceInfoVo> excelList);
}
