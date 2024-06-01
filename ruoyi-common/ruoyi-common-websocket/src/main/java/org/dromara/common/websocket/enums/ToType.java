package org.dromara.common.websocket.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * @author bkywksj
 * 接收对象类型（单聊 single 群聊 group）
 */

@Getter
@AllArgsConstructor
public enum ToType {

    /**
     * 单聊
     */
    SINGLE("single"),
    /**
     * 群聊
     */
    GROUP("group");


    private final String type;
}
