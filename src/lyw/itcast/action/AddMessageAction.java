package lyw.itcast.action;

import com.opensymphony.xwork2.ActionSupport;
import lyw.itcast.domain.Business;
import lyw.itcast.serivce.BusinessService;
import lyw.itcast.serivce.MessageService;

/**
 * 添加新兼职信息的action
 */
public class AddMessageAction extends ActionSupport {
    //兼职信息标题
    private String title;
    //兼职信息内容
    private String content;
    //时间戳字符串
    private String time;
    //分类id
    private int comid;
    //指定操作类型
    private String type;

    //传来的参数，指定兼职信息id
    private int mid;

    //返回，表示是否成功
    private boolean success;
    //返回，提示信息
    private String msg;


    @Override
    public String execute() throws Exception {
        //引入兼职信息的相关服务
        MessageService messageService = new MessageService();

        //验证商家有没有登录
        BusinessService businessService = new BusinessService();
        Business business = businessService.getSessionBusiness();
        if (business != null) {

            if (type.equals("add")) {
                if (business.getLevel()>0) {
                    //添加新兼职信息
                    success = messageService.addMessage(title, content, time, comid, business.getId());
                    if (success) {
                        msg = "添加兼职信息成功！";
                    } else {
                        msg = "添加兼职信息失败";
                    }
                }else {
                    success = false;
                    msg = "还未通过商家审核，暂时不能发布兼职信息";
                }

            } else if (type.equals("del")) {
                success = messageService.deleteMessage(mid, business.getId());
                if (success) {
                    msg = "删除兼职信息成功";
                } else {
                    msg = "删除兼职信息失败";
                }
            } else if (type.equals("save")) {
                success = messageService.saveMessage(title, content, time, comid, mid);
                if (success) {
                    msg = "更新兼职信息成功";
                } else {
                    msg = "更新兼职信息失败";
                }
            }
        } else {
            success = false;
            msg = "登录后才能操作啊！";
        }
        return SUCCESS;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public int getComid() {
        return comid;
    }

    public void setComid(int comid) {
        this.comid = comid;
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public String getMsg() {
        return msg;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getMid() {
        return mid;
    }

    public void setMid(int mid) {
        this.mid = mid;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
