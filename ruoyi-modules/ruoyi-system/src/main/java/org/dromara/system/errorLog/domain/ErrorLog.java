package org.dromara.system.errorLog.domain;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import org.dromara.common.mybatis.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * 错误日志对象 f_error_log
 *
 * @author ruoyi
 */
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
@TableName("f_error_log")
public class ErrorLog extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * id
     */
    @TableId(value = "id")
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
     * 逻辑删除
     */
    @TableLogic
    private String delFlag;
    /**
     * 备注
     */
    private String remark;

}
