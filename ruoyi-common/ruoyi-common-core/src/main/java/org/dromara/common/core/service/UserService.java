package org.dromara.common.core.service;


import org.dromara.common.core.domain.model.LoginUser;

/**
 * 通用 用户服务
 *
 * @author Lion Li
 */
public interface UserService {

    /**
     * 查询登录用户信息
     * @return LoginUser
     */
    LoginUser getLoginUser();

    /**
     * 通过用户ID查询用户账户
     *
     * @param userId 用户ID
     * @return 用户账户
     */
    String selectUserNameById(Long userId);

    /**
     * 通过用户id查询头像
     * @param userId 用户ID
     * @return 用户头像
     */
    String selectAvatarById(Long userId);

    /**
     * 通过用户id查询昵称
     * @param userId 用户ID
     * @return 用户昵称
     */
    String selectNicknameById(Long userId);

    /**
     * 通过用户ID查询用户手机号
     *
     * @param userId 用户id
     * @return 用户手机号
     */
    String selectPhonenumberById(Long userId);

    /**
     * 通过用户ID查询用户邮箱
     *
     * @param userId 用户id
     * @return 用户邮箱
     */
    String selectEmailById(Long userId);

}
