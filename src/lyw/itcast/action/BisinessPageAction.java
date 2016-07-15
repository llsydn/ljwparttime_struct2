package lyw.itcast.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import lyw.itcast.domain.Business;
import lyw.itcast.domain.Commodity;
import lyw.itcast.domain.Message;
import lyw.itcast.domain.User_message;
import lyw.itcast.serivce.BusinessService;
import lyw.itcast.serivce.CommodityService;
import lyw.itcast.serivce.MessageService;
import lyw.itcast.serivce.User_messageService;

import java.util.List;

/**
 * 显示主页
 */
public class BisinessPageAction extends ActionSupport {

    //指定访问哪个页面
    private String type;

    //指定访问哪个商家的id
    private Integer bid;

    //指定访问的兼职信息id
    private int mid;

    //返回的变量，保存了某兼职信息的所有申请的用户
    private List<User_message> umlist;

    //返回的兼职信息
    private Message message;

    public String info() {
        //新建服务
        BusinessService businessService = new BusinessService();
        //从session中读取business
        Business business = businessService.getSessionBusiness();
        //清除临时文件
        businessService.cleanTemp();

        //声明是哪个page
        //ActionContext.getContext().put("page","space");

        if (business == null) {
            //用户或者没有登录的商家
            if (bid == null) {
                //没有指定商家id,跳到商家登录页面
                return "nologin";
            } else {
                //指定了商家id，以用户的视角访问空间主页
                ActionContext.getContext().put("seller", businessService.findById(bid));
                return "space";
            }
        } else {
            ActionContext.getContext().put("seller", business);
            //确定是登录的商家
            if (type == null) {
                //没有指定type，跳到空间主页

            } else {
                //指定了type，跳到相应的页面
                if (type.equals("modify")) {
                    //ActionContext.getContext().put("page","modify");
                    return "home";
                } else if (type.equals("manage")) {
                    //将分类列表保存到上下文当中
                    List<Commodity> commodities = new CommodityService().findall();
                    ActionContext.getContext().put("clist", commodities);
                    return "manage";
                } else if (type.equals("person")) {
                    if (mid != 0) {
                        //与用户兼职信息有关的服务
                        User_messageService user_messageService = new User_messageService();
                        umlist = user_messageService.findByMessageId(mid);

                        MessageService messageService = new MessageService();
                        message = messageService.getMessageDetail(mid);

                        return "person";
                    }
                    return "manage";
                }
            }

            return "space";
        }
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getBid() {
        return bid;
    }

    public void setBid(int bid) {
        this.bid = bid;
    }

    public int getMid() {
        return mid;
    }

    public void setMid(int mid) {
        this.mid = mid;
    }

    public List<User_message> getUmlist() {
        return umlist;
    }

    public void setUmlist(List<User_message> umlist) {
        this.umlist = umlist;
    }

    public Message getMessage() {
        return message;
    }

    public void setMessage(Message message) {
        this.message = message;
    }
}
