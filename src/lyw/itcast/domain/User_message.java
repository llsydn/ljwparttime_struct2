package lyw.itcast.domain;

import org.apache.struts2.json.annotations.JSON;

import java.util.Date;

public class User_message {
    private String user_id; //用户的id
    private String message_id; //兼职信息的id
    private Date apply_time; //申请时间。

    //连接的用户和兼职信息，数据库中不存在该字段
    private User user;
    private Message message;

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getMessage_id() {
        return message_id;
    }

    public void setMessage_id(String message_id) {
        this.message_id = message_id;
    }

    @JSON(format="yyyy-MM-dd HH:mm:ss")
    public Date getApply_time() {
        return apply_time;
    }

    public void setApply_time(Date apply_time) {
        this.apply_time = apply_time;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Message getMessage() {
        return message;
    }

    public void setMessage(Message message) {
        this.message = message;
    }
}
