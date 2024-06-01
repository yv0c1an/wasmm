package org.dromara.wasm.api.e;

public enum Language {
    EN_US("en-US"),
    ZH_TW("zh-TW"),
    JA_JP("ja-JP");

    private String code;

    Language(String code) {
        this.code = code;
    }

    public static Language getLanguage(String code) {
        for (Language language : Language.values()) {
            if (language.getCode().equals(code)) {
                return language;
            }
        }
        return null;
    }

    public String getCode() {
        return code;
    }
}
