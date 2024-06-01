package org.dromara.wasm.online.domain.bo;

import org.dromara.common.core.validate.AddGroup;
import org.dromara.common.core.validate.EditGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;
import javax.validation.constraints.*;

import java.util.Date;
import lombok.ToString;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.dromara.common.mybatis.core.domain.BaseEntity;

/**
 * 在线用户信息业务对象 wasm_online
 *
 * @author ruoyi
 */

@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
public class WasmOnlineBo extends BaseEntity {

    /**
     * 记录ID
     */
    @NotNull(message = "记录ID不能为空", groups = { EditGroup.class })
    private Integer id;

    /**
     * 是否新用户：1-是，0-否
     */
    @NotNull(message = "是否新用户：1-是，0-否不能为空", groups = { AddGroup.class, EditGroup.class })
    private Integer isNew;

    /**
     * 用户语言
     */
    @NotBlank(message = "用户语言不能为空", groups = { AddGroup.class, EditGroup.class })
    private String language;

    /**
     * 用户登录的平台
     */
    @NotBlank(message = "用户登录的平台不能为空", groups = { AddGroup.class, EditGroup.class })
    private String platform;

    /**
     * 用户设备的屏幕信息
     */
    @NotBlank(message = "用户设备的屏幕信息不能为空", groups = { AddGroup.class, EditGroup.class })
    private String screenInfo;

    /**
     * 用户钱包地址
     */
    @NotBlank(message = "用户钱包地址不能为空", groups = { AddGroup.class, EditGroup.class })
    private String walletAddress;

    /**
     * 用户设备类型
     */
    @NotBlank(message = "用户设备类型不能为空", groups = { AddGroup.class, EditGroup.class })
    private String deviceType;

    /**
     * 用户最后在线的时间戳
     */
    @NotNull(message = "用户最后在线的时间戳不能为空", groups = { AddGroup.class, EditGroup.class })
    private Date timestamp;

    /**
     * 用户关联的地址
     */
    @NotBlank(message = "用户关联的地址不能为空", groups = { AddGroup.class, EditGroup.class })
    private String userAddress;


}
