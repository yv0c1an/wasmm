package org.dromara.wasm.balanceInfo.domain.bo;

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
 * 余额信息业务对象 wasm_balance_info
 *
 * @author ruoyi
 */

@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
public class WasmBalanceInfoBo extends BaseEntity {

    /**
     * 
     */
    @NotNull(message = "不能为空", groups = { EditGroup.class })
    private Integer id;

    /**
     * 总额
     */
    @NotNull(message = "总额不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal total;

    /**
     * 可用金额
     */
    @NotNull(message = "可用金额不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal available;

    /**
     * 冻结金额
     */
    @NotNull(message = "冻结金额不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal freezen;

    /**
     * 币种
     */
    @NotBlank(message = "币种不能为空", groups = { AddGroup.class, EditGroup.class })
    private String coin;

    /**
     * 地址
     */
    @NotBlank(message = "地址不能为空", groups = { AddGroup.class, EditGroup.class })
    private String address;


}
