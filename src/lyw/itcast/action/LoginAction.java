package lyw.itcast.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import lyw.itcast.domain.User;
import lyw.itcast.serivce.UserService;

public class LoginAction extends ActionSupport {
	private HttpServletRequest request;
	private HttpServletResponse response;

	private String login_pass;//获取登录的密码
	private String login_user;//获取登录的用户名
	private String expires; //获取到是否要保存登陆时间
	
	public String getExpires() {
		return expires;
	}

	public void setExpires(String expires) {
		this.expires = expires;
	}
	
	//1、判断用户和密码是否存在（包括验证码的校验）
	public void processing() throws ServletException, IOException {
		request = ServletActionContext.getRequest();
		response = ServletActionContext.getResponse();

		// 查找数据库中是否存在该用户
		UserService service = new UserService();
		User user = service.find(login_user, login_pass);

		// 获取保存在session中的验证码
		// 判断session中的验证码和用户提交的验证码是否正确
		HttpSession session = request.getSession();
		String checkcode = (String) session.getAttribute("checkcode");

		// 用户不存在或者验证码不正确
		if (user == null
				&& (!checkcode.equals(request.getParameter("checkcode")))) {
			response.getWriter().print("false");
		} else {
			response.getWriter().print("true");
		}
		// 发送自动登录的cookie
		if (expires!= null) {
			//System.out.println("request.getParameter(expires)!= null");
			// 这里可以实现，当浏览器关闭后，数据还是存在的。
			String sessionid = session.getId();
			session.setAttribute("user", user);
			Cookie cookie = new Cookie("JSESSIONID", sessionid);
			cookie.setMaxAge(3600);
			cookie.setPath("/ljwparttime");
			response.addCookie(cookie);
			
			//session保存用户
			session.setAttribute("user", user);
		}
	}
	
	//2、判断用户的密码是否正确。
	private String userName;
	private String oldPassword;
	public void checkpassword() throws Exception{
		response = ServletActionContext.getResponse();
		// 查找数据库中是否存在该用户
		UserService service = new UserService();
		User user = service.find(userName, oldPassword);
		
		//密码不正确(查找不到用户)
		if (user == null) {
			response.getWriter().print("false");
		} else {
			response.getWriter().print("true");
		}
		
	}
	public String getLogin_pass() {
		return login_pass;
	}

	public void setLogin_pass(String login_pass) {
		this.login_pass = login_pass;
	}
	public String getLogin_user() {
		return login_user;
	}
	public void setLogin_user(String login_user) {
		this.login_user = login_user;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getOldPassword() {
		return oldPassword;
	}
	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}
}
