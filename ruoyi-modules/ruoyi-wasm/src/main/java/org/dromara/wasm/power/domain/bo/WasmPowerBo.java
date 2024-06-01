package org.dromara.wasm.power.domain.bo;

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
 * 挖矿收益设置业务对象 wasm_power
 *
 * @author ruoyi
 */

@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
public class WasmPowerBo extends BaseEntity {

    /**
     * 
     */
    @NotNull(message = "不能为空", groups = { EditGroup.class })
    private Integer id;

    /**
     * 钱包类型
     */
    @NotBlank(message = "钱包类型不能为空", groups = { AddGroup.class, EditGroup.class })
    private String type;

    /**
     * 最小金额
     */
    @NotNull(message = "最小金额不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal minAmount;

    /**
     * 最大金额
     */
    private BigDecimal maxAmount;

    /**
     * 最小速度
     */
    @NotNull(message = "最小速度不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal minRate;

    /**
     * 最大速度
     */
    @NotNull(message = "最大速度不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal maxRate;


}
