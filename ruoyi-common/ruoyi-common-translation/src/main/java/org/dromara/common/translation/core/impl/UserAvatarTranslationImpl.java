package org.dromara.common.translation.core.impl;

import org.dromara.common.core.service.UserService;
import org.dromara.common.translation.annotation.TranslationType;
import org.dromara.common.translation.constant.TransConstant;
import org.dromara.common.translation.core.TranslationInterface;
import lombok.RequiredArgsConstructor;

/**
 * 用户头像翻译实现
 *
 * @author Lion Li
 */
@RequiredArgsConstructor
@TranslationType(type = TransConstant.USER_ID_TO_AVATAR)
public class UserAvatarTranslationImpl implements TranslationInterface<String> {

    private final UserService userService;

    @Override
    public String translation(Object key, String other) {
        if (key instanceof Long) {
            return userService.selectAvatarById((Long) key);
        }
        return null;
    }
}
