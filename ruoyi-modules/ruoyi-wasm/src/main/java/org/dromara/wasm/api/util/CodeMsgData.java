package org.dromara.wasm.api.util;

import org.dromara.wasm.api.e.Language;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

/**
 * 错误码
 *
 */
public class CodeMsgData {
    public static final class Message {
        private String text;

        public Message(String text) {
            this.text = text;
        }

        public String getText() {
            return text;
        }
    }

    private static Map<Integer, Map<Language, Message>> messages = new HashMap<>();

    // 初始化数据
    {
        messages.put(501, new HashMap<>());
        messages.get(501).put(Language.EN_US, new Message("Network error, please try again!"));
        messages.get(501).put(Language.ZH_TW, new Message("網路錯誤，請重試!"));
        messages.get(501).put(Language.JA_JP, new Message("ネットワーク エラー。もう一度お試しください。"));

        messages.put(502, new HashMap<>());
        messages.get(502).put(Language.EN_US, new Message("Your account balance is insufficient!"));
        messages.get(502).put(Language.ZH_TW, new Message("您的帳戶餘額不足!"));
        messages.get(502).put(Language.JA_JP, new Message("アカウントの残高が不足しています"));
    }

    public static  String getErrorMessage(int code, Language lang) {
        Message message = messages.getOrDefault(code, Collections.emptyMap()).get(lang);
        return message != null ? message.getText() : null;
    }
}
