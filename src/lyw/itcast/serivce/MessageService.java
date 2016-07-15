package lyw.itcast.serivce;

import lyw.itcast.dao.BusinessDAO;
import lyw.itcast.dao.CommodityDAO;
import lyw.itcast.dao.DAO_common;
import lyw.itcast.dao.MessageDAO;
import lyw.itcast.domain.Message;
import lyw.itcast.domain.Page;

import java.sql.Timestamp;
import java.util.List;

public class MessageService {
    MessageDAO messageDAO;

    public MessageService() {
        super();
        this.messageDAO = new MessageDAO();
    }

    public List<Message> findMessageByCommodity(int comodity_id, int start, int size) {
        CommodityDAO commodityDAO = new CommodityDAO();

        List<Message> messages = messageDAO.findMessageByCommodityAndLimit(comodity_id, start, size);
        for (Message each : messages) {
            //绑定响应的兼职分类
            each.setCommodity(commodityDAO.findById(each.getCommodity_id()));
        }
        return messages;
    }

    /**
     * 返回某分类下兼职信息的总共数量
     */
    public int getTotalCount(int commodity_id) {
        return messageDAO.getTotalCount(commodity_id);
    }

    /**
     * 获得兼职信息的详细信息
     *
     * @param id 兼职信息的id
     * @return
     */
    public Message getMessageDetail(int id) {
        BusinessDAO businessDAO = new BusinessDAO();
        CommodityDAO commodityDAO = new CommodityDAO();

        Message message = messageDAO.getMessageDetail(id);
        //绑定关联的商家
        message.setBusiness(businessDAO.findById(message.getBusiness_id()));
        //绑定关联的种类
        message.setCommodity(commodityDAO.findById(message.getCommodity_id()));
        return message;
    }

    /**
     * 发布一条兼职信息
     *
     * @param title   标题
     * @param content 内容
     * @param timeStr 兼职时间字符串
     * @param comid   分类id
     * @param bid     商家id
     * @return true表示添加成功
     */
    public boolean addMessage(String title, String content, String timeStr, int comid, int bid) {
        Timestamp timestamp = new Timestamp(Long.parseLong(timeStr));
        return messageDAO.addMessage(title, content, timestamp, comid, bid);
    }

    /**
     * 删除一条兼职信息
     *
     * @param id  信息id
     * @param bid 商家id
     * @return true表示操作成功
     */
    public boolean deleteMessage(int id, int bid) {
        return messageDAO.deleteMessage(id, bid);
    }

    /**
     * 更新一条兼职信息
     *
     * @param title   标题
     * @param content 内容
     * @param timeStr 兼职时间字符串
     * @param comid   分类id
     * @param mid     兼职信息id
     * @return true表示更新成功
     */
    public boolean saveMessage(String title, String content, String timeStr, int comid, int mid) {
        Timestamp timestamp = new Timestamp(Long.parseLong(timeStr));
        return messageDAO.saveMessage(title, content, timestamp, comid, mid);
    }

    /**
     * 获得一个商家发布的兼职信息列表
     *
     * @param bid 商家id
     * @return List<Message>
     */
    public List<Message> findMessageByBusiness(int bid, int start, int size) {
        //为了关联商家和兼职分类
        BusinessDAO businessDAO = new BusinessDAO();
        CommodityDAO commodityDAO = new CommodityDAO();

        List<Message> list = messageDAO.findMessageByBusinessAndLimit(bid, start, size);
        for (Message each : list) {
            //设置【兼职信息】相应的【种类】实例
            each.setCommodity(commodityDAO.findById(each.getCommodity_id()));
        }
        return list;
    }


    /**
     * 获得一个商家发布的所有兼职信息能组成多少页
     *
     * @param bid 商家id
     * @return page类的实例
     */
    public Page findPageByBusiness(int bid) {
        int count = messageDAO.findBusinessMessageCount(bid);
        Page page = new Page(1);
        page.setTotal(count);
        page.setPageSize(10);
        return page;
    }

    /**
     * 获得分页的所有兼职信息
     * @param field
     * @return
     */
    public List<Message> getAllMessageOrderBy(Page page, String field) {
        if (field == null || field.equals("")) {
            field = " date_time desc ";
        }

        BusinessDAO businessDAO = new BusinessDAO();
        CommodityDAO commodityDAO = new CommodityDAO();

        List<Message> list = messageDAO.getAllMessageOrderBy(page.getStart(), page.getPageSize(), field);;
        for (Message each : list) {
            //设置【兼职信息】相应的【分类】实例
            each.setCommodity(commodityDAO.findById(each.getCommodity_id()));
            //设置【兼职信息】相应的【商家】实例
            each.setBusiness(businessDAO.findById(each.getBusiness_id()));
        }
        return list;
    }

    /**
     * 获得所有兼职信息的分页
     * @param page
     * @return
     */
    public Page getAllMessagePage(int page) {
        //默认第一页
        if (page == 0) {
            page = 1;
        }

        Page page1 = new Page(page);
        //每页显示5条记录
        page1.setPageSize(10);
        //设置总共有多少条记录
        page1.setTotal(messageDAO.getAllMessageCount());
        return page1;
    }
}
