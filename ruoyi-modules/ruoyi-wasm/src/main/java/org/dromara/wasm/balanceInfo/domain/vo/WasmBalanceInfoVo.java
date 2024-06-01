package org.dromara.wasm.balanceInfo.domain.vo;

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
 * 余额信息视图对象 wasm_balance_info
 *
 * @author ruoyi
 */
@Data
@ExcelIgnoreUnannotated
public class WasmBalanceInfoVo implements Serializable{

    private static final long serialVersionUID = 1L;

    /**
     * 
     */
    @ExcelProperty(value = "")
    private Integer id;

    /**
     * 总额
     */
    @ExcelProperty(value = "总额")
    private BigDecimal total;

    /**
     * 可用金额
     */
    @ExcelProperty(value = "可用金额")
    private BigDecimal available;

    /**
     * 冻结金额
     */
    @ExcelProperty(value = "冻结金额")
    private BigDecimal freezen;

    /**
     * 币种
     */
    @ExcelProperty(value = "币种")
    private String coin;

    /**
     * 地址
     */
    @ExcelProperty(value = "地址")
    private String address;


}
