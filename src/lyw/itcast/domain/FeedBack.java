package lyw.itcast.domain;

import java.util.Date;

/**
 * 反馈意见
 * @author llsydn
 *
 */
public class FeedBack {
	private String comment; //反馈的文本
	private String style; //反馈的联系方式
	private String user_id; //用户id
	private Date feedbacktime; //反馈时间
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getStyle() {
		return style;
	}
	public void setStyle(String style) {
		this.style = style;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public Date getFeedbacktime() {
		return feedbacktime;
	}
	public void setFeedbacktime(Date feedbacktime) {
		this.feedbacktime = feedbacktime;
	}
}
