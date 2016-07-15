package lyw.itcast.utils;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.geom.AffineTransform;
import java.awt.image.AffineTransformOp;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

/**
 * 将图片裁剪到指定大小的图片
 */
public class UnifiedImage {
    private File srcFile;
    private File desFile;

    //旋转角度
    private int rotate;

    // ===剪切点x坐标
    private float x;
    private float y;
    // ===剪切点宽度
    private float width;
    private float height;

    /**
     * 旋转
     * http://www.2cto.com/kf/201506/407055.html
     *
     * @param degree 旋转角度
     * @throws Exception
     */
    public BufferedImage spin(BufferedImage src, int degree) throws Exception {
        int swidth = 0; // 旋转后的宽度
        int sheight = 0; // 旋转后的高度
        int x; // 原点横坐标
        int y; // 原点纵坐标

        // 处理角度--确定旋转弧度
        degree = degree % 360;
        if (degree < 0)
            degree = 360 + degree;// 将角度转换到0-360度之间
        double theta = Math.toRadians(degree);// 将角度转为弧度

        // 确定旋转后的宽和高
        if (degree == 180 || degree == 0 || degree == 360) {
            swidth = src.getWidth();
            sheight = src.getHeight();
        } else if (degree == 90 || degree == 270) {
            sheight = src.getWidth();
            swidth = src.getHeight();
        } else {
            swidth = (int) (Math.sqrt(src.getWidth() * src.getWidth()
                    + src.getHeight() * src.getHeight()));
            sheight = (int) (Math.sqrt(src.getWidth() * src.getWidth()
                    + src.getHeight() * src.getHeight()));
        }

        x = (swidth / 2) - (src.getWidth() / 2);// 确定原点坐标
        y = (sheight / 2) - (src.getHeight() / 2);

        //创建新image
        BufferedImage spinImage = new BufferedImage(swidth, sheight,
                src.getType());
        // 设置图片背景颜色
        Graphics2D gs = (Graphics2D) spinImage.getGraphics();
        gs.setColor(Color.white);
        gs.fillRect(0, 0, swidth, sheight);// 以给定颜色绘制旋转后图片的背景

        AffineTransform at = new AffineTransform();
        at.rotate(theta, swidth / 2, sheight / 2);// 旋转图象
        at.translate(x, y);
        AffineTransformOp op = new AffineTransformOp(at,
                AffineTransformOp.TYPE_BICUBIC);
        spinImage = op.filter(src, spinImage);

        return spinImage;
    }

    /**
     * 将图像旋转，裁剪，然后缩放
     */
    public void cut() {
        try {
            FileInputStream fis = new FileInputStream(srcFile);
            //从文件读取图片
            BufferedImage sourceImg = ImageIO.read(fis);

            //旋转图片
            sourceImg = this.spin(sourceImg, (int) rotate);

            //图片宽
            int Pwidth = sourceImg.getWidth();
            //图片高
            int Pheight = sourceImg.getHeight();

            //原图在裁剪框中的缩放
            int frame_size = 280;
            float scaleX = (float) Pwidth / frame_size;
            float scaleY = (float) Pheight / frame_size;

            //裁剪框在原图中真正的大小
            int cx = (int) (x * scaleX);
            int cy = (int) (y * scaleY);
            int rwidth = (int) (width * scaleX);
            int rheight = (int) (height * scaleY);
            //截图
            BufferedImage newImg = sourceImg.getSubimage(cx, cy, rwidth, rheight);
            System.out.println("Pwidth:" + Pwidth + ",Pheight:" + Pheight + ",cx: " + cx + ",cy:" + cy + ",rwidth:" + rwidth + ",rheight: " + rheight);
            //ImageIO.write(newImg, "jpg", new File("D:/test.jpg"));

            //缩放后的图片
            int des_size = 180;
            BufferedImage image = new BufferedImage(des_size, des_size, BufferedImage.TYPE_INT_RGB);
            image.getGraphics().drawImage(newImg, 0, 0, des_size, des_size, null);

            //写出为jpg格式
            ImageIO.write(image, "jpg", desFile);

            fis.close();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    /**
     * 旋转图片为指定角度[备用]
     * http://cping1982.blog.51cto.com/601635/130066/
     *
     * @param bufferedimage 目标图像
     * @param degree        旋转角度
     * @return
     */
    public static BufferedImage rotateImage(final BufferedImage bufferedimage, final int degree) {
        int w = bufferedimage.getWidth();
        int h = bufferedimage.getHeight();
        int type = bufferedimage.getColorModel().getTransparency();
        BufferedImage img;
        Graphics2D graphics2d;
        (graphics2d = (img = new BufferedImage(w, h, type))
                .createGraphics()).setRenderingHint(
                RenderingHints.KEY_INTERPOLATION,
                RenderingHints.VALUE_INTERPOLATION_BILINEAR);
        graphics2d.rotate(Math.toRadians(degree), w / 2, h / 2);
        graphics2d.drawImage(bufferedimage, 0, 0, null);
        graphics2d.dispose();
        return img;
    }

    public File getSrcFile() {
        return srcFile;
    }

    public void setSrcFile(File srcFile) {
        this.srcFile = srcFile;
    }

    public File getDesFile() {
        return desFile;
    }

    public void setDesFile(File desFile) {
        this.desFile = desFile;
    }

    public float getX() {
        return x;
    }

    public void setX(float x) {
        this.x = x;
    }

    public float getY() {
        return y;
    }

    public void setY(float y) {
        this.y = y;
    }

    public float getWidth() {
        return width;
    }

    public void setWidth(float width) {
        this.width = width;
    }

    public float getHeight() {
        return height;
    }

    public void setHeight(float height) {
        this.height = height;
    }

    public int getRotate() {
        return rotate;
    }

    public void setRotate(int rotate) {
        this.rotate = rotate;
    }
}
