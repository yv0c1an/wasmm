package org.dromara.system.errorLog.domain.bo;

import org.dromara.common.core.validate.EditGroup;
import org.dromara.common.mybatis.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

import javax.validation.constraints.NotNull;

/**
 * 错误日志业务对象 f_error_log
 *
 * @author ruoyi
 */

@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
public class ErrorLogBo extends BaseEntity {

    /**
     * id
     */
    @NotNull(message = "id不能为空", groups = {EditGroup.class})
    private Long id;

    /**
     * 客户端类型
     */
    private String type;

    /**
     * 错误类型
     */
    private String errorType;

    /**
     * 用户id
     */
    private Long uid;

    /**
     * 昵称
     */
    private String nickname;

    /**
     * 路径
     */
    private String url;

    /**
     * 方法
     */
    private String method;

    /**
     * 参数
     */
    private String args;

    /**
     * 错误信息
     */
    private String error;

    /**
     * 备注
     */
    private String remark;


}
