package lyw.itcast.domain;

import java.util.Date;

/**
 * 收藏商家信息的整合对象
 * @author llsydn
 *
 */
public class Collect_Business {
	private String name; //商家的名称
	private String phone;//商家的手机
	private String email;//商家的email
	private String address;//商家的地址
	private Date coltime; //收藏的时间
	private String user_id; //收藏的用户的id号
	private String business_id; //商家的id号
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getColtime() {
		return coltime;
	}
	public void setColtime(Date coltime) {
		this.coltime = coltime;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getBusiness_id() {
		return business_id;
	}
	public void setBusiness_id(String business_id) {
		this.business_id = business_id;
	}
	
}
