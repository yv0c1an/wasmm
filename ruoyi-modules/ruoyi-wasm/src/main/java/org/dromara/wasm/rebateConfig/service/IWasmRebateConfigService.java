package org.dromara.wasm.rebateConfig.service;

import org.dromara.wasm.rebateConfig.domain.WasmRebateConfig;
import org.dromara.wasm.rebateConfig.domain.vo.WasmRebateConfigVo;
import org.dromara.wasm.rebateConfig.domain.bo.WasmRebateConfigBo;
import org.dromara.common.mybatis.core.page.TableDataInfo;
import org.dromara.common.mybatis.core.page.PageQuery;

import java.util.Collection;
import java.util.List;

/**
 * 返利配置Service接口
 *
 * @author ruoyi
 */
public interface IWasmRebateConfigService {

    /**
     * 查询返利配置
     */
    WasmRebateConfigVo queryById(Integer id);

    /**
     * 查询返利配置列表
     */
    TableDataInfo<WasmRebateConfigVo> queryPageList(WasmRebateConfigBo bo, PageQuery pageQuery);

    /**
     * 查询返利配置列表
     */
    List<WasmRebateConfigVo> queryList(WasmRebateConfigBo bo);

    /**
     * 新增返利配置
     */
    Boolean insertByBo(WasmRebateConfigBo bo);

    /**
     * 修改返利配置
     */
    Boolean updateByBo(WasmRebateConfigBo bo);

    /**
     * 校验并批量删除返利配置信息
     */
    Boolean deleteWithValidByIds(Collection<Integer> ids, Boolean isValid);


    /**
     * 导入数据
     */
    String importWasmRebateConfig(List<WasmRebateConfigVo> excelList);
}
