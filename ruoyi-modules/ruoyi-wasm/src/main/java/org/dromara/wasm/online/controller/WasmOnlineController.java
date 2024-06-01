package org.dromara.wasm.online.controller;

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
import org.dromara.wasm.online.domain.vo.WasmOnlineVo;
import org.dromara.wasm.online.domain.bo.WasmOnlineBo;
import org.dromara.wasm.online.service.IWasmOnlineService;
import org.dromara.common.mybatis.core.page.TableDataInfo;

/**
 * 在线用户信息
 *
 * @author ruoyi
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/online/online")
public class WasmOnlineController extends BaseController {

    private final IWasmOnlineService wasmOnlineService;

    /**
     * 查询在线用户信息列表
     */
    @SaCheckPermission("online:online:query")
    @GetMapping("/list")
    public TableDataInfo<WasmOnlineVo> list(WasmOnlineBo bo, PageQuery pageQuery) {
        return wasmOnlineService.queryPageList(bo, pageQuery);
    }

    /**
     * 获取在线用户信息详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("online:online:query")
    @GetMapping("/{id}")
    public R<WasmOnlineVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Integer id) {
        return R.ok(wasmOnlineService.queryById(id));
    }

    /**
     * 新增在线用户信息
     */
    @SaCheckPermission("online:online:add")
    @Log(title = "在线用户信息", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody WasmOnlineBo bo) {
        return toAjax(wasmOnlineService.insertByBo(bo));
    }

    /**
     * 修改在线用户信息
     */
    @SaCheckPermission("online:online:edit")
    @Log(title = "在线用户信息", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody WasmOnlineBo bo) {
        return toAjax(wasmOnlineService.updateByBo(bo));
    }

    /**
     * 删除在线用户信息
     *
     * @param ids 主键串
     */
    @SaCheckPermission("online:online:remove")
    @Log(title = "在线用户信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Integer[] ids) {
        return toAjax(wasmOnlineService.deleteWithValidByIds(Arrays.asList(ids), true));
    }

    /**
     * 导入在线用户信息
     */
    @Log(title = "在线用户信息", businessType = BusinessType.IMPORT)
    @SaCheckPermission("online:online:import")
    @PostMapping(value = "/importData", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public R<Void> importData(MultipartFile file) throws Exception {
        List<WasmOnlineVo> excelList = ExcelUtil.importExcel(file.getInputStream(),WasmOnlineVo.class);
        String message = wasmOnlineService.importWasmOnline(excelList);
        return R.ok(message);
    }

    /**
     * 导出在线用户信息列表
     */
    @SaCheckPermission("online:online:export")
    @Log(title = "在线用户信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(WasmOnlineBo bo, PageQuery pageQuery, HttpServletResponse response) {
        TableDataInfo<WasmOnlineVo> info = wasmOnlineService.queryPageList(bo, pageQuery);
        ExcelUtil.exportExcel(info.getRows(), "在线用户信息", WasmOnlineVo.class, response);
    }

    /**
     * 导出在线用户信息模板
     */
    @PostMapping("/exportTemplate")
    @Log(title = "在线用户信息" , businessType = BusinessType.EXPORT)
    public void exportTemplate(HttpServletResponse response) {
        ExcelUtil.exportExcel(new ArrayList<>(), "在线用户信息", WasmOnlineVo.class, response);
    }
}
