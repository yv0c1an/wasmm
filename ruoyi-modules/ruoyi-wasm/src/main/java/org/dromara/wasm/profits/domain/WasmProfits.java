package org.dromara.wasm.profits.domain;

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
 * 利润记录对象 wasm_profits
 *
 * @author ruoyi
 */
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
@TableName("wasm_profits")
public class WasmProfits extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 利润记录的唯一标识
     */
    @TableId(value = "id")
    private Integer id;
    /**
     * 利润金额
     */
    private BigDecimal amount;
    /**
     * 涉及的币种
     */
    private String coin;
    /**
     * 相关地址
     */
    private String address;

}
