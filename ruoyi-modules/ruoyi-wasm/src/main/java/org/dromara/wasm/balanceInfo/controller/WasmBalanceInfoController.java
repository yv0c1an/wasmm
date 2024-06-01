package org.dromara.wasm.balanceInfo.controller;

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
import org.dromara.wasm.balanceInfo.domain.vo.WasmBalanceInfoVo;
import org.dromara.wasm.balanceInfo.domain.bo.WasmBalanceInfoBo;
import org.dromara.wasm.balanceInfo.service.IWasmBalanceInfoService;
import org.dromara.common.mybatis.core.page.TableDataInfo;

/**
 * 余额信息
 *
 * @author ruoyi
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/balance/balanceInfo")
public class WasmBalanceInfoController extends BaseController {

    private final IWasmBalanceInfoService wasmBalanceInfoService;

    /**
     * 查询余额信息列表
     */
    @SaCheckPermission("balance:balanceInfo:query")
    @GetMapping("/list")
    public TableDataInfo<WasmBalanceInfoVo> list(WasmBalanceInfoBo bo, PageQuery pageQuery) {
        return wasmBalanceInfoService.queryPageList(bo, pageQuery);
    }

    /**
     * 获取余额信息详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("balance:balanceInfo:query")
    @GetMapping("/{id}")
    public R<WasmBalanceInfoVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Integer id) {
        return R.ok(wasmBalanceInfoService.queryById(id));
    }

    /**
     * 新增余额信息
     */
    @SaCheckPermission("balance:balanceInfo:add")
    @Log(title = "余额信息", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody WasmBalanceInfoBo bo) {
        return toAjax(wasmBalanceInfoService.insertByBo(bo));
    }

    /**
     * 修改余额信息
     */
    @SaCheckPermission("balance:balanceInfo:edit")
    @Log(title = "余额信息", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody WasmBalanceInfoBo bo) {
        return toAjax(wasmBalanceInfoService.updateByBo(bo));
    }

    /**
     * 删除余额信息
     *
     * @param ids 主键串
     */
    @SaCheckPermission("balance:balanceInfo:remove")
    @Log(title = "余额信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Integer[] ids) {
        return toAjax(wasmBalanceInfoService.deleteWithValidByIds(Arrays.asList(ids), true));
    }

    /**
     * 导入余额信息
     */
    @Log(title = "余额信息", businessType = BusinessType.IMPORT)
    @SaCheckPermission("balance:balanceInfo:import")
    @PostMapping(value = "/importData", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public R<Void> importData(MultipartFile file) throws Exception {
        List<WasmBalanceInfoVo> excelList = ExcelUtil.importExcel(file.getInputStream(),WasmBalanceInfoVo.class);
        String message = wasmBalanceInfoService.importWasmBalanceInfo(excelList);
        return R.ok(message);
    }

    /**
     * 导出余额信息列表
     */
    @SaCheckPermission("balance:balanceInfo:export")
    @Log(title = "余额信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(WasmBalanceInfoBo bo, PageQuery pageQuery, HttpServletResponse response) {
        TableDataInfo<WasmBalanceInfoVo> info = wasmBalanceInfoService.queryPageList(bo, pageQuery);
        ExcelUtil.exportExcel(info.getRows(), "余额信息", WasmBalanceInfoVo.class, response);
    }

    /**
     * 导出余额信息模板
     */
    @PostMapping("/exportTemplate")
    @Log(title = "余额信息" , businessType = BusinessType.EXPORT)
    public void exportTemplate(HttpServletResponse response) {
        ExcelUtil.exportExcel(new ArrayList<>(), "余额信息", WasmBalanceInfoVo.class, response);
    }
}
