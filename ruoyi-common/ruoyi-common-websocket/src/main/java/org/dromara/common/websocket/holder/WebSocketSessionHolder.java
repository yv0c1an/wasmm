package org.dromara.common.websocket.holder;

import lombok.AccessLevel;
import lombok.NoArgsConstructor;
import org.springframework.web.socket.WebSocketSession;

import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

/**
 * WebSocketSession 用于保存当前所有在线的会话信息
 *
 * @author zendwang
 */
@NoArgsConstructor(access = AccessLevel.PRIVATE)
public class WebSocketSessionHolder {

    private static final Map<Long, WebSocketSession> USER_SESSION_MAP = new ConcurrentHashMap<>();

    /**
     * 添加session
     */
    public static void addSession(Long sessionKey, WebSocketSession session) {
        USER_SESSION_MAP.put(sessionKey, session);
    }

    /**
     * 移除sessionKey
     */
    public static void removeSession(Long sessionKey) {
        if (USER_SESSION_MAP.containsKey(sessionKey)) {
            USER_SESSION_MAP.remove(sessionKey);
        }
    }

    /**
     * 根据sessionKey获取WebSocketSession
     */
    public static WebSocketSession getSessions(Long sessionKey) {
        return USER_SESSION_MAP.get(sessionKey);
    }

    /**
     * 获取所有在线的session
     */
    public static Set<Long> getSessionsAll() {
        return USER_SESSION_MAP.keySet();
    }

    /**
     * 判断是否存在session
     */
    public static Boolean existSession(Long sessionKey) {
        return USER_SESSION_MAP.containsKey(sessionKey);
    }

    /**
     * 获取当前在线人数
     */
    public static Integer getSessionSize() {
        return USER_SESSION_MAP.size();
    }
}
