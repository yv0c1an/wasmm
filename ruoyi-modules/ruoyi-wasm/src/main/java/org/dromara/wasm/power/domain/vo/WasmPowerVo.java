package org.dromara.wasm.power.domain.vo;

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
 * 挖矿收益设置视图对象 wasm_power
 *
 * @author ruoyi
 */
@Data
@ExcelIgnoreUnannotated
public class WasmPowerVo implements Serializable{

    private static final long serialVersionUID = 1L;

    /**
     * 
     */
    @ExcelProperty(value = "")
    private Integer id;

    /**
     * 钱包类型
     */
    @ExcelProperty(value = "钱包类型", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "power_type")
    private String type;

    /**
     * 最小金额
     */
    @ExcelProperty(value = "最小金额")
    private BigDecimal minAmount;

    /**
     * 最大金额
     */
    @ExcelProperty(value = "最大金额")
    private BigDecimal maxAmount;

    /**
     * 最小速度
     */
    @ExcelProperty(value = "最小速度")
    private BigDecimal minRate;

    /**
     * 最大速度
     */
    @ExcelProperty(value = "最大速度")
    private BigDecimal maxRate;


}
