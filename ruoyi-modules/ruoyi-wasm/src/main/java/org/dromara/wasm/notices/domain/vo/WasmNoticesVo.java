package org.dromara.wasm.notices.domain.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import org.dromara.common.excel.annotation.ExcelDictFormat;
import org.dromara.common.excel.convert.ExcelDictConvert;
import org.dromara.common.translation.annotation.Translation;
import org.dromara.common.translation.constant.TransConstant;
import lombok.Data;
import java.util.Date;
import java.io.Serializable;


/**
 * 通知公告视图对象 wasm_notices
 *
 * @author ruoyi
 */
@Data
@ExcelIgnoreUnannotated
public class WasmNoticesVo implements Serializable{

    private static final long serialVersionUID = 1L;

    /**
     * 唯一标识
     */
    @ExcelProperty(value = "唯一标识")
    private Integer id;

    /**
     * 公告标题
     */
    @ExcelProperty(value = "公告标题")
    private String title;

    /**
     * 公告内容
     */
    @ExcelProperty(value = "公告内容")
    private String content;

    /**
     * 公告状态：1-启用，0-禁用
     */
    @ExcelProperty(value = "公告状态：1-启用，0-禁用", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "sys_normal_disabled")
    private Integer status;

    /**
     * 相关链接或地址
     */
    @ExcelProperty(value = "相关链接或地址")
    private String address;


}
