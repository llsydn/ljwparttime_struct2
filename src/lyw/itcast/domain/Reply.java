package lyw.itcast.domain;

import java.sql.Date;

/**
 * 回复实体
 */
public class Reply {
    //回复id
    private int id;
    //哪个用户发的
    private String user_id;
    //属于哪个评论
    private int comment_id;
    //内容
    private String content;
    //发送时间
    private Date time;
    
    //属于哪个用户发的【数据库不存在该字段】
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

    public int getComment_id() {
        return comment_id;
    }

    public void setComment_id(int comment_id) {
        this.comment_id = comment_id;
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

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
