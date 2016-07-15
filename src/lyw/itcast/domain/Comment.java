package lyw.itcast.domain;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

/**
 * 评论实体
 */
public class Comment implements Serializable {
	// 评论id
	private int id;
	// 哪个用户发的
	private String user_id;
	// 在哪个兼职信息里面
	private int message_id;
	// 内容
	private String content;
	// 发布时间
	private Date time;

	// 回复分页的实体
	private Page replyPage;
	// 该评论的所有回复实体[数据库不存在该字段]
	private List<Reply> replys;
	// 评论的用户实体[数据库不存在该字段]
	private User user;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getMessage_id() {
		return message_id;
	}

	public void setMessage_id(int message_id) {
		this.message_id = message_id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public Page getReplyPage() {
		return replyPage;
	}

	public void setReplyPage(Page replyPage) {
		this.replyPage = replyPage;
	}

	public List<Reply> getReplys() {
		return replys;
	}

	public void setReplys(List<Reply> replys) {
		this.replys = replys;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
}
