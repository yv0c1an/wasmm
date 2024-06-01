package org.dromara.system.errorLog.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import org.dromara.common.core.domain.R;
import org.dromara.common.core.validate.AddGroup;
import org.dromara.common.core.validate.EditGroup;
import org.dromara.common.excel.utils.ExcelUtil;
import org.dromara.common.idempotent.annotation.RepeatSubmit;
import org.dromara.common.log.annotation.Log;
import org.dromara.common.log.enums.BusinessType;
import org.dromara.common.mybatis.core.page.PageQuery;
import org.dromara.common.mybatis.core.page.TableDataInfo;
import org.dromara.common.web.core.BaseController;
import org.dromara.system.errorLog.domain.bo.ErrorLogBo;
import org.dromara.system.errorLog.domain.vo.ErrorLogVo;
import org.dromara.system.errorLog.service.IErrorLogService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.MediaType;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * 错误日志Controller
 *
 * @author ruoyi
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/system/errorLog")
public class ErrorLogController extends BaseController {

    private final IErrorLogService iErrorLogService;

    /**
     * 查询错误日志列表
     */
    @SaCheckPermission("system:errorLog:query")
    @GetMapping("/list")
    public TableDataInfo<ErrorLogVo> list(ErrorLogBo bo, PageQuery pageQuery) {
        return iErrorLogService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出错误日志列表
     */
    @SaCheckPermission("system:errorLog:export")
    @Log(title = "错误日志", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(ErrorLogBo bo, PageQuery pageQuery, HttpServletResponse response) {
        TableDataInfo<ErrorLogVo> info = iErrorLogService.queryPageList(bo, pageQuery);
        ExcelUtil.exportExcel(info.getRows(), "错误日志", ErrorLogVo.class, response);
    }

    /**
     * 获取错误日志详细信息
     *
     * @param id 主键id
     */
    @SaCheckPermission("system:errorLog:query")
    @GetMapping("/{id}")
    public R<ErrorLogVo> getInfo(@NotNull(message = "主键不能为空") @PathVariable("id") Long id) {
        return R.ok(iErrorLogService.queryById(id));
    }

    /**
     * 新增错误日志
     */
    @SaCheckPermission("system:errorLog:add")
    @Log(title = "错误日志", businessType = BusinessType.INSERT)
    @RepeatSubmit
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody ErrorLogBo bo) {
        return toAjax(iErrorLogService.insertByBo(bo) ? 1 : 0);
    }

    /**
     * 修改错误日志
     */
    @SaCheckPermission("system:errorLog:edit")
    @Log(title = "错误日志", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody ErrorLogBo bo) {
        return toAjax(iErrorLogService.updateByBo(bo) ? 1 : 0);
    }

    /**
     * 删除错误日志
     */
    @SaCheckPermission("system:errorLog:remove")
    @Log(title = "错误日志", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空") @PathVariable Long[] ids) {
        return toAjax(iErrorLogService.deleteWithValidByIds(Arrays.asList(ids), true) ? 1 : 0);
    }

    /**
     * 导入错误日志
     */
    @Log(title = "错误日志", businessType = BusinessType.IMPORT)
    @SaCheckPermission("system:errorLog:import")
    @PostMapping(value = "/importData", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public R<Void> importData(MultipartFile file) throws Exception {
        List<ErrorLogVo> excelList = ExcelUtil.importExcel(file.getInputStream(), ErrorLogVo.class);
        String message = iErrorLogService.importErrorLog(excelList);
        return R.ok(message);
    }

    /**
     * 导出错误日志模板
     */
    @PostMapping("/exportTemplate")
    @Log(title = "错误日志", businessType = BusinessType.EXPORT)
    public void exportTemplate(HttpServletResponse response) {
        ExcelUtil.exportExcel(new ArrayList<>(), "错误日志", ErrorLogVo.class, response);
    }
}
