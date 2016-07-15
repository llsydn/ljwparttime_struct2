package lyw.itcast.domain;

import java.util.Date;

/**
 * 商家收藏
 * @author llsydn
 *
 */
public class User_business {
	private String user_id; //用户的id
	private String business_id; //商家的id
	private Date coltime; //收藏时间。
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
	public Date getColtime() {
		return coltime;
	}
	public void setColtime(Date coltime) {
		this.coltime = coltime;
	}
}
