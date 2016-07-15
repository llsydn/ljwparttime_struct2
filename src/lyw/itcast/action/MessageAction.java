package lyw.itcast.action;

import com.opensymphony.xwork2.ActionSupport;
import lyw.itcast.domain.Message;
import lyw.itcast.domain.Page;
import lyw.itcast.serivce.MessageService;

import java.util.List;

/**
 * 显示兼职信息的Action
 */
//测试url
//http://localhost:8080/ljwparttime_struct2/include/MessageAction?comodity_id=1&start=1&size=10
public class MessageAction extends ActionSupport {

    private static final long serialVersionUID = 1L;

    //返回的json数据
    private List<Message> data;
    //兼职分类id
    private int comodity_id;
    //开始位置
    private int start;
    //多少条
    private int size;
    //某分类总共有多少条记录
    private int messageTotalCount;
    //兼职详细信息的记录实体
    private Message message;
    //传过来的兼职信息id
    private int message_id;

    //传过来的商家的id，为了获得该商家发布的兼职信息列表
    private int bid;
    //该商家的分页类
    private Page mypage;
    //传来的参数，表示要看第几页
    private int page;


    /**
     * 返回兼职信息列表action
     */
    public String getMessageList() throws Exception {
        MessageService messageService = new MessageService();
        System.out.println("首页的兼职信息列表请求，comodity_id:" + comodity_id + " start:" + start + " size:" + size);
        data = messageService.findMessageByCommodity(comodity_id, start, size);
        return SUCCESS;
    }

    /**
     * 返回某分类下兼职信息的总共数量action
     */
    public String getMessageCount() {
        MessageService messageService = new MessageService();
        messageTotalCount = messageService.getTotalCount(comodity_id);
        return SUCCESS;
    }

    /**
     * 兼职信息页面构建的action
     */
    public String getMessageDetail() {
        //System.out.println("message_id:"+message_id);
        MessageService messageService = new MessageService();
        message = messageService.getMessageDetail(message_id);
        if (message == null) {
            return "error";//返回错误页面
        }
        return "success";//返回显示页面
    }

    /**
     * 获得一个商家的兼职信息列表
     *
     * @return
     */
    public String getBusinessMessages() {
        MessageService messageService = new MessageService();
        //page分页
        mypage = messageService.findPageByBusiness(bid);
        mypage.setCurrent(page);
        //list列表
        data = messageService.findMessageByBusiness(bid, mypage.getStart(), mypage.getPageSize());
        return SUCCESS;
    }

    public List<Message> getData() {
        return data;
    }

    public void setData(List<Message> data) {
        this.data = data;
    }

    public int getComodity_id() {
        return comodity_id;
    }

    public void setComodity_id(int comodity_id) {
        this.comodity_id = comodity_id;
    }

    public int getStart() {
        return start;
    }

    public void setStart(int start) {
        this.start = start;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public int getMessageTotalCount() {
        return messageTotalCount;
    }

    public void setMessageTotalCount(int messageTotalCount) {
        this.messageTotalCount = messageTotalCount;
    }

    public Message getMessage() {
        return message;
    }

    public void setMessage(Message message) {
        this.message = message;
    }

    public int getMessage_id() {
        return message_id;
    }

    public void setMessage_id(int message_id) {
        this.message_id = message_id;
    }

    public int getBid() {
        return bid;
    }

    public void setBid(int bid) {
        this.bid = bid;
    }

    public Page getMypage() {
        return mypage;
    }

    public void setMypage(Page mypage) {
        this.mypage = mypage;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }
}
