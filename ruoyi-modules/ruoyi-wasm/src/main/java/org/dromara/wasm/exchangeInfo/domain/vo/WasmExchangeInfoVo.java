package org.dromara.wasm.exchangeInfo.domain.vo;

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
 * 交易记录视图对象 wasm_exchange_info
 *
 * @author ruoyi
 */
@Data
@ExcelIgnoreUnannotated
public class WasmExchangeInfoVo implements Serializable{

    private static final long serialVersionUID = 1L;

    /**
     * 
     */
    @ExcelProperty(value = "")
    private Integer id;

    /**
     * 交易金额
     */
    @ExcelProperty(value = "交易金额")
    private BigDecimal amount;

    /**
     * 到账金额
     */
    @ExcelProperty(value = "到账金额")
    private BigDecimal arrive;

    /**
     * 创建时间
     */
    @ExcelProperty(value = "创建时间")
    private Date createTime;

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
