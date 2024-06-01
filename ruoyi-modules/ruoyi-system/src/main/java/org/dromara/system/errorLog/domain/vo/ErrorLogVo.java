package org.dromara.system.errorLog.domain.vo;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;


/**
 * 错误日志视图对象 f_error_log
 *
 * @author ruoyi
 */
@Data
@ExcelIgnoreUnannotated
public class ErrorLogVo implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * id
     */
    @ExcelProperty(value = "id")
    private Long id;

    /**
     * 客户端类型
     */
    @ExcelProperty(value = "客户端类型")
    private String type;

    /**
     * 错误类型
     */
    @ExcelProperty(value = "错误类型")
    private String errorType;

    /**
     * 用户id
     */
    @ExcelProperty(value = "用户id")
    private Long uid;

    /**
     * 昵称
     */
    @ExcelProperty(value = "昵称")
    private String nickname;

    /**
     * 路径
     */
    @ExcelProperty(value = "路径")
    private String url;

    /**
     * 方法
     */
    @ExcelProperty(value = "方法")
    private String method;

    /**
     * 参数
     */
    @ExcelProperty(value = "参数")
    private String args;

    /**
     * 错误信息
     */
    @ExcelProperty(value = "错误信息")
    private String error;

    /**
     * 创建时间
     */
    @ExcelProperty(value = "创建时间")
    private Date createTime;

    /**
     * 修改时间
     */
    @ExcelProperty(value = "修改时间")
    private Date updateTime;

    /**
     * 备注
     */
    @ExcelProperty(value = "备注")
    private String remark;


}
