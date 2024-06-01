package org.dromara.wasm.rebateConfig.domain;

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
 * 返利配置对象 wasm_rebate_config
 *
 * @author ruoyi
 */
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
@TableName("wasm_rebate_config")
public class WasmRebateConfig extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 
     */
    @TableId(value = "id")
    private Integer id;
    /**
     * 英文名称
     */
    private String enName;
    /**
     * 日文名称
     */
    private String jpName;
    /**
     * 繁体中文名称
     */
    private String twName;
    /**
     * 最小余额
     */
    private BigDecimal minBalance;
    /**
     * 等级1的返利率
     */
    private BigDecimal level1;
    /**
     * 等级2的返利率
     */
    private BigDecimal level2;
    /**
     * 等级3的返利率
     */
    private BigDecimal level3;

}
