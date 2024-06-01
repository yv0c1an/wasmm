package org.dromara.wasm.withdraw.domain.vo;

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
 * 提现视图对象 wasm_withdraw
 *
 * @author ruoyi
 */
@Data
@ExcelIgnoreUnannotated
public class WasmWithdrawVo implements Serializable{

    private static final long serialVersionUID = 1L;

    /**
     * 提现记录ID
     */
    @ExcelProperty(value = "提现记录ID")
    private Long id;

    /**
     * 提现金额
     */
    @ExcelProperty(value = "提现金额")
    private BigDecimal amount;

    /**
     * 提现创建时间（Unix时间戳）
     */
    @ExcelProperty(value = "提现创建时间", converter = ExcelDictConvert.class)
    @ExcelDictFormat(readConverterExp = "U=nix时间戳")
    private Date createTime;

    /**
     * 提现状态：1-待处理，2-处理中，3-已完成，4-已取消
     */
    @ExcelProperty(value = "提现状态：1-待处理，2-处理中，3-已完成，4-已取消", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "sys_normal_disabled")
    private String status;

    /**
     * 提现地址
     */
    @ExcelProperty(value = "提现地址")
    private String address;


}
