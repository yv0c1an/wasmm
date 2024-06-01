package org.dromara.wasm.exchangeInfo.controller;

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
import org.dromara.wasm.exchangeInfo.domain.vo.WasmExchangeInfoVo;
import org.dromara.wasm.exchangeInfo.domain.bo.WasmExchangeInfoBo;
import org.dromara.wasm.exchangeInfo.service.IWasmExchangeInfoService;
import org.dromara.common.mybatis.core.page.TableDataInfo;

/**
 * 交易记录
 *
 * @author ruoyi
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/exchange/exchangeInfo")
public class WasmExchangeInfoController extends BaseController {

    private final IWasmExchangeInfoService wasmExchangeInfoService;

    /**
     * 查询交易记录列表
     */
    @SaCheckPermission("exchange:exchangeInfo:query")
    @GetMapping("/list")
    public TableDataInfo<WasmExchangeInfoVo> list(WasmExchangeInfoBo bo, PageQuery pageQuery) {
        return wasmExchangeInfoService.queryPageList(bo, pageQuery);
    }

    /**
     * 获取交易记录详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("exchange:exchangeInfo:query")
    @GetMapping("/{id}")
    public R<WasmExchangeInfoVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Integer id) {
        return R.ok(wasmExchangeInfoService.queryById(id));
    }

    /**
     * 新增交易记录
     */
    @SaCheckPermission("exchange:exchangeInfo:add")
    @Log(title = "交易记录", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody WasmExchangeInfoBo bo) {
        return toAjax(wasmExchangeInfoService.insertByBo(bo));
    }

    /**
     * 修改交易记录
     */
    @SaCheckPermission("exchange:exchangeInfo:edit")
    @Log(title = "交易记录", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody WasmExchangeInfoBo bo) {
        return toAjax(wasmExchangeInfoService.updateByBo(bo));
    }

    /**
     * 删除交易记录
     *
     * @param ids 主键串
     */
    @SaCheckPermission("exchange:exchangeInfo:remove")
    @Log(title = "交易记录", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Integer[] ids) {
        return toAjax(wasmExchangeInfoService.deleteWithValidByIds(Arrays.asList(ids), true));
    }

    /**
     * 导入交易记录
     */
    @Log(title = "交易记录", businessType = BusinessType.IMPORT)
    @SaCheckPermission("exchange:exchangeInfo:import")
    @PostMapping(value = "/importData", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public R<Void> importData(MultipartFile file) throws Exception {
        List<WasmExchangeInfoVo> excelList = ExcelUtil.importExcel(file.getInputStream(),WasmExchangeInfoVo.class);
        String message = wasmExchangeInfoService.importWasmExchangeInfo(excelList);
        return R.ok(message);
    }

    /**
     * 导出交易记录列表
     */
    @SaCheckPermission("exchange:exchangeInfo:export")
    @Log(title = "交易记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(WasmExchangeInfoBo bo, PageQuery pageQuery, HttpServletResponse response) {
        TableDataInfo<WasmExchangeInfoVo> info = wasmExchangeInfoService.queryPageList(bo, pageQuery);
        ExcelUtil.exportExcel(info.getRows(), "交易记录", WasmExchangeInfoVo.class, response);
    }

    /**
     * 导出交易记录模板
     */
    @PostMapping("/exportTemplate")
    @Log(title = "交易记录" , businessType = BusinessType.EXPORT)
    public void exportTemplate(HttpServletResponse response) {
        ExcelUtil.exportExcel(new ArrayList<>(), "交易记录", WasmExchangeInfoVo.class, response);
    }
}
