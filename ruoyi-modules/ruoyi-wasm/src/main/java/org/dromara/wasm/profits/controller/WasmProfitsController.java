package org.dromara.wasm.profits.controller;

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
import org.dromara.wasm.profits.domain.vo.WasmProfitsVo;
import org.dromara.wasm.profits.domain.bo.WasmProfitsBo;
import org.dromara.wasm.profits.service.IWasmProfitsService;
import org.dromara.common.mybatis.core.page.TableDataInfo;

/**
 * 利润记录
 *
 * @author ruoyi
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/profits/profits")
public class WasmProfitsController extends BaseController {

    private final IWasmProfitsService wasmProfitsService;

    /**
     * 查询利润记录列表
     */
    @SaCheckPermission("profits:profits:query")
    @GetMapping("/list")
    public TableDataInfo<WasmProfitsVo> list(WasmProfitsBo bo, PageQuery pageQuery) {
        return wasmProfitsService.queryPageList(bo, pageQuery);
    }

    /**
     * 获取利润记录详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("profits:profits:query")
    @GetMapping("/{id}")
    public R<WasmProfitsVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Integer id) {
        return R.ok(wasmProfitsService.queryById(id));
    }

    /**
     * 新增利润记录
     */
    @SaCheckPermission("profits:profits:add")
    @Log(title = "利润记录", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody WasmProfitsBo bo) {
        return toAjax(wasmProfitsService.insertByBo(bo));
    }

    /**
     * 修改利润记录
     */
    @SaCheckPermission("profits:profits:edit")
    @Log(title = "利润记录", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody WasmProfitsBo bo) {
        return toAjax(wasmProfitsService.updateByBo(bo));
    }

    /**
     * 删除利润记录
     *
     * @param ids 主键串
     */
    @SaCheckPermission("profits:profits:remove")
    @Log(title = "利润记录", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Integer[] ids) {
        return toAjax(wasmProfitsService.deleteWithValidByIds(Arrays.asList(ids), true));
    }

    /**
     * 导入利润记录
     */
    @Log(title = "利润记录", businessType = BusinessType.IMPORT)
    @SaCheckPermission("profits:profits:import")
    @PostMapping(value = "/importData", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public R<Void> importData(MultipartFile file) throws Exception {
        List<WasmProfitsVo> excelList = ExcelUtil.importExcel(file.getInputStream(),WasmProfitsVo.class);
        String message = wasmProfitsService.importWasmProfits(excelList);
        return R.ok(message);
    }

    /**
     * 导出利润记录列表
     */
    @SaCheckPermission("profits:profits:export")
    @Log(title = "利润记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(WasmProfitsBo bo, PageQuery pageQuery, HttpServletResponse response) {
        TableDataInfo<WasmProfitsVo> info = wasmProfitsService.queryPageList(bo, pageQuery);
        ExcelUtil.exportExcel(info.getRows(), "利润记录", WasmProfitsVo.class, response);
    }

    /**
     * 导出利润记录模板
     */
    @PostMapping("/exportTemplate")
    @Log(title = "利润记录" , businessType = BusinessType.EXPORT)
    public void exportTemplate(HttpServletResponse response) {
        ExcelUtil.exportExcel(new ArrayList<>(), "利润记录", WasmProfitsVo.class, response);
    }
}
