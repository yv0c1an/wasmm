package org.dromara.wasm.rebateConfig.controller;

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
import org.dromara.wasm.rebateConfig.domain.vo.WasmRebateConfigVo;
import org.dromara.wasm.rebateConfig.domain.bo.WasmRebateConfigBo;
import org.dromara.wasm.rebateConfig.service.IWasmRebateConfigService;
import org.dromara.common.mybatis.core.page.TableDataInfo;

/**
 * 返利配置
 *
 * @author ruoyi
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/rebate/rebateConfig")
public class WasmRebateConfigController extends BaseController {

    private final IWasmRebateConfigService wasmRebateConfigService;

    /**
     * 查询返利配置列表
     */
    @SaCheckPermission("rebate:rebateConfig:query")
    @GetMapping("/list")
    public TableDataInfo<WasmRebateConfigVo> list(WasmRebateConfigBo bo, PageQuery pageQuery) {
        return wasmRebateConfigService.queryPageList(bo, pageQuery);
    }

    /**
     * 获取返利配置详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("rebate:rebateConfig:query")
    @GetMapping("/{id}")
    public R<WasmRebateConfigVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Integer id) {
        return R.ok(wasmRebateConfigService.queryById(id));
    }

    /**
     * 新增返利配置
     */
    @SaCheckPermission("rebate:rebateConfig:add")
    @Log(title = "返利配置", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody WasmRebateConfigBo bo) {
        return toAjax(wasmRebateConfigService.insertByBo(bo));
    }

    /**
     * 修改返利配置
     */
    @SaCheckPermission("rebate:rebateConfig:edit")
    @Log(title = "返利配置", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody WasmRebateConfigBo bo) {
        return toAjax(wasmRebateConfigService.updateByBo(bo));
    }

    /**
     * 删除返利配置
     *
     * @param ids 主键串
     */
    @SaCheckPermission("rebate:rebateConfig:remove")
    @Log(title = "返利配置", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Integer[] ids) {
        return toAjax(wasmRebateConfigService.deleteWithValidByIds(Arrays.asList(ids), true));
    }

    /**
     * 导入返利配置
     */
    @Log(title = "返利配置", businessType = BusinessType.IMPORT)
    @SaCheckPermission("rebate:rebateConfig:import")
    @PostMapping(value = "/importData", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public R<Void> importData(MultipartFile file) throws Exception {
        List<WasmRebateConfigVo> excelList = ExcelUtil.importExcel(file.getInputStream(),WasmRebateConfigVo.class);
        String message = wasmRebateConfigService.importWasmRebateConfig(excelList);
        return R.ok(message);
    }

    /**
     * 导出返利配置列表
     */
    @SaCheckPermission("rebate:rebateConfig:export")
    @Log(title = "返利配置", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(WasmRebateConfigBo bo, PageQuery pageQuery, HttpServletResponse response) {
        TableDataInfo<WasmRebateConfigVo> info = wasmRebateConfigService.queryPageList(bo, pageQuery);
        ExcelUtil.exportExcel(info.getRows(), "返利配置", WasmRebateConfigVo.class, response);
    }

    /**
     * 导出返利配置模板
     */
    @PostMapping("/exportTemplate")
    @Log(title = "返利配置" , businessType = BusinessType.EXPORT)
    public void exportTemplate(HttpServletResponse response) {
        ExcelUtil.exportExcel(new ArrayList<>(), "返利配置", WasmRebateConfigVo.class, response);
    }
}
