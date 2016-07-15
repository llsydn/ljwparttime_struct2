package lyw.itcast.domain;

/**
 * 添加用户的Form
 * @author llsydn
 *
 */
public class User {
	private String username; //用户名
	private String password; //密码
	private String user_id; //用户id
	private String email; //用户邮箱
	private String iphone;  //手机
	private String sex; //性别
	private String imageurl; //保存的头像
	private Integer resumecount; //创建简历的数目
	
	public String getImageurl() {
		return imageurl;
	}
	public void setImageurl(String imageurl) {
		this.imageurl = imageurl;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getIphone() {
		return iphone;
	}
	public void setIphone(String iphone) {
		this.iphone = iphone;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public Integer getResumecount() {
		return resumecount;
	}
	public void setResumecount(Integer resumecount) {
		this.resumecount = resumecount;
	}
}
