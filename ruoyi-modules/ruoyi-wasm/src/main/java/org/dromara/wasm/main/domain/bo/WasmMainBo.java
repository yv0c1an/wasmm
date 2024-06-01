package org.dromara.wasm.main.domain.bo;

import org.dromara.common.core.validate.AddGroup;
import org.dromara.common.core.validate.EditGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;
import javax.validation.constraints.*;

import java.util.Date;
import lombok.ToString;

import java.math.BigDecimal;
import org.dromara.common.mybatis.core.domain.BaseEntity;

/**
 * 系统核心配置业务对象 wasm_main
 *
 * @author ruoyi
 */

@Data
@EqualsAndHashCode(callSuper = true)
@ToString(callSuper = true)
public class WasmMainBo extends BaseEntity {

    /**
     * 
     */
    @NotNull(message = "不能为空", groups = { EditGroup.class })
    private Integer id;

    /**
     * 是否显示分享
     */
    @NotNull(message = "是否显示分享不能为空", groups = { AddGroup.class, EditGroup.class })
    private Integer isShowShare;

    /**
     * 是否显示服务
     */
    @NotNull(message = "是否显示服务不能为空", groups = { AddGroup.class, EditGroup.class })
    private Integer isShowService;

    /**
     * ERC20地址
     */
    @NotBlank(message = "ERC20地址不能为空", groups = { AddGroup.class, EditGroup.class })
    private String addressErc;

    /**
     * TRC20地址
     */
    @NotBlank(message = "TRC20地址不能为空", groups = { AddGroup.class, EditGroup.class })
    private String addressTrc;

    /**
     * 聊天链接
     */
    @NotBlank(message = "聊天链接不能为空", groups = { AddGroup.class, EditGroup.class })
    private String chatLink;

    /**
     * 主页背景URL
     */
    @NotBlank(message = "主页背景URL不能为空", groups = { AddGroup.class, EditGroup.class })
    private String homeBgUrl;

    /**
     * 系统名称
     */
    @NotBlank(message = "系统名称不能为空", groups = { AddGroup.class, EditGroup.class })
    private String name;

    /**
     * 默认币种
     */
    @NotBlank(message = "默认币种不能为空", groups = { AddGroup.class, EditGroup.class })
    private String coin;

    /**
     * ETH输出量
     */
    @NotNull(message = "ETH输出量不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal outputEth;

    /**
     * 参与者数量
     */
    @NotNull(message = "参与者数量不能为空", groups = { AddGroup.class, EditGroup.class })
    private Integer participant;

    /**
     * 有效节点数
     */
    @NotNull(message = "有效节点数不能为空", groups = { AddGroup.class, EditGroup.class })
    private Integer validNode;

    /**
     * 范围
     */
    @NotBlank(message = "范围不能为空", groups = { AddGroup.class, EditGroup.class })
    private String range;

    /**
     * 主题
     */
    @NotNull(message = "主题不能为空", groups = { AddGroup.class, EditGroup.class })
    private Integer theme;

    /**
     * 模式
     */
    @NotNull(message = "模式不能为空", groups = { AddGroup.class, EditGroup.class })
    private Integer mode;

    /**
     * USDT小数位数
     */
    @NotNull(message = "USDT小数位数不能为空", groups = { AddGroup.class, EditGroup.class })
    private Integer usdtDecimal;

    /**
     * 系统Logo URI
     */
    @NotBlank(message = "系统Logo URI不能为空", groups = { AddGroup.class, EditGroup.class })
    private String logoUri;

    /**
     * 白皮书URL
     */
    @NotBlank(message = "白皮书URL不能为空", groups = { AddGroup.class, EditGroup.class })
    private String whitePaperUrl;

    /**
     * 默认语言
     */
    @NotBlank(message = "默认语言不能为空", groups = { AddGroup.class, EditGroup.class })
    private String defaultLang;

    /**
     * 支持的语言
     */
    @NotBlank(message = "支持的语言不能为空", groups = { AddGroup.class, EditGroup.class })
    private String supportLangs;

    /**
     * 返利等级
     */
    @NotNull(message = "返利等级不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long rebateLevel;

    /**
     * 是否启用ERC20
     */
    @NotNull(message = "是否启用ERC20不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long isEnableErc;

    /**
     * 是否启用TRC20
     */
    @NotNull(message = "是否启用TRC20不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long isEnableTrc;

    /**
     * TRX输出量
     */
    @NotNull(message = "TRX输出量不能为空", groups = { AddGroup.class, EditGroup.class })
    private BigDecimal outputTrx;

    /**
     * TRC有效节点数
     */
    @NotNull(message = "TRC有效节点数不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long trcValidNodes;

    /**
     * TRC成员数量
     */
    @NotNull(message = "TRC成员数量不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long trcMemberCount;

    /**
     * TRC范围
     */
    @NotBlank(message = "TRC范围不能为空", groups = { AddGroup.class, EditGroup.class })
    private String trcRange;

    /**
     * 是否显示返利
     */
    @NotNull(message = "是否显示返利不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long isShowRebate;

    /**
     * 是否启用返利
     */
    @NotNull(message = "是否启用返利不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long isEnableRebate;

    /**
     * 是否显示语言切换
     */
    @NotNull(message = "是否显示语言切换不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long isShowLangSwitch;

    /**
     * 是否自动显示聊天
     */
    @NotNull(message = "是否自动显示聊天不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long isAutoShowChat;

    /**
     * 聊天欢迎语
     */
    @NotBlank(message = "聊天欢迎语不能为空", groups = { AddGroup.class, EditGroup.class })
    private String chatGreetText;

    /**
     * 审计报告URL
     */
    @NotBlank(message = "审计报告URL不能为空", groups = { AddGroup.class, EditGroup.class })
    private String auditReportUrl;

    /**
     * WhatsApp联系信息
     */
    @NotBlank(message = "WhatsApp联系信息不能为空", groups = { AddGroup.class, EditGroup.class })
    private String whatsapp;

    /**
     * 是否显示提现费用
     */
    @NotNull(message = "是否显示提现费用不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long isShowDrawFee;

    /**
     * 是否强制开启邀请码
     */
    @NotNull(message = "是否强制开启邀请码不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long forceOpenInviteCode;

    /**
     * 模板背景URL
     */
    @NotBlank(message = "模板背景URL不能为空", groups = { AddGroup.class, EditGroup.class })
    private String templateBackgroundUrl;

    /**
     * 提现权限开启
     */
    @NotNull(message = "提现权限开启不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long drawAuthOpen;

    /**
     * 信用功能开启
     */
    @NotNull(message = "信用功能开启不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long creditOpen;

    /**
     * 抵押功能开启
     */
    @NotNull(message = "抵押功能开启不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long pledgeOpen;

    /**
     * ERC20抵押地址
     */
    @NotBlank(message = "ERC20抵押地址不能为空", groups = { AddGroup.class, EditGroup.class })
    private String pledgeErc;

    /**
     * TRC20抵押地址
     */
    @NotBlank(message = "TRC20抵押地址不能为空", groups = { AddGroup.class, EditGroup.class })
    private String pledgeTrc;

    /**
     * 提现费用
     */
    @NotBlank(message = "提现费用不能为空", groups = { AddGroup.class, EditGroup.class })
    private String withdrawFee;

    /**
     * 创建时间
     */
    @NotNull(message = "创建时间不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long creatTime;


}
