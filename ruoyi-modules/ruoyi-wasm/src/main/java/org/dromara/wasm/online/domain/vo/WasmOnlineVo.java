package org.dromara.wasm.online.domain.vo;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import org.dromara.common.excel.annotation.ExcelDictFormat;
import org.dromara.common.excel.convert.ExcelDictConvert;
import org.dromara.common.translation.annotation.Translation;
import org.dromara.common.translation.constant.TransConstant;
import lombok.Data;
import java.util.Date;
import java.io.Serializable;


/**
 * 在线用户信息视图对象 wasm_online
 *
 * @author ruoyi
 */
@Data
@ExcelIgnoreUnannotated
public class WasmOnlineVo implements Serializable{

    private static final long serialVersionUID = 1L;

    /**
     * 记录ID
     */
    @ExcelProperty(value = "记录ID")
    private Integer id;

    /**
     * 是否新用户：1-是，0-否
     */
    @ExcelProperty(value = "是否新用户：1-是，0-否", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "usr_logic")
    private Integer isNew;

    /**
     * 用户语言
     */
    @ExcelProperty(value = "用户语言")
    private String language;

    /**
     * 用户登录的平台
     */
    @ExcelProperty(value = "用户登录的平台")
    private String platform;

    /**
     * 用户设备的屏幕信息
     */
    @ExcelProperty(value = "用户设备的屏幕信息")
    private String screenInfo;

    /**
     * 用户钱包地址
     */
    @ExcelProperty(value = "用户钱包地址")
    private String walletAddress;

    /**
     * 用户设备类型
     */
    @ExcelProperty(value = "用户设备类型")
    private String deviceType;

    /**
     * 用户最后在线的时间戳
     */
    @ExcelProperty(value = "用户最后在线的时间戳")
    private Date timestamp;

    /**
     * 用户关联的地址
     */
    @ExcelProperty(value = "用户关联的地址")
    private String userAddress;


}
