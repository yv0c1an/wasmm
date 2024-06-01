package org.dromara.web.service;


import org.dromara.common.core.exception.ServiceException;
import org.dromara.common.core.utils.SpringUtils;
import org.dromara.system.client.domain.SysClient;
import org.dromara.web.domain.vo.LoginVo;

/**
 * 授权策略
 *
 * @author Michelle.Chung
 */
public interface IAuthStrategy {

    String BASE_NAME = "AuthStrategy";

    /**
     * 登录
     * @param body 登录信息
     * @param client 客户端信息
     * @param grantType 授权类型
     * @return 登录返回信息
     */
    static LoginVo login(String body, SysClient client, String grantType) {
        // 授权类型和客户端id
        String beanName = grantType + BASE_NAME;
        if (!SpringUtils.containsBean(beanName)) {
            throw new ServiceException("授权类型不正确!");
        }
        IAuthStrategy instance = SpringUtils.getBean(beanName);
        return instance.login(body, client);
    }

    /**
     * 登录
     */
    LoginVo login(String body, SysClient client);

}
