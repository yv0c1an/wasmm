package org.dromara.wasm.main.controller;

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
import org.dromara.wasm.main.domain.vo.WasmMainVo;
import org.dromara.wasm.main.domain.bo.WasmMainBo;
import org.dromara.wasm.main.service.IWasmMainService;
import org.dromara.common.mybatis.core.page.TableDataInfo;

/**
 * 系统核心配置
 *
 * @author ruoyi
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/main/main")
public class WasmMainController extends BaseController {

    private final IWasmMainService wasmMainService;

    /**
     * 查询系统核心配置列表
     */
    @SaCheckPermission("main:main:query")
    @GetMapping("/list")
    public TableDataInfo<WasmMainVo> list(WasmMainBo bo, PageQuery pageQuery) {
        return wasmMainService.queryPageList(bo, pageQuery);
    }

    /**
     * 获取系统核心配置详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("main:main:query")
    @GetMapping("/{id}")
    public R<WasmMainVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Integer id) {
        return R.ok(wasmMainService.queryById(id));
    }

    /**
     * 新增系统核心配置
     */
    @SaCheckPermission("main:main:add")
    @Log(title = "系统核心配置", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody WasmMainBo bo) {
        return toAjax(wasmMainService.insertByBo(bo));
    }

    /**
     * 修改系统核心配置
     */
    @SaCheckPermission("main:main:edit")
    @Log(title = "系统核心配置", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody WasmMainBo bo) {
        return toAjax(wasmMainService.updateByBo(bo));
    }

    /**
     * 删除系统核心配置
     *
     * @param ids 主键串
     */
    @SaCheckPermission("main:main:remove")
    @Log(title = "系统核心配置", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Integer[] ids) {
        return toAjax(wasmMainService.deleteWithValidByIds(Arrays.asList(ids), true));
    }

    /**
     * 导入系统核心配置
     */
    @Log(title = "系统核心配置", businessType = BusinessType.IMPORT)
    @SaCheckPermission("main:main:import")
    @PostMapping(value = "/importData", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public R<Void> importData(MultipartFile file) throws Exception {
        List<WasmMainVo> excelList = ExcelUtil.importExcel(file.getInputStream(),WasmMainVo.class);
        String message = wasmMainService.importWasmMain(excelList);
        return R.ok(message);
    }

    /**
     * 导出系统核心配置列表
     */
    @SaCheckPermission("main:main:export")
    @Log(title = "系统核心配置", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(WasmMainBo bo, PageQuery pageQuery, HttpServletResponse response) {
        TableDataInfo<WasmMainVo> info = wasmMainService.queryPageList(bo, pageQuery);
        ExcelUtil.exportExcel(info.getRows(), "系统核心配置", WasmMainVo.class, response);
    }

    /**
     * 导出系统核心配置模板
     */
    @PostMapping("/exportTemplate")
    @Log(title = "系统核心配置" , businessType = BusinessType.EXPORT)
    public void exportTemplate(HttpServletResponse response) {
        ExcelUtil.exportExcel(new ArrayList<>(), "系统核心配置", WasmMainVo.class, response);
    }
}
