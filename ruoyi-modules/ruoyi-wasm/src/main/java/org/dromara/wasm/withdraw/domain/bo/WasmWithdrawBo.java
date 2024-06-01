package org.dromara.wasm.withdraw.domain.bo;

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
 * 提现业务对象 wasm_withdraw
 *
 * @author ruoyi
 */

@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
public class WasmWithdrawBo extends BaseEntity {

    /**
     * 提现记录ID
     */
    @NotNull(message = "提现记录ID不能为空", groups = { EditGroup.class })
    private Long id;

    /**
     * 提现金额
     */
    @NotNull(message = "提现金额不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal amount;

    /**
     * 提现状态：1-待处理，2-处理中，3-已完成，4-已取消
     */
    @NotBlank(message = "提现状态：1-待处理，2-处理中，3-已完成，4-已取消不能为空", groups = { AddGroup.class, EditGroup.class })
    private String status;

    /**
     * 提现地址
     */
    @NotBlank(message = "提现地址不能为空", groups = { AddGroup.class, EditGroup.class })
    private String address;


}
