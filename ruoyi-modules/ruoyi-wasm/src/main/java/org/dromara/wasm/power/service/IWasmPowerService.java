package org.dromara.wasm.power.service;

import org.dromara.wasm.power.domain.WasmPower;
import org.dromara.wasm.power.domain.vo.WasmPowerVo;
import org.dromara.wasm.power.domain.bo.WasmPowerBo;
import org.dromara.common.mybatis.core.page.TableDataInfo;
import org.dromara.common.mybatis.core.page.PageQuery;

import java.util.Collection;
import java.util.List;

/**
 * 挖矿收益设置Service接口
 *
 * @author ruoyi
 */
public interface IWasmPowerService {

    /**
     * 查询挖矿收益设置
     */
    WasmPowerVo queryById(Integer id);

    /**
     * 查询挖矿收益设置列表
     */
    TableDataInfo<WasmPowerVo> queryPageList(WasmPowerBo bo, PageQuery pageQuery);

    /**
     * 查询挖矿收益设置列表
     */
    List<WasmPowerVo> queryList(WasmPowerBo bo);

    /**
     * 新增挖矿收益设置
     */
    Boolean insertByBo(WasmPowerBo bo);

    /**
     * 修改挖矿收益设置
     */
    Boolean updateByBo(WasmPowerBo bo);

    /**
     * 校验并批量删除挖矿收益设置信息
     */
    Boolean deleteWithValidByIds(Collection<Integer> ids, Boolean isValid);


    /**
     * 导入数据
     */
    String importWasmPower(List<WasmPowerVo> excelList);
}
