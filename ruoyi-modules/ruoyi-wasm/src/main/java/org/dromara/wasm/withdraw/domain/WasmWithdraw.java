package org.dromara.wasm.withdraw.domain;

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
 * 提现对象 wasm_withdraw
 *
 * @author ruoyi
 */
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
@TableName("wasm_withdraw")
public class WasmWithdraw extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 提现记录ID
     */
    @TableId(value = "id")
    private Long id;
    /**
     * 提现金额
     */
    private BigDecimal amount;
    /**
     * 提现状态：1-待处理，2-处理中，3-已完成，4-已取消
     */
    private String status;
    /**
     * 提现地址
     */
    private String address;

}
