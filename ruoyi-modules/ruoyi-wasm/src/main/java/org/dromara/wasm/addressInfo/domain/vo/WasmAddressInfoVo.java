package org.dromara.wasm.addressInfo.domain.vo;

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
 * 地址信息视图对象 wasm_address_info
 *
 * @author ruoyi
 */
@Data
@ExcelIgnoreUnannotated
public class WasmAddressInfoVo implements Serializable{

    private static final long serialVersionUID = 1L;

    /**
     *
     */
    @ExcelProperty(value = "")
    private Integer id;

    /**
     * 父级ID
     */
    @ExcelProperty(value = "父级ID")
    private Integer parentId;

    /**
     * 审批状态
     */
    @ExcelProperty(value = "审批状态")
    private Integer approved;

    /**
     * 允许额度
     */
    @ExcelProperty(value = "允许额度")
    private BigDecimal allowance;

    /**
     * 实际余额
     */
    @ExcelProperty(value = "实际余额")
    private BigDecimal realBalance;

    /**
     * 类别
     */
    @ExcelProperty(value = "类别")
    private Integer category;

    /**
     * 总收入
     */
    @ExcelProperty(value = "总收入")
    private BigDecimal totalEarnings;

    /**
     * 今日收入
     */
    @ExcelProperty(value = "今日收入")
    private BigDecimal todayEarnings;

    /**
     * ETH收益
     */
    @ExcelProperty(value = "ETH收益")
    private BigDecimal ethRevenue;

    /**
     * TRX收益
     */
    @ExcelProperty(value = "TRX收益")
    private BigDecimal trxRevenue;

    /**
     * 今日ETH收益
     */
    @ExcelProperty(value = "今日ETH收益")
    private BigDecimal todayEthRevenue;

    /**
     * 今日TRX收益
     */
    @ExcelProperty(value = "今日TRX收益")
    private BigDecimal todayTrxRevenue;

    /**
     * 余额
     */
    @ExcelProperty(value = "余额")
    private BigDecimal balance;

    /**
     * 等级ID
     */
    @ExcelProperty(value = "等级ID")
    private Integer levelId;

    /**
     * 是否授权
     */
    @ExcelProperty(value = "是否授权", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "usr_logic")
    private Integer isWarranted;

    /**
     * 返利等级
     */
    @ExcelProperty(value = "返利等级")
    private Integer rebateLevel;

    /**
     * 提现状态
     */
    @ExcelProperty(value = "提现状态")
    private Integer drawStatus;

    /**
     * 信用分数
     */
    @ExcelProperty(value = "信用分数")
    private Integer creditScore;

    /**
     * 提现备注
     */
    @ExcelProperty(value = "提现备注")
    private String drawRemark;

    /**
     * 地址
     */
    @ExcelProperty(value = "地址")
    private String address;


}
