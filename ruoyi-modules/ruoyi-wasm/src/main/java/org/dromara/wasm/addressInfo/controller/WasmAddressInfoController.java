package org.dromara.wasm.addressInfo.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Arrays;

import org.springframework.http.MediaType;
import org.springframework.web.multipart.MultipartFile;
import lombok.RequiredArgsConstructor;
import javax.servlet.http.HttpServletResponse;
import javax.validation.constraints.*;
import cn.dev33.satoken.annotation.SaCheckPermission;
import org.springframework.web.bind.annotation.*;
import org.springframework.validation.annotation.Validated;
import org.dromara.common.idempotent.annotation.RepeatSubmit;
import org.dromara.common.log.annotation.Log;
import org.dromara.common.web.core.BaseController;
import org.dromara.common.mybatis.core.page.PageQuery;
import org.dromara.common.core.domain.R;
import org.dromara.common.core.validate.AddGroup;
import org.dromara.common.core.validate.EditGroup;
import org.dromara.common.log.enums.BusinessType;
import org.dromara.common.excel.utils.ExcelUtil;
import org.dromara.wasm.addressInfo.domain.vo.WasmAddressInfoVo;
import org.dromara.wasm.addressInfo.domain.bo.WasmAddressInfoBo;
import org.dromara.wasm.addressInfo.service.IWasmAddressInfoService;
import org.dromara.common.mybatis.core.page.TableDataInfo;

/**
 * 地址信息
 *
 * @author ruoyi
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/address/addressInfo")
public class WasmAddressInfoController extends BaseController {

    private final IWasmAddressInfoService wasmAddressInfoService;

    /**
     * 查询地址信息列表
     */
    @SaCheckPermission("address:addressInfo:query")
    @GetMapping("/list")
    public TableDataInfo<WasmAddressInfoVo> list(WasmAddressInfoBo bo, PageQuery pageQuery) {
        return wasmAddressInfoService.queryPageList(bo, pageQuery);
    }

    /**
     * 获取地址信息详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("address:addressInfo:query")
    @GetMapping("/{id}")
    public R<WasmAddressInfoVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Integer id) {
        return R.ok(wasmAddressInfoService.queryById(id));
    }

    /**
     * 新增地址信息
     */
    @SaCheckPermission("address:addressInfo:add")
    @Log(title = "地址信息", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody WasmAddressInfoBo bo) {
        return toAjax(wasmAddressInfoService.insertByBo(bo));
    }

    /**
     * 修改地址信息
     */
    @SaCheckPermission("address:addressInfo:edit")
    @Log(title = "地址信息", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody WasmAddressInfoBo bo) {
        return toAjax(wasmAddressInfoService.updateByBo(bo));
    }

    /**
     * 删除地址信息
     *
     * @param ids 主键串
     */
    @SaCheckPermission("address:addressInfo:remove")
    @Log(title = "地址信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Integer[] ids) {
        return toAjax(wasmAddressInfoService.deleteWithValidByIds(Arrays.asList(ids), true));
    }

    /**
     * 导入地址信息
     */
    @Log(title = "地址信息", businessType = BusinessType.IMPORT)
    @SaCheckPermission("address:addressInfo:import")
    @PostMapping(value = "/importData", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public R<Void> importData(MultipartFile file) throws Exception {
        List<WasmAddressInfoVo> excelList = ExcelUtil.importExcel(file.getInputStream(),WasmAddressInfoVo.class);
        String message = wasmAddressInfoService.importWasmAddressInfo(excelList);
        return R.ok(message);
    }

    /**
     * 导出地址信息列表
     */
    @SaCheckPermission("address:addressInfo:export")
    @Log(title = "地址信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(WasmAddressInfoBo bo, PageQuery pageQuery, HttpServletResponse response) {
        TableDataInfo<WasmAddressInfoVo> info = wasmAddressInfoService.queryPageList(bo, pageQuery);
        ExcelUtil.exportExcel(info.getRows(), "地址信息", WasmAddressInfoVo.class, response);
    }

    /**
     * 导出地址信息模板
     */
    @PostMapping("/exportTemplate")
    @Log(title = "地址信息" , businessType = BusinessType.EXPORT)
    public void exportTemplate(HttpServletResponse response) {
        ExcelUtil.exportExcel(new ArrayList<>(), "地址信息", WasmAddressInfoVo.class, response);
    }
}
