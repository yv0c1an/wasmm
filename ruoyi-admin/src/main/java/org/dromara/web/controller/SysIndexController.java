package org.dromara.web.controller;

import cn.dev33.satoken.annotation.SaIgnore;
import cn.dev33.satoken.config.SaTokenConfig;
import cn.dev33.satoken.stp.SaLoginModel;
import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import org.dromara.common.core.config.RuoYiConfig;
import org.dromara.common.core.constant.Constants;
import org.dromara.common.core.domain.model.LoginUser;
import org.dromara.common.core.enums.UserStatus;
import org.dromara.common.core.exception.user.UserException;
import org.dromara.common.core.utils.SpringUtils;
import org.dromara.common.core.utils.StringUtils;
import org.dromara.common.satoken.utils.LoginHelper;
import org.dromara.system.user.domain.SysUser;
import org.dromara.system.user.domain.vo.SysUserVo;
import org.dromara.system.user.mapper.SysUserMapper;
import org.dromara.web.service.SysLoginService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 首页
 *
 * @author Lion Li
 */
@RequiredArgsConstructor
@RestController
@Slf4j
public class SysIndexController {

    /**
     * 系统基础配置
     */
    private final RuoYiConfig ruoyiConfig;

    /**
     * 登录服务接口
     */
    private final SysLoginService loginService;
    private final SysUserMapper userMapper;
    private final SaTokenConfig tokenConfig;

    /**
     * 访问首页，提示语
     * @param userId 用户id
     * @param username 用户名称
     */
    @SaIgnore
    @GetMapping("/")
    public String index(Long userId, String username) {
        //生产环境 或者 没提供用户id和用户名则返回成功提示即可
        if (Constants.PROD.equals(SpringUtils.getActiveProfile()) || (ObjectUtil.isNull(userId) && StringUtils.isBlank(username))) {
            return StringUtils.format("欢迎使用{}后台管理框架，当前版本：v{}，请通过前端地址访问。",
                ruoyiConfig.getName(), ruoyiConfig.getVersion());
        }
        //除了生产环境，都可以临时获取token
        SysUserVo user = loadUserByUserIdOrUsername(userId, username);
        // 此处可根据登录用户的数据不同 自行创建 loginUser
        LoginUser loginUser = loginService.buildLoginUser(user);
        SaLoginModel model = new SaLoginModel();
        model.setDevice("pc");
        //设置三十天过期
        model.setTimeout(2592000);
        model.setActiveTimeout(2592000);
        // 生成token
        LoginHelper.login(loginUser, model);
        return StringUtils.format("{} {}", tokenConfig.getTokenPrefix(), StpUtil.getTokenValue());
    }

    private SysUserVo loadUserByUserIdOrUsername(Long userId, String username) {
        SysUser user = userMapper.selectOne(new LambdaQueryWrapper<SysUser>()
            .select(SysUser::getUsername, SysUser::getStatus)
            .eq(ObjectUtil.isNotNull(userId), SysUser::getUserId, userId)
            .eq(StringUtils.isNotBlank(username), SysUser::getUsername, username));
        if (ObjectUtil.isNull(user)) {
            log.info("登录用户：{}，{} 不存在.", userId, username);
            throw new UserException("user.not.exists", StringUtils.format("{}:{}", userId, username));
        } else if (UserStatus.DISABLE.getCode().equals(user.getStatus())) {
            log.info("登录用户：{}，{} 已被停用.", userId, username);
            throw new UserException("user.blocked", StringUtils.format("{}:{}", userId, username));
        }
        return userMapper.selectUserByUsername(user.getUsername());
    }
}
