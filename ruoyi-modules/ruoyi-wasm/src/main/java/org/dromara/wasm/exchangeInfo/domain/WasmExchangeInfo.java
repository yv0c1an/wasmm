package org.dromara.wasm.exchangeInfo.domain;

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
 * 交易记录对象 wasm_exchange_info
 *
 * @author ruoyi
 */
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
@TableName("wasm_exchange_info")
public class WasmExchangeInfo extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 
     */
    @TableId(value = "id")
    private Integer id;
    /**
     * 交易金额
     */
    private BigDecimal amount;
    /**
     * 到账金额
     */
    private BigDecimal arrive;
    /**
     * 币种
     */
    private String coin;
    /**
     * 地址
     */
    private String address;

}
