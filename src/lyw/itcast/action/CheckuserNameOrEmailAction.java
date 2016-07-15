package lyw.itcast.action;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import lyw.itcast.domain.User;
import lyw.itcast.serivce.UserService;
import lyw.itcast.utils.EmailUtils;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CheckuserNameOrEmailAction extends ActionSupport {
	private String userNameOrEmail;//获取到提交上来的userNameOrEmail
	private String checkcode; //获取用户输入的验证码。
	
	//1、检查userNameOrEmail是否存在，还有验证码是否正确
	public void checkuserNameOrEmail() throws Exception{
		HttpServletResponse response=ServletActionContext.getResponse();
		UserService userService=new UserService();
		User user=new User();
		//获取保存在session中验证码
		String sessioncheckcode=(String) ActionContext.getContext().getSession().get("checkcode");
		
		if (userNameOrEmail!=null ) {
			if (userNameOrEmail.contains("@")) { //表示是用户输入的是邮箱
				user=userService.findByEmail(userNameOrEmail);
				
			}else {  //否则用户输入的就是用户名
				user=userService.findUser(userNameOrEmail);
			}
			//判断用户是否存在(直接向浏览器输出信息)
			if (user==null)  {
				response.getWriter().print("false");
			}else {
				response.getWriter().print("true");
			}
		}else {  //因为第二次使用ajax请求的是时候，userNameOrEmail已经没有发送过来的的，是为空的。
			if (!checkcode.equals(sessioncheckcode))  {
				response.getWriter().print("false");
			}else {
				response.getWriter().print("true");
			}
		}
	}
	
	//2、向用户发送邮件。重置密码（这里接收到的用户名或者邮箱肯定是存在的）
	public String sendEmail(){
		UserService userService=new UserService();
		User user=new User();
		
		if (userNameOrEmail.contains("@")) { //表示是用户输入的是邮箱
			user=userService.findByEmail(userNameOrEmail);
			
		}else {  //否则用户输入的就是用户名
			user=userService.findUser(userNameOrEmail);
		}
		
		// 发送重新设置密码的链接
		EmailUtils.sendResetPasswordEmail(user);
		ActionContext.getContext().getSession().put("user", user);
		ActionContext.getContext().getSession().put("message", "您的申请已提交成功，请查看您的"+user.getEmail()+"邮箱。");
		
		return "sendEmail";
	}
	
	//3、重置用户密码的action
	public String resetPasswordUI(){
		
		return "resetPasswordUI";
	}
	
	//4、重置用户的密码
	private String userName;
	private String newPassword;
	private String newPassword2;
	public String resetPassword(){
		
		UserService userService=new UserService();
		User user = userService.findUser(userName);
		
		//重新设置用户的密码。
		user.setPassword(newPassword);
		//向数据库中更新用户的信息
		userService.updateUser(user, user.getUser_id());
		
		ActionContext.getContext().getSession().put("message", "您的密码更新成功...");
		
		return "resetPassword";
	}
	
	
	public String getCheckcode() {
		return checkcode;
	}

	public void setCheckcode(String checkcode) {
		this.checkcode = checkcode;
	}

	public String getUserNameOrEmail() {
		return userNameOrEmail;
	}

	public void setUserNameOrEmail(String userNameOrEmail) {
		this.userNameOrEmail = userNameOrEmail;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	public String getNewPassword2() {
		return newPassword2;
	}

	public void setNewPassword2(String newPassword2) {
		this.newPassword2 = newPassword2;
	}
}
