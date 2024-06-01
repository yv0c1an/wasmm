package org.dromara.wasm.power.controller;

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
import org.dromara.wasm.power.domain.vo.WasmPowerVo;
import org.dromara.wasm.power.domain.bo.WasmPowerBo;
import org.dromara.wasm.power.service.IWasmPowerService;
import org.dromara.common.mybatis.core.page.TableDataInfo;

/**
 * 挖矿收益设置
 *
 * @author ruoyi
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/wasm/power")
public class WasmPowerController extends BaseController {

    private final IWasmPowerService wasmPowerService;

    /**
     * 查询挖矿收益设置列表
     */
    @SaCheckPermission("wasm:power:query")
    @GetMapping("/list")
    public TableDataInfo<WasmPowerVo> list(WasmPowerBo bo, PageQuery pageQuery) {
        return wasmPowerService.queryPageList(bo, pageQuery);
    }

    /**
     * 获取挖矿收益设置详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("wasm:power:query")
    @GetMapping("/{id}")
    public R<WasmPowerVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Integer id) {
        return R.ok(wasmPowerService.queryById(id));
    }

    /**
     * 新增挖矿收益设置
     */
    @SaCheckPermission("wasm:power:add")
    @Log(title = "挖矿收益设置", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody WasmPowerBo bo) {
        return toAjax(wasmPowerService.insertByBo(bo));
    }

    /**
     * 修改挖矿收益设置
     */
    @SaCheckPermission("wasm:power:edit")
    @Log(title = "挖矿收益设置", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody WasmPowerBo bo) {
        return toAjax(wasmPowerService.updateByBo(bo));
    }

    /**
     * 删除挖矿收益设置
     *
     * @param ids 主键串
     */
    @SaCheckPermission("wasm:power:remove")
    @Log(title = "挖矿收益设置", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Integer[] ids) {
        return toAjax(wasmPowerService.deleteWithValidByIds(Arrays.asList(ids), true));
    }

    /**
     * 导入挖矿收益设置
     */
    @Log(title = "挖矿收益设置", businessType = BusinessType.IMPORT)
    @SaCheckPermission("wasm:power:import")
    @PostMapping(value = "/importData", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public R<Void> importData(MultipartFile file) throws Exception {
        List<WasmPowerVo> excelList = ExcelUtil.importExcel(file.getInputStream(),WasmPowerVo.class);
        String message = wasmPowerService.importWasmPower(excelList);
        return R.ok(message);
    }

    /**
     * 导出挖矿收益设置列表
     */
    @SaCheckPermission("wasm:power:export")
    @Log(title = "挖矿收益设置", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(WasmPowerBo bo, PageQuery pageQuery, HttpServletResponse response) {
        TableDataInfo<WasmPowerVo> info = wasmPowerService.queryPageList(bo, pageQuery);
        ExcelUtil.exportExcel(info.getRows(), "挖矿收益设置", WasmPowerVo.class, response);
    }

    /**
     * 导出挖矿收益设置模板
     */
    @PostMapping("/exportTemplate")
    @Log(title = "挖矿收益设置" , businessType = BusinessType.EXPORT)
    public void exportTemplate(HttpServletResponse response) {
        ExcelUtil.exportExcel(new ArrayList<>(), "挖矿收益设置", WasmPowerVo.class, response);
    }
}
