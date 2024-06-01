package org.dromara.wasm.addressInfo.service;

import org.dromara.wasm.addressInfo.domain.WasmAddressInfo;
import org.dromara.wasm.addressInfo.domain.vo.WasmAddressInfoVo;
import org.dromara.wasm.addressInfo.domain.bo.WasmAddressInfoBo;
import org.dromara.common.mybatis.core.page.TableDataInfo;
import org.dromara.common.mybatis.core.page.PageQuery;

import java.util.Collection;
import java.util.List;

/**
 * 地址信息Service接口
 *
 * @author ruoyi
 */
public interface IWasmAddressInfoService {

    /**
     * 查询地址信息
     */
    WasmAddressInfoVo queryById(Integer id);

    /**
     * 查询地址信息列表
     */
    TableDataInfo<WasmAddressInfoVo> queryPageList(WasmAddressInfoBo bo, PageQuery pageQuery);

    /**
     * 查询地址信息列表
     */
    List<WasmAddressInfoVo> queryList(WasmAddressInfoBo bo);

    /**
     * 新增地址信息
     */
    Boolean insertByBo(WasmAddressInfoBo bo);

    /**
     * 修改地址信息
     */
    Boolean updateByBo(WasmAddressInfoBo bo);

    /**
     * 校验并批量删除地址信息信息
     */
    Boolean deleteWithValidByIds(Collection<Integer> ids, Boolean isValid);


    /**
     * 导入数据
     */
    String importWasmAddressInfo(List<WasmAddressInfoVo> excelList);
}
