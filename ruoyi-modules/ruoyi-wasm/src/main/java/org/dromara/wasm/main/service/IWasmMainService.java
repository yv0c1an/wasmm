package org.dromara.wasm.main.service;

import org.dromara.wasm.main.domain.WasmMain;
import org.dromara.wasm.main.domain.vo.WasmMainVo;
import org.dromara.wasm.main.domain.bo.WasmMainBo;
import org.dromara.common.mybatis.core.page.TableDataInfo;
import org.dromara.common.mybatis.core.page.PageQuery;

import java.util.Collection;
import java.util.List;

/**
 * 系统核心配置Service接口
 *
 * @author ruoyi
 */
public interface IWasmMainService {

    /**
     * 查询系统核心配置
     */
    WasmMainVo queryById(Integer id);

    /**
     * 查询系统核心配置列表
     */
    TableDataInfo<WasmMainVo> queryPageList(WasmMainBo bo, PageQuery pageQuery);

    /**
     * 查询系统核心配置列表
     */
    List<WasmMainVo> queryList(WasmMainBo bo);

    /**
     * 新增系统核心配置
     */
    Boolean insertByBo(WasmMainBo bo);

    /**
     * 修改系统核心配置
     */
    Boolean updateByBo(WasmMainBo bo);

    /**
     * 校验并批量删除系统核心配置信息
     */
    Boolean deleteWithValidByIds(Collection<Integer> ids, Boolean isValid);


    /**
     * 导入数据
     */
    String importWasmMain(List<WasmMainVo> excelList);
}
