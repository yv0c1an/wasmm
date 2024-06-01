package org.dromara.common.poster.domain;

import lombok.Data;
import org.dromara.common.poster.enums.PosterItemType;

import java.awt.*;

/**
 * 海报元素
 *
 * @author yecha
 */
@Data
public class PosterItem {

    /**
     * 海报元素类型
     */
    private PosterItemType type;

    /**
     * 字体颜色
     */
    private Color fontColor;

    /**
     * 字体
     */
    private Font font;

    /**
     * x轴
     */
    private int x;

    /**
     * y轴
     */
    private int y;

    /**
     * 宽
     */
    private int width;
    /**
     * 高
     */
    private int height;

    /**
     * 是否圆形
     */
    private Boolean isCircle = false;

    /**
     * 内容
     */
    private String content;

    /**
     * 文本元素初始化
     */
    public PosterItem(PosterItemType type, Font font, Color fontColor, int x, int y, String content) {
        this.type = type;
        this.fontColor = fontColor;
        this.font = font;
        this.x = x;
        this.y = y;
        this.content = content;
    }

    /**
     * 图片元素初始化
     */
    public PosterItem(PosterItemType type, int x, int y, int width, int height, Boolean isCircle, String content) {
        this.type = type;
        this.x = x;
        this.y = y;
        this.width = width;
        this.height = height;
        this.isCircle = isCircle;
        this.content = content;
    }

    /**
     * 二维码元素初始化
     */
    public PosterItem(PosterItemType type, int x, int y, int width, int height, String content) {
        this.type = type;
        this.x = x;
        this.y = y;
        this.width = width;
        this.height = height;
        this.content = content;
    }
}
