package lyw.itcast.action;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class CheckCodeAction extends ActionSupport {
	private HttpServletRequest request;
	private HttpServletResponse response;

	public void processing() throws ServletException, IOException {
		
		request = ServletActionContext.getRequest();
		response = ServletActionContext.getResponse();
		
		// 6,设置头，控制浏览器不要缓存图片数据
		response.setHeader("Expires", "-1");
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Pragma", "no-cache");

		// 5,通知浏览器以图片方式打开
		response.setHeader("Content-type", "image/jpeg");
		// 1,在内存中创建一副图片(宽、高、类型)
		BufferedImage image = new BufferedImage(70, 25,
				BufferedImage.TYPE_INT_RGB);

		// 2,得到图片
		// Graphics g=image.getGraphics();
		Graphics2D g = (Graphics2D) image.getGraphics();

		// 设置背景色
		g.setColor(Color.white); // 白色为底
		g.fillRect(0, 0, 70, 25); // 用白色填充整个矩形。(x y 宽 高)

		// 3,向图片上写数据 字体的样式。null表示为默认，Font.BOLD 表示粗体，大小。
		g.setColor(Color.blue);
		g.setFont(new Font(null, Font.BOLD, 20));
		String checkcode = makeNum();
		g.drawString(checkcode, 0, 20); // 表示从（0,20）位置写数据

		// 7.将验证码保存在session中。
		HttpSession session = request.getSession();
		session.setAttribute("checkcode", checkcode);

		// 4,将图片写给浏览器。
		ImageIO.write(image, "jpg", response.getOutputStream());

	}

	private String makeNum() {
		// char c[]={'中','国'}; 中文验证码。
		Random r = new Random();
		String num = r.nextInt(999999) + ""; // 0-99999 123 1234567

		// 保证数据长度为6位。 不足6位，在前面补0
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < 6 - num.length(); i++) {
			sb.append("0");
		}
		return sb.toString() + num;
	}

}
