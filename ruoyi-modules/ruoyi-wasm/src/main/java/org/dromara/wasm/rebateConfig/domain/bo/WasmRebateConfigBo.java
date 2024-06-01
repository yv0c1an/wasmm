package org.dromara.wasm.rebateConfig.domain.bo;

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
 * 返利配置业务对象 wasm_rebate_config
 *
 * @author ruoyi
 */

@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
public class WasmRebateConfigBo extends BaseEntity {

    /**
     * 
     */
    @NotNull(message = "不能为空", groups = { EditGroup.class })
    private Integer id;

    /**
     * 英文名称
     */
    @NotBlank(message = "英文名称不能为空", groups = { AddGroup.class, EditGroup.class })
    private String enName;

    /**
     * 日文名称
     */
    @NotBlank(message = "日文名称不能为空", groups = { AddGroup.class, EditGroup.class })
    private String jpName;

    /**
     * 繁体中文名称
     */
    @NotBlank(message = "繁体中文名称不能为空", groups = { AddGroup.class, EditGroup.class })
    private String twName;

    /**
     * 最小余额
     */
    @NotNull(message = "最小余额不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal minBalance;

    /**
     * 等级1的返利率
     */
    @NotNull(message = "等级1的返利率不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal level1;

    /**
     * 等级2的返利率
     */
    @NotNull(message = "等级2的返利率不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal level2;

    /**
     * 等级3的返利率
     */
    @NotNull(message = "等级3的返利率不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal level3;


}
