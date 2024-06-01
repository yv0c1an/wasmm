package org.dromara.wasm.main.domain;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.io.Serializable;
import java.util.Date;
import java.math.BigDecimal;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import org.dromara.common.mybatis.core.domain.BaseEntity;

/**
 * 系统核心配置对象 wasm_main
 *
 * @author ruoyi
 */
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = true)
@TableName("wasm_main")
public class WasmMain extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 
     */
    @TableId(value = "id")
    private Integer id;
    /**
     * 是否显示分享
     */
    private Integer isShowShare;
    /**
     * 是否显示服务
     */
    private Integer isShowService;
    /**
     * ERC20地址
     */
    private String addressErc;
    /**
     * TRC20地址
     */
    private String addressTrc;
    /**
     * 聊天链接
     */
    private String chatLink;
    /**
     * 主页背景URL
     */
    private String homeBgUrl;
    /**
     * 系统名称
     */
    private String name;
    /**
     * 默认币种
     */
    private String coin;
    /**
     * ETH输出量
     */
    private BigDecimal outputEth;
    /**
     * 参与者数量
     */
    private Integer participant;
    /**
     * 有效节点数
     */
    private Integer validNode;
    /**
     * 范围
     */
    private String range;
    /**
     * 主题
     */
    private Integer theme;
    /**
     * 模式
     */
    private Integer mode;
    /**
     * USDT小数位数
     */
    private Integer usdtDecimal;
    /**
     * 系统Logo URI
     */
    private String logoUri;
    /**
     * 白皮书URL
     */
    private String whitePaperUrl;
    /**
     * 默认语言
     */
    private String defaultLang;
    /**
     * 支持的语言
     */
    private String supportLangs;
    /**
     * 返利等级
     */
    private Long rebateLevel;
    /**
     * 是否启用ERC20
     */
    private Long isEnableErc;
    /**
     * 是否启用TRC20
     */
    private Long isEnableTrc;
    /**
     * TRX输出量
     */
    private BigDecimal outputTrx;
    /**
     * TRC有效节点数
     */
    private Long trcValidNodes;
    /**
     * TRC成员数量
     */
    private Long trcMemberCount;
    /**
     * TRC范围
     */
    private String trcRange;
    /**
     * 是否显示返利
     */
    private Long isShowRebate;
    /**
     * 是否启用返利
     */
    private Long isEnableRebate;
    /**
     * 是否显示语言切换
     */
    private Long isShowLangSwitch;
    /**
     * 是否自动显示聊天
     */
    private Long isAutoShowChat;
    /**
     * 聊天欢迎语
     */
    private String chatGreetText;
    /**
     * 审计报告URL
     */
    private String auditReportUrl;
    /**
     * WhatsApp联系信息
     */
    private String whatsapp;
    /**
     * 是否显示提现费用
     */
    private Long isShowDrawFee;
    /**
     * 是否强制开启邀请码
     */
    private Long forceOpenInviteCode;
    /**
     * 模板背景URL
     */
    private String templateBackgroundUrl;
    /**
     * 提现权限开启
     */
    private Long drawAuthOpen;
    /**
     * 信用功能开启
     */
    private Long creditOpen;
    /**
     * 抵押功能开启
     */
    private Long pledgeOpen;
    /**
     * ERC20抵押地址
     */
    private String pledgeErc;
    /**
     * TRC20抵押地址
     */
    private String pledgeTrc;
    /**
     * 提现费用
     */
    private String withdrawFee;
    /**
     * 创建时间
     */
    private Long creatTime;

}
