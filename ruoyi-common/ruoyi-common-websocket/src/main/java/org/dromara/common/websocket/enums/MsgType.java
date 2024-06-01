package org.dromara.common.websocket.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * @author bkywksj
 * 消息类型
 */

@Getter
@AllArgsConstructor
public enum MsgType {

    /**
     * 心跳
     */
    PING("ping"),
    /**
     * 文本
     */
    TEXT("text"),
    /**
     * 图片
     */
    IMAGE("image"),
    /**
     * 文件
     */
    FILE("file"),
    /**
     * 视频
     */
    VIDEO("video"),
    /**
     * 语音
     */
    VOICE("voice"),
    /**
     * 笔记
     */
    NOTE("note"),
    /**
     * 收藏
     */
    COLLECTION("collection");

    private final String type;
}
