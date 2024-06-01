package org.dromara.common.websocket.domain;

import lombok.Data;

import java.io.Serializable;

/**
 * 来自用户
 *
 * @author bkywksj
 */
@Data
public class FromUser implements Serializable {
    /**
     * 用户id
     */
    private Long userId;
    /**
     * 昵称
     */
    private String nickname;
    /**
     * 头像
     */
    private String avatar;

    /**
     * 会话id
     */
    private String sessionId;

    /**
     * 群号
     */
    private Long groupId;
    /**
     * 群昵称
     */
    private String groupNickname;
    /**
     * 群头像
     */
    private String groupAvatar;
}
