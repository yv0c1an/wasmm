package org.dromara.wasm.profits.domain.bo;

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
 * 利润记录业务对象 wasm_profits
 *
 * @author ruoyi
 */

@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
public class WasmProfitsBo extends BaseEntity {

    /**
     * 利润记录的唯一标识
     */
    @NotNull(message = "利润记录的唯一标识不能为空", groups = { EditGroup.class })
    private Integer id;

    /**
     * 利润金额
     */
    @NotNull(message = "利润金额不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal amount;

    /**
     * 涉及的币种
     */
    @NotBlank(message = "涉及的币种不能为空", groups = { AddGroup.class, EditGroup.class })
    private String coin;

    /**
     * 相关地址
     */
    @NotBlank(message = "相关地址不能为空", groups = { AddGroup.class, EditGroup.class })
    private String address;


}
