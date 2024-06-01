package org.dromara.wasm.exchangeInfo.domain.bo;

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
 * 交易记录业务对象 wasm_exchange_info
 *
 * @author ruoyi
 */

@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
public class WasmExchangeInfoBo extends BaseEntity {

    /**
     * 
     */
    @NotNull(message = "不能为空", groups = { EditGroup.class })
    private Integer id;

    /**
     * 交易金额
     */
    @NotNull(message = "交易金额不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal amount;

    /**
     * 到账金额
     */
    @NotNull(message = "到账金额不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal arrive;

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
