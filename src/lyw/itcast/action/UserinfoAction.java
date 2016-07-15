package lyw.itcast.action;
import lyw.itcast.domain.User;
import lyw.itcast.serivce.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 用户信息action
 * @author llsydn
 *
 */
public class UserinfoAction extends ActionSupport {
	
	private String username;
	User user; //保存查询到的user信息,方便jsp获取到
	// 查找用户信息
	public String findUser() {
		//获取到actioncontent对象,就相当于获取了request,session,应用范围对象
		ActionContext context=ActionContext.getContext();
		UserService serivce = new UserService();
		
		try {
			username=new String(username.getBytes("iso-8859-1"),"UTF-8"); 
			user=serivce.findUser(username);
			//context.put("user", user);//将user保存在request域中
			context.getSession().put("user", user);//保存在session中。
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return SUCCESS;// 表示成功运行，返回json
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
}
