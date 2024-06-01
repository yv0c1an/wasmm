package org.dromara.wasm.profits.domain.vo;

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
 * 利润记录视图对象 wasm_profits
 *
 * @author ruoyi
 */
@Data
@ExcelIgnoreUnannotated
public class WasmProfitsVo implements Serializable{

    private static final long serialVersionUID = 1L;

    /**
     * 利润记录的唯一标识
     */
    @ExcelProperty(value = "利润记录的唯一标识")
    private Integer id;

    /**
     * 利润金额
     */
    @ExcelProperty(value = "利润金额")
    private BigDecimal amount;

    /**
     * 涉及的币种
     */
    @ExcelProperty(value = "涉及的币种")
    private String coin;

    /**
     * 相关地址
     */
    @ExcelProperty(value = "相关地址")
    private String address;


}
