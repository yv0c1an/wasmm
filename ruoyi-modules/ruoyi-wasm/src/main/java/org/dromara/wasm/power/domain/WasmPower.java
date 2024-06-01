package org.dromara.wasm.power.domain;

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
 * 挖矿收益设置对象 wasm_power
 *
 * @author ruoyi
 */
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
@TableName("wasm_power")
public class WasmPower extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 
     */
    @TableId(value = "id")
    private Integer id;
    /**
     * 钱包类型
     */
    private String type;
    /**
     * 最小金额
     */
    private BigDecimal minAmount;
    /**
     * 最大金额
     */
    private BigDecimal maxAmount;
    /**
     * 最小速度
     */
    private BigDecimal minRate;
    /**
     * 最大速度
     */
    private BigDecimal maxRate;

}
