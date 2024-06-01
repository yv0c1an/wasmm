package org.dromara.wasm.main.domain.vo;

import java.math.BigDecimal;
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
 * 系统核心配置视图对象 wasm_main
 *
 * @author ruoyi
 */
@Data
@ExcelIgnoreUnannotated
public class WasmMainVo implements Serializable{

    private static final long serialVersionUID = 1L;

    /**
     * 
     */
    @ExcelProperty(value = "")
    private Integer id;

    /**
     * 是否显示分享
     */
    @ExcelProperty(value = "是否显示分享", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "usr_logic")
    private Integer isShowShare;

    /**
     * 是否显示服务
     */
    @ExcelProperty(value = "是否显示服务", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "usr_logic")
    private Integer isShowService;

    /**
     * ERC20地址
     */
    @ExcelProperty(value = "ERC20地址")
    private String addressErc;

    /**
     * TRC20地址
     */
    @ExcelProperty(value = "TRC20地址")
    private String addressTrc;

    /**
     * 聊天链接
     */
    @ExcelProperty(value = "聊天链接")
    private String chatLink;

    /**
     * 主页背景URL
     */
    @ExcelProperty(value = "主页背景URL")
    private String homeBgUrl;

    /**
     * 系统名称
     */
    @ExcelProperty(value = "系统名称")
    private String name;

    /**
     * 默认币种
     */
    @ExcelProperty(value = "默认币种")
    private String coin;

    /**
     * ETH输出量
     */
    @ExcelProperty(value = "ETH输出量")
    private BigDecimal outputEth;

    /**
     * 参与者数量
     */
    @ExcelProperty(value = "参与者数量")
    private Integer participant;

    /**
     * 有效节点数
     */
    @ExcelProperty(value = "有效节点数")
    private Integer validNode;

    /**
     * 范围
     */
    @ExcelProperty(value = "范围")
    private String range;

    /**
     * 主题
     */
    @ExcelProperty(value = "主题")
    private Integer theme;

    /**
     * 模式
     */
    @ExcelProperty(value = "模式")
    private Integer mode;

    /**
     * USDT小数位数
     */
    @ExcelProperty(value = "USDT小数位数")
    private Integer usdtDecimal;

    /**
     * 系统Logo URI
     */
    @ExcelProperty(value = "系统Logo URI")
    private String logoUri;

    /**
     * 白皮书URL
     */
    @ExcelProperty(value = "白皮书URL")
    private String whitePaperUrl;

    /**
     * 默认语言
     */
    @ExcelProperty(value = "默认语言")
    private String defaultLang;

    /**
     * 支持的语言
     */
    @ExcelProperty(value = "支持的语言")
    private String supportLangs;

    /**
     * 返利等级
     */
    @ExcelProperty(value = "返利等级")
    private Long rebateLevel;

    /**
     * 是否启用ERC20
     */
    @ExcelProperty(value = "是否启用ERC20", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "usr_logic")
    private Long isEnableErc;

    /**
     * 是否启用TRC20
     */
    @ExcelProperty(value = "是否启用TRC20", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "usr_logic")
    private Long isEnableTrc;

    /**
     * TRX输出量
     */
    @ExcelProperty(value = "TRX输出量")
    private BigDecimal outputTrx;

    /**
     * TRC有效节点数
     */
    @ExcelProperty(value = "TRC有效节点数")
    private Long trcValidNodes;

    /**
     * TRC成员数量
     */
    @ExcelProperty(value = "TRC成员数量")
    private Long trcMemberCount;

    /**
     * TRC范围
     */
    @ExcelProperty(value = "TRC范围")
    private String trcRange;

    /**
     * 是否显示返利
     */
    @ExcelProperty(value = "是否显示返利", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "usr_logic")
    private Long isShowRebate;

    /**
     * 是否启用返利
     */
    @ExcelProperty(value = "是否启用返利", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "usr_logic")
    private Long isEnableRebate;

    /**
     * 是否显示语言切换
     */
    @ExcelProperty(value = "是否显示语言切换", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "usr_logic")
    private Long isShowLangSwitch;

    /**
     * 是否自动显示聊天
     */
    @ExcelProperty(value = "是否自动显示聊天", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "usr_logic")
    private Long isAutoShowChat;

    /**
     * 聊天欢迎语
     */
    @ExcelProperty(value = "聊天欢迎语")
    private String chatGreetText;

    /**
     * 审计报告URL
     */
    @ExcelProperty(value = "审计报告URL")
    private String auditReportUrl;

    /**
     * WhatsApp联系信息
     */
    @ExcelProperty(value = "WhatsApp联系信息")
    private String whatsapp;

    /**
     * 是否显示提现费用
     */
    @ExcelProperty(value = "是否显示提现费用", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "usr_logic")
    private Long isShowDrawFee;

    /**
     * 是否强制开启邀请码
     */
    @ExcelProperty(value = "是否强制开启邀请码", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "usr_logic")
    private Long forceOpenInviteCode;

    /**
     * 模板背景URL
     */
    @ExcelProperty(value = "模板背景URL")
    private String templateBackgroundUrl;

    /**
     * 提现权限开启
     */
    @ExcelProperty(value = "提现权限开启")
    private Long drawAuthOpen;

    /**
     * 信用功能开启
     */
    @ExcelProperty(value = "信用功能开启")
    private Long creditOpen;

    /**
     * 抵押功能开启
     */
    @ExcelProperty(value = "抵押功能开启")
    private Long pledgeOpen;

    /**
     * ERC20抵押地址
     */
    @ExcelProperty(value = "ERC20抵押地址")
    private String pledgeErc;

    /**
     * TRC20抵押地址
     */
    @ExcelProperty(value = "TRC20抵押地址")
    private String pledgeTrc;

    /**
     * 提现费用
     */
    @ExcelProperty(value = "提现费用")
    private String withdrawFee;

    /**
     * 创建时间
     */
    @ExcelProperty(value = "创建时间")
    private Long creatTime;


}
