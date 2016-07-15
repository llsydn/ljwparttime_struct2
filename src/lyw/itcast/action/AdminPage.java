package lyw.itcast.action;

import com.opensymphony.xwork2.ActionSupport;
import lyw.itcast.domain.*;
import lyw.itcast.serivce.*;

import java.util.List;

/**
 * 管理员的导航页面
 */
public class AdminPage extends ActionSupport{

    //页面类型
    private String type;

    //商家列表
    private List<Business> blist;

    //兼职信息列表
    private List<Message> mlist;

    //商家列表
    private List<User> ulist;

    private List<Commodity> comlist;

    //分页
    private Page myPage;

    //网页接受的参数，分页页数
    private int page;

    @Override
    public String execute() throws Exception {
        AdminService adminService = new AdminService();
        Admin admin = adminService.getSessionAdmin();
        if (admin != null) {
            //已经登录
            if (type != null) {

                //商家服务
                BusinessService businessService = new BusinessService();

                if (type.equals("business_vertify")){
                    //商家审核

                    //分页
                    if (page == 0) {
                        page = 1;//默认第一页
                    }
                    myPage = businessService.getLevel0businessCount(page);
                    blist = businessService.getLevel0Bisinesses(myPage);

                    return "business_vertify";
                } else if (type.equals("business_manage")) {
                    //商家管理

                    //分页
                    if (page == 0) {
                        page = 1;//默认第一页
                    }

                    //默认显示通过审核的商家
                    myPage = businessService.getLevel1businessCount(page);
                    blist = businessService.getLevel1Bisinesses(myPage);

                    return "business_manage";
                } else if (type.equals("message_manage")) {
                    //兼职信息管理

                    MessageService messageService = new MessageService();

                    myPage = messageService.getAllMessagePage(page);
                    mlist = messageService.getAllMessageOrderBy(myPage, "");

                    return "message_manage";
                } else if (type.equals("user_manage")) {

                    UserService userService = new UserService();

                    myPage = userService.getAllUsersCount(page);
                    ulist = userService.getUsersByPages(myPage);

                    return "user_manage";
                } else if (type.equals("commodity_manage")) {

                    CommodityService commodityService = new CommodityService();

                    comlist = commodityService.findall();

                    return "commodity_manage";
                }
            }
            return "main";
        } else {
            //没有登录
            return "nologin";
        }
        //return SUCCESS;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public List<Business> getBlist() {
        return blist;
    }

    public void setBlist(List<Business> blist) {
        this.blist = blist;
    }

    public Page getMyPage() {
        return myPage;
    }

    public void setMyPage(Page myPage) {
        this.myPage = myPage;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public List<Message> getMlist() {
        return mlist;
    }

    public void setMlist(List<Message> mlist) {
        this.mlist = mlist;
    }

    public List<User> getUlist() {
        return ulist;
    }

    public void setUlist(List<User> ulist) {
        this.ulist = ulist;
    }

    public List<Commodity> getComlist() {
        return comlist;
    }

    public void setComlist(List<Commodity> comlist) {
        this.comlist = comlist;
    }
}
