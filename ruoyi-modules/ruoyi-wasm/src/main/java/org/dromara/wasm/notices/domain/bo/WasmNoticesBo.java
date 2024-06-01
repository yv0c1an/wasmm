package org.dromara.wasm.notices.domain.bo;

import org.dromara.common.core.validate.AddGroup;
import org.dromara.common.core.validate.EditGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;
import javax.validation.constraints.*;

import java.util.Date;
import lombok.ToString;

import org.dromara.common.mybatis.core.domain.BaseEntity;

/**
 * 通知公告业务对象 wasm_notices
 *
 * @author ruoyi
 */

@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
public class WasmNoticesBo extends BaseEntity {

    /**
     * 唯一标识
     */
    @NotNull(message = "唯一标识不能为空", groups = { EditGroup.class })
    private Integer id;

    /**
     * 公告标题
     */
    @NotBlank(message = "公告标题不能为空", groups = { AddGroup.class, EditGroup.class })
    private String title;

    /**
     * 公告内容
     */
    @NotBlank(message = "公告内容不能为空", groups = { AddGroup.class, EditGroup.class })
    private String content;

    /**
     * 公告状态：1-启用，0-禁用
     */
    @NotNull(message = "公告状态：1-启用，0-禁用不能为空", groups = { AddGroup.class, EditGroup.class })
    private Integer status;

    /**
     * 相关链接或地址
     */
    @NotBlank(message = "相关链接或地址不能为空", groups = { AddGroup.class, EditGroup.class })
    private String address;


}
