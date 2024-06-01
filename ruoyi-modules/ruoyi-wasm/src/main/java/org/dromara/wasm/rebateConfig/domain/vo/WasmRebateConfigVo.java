package org.dromara.wasm.rebateConfig.domain.vo;

import java.math.BigDecimal;
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
 * 返利配置视图对象 wasm_rebate_config
 *
 * @author ruoyi
 */
@Data
@ExcelIgnoreUnannotated
public class WasmRebateConfigVo implements Serializable{

    private static final long serialVersionUID = 1L;

    /**
     * 
     */
    @ExcelProperty(value = "")
    private Integer id;

    /**
     * 英文名称
     */
    @ExcelProperty(value = "英文名称")
    private String enName;

    /**
     * 日文名称
     */
    @ExcelProperty(value = "日文名称")
    private String jpName;

    /**
     * 繁体中文名称
     */
    @ExcelProperty(value = "繁体中文名称")
    private String twName;

    /**
     * 最小余额
     */
    @ExcelProperty(value = "最小余额")
    private BigDecimal minBalance;

    /**
     * 等级1的返利率
     */
    @ExcelProperty(value = "等级1的返利率")
    private BigDecimal level1;

    /**
     * 等级2的返利率
     */
    @ExcelProperty(value = "等级2的返利率")
    private BigDecimal level2;

    /**
     * 等级3的返利率
     */
    @ExcelProperty(value = "等级3的返利率")
    private BigDecimal level3;


}
