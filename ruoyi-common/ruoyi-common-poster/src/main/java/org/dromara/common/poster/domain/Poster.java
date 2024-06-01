package org.dromara.common.poster.domain;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.extra.qrcode.QrCodeUtil;
import lombok.Data;
import org.dromara.common.core.utils.ServletUtils;
import org.dromara.common.core.utils.StringUtils;
import org.dromara.common.poster.enums.OutputType;
import org.dromara.common.poster.enums.PosterItemType;

import javax.imageio.ImageIO;
import javax.imageio.stream.ImageOutputStream;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.geom.Ellipse2D;
import java.awt.image.BufferedImage;
import java.io.*;
import java.net.URL;
import java.util.List;

/**
 * 海报参数
 *
 * @author yecha
 */
@Data
public class Poster {

    /**
     * 背景图片
     */
    private String bgUrl;

    /**
     * 背景颜色
     */
    private Color bgColor;

    /**
     * 宽
     */
    private int width;

    /**
     * 高
     */
    private int height;

    /**
     * 海报元素
     */
    private List<PosterItem> posterItems;

    /**
     * 海报输出类型
     */
    private OutputType outputType;
    /**
     * 生成结果
     */
    private BufferedImage result;

    /**
     * 背景图链接 宽 高
     */
    public Poster(String bgUrl, int width, int height) {
        this(null, bgUrl, width, height, null);
    }

    /**
     * 背景图链接 宽 高 输出类型
     */
    public Poster(String bgUrl, int width, int height, OutputType outputType) {
        this(null, bgUrl, width, height, outputType);
    }

    /**
     * 背景颜色 宽 高
     */
    public Poster(Color bgColor, int width, int height) {
        this(bgColor, null, width, height, null);
    }

    /**
     * 背景颜色 宽 高 输出类型
     */
    public Poster(Color bgColor, int width, int height, OutputType outputType) {
        this(bgColor, null, width, height, outputType);
    }

    /**
     * 背景颜色 背景图链接 宽 高 输出类型
     */
    public Poster(Color bgColor, String bgUrl, int width, int height) {
        this(bgColor, bgUrl, width, height, null);
    }

    /**
     * 背景颜色 背景图链接 宽 高 输出类型
     */
    public Poster(Color bgColor, String bgUrl, int width, int height, OutputType outputType) {
        this.bgColor = ObjectUtil.isNull(bgColor) ? Color.WHITE : bgColor;
        this.bgUrl = bgUrl;
        this.width = width;
        this.height = height;
        this.outputType = ObjectUtil.isNull(outputType) ? OutputType.JPG : outputType;
        posterItems = CollUtil.newArrayList();
    }

    /**
     * 添加文本元素
     */
    public void addTextItem(Font font, Color fontColor, int x, int y, String text) {
        posterItems.add(new PosterItem(PosterItemType.TEXT, font, fontColor, x, y, text));
    }

    /**
     * 添加图片元素
     */
    public void addImageItem(int x, int y, int width, int height, Boolean isCircle, String image) {
        posterItems.add(new PosterItem(PosterItemType.IMAGE, x, y, width, height, isCircle, image));
    }

    /**
     * 添加二维码元素
     */
    public void addQrcodeItem(int x, int y, int width, int height, String link) {
        posterItems.add(new PosterItem(PosterItemType.QRCODE, x, y, width, height, link));
    }

