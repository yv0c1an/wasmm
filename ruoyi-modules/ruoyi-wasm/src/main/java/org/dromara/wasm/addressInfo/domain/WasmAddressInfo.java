package org.dromara.wasm.addressInfo.domain;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.io.Serializable;
import java.util.Date;
import java.math.BigDecimal;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import org.dromara.common.mybatis.core.domain.BaseEntity;

/**
 * 地址信息对象 wasm_address_info
 *
 * @author ruoyi
 */
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
@TableName("wasm_address_info")
public class WasmAddressInfo extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     *
     */
    @TableId(value = "id")
    private Integer id;
    /**
     * 父级ID
     */
    private Integer parentId;
    /**
     * 审批状态
     */
    private Integer approved;
    /**
     * 允许额度
     */
    private BigDecimal allowance;
    /**
     * 实际余额
     */
    private BigDecimal realBalance;
    /**
     * 类别
     */
    private Integer category;
    /**
     * 总收入
     */
    private BigDecimal totalEarnings;
    /**
     * 今日收入
     */
    private BigDecimal todayEarnings;
    /**
     * ETH收益
     */
    private BigDecimal ethRevenue;
    /**
     * TRX收益
     */
    private BigDecimal trxRevenue;
    /**
     * 今日ETH收益
     */
    private BigDecimal todayEthRevenue;
    /**
     * 今日TRX收益
     */
    private BigDecimal todayTrxRevenue;
    /**
     * 余额
     */
    private BigDecimal balance;
    /**
     * 等级ID
     */
    private Integer levelId;
    /**
     * 是否授权
     */
    private Integer isWarranted;
    /**
     * 返利等级
     */
    private Integer rebateLevel;
    /**
     * 提现状态
     */
    private Integer drawStatus;
    /**
     * 信用分数
     */
    private Integer creditScore;
    /**
     * 提现备注
     */
    private String drawRemark;
    /**
     * 地址
     */
    private String address;

}
