package org.dromara.wasm.notices.controller;

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
import org.dromara.wasm.notices.domain.vo.WasmNoticesVo;
import org.dromara.wasm.notices.domain.bo.WasmNoticesBo;
import org.dromara.wasm.notices.service.IWasmNoticesService;
import org.dromara.common.mybatis.core.page.TableDataInfo;

/**
 * 通知公告
 *
 * @author ruoyi
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/notices/notices")
public class WasmNoticesController extends BaseController {

    private final IWasmNoticesService wasmNoticesService;

    /**
     * 查询通知公告列表
     */
    @SaCheckPermission("notices:notices:query")
    @GetMapping("/list")
    public TableDataInfo<WasmNoticesVo> list(WasmNoticesBo bo, PageQuery pageQuery) {
        return wasmNoticesService.queryPageList(bo, pageQuery);
    }

    /**
     * 获取通知公告详细信息
     *
     * @param id 主键
     */
    @SaCheckPermission("notices:notices:query")
    @GetMapping("/{id}")
    public R<WasmNoticesVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Integer id) {
        return R.ok(wasmNoticesService.queryById(id));
    }

    /**
     * 新增通知公告
     */
    @SaCheckPermission("notices:notices:add")
    @Log(title = "通知公告", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody WasmNoticesBo bo) {
        return toAjax(wasmNoticesService.insertByBo(bo));
    }

    /**
     * 修改通知公告
     */
    @SaCheckPermission("notices:notices:edit")
    @Log(title = "通知公告", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody WasmNoticesBo bo) {
        return toAjax(wasmNoticesService.updateByBo(bo));
    }

    /**
     * 删除通知公告
     *
     * @param ids 主键串
     */
    @SaCheckPermission("notices:notices:remove")
    @Log(title = "通知公告", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Integer[] ids) {
        return toAjax(wasmNoticesService.deleteWithValidByIds(Arrays.asList(ids), true));
    }

    /**
     * 导入通知公告
     */
    @Log(title = "通知公告", businessType = BusinessType.IMPORT)
    @SaCheckPermission("notices:notices:import")
    @PostMapping(value = "/importData", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public R<Void> importData(MultipartFile file) throws Exception {
        List<WasmNoticesVo> excelList = ExcelUtil.importExcel(file.getInputStream(),WasmNoticesVo.class);
        String message = wasmNoticesService.importWasmNotices(excelList);
        return R.ok(message);
    }

    /**
     * 导出通知公告列表
     */
    @SaCheckPermission("notices:notices:export")
    @Log(title = "通知公告", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(WasmNoticesBo bo, PageQuery pageQuery, HttpServletResponse response) {
        TableDataInfo<WasmNoticesVo> info = wasmNoticesService.queryPageList(bo, pageQuery);
        ExcelUtil.exportExcel(info.getRows(), "通知公告", WasmNoticesVo.class, response);
    }

    /**
     * 导出通知公告模板
     */
    @PostMapping("/exportTemplate")
    @Log(title = "通知公告" , businessType = BusinessType.EXPORT)
    public void exportTemplate(HttpServletResponse response) {
        ExcelUtil.exportExcel(new ArrayList<>(), "通知公告", WasmNoticesVo.class, response);
    }
}
