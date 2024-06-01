package org.dromara.wasm.addressInfo.domain.bo;

import org.dromara.common.core.validate.AddGroup;
import org.dromara.common.core.validate.EditGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;
import javax.validation.constraints.*;

import java.util.Date;
import lombok.ToString;

import java.math.BigDecimal;
import org.dromara.common.mybatis.core.domain.BaseEntity;

/**
 * 地址信息业务对象 wasm_address_info
 *
 * @author ruoyi
 */

@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
public class WasmAddressInfoBo extends BaseEntity {

    /**
     *
     */
    @NotNull(message = "不能为空", groups = { EditGroup.class })
    private Integer id;

    /**
     * 父级ID
     */
    @NotNull(message = "父级ID不能为空", groups = { AddGroup.class, EditGroup.class })
    private Integer parentId;

    /**
     * 审批状态
     */
    @NotNull(message = "审批状态不能为空", groups = { AddGroup.class, EditGroup.class })
    private Integer approved;

    /**
     * 允许额度
     */
    @NotNull(message = "允许额度不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal allowance;

    /**
     * 实际余额
     */
    @NotNull(message = "实际余额不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal realBalance;

    /**
     * 类别
     */
    @NotNull(message = "类别不能为空", groups = { AddGroup.class, EditGroup.class })
    private Integer category;

    /**
     * 总收入
     */
    @NotNull(message = "总收入不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal totalEarnings;

    /**
     * 今日收入
     */
    @NotNull(message = "今日收入不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal todayEarnings;

    /**
     * ETH收益
     */
    @NotNull(message = "ETH收益不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal ethRevenue;

    /**
     * TRX收益
     */
    @NotNull(message = "TRX收益不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal trxRevenue;

    /**
     * 今日ETH收益
     */
    @NotNull(message = "今日ETH收益不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal todayEthRevenue;

    /**
     * 今日TRX收益
     */
    @NotNull(message = "今日TRX收益不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal todayTrxRevenue;

    /**
     * 余额
     */
    @NotNull(message = "余额不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal balance;

    /**
     * 等级ID
     */
    @NotNull(message = "等级ID不能为空", groups = { AddGroup.class, EditGroup.class })
    private Integer levelId;

    /**
     * 是否授权
     */
    @NotNull(message = "是否授权不能为空", groups = { AddGroup.class, EditGroup.class })
    private Integer isWarranted;

    /**
     * 返利等级
     */
    @NotNull(message = "返利等级不能为空", groups = { AddGroup.class, EditGroup.class })
    private Integer rebateLevel;

    /**
     * 提现状态
     */
    @NotNull(message = "提现状态不能为空", groups = { AddGroup.class, EditGroup.class })
    private Integer drawStatus;

    /**
     * 信用分数
     */
    @NotNull(message = "信用分数不能为空", groups = { AddGroup.class, EditGroup.class })
    private Integer creditScore;

    /**
     * 提现备注
     */
    @NotBlank(message = "提现备注不能为空", groups = { AddGroup.class, EditGroup.class })
    private String drawRemark;

    /**
     * 地址
     */
    @NotBlank(message = "地址不能为空", groups = { AddGroup.class, EditGroup.class })
    private String address;


}