    /**
     * 生成海报
     */
    public BufferedImage generate() {
        try {
            //创建画布
            result = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
            Graphics2D g2d = result.createGraphics();
            //绘制背景
            if (StringUtils.isBlank(bgUrl)) {
                g2d.setColor(bgColor);
                g2d.fillRect(0, 0, width, height);
            } else {
                BufferedImage bgImage = ImageIO.read(new URL(bgUrl));
                g2d.drawImage(bgImage.getScaledInstance(width, height, Image.SCALE_SMOOTH), 0, 0, null);
            }
            //抗锯齿
            g2d.setRenderingHint(RenderingHints.KEY_TEXT_ANTIALIASING, RenderingHints.VALUE_TEXT_ANTIALIAS_ON);
            //遍历海报元素进行绘制
            for (PosterItem posterItem : posterItems) {
                switch (posterItem.getType().getType()) {
                    case "text":
                        g2d.setColor(posterItem.getFontColor());
                        g2d.setFont(posterItem.getFont());
                        g2d.drawString(posterItem.getContent(), posterItem.getX(), posterItem.getY());
                        break;
                    case "image":
                        BufferedImage image = ImageIO.read(new URL(posterItem.getContent()));
                        if (posterItem.getIsCircle()) {
                            image = drawCircleImage(image, posterItem.getWidth());
                        }
                        g2d.drawImage(image.getScaledInstance(posterItem.getWidth(), posterItem.getHeight(), Image.SCALE_SMOOTH),
                            posterItem.getX(), posterItem.getY(), null);
                        break;
                    case "qrcode":
                        BufferedImage qrcode = QrCodeUtil.generate(posterItem.getContent(), posterItem.getWidth(), posterItem.getHeight());
                        g2d.drawImage(qrcode.getScaledInstance(posterItem.getWidth(), posterItem.getHeight(), Image.SCALE_SMOOTH),
                            posterItem.getX(), posterItem.getY(), null);
                        break;
                    default:
                        throw new RuntimeException("未知海报元素类型");
                }
            }
            g2d.dispose();
            //返回画布
            return result;
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 保存海报到文件
     */
    public void save(String filePath) {
        if (ObjectUtil.isNull(result)) {
            throw new RuntimeException("请先生成海报");
        }
        try {
            File file = new File(filePath);
            ImageIO.write(result, "png", file);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 转为输入流
     */
    public InputStream toInputStream() {
        try {
            // 创建字节数组输出流
            ByteArrayOutputStream bs = new ByteArrayOutputStream();
            // 创建ImageOutputStream
            ImageOutputStream imgOut = ImageIO.createImageOutputStream(bs);
            // 写入图片
            ImageIO.write(result, outputType.getType(), imgOut);
            // 获取输入流
            return new ByteArrayInputStream(bs.toByteArray());
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 生成图片流响应
     */
    public void toOutputStream() {
        if (ObjectUtil.isNull(result)) {
            throw new RuntimeException("请先生成海报");
        }
        try {
            HttpServletResponse response = ServletUtils.getResponse();
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Cache-Control", "no-cache");
            response.setDateHeader("Expires", 0);
            response.setContentType("image/" + outputType.getType());
            // 将图像输出到Servlet输出流中。
            ServletOutputStream sos = response.getOutputStream();
            ImageIO.write(result, outputType.getType(), sos);
            sos.close();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 画圆形图片
     *
     * @param imageUrl 图片链接
     * @param size     大小
     * @return BufferedImage
     */
    public BufferedImage drawCircleImage(String imageUrl, int size) {
        try {
            return drawCircleImage(ImageIO.read(new URL(imageUrl)), size);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 画圆形图片
     *
     * @param image 图片BufferedImage
     * @param size  大小
     * @return BufferedImage
     */
    public BufferedImage drawCircleImage(BufferedImage image, int size) {
        BufferedImage bufferedImage = new BufferedImage(size, size, BufferedImage.TYPE_INT_ARGB);
        Ellipse2D.Double shape = new Ellipse2D.Double(0, 0, size, size);
        Graphics2D g2 = bufferedImage.createGraphics();
        bufferedImage = g2.getDeviceConfiguration().createCompatibleImage(size, size, Transparency.TRANSLUCENT);
        g2 = bufferedImage.createGraphics();
        g2.setComposite(AlphaComposite.Clear);
        g2.fill(new Rectangle(bufferedImage.getWidth(), bufferedImage.getHeight()));
        g2.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC, 1.0f));
        g2.setClip(shape);
        // 使用 setRenderingHint 设置抗锯齿
        g2 = bufferedImage.createGraphics();
        g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
        g2.fillRoundRect(0, 0, size, size, size, size);
        g2.setComposite(AlphaComposite.SrcIn);
        g2.drawImage(image, 0, 0, size, size, null);
        g2.dispose();
        return bufferedImage;
    }
}
