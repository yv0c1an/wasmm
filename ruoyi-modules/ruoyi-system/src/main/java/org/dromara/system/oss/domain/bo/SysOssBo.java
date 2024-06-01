package org.dromara.system.oss.domain.bo;

import org.dromara.common.core.validate.EditGroup;
import org.dromara.common.mybatis.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

/**
 * OSS对象存储分页查询对象 sys_oss
 *
 * @author Lion Li
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class SysOssBo extends BaseEntity {

    /**
     * ossId
     */
    @NotNull(groups = {EditGroup.class})
    private Long ossId;

    /**
     * 文件名
     */
    private String fileName;

    /**
     * 原名
     */
    private String originalName;

    /**
     * 文件后缀名
     */
    private String fileSuffix;

    /**
     * URL地址
     */
    private String url;
    /**
     * 状态
     */
    @NotBlank(groups = {EditGroup.class})
    private String status;
    /**
     * 服务商
     */
    private String service;

}
