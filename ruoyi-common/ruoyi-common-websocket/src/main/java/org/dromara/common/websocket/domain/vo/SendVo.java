package org.dromara.common.websocket.domain.vo;

import lombok.Data;
import org.dromara.common.websocket.domain.FromUser;

import java.io.Serializable;

/**
 * @author bkywksj
 */
@Data
public class SendVo implements Serializable {
    /**
     * 消息id
     */
    private String msgId;
    /**
     * 消息类型 心跳/文本/图片/文件/视频/语音/笔记/收藏等
     */
    private String msgType;
    /**
     * 来自用户
     */
    private FromUser fromUser;
    /**
     * 接收对象类型（单聊 single 群聊 group）
     */
    private String toType;

    /**
     * 接收对象 （用户id/群id）
     */
    private Long toObj;

    /**
     * 消息内容
     */
    private String content;

    /**
     * 发送时间
     */
    private Long sendTime;

}
