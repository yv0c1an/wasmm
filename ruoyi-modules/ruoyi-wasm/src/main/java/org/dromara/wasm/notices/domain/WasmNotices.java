package org.dromara.wasm.notices.domain;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.io.Serializable;
import java.util.Date;
import java.math.BigDecimal;
import lombok.NoArgsConstructor;

import org.dromara.common.mybatis.core.domain.BaseEntity;

/**
 * 通知公告对象 wasm_notices
 *
 * @author ruoyi
 */
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
@TableName("wasm_notices")
public class WasmNotices extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 唯一标识
     */
    @TableId(value = "id")
    private Integer id;
    /**
     * 公告标题
     */
    private String title;
    /**
     * 公告内容
     */
    private String content;
    /**
     * 公告状态：1-启用，0-禁用
     */
    private Integer status;
    /**
     * 相关链接或地址
     */
    private String address;

}
