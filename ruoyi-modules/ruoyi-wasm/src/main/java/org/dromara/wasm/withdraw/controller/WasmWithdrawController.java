package org.dromara.wasm.withdraw.controller;

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
import org.dromara.wasm.withdraw.domain.vo.WasmWithdrawVo;
import org.dromara.wasm.withdraw.domain.bo.WasmWithdrawBo;
import org.dromara.wasm.withdraw.service.IWasmWithdrawService;
import org.dromara.common.mybatis.core.page.TableDataInfo;

/**
 * 提现
 *
 * @author ruoyi
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/withdraw/withdraw")
public class WasmWithdrawController extends BaseController {

    private final IWasmWithdrawService wasmWithdrawService;

    /**
     * 查询提现列表
     */
    @SaCheckPermission("withdraw:withdraw:query")
    @GetMapping("/list")
    public TableDataInfo<WasmWithdrawVo> list(WasmWithdrawBo bo, PageQuery pageQuery) {
        return wasmWithdrawService.queryPageList(bo, pageQuery);
    }

    /**
     * 获取提现详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("withdraw:withdraw:query")
    @GetMapping("/{id}")
    public R<WasmWithdrawVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long id) {
        return R.ok(wasmWithdrawService.queryById(id));
    }

    /**
     * 新增提现
     */
    @SaCheckPermission("withdraw:withdraw:add")
    @Log(title = "提现", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody WasmWithdrawBo bo) {
        return toAjax(wasmWithdrawService.insertByBo(bo));
    }

    /**
     * 修改提现
     */
    @SaCheckPermission("withdraw:withdraw:edit")
    @Log(title = "提现", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody WasmWithdrawBo bo) {
        return toAjax(wasmWithdrawService.updateByBo(bo));
    }

    /**
     * 删除提现
     *
     * @param ids 主键串
     */
    @SaCheckPermission("withdraw:withdraw:remove")
    @Log(title = "提现", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] ids) {
        return toAjax(wasmWithdrawService.deleteWithValidByIds(Arrays.asList(ids), true));
    }

    /**
     * 导入提现
     */
    @Log(title = "提现", businessType = BusinessType.IMPORT)
    @SaCheckPermission("withdraw:withdraw:import")
    @PostMapping(value = "/importData", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public R<Void> importData(MultipartFile file) throws Exception {
        List<WasmWithdrawVo> excelList = ExcelUtil.importExcel(file.getInputStream(),WasmWithdrawVo.class);
        String message = wasmWithdrawService.importWasmWithdraw(excelList);
        return R.ok(message);
    }

    /**
     * 导出提现列表
     */
    @SaCheckPermission("withdraw:withdraw:export")
    @Log(title = "提现", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(WasmWithdrawBo bo, PageQuery pageQuery, HttpServletResponse response) {
        TableDataInfo<WasmWithdrawVo> info = wasmWithdrawService.queryPageList(bo, pageQuery);
        ExcelUtil.exportExcel(info.getRows(), "提现", WasmWithdrawVo.class, response);
    }

    /**
     * 导出提现模板
     */
    @PostMapping("/exportTemplate")
    @Log(title = "提现" , businessType = BusinessType.EXPORT)
    public void exportTemplate(HttpServletResponse response) {
        ExcelUtil.exportExcel(new ArrayList<>(), "提现", WasmWithdrawVo.class, response);
    }
}
