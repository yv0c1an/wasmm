package org.dromara.wasm.online.service;

import org.dromara.wasm.online.domain.WasmOnline;
import org.dromara.wasm.online.domain.vo.WasmOnlineVo;
import org.dromara.wasm.online.domain.bo.WasmOnlineBo;
import org.dromara.common.mybatis.core.page.TableDataInfo;
import org.dromara.common.mybatis.core.page.PageQuery;

import java.util.Collection;
import java.util.List;

/**
 * 在线用户信息Service接口
 *
 * @author ruoyi
 */
public interface IWasmOnlineService {

    /**
     * 查询在线用户信息
     */
    WasmOnlineVo queryById(Integer id);

    /**
     * 查询在线用户信息列表
     */
    TableDataInfo<WasmOnlineVo> queryPageList(WasmOnlineBo bo, PageQuery pageQuery);

    /**
     * 查询在线用户信息列表
     */
    List<WasmOnlineVo> queryList(WasmOnlineBo bo);

    /**
     * 新增在线用户信息
     */
    Boolean insertByBo(WasmOnlineBo bo);

    /**
     * 修改在线用户信息
     */
    Boolean updateByBo(WasmOnlineBo bo);

    /**
     * 校验并批量删除在线用户信息信息
     */
    Boolean deleteWithValidByIds(Collection<Integer> ids, Boolean isValid);


    /**
     * 导入数据
     */
    String importWasmOnline(List<WasmOnlineVo> excelList);
}
