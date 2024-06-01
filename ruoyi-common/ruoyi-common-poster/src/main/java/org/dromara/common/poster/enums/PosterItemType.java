package org.dromara.common.poster.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 海报类型
 *
 * @author yecha
 */

@Getter
@AllArgsConstructor
public enum PosterItemType {

    /**
     * 文本
     */
    TEXT("text", "文本"),
    /**
     * 图片
     */
    IMAGE("image", "图片"),
    /**
     * 二维码
     */
    QRCODE("qrcode", "二维码");

    /**
     * 类型
     */
    private final String type;
    /**
     * 名称
     */
    private final String name;

}
