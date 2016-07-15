package lyw.itcast.utils;

import java.security.GeneralSecurityException;
import java.util.Date;
import java.util.Properties;








import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Message.RecipientType;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import com.sun.mail.util.MailSSLSocketFactory;

import lyw.itcast.domain.User;
public class EmailUtils {
	
	private static final String FROM = "1091391667@qq.com";
	/**
	 * 发送重设密码链接的邮件
	 */
	public static void sendResetPasswordEmail(User user) {
		Properties prop = new Properties();
		prop.setProperty("mail.host", "smtp.qq.com");// 设置邮件服务器主机名
		prop.setProperty("mail.transport.protocol", "smtp"); // 发送邮件协议名称
		prop.setProperty("mail.smtp.auth", "true"); // 发送服务器需要身份验证
		prop.setProperty("mail.mime.charset", "utf-8");//设置编码
		
		//创建session
		Session session = Session.getInstance(prop);
		session.setDebug(true);
		
		MailSSLSocketFactory sf;
		try {
			sf = new MailSSLSocketFactory();
			sf.setTrustAllHosts(true);
		    prop.put("mail.smtp.ssl.enable", "true");
		    prop.put("mail.smtp.ssl.socketFactory", sf);
		} catch (GeneralSecurityException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		//通过session得到transport对象
		Transport ts = null;
		try {
			ts = session.getTransport();
			//连上邮件服务器
			ts.connect("smtp.qq.com", "1091391667", "xfigknlixdzlfjeg");
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		MimeMessage message = new MimeMessage(session);
		try {
			message.setSubject("找回您的帐户与密码");
			message.setSentDate(new Date());
			message.setFrom(new InternetAddress(FROM));
			message.setRecipient(RecipientType.TO, new InternetAddress(user.getEmail()));
			message.setContent("亲爱的用户您好"
					+ "(<a href='mailto:"+user.getEmail()+"'>"+user.getEmail()+"</a>)<br/>"
					+ "我们已经收到你找回密码的请求,要使用新的密码, 请使用以下链接启用密码:<br/><a href='" + GenerateLinkUtils.generateResetPwdLink(user) +"'>点击重新设置密码</a><br/>"
					+ "祝您的职业更上一层楼!<br/>",
					"text/html;charset=utf-8");
			// 发送邮件
			ts.sendMessage(message, message.getAllRecipients());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/*public static void sendResetPasswordEmail(User user) {
		Properties prop = new Properties();
		prop.setProperty("mail.host", "smtp.sohu.com");
		prop.setProperty("mail.transport.protocol", "smtp");
		prop.setProperty("mail.smtp.auth", "true");
		
		//创建session
		Session session = Session.getInstance(prop);
		session.setDebug(true);
		
		//通过session得到transport对象
		Transport ts = null;
		try {
			ts = session.getTransport();
			//连上邮件服务器
			ts.connect("smtp.sohu.com", "llsydn", "428527");
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		MimeMessage message = new MimeMessage(session);
		try {
			message.setSubject("找回您的帐户与密码");
			message.setSentDate(new Date());
			message.setFrom(new InternetAddress(FROM));
			message.setRecipient(RecipientType.TO, new InternetAddress(user.getEmail()));
			message.setContent("要使用新的密码, 请使用以下链接启用密码:<br/><a href='" + GenerateLinkUtils.generateResetPwdLink(user) +"'>点击重新设置密码</a>","text/html;charset=utf-8");
			// 发送邮件
			ts.sendMessage(message, message.getAllRecipients());
//			System.out.println(request.getRemoteAddr());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}*/
	
}