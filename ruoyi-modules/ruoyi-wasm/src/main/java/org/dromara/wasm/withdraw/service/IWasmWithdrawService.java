package org.dromara.wasm.withdraw.service;

import org.dromara.wasm.withdraw.domain.WasmWithdraw;
import org.dromara.wasm.withdraw.domain.vo.WasmWithdrawVo;
import org.dromara.wasm.withdraw.domain.bo.WasmWithdrawBo;
import org.dromara.common.mybatis.core.page.TableDataInfo;
import org.dromara.common.mybatis.core.page.PageQuery;

import java.util.Collection;
import java.util.List;

/**
 * 提现Service接口
 *
 * @author ruoyi
 */
public interface IWasmWithdrawService {

    /**
     * 查询提现
     */
    WasmWithdrawVo queryById(Long id);

    /**
     * 查询提现列表
     */
    TableDataInfo<WasmWithdrawVo> queryPageList(WasmWithdrawBo bo, PageQuery pageQuery);

    /**
     * 查询提现列表
     */
    List<WasmWithdrawVo> queryList(WasmWithdrawBo bo);

    /**
     * 新增提现
     */
    Boolean insertByBo(WasmWithdrawBo bo);

    /**
     * 修改提现
     */
    Boolean updateByBo(WasmWithdrawBo bo);

    /**
     * 校验并批量删除提现信息
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);


    /**
     * 导入数据
     */
    String importWasmWithdraw(List<WasmWithdrawVo> excelList);
}
