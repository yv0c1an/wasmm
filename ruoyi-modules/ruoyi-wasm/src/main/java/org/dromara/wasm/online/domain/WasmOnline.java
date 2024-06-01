package org.dromara.wasm.online.domain;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.io.Serializable;
import java.util.Date;
import java.math.BigDecimal;
import lombok.NoArgsConstructor;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.dromara.common.mybatis.core.domain.BaseEntity;

/**
 * 在线用户信息对象 wasm_online
 *
 * @author ruoyi
 */
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
@TableName("wasm_online")
public class WasmOnline extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 记录ID
     */
    @TableId(value = "id")
    private Integer id;
    /**
     * 是否新用户：1-是，0-否
     */
    private Integer isNew;
    /**
     * 用户语言
     */
    private String language;
    /**
     * 用户登录的平台
     */
    private String platform;
    /**
     * 用户设备的屏幕信息
     */
    private String screenInfo;
    /**
     * 用户钱包地址
     */
    private String walletAddress;
    /**
     * 用户设备类型
     */
    private String deviceType;
    /**
     * 用户最后在线的时间戳
     */
    private Date timestamp;
    /**
     * 用户关联的地址
     */
    private String userAddress;

}
