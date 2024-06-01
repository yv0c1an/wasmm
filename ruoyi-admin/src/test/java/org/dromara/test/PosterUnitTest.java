package org.dromara.test;

import org.dromara.common.poster.domain.Poster;
import org.junit.jupiter.api.Test;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

/**
 * 海报测试类
 */
public class PosterUnitTest {

    @Test
    public void saveImg() throws IOException {
        BufferedImage image = ImageIO.read(new File("D:\\computer\\pictures\\Saved Pictures\\nav01.jpg"));

        File file = new File("D:\\download\\download\\1.png");
        ImageIO.write(image, "png", file);
    }

    @Test
    public void generatePoster() throws IOException {
        BufferedImage bufferedImage = new BufferedImage(200, 200, BufferedImage.TYPE_INT_RGB);
        Graphics2D graphics = bufferedImage.createGraphics();
        graphics.drawString("Hello World", 10, 10);
        graphics.dispose();
        File file = new File("D:\\download\\download\\2.png");
        ImageIO.write(bufferedImage, "png", file);
    }

    @Test
    public void generatePoster2() throws IOException {
        Poster poster = new Poster(Color.BLUE,
            "https://ruoyikj-1306280403.cos.ap-guangzhou.myqcloud.com/yymy/2023/11/08/aa364caa1b494733ae2773ea40907130.jpg", 500, 500);
        poster.addTextItem(new Font("微软雅黑", Font.BOLD, 20), Color.RED, 100, 180, "Hello World");
        poster.addQrcodeItem(100, 200, 100, 100, "http://baidu.com");
        poster.addImageItem(0, 0, 200, 200, false,
            "https://ruoyikj-1306280403.cos.ap-guangzhou.myqcloud.com/yymy/2023/11/08/aa364caa1b494733ae2773ea40907130.jpg");
        BufferedImage result = poster.generate();
        poster.save("D:\\download\\download\\3.png");
        //生成图片响应流
        //poster.toOutputStream();
        //上传到oss
        //SpringUtils.getBean(ISysOssService.class).upload(poster.toInputStream(), poster.getOutputType().getType());
    }
}
