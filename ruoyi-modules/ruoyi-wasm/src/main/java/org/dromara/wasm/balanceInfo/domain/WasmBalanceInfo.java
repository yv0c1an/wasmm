package org.dromara.wasm.balanceInfo.domain;

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
 * 余额信息对象 wasm_balance_info
 *
 * @author ruoyi
 */
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
@TableName("wasm_balance_info")
public class WasmBalanceInfo extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 
     */
    @TableId(value = "id")
    private Integer id;
    /**
     * 总额
     */
    private BigDecimal total;
    /**
     * 可用金额
     */
    private BigDecimal available;
    /**
     * 冻结金额
     */
    private BigDecimal freezen;
    /**
     * 币种
     */
    private String coin;
    /**
     * 地址
     */
    private String address;

}
