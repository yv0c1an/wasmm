package org.dromara.common.poster.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 图文输出类型
 *
 * @author yecha
 */

@Getter
@AllArgsConstructor
public enum OutputType {

    /**
     * jpg
     */
    JPG("jpg"),
    /**
     * jpeg
     */
    JPEG("jpeg"),
    /**
     * png
     */
    PNG("png"),
    /**
     * bmp
     */
    BMP("bmp");

    public final String type;

}
