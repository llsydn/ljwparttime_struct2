package lyw.itcast.dao;

import lyw.itcast.domain.Message;
import lyw.itcast.utils.JdbcUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 * Message的逻辑层
 */
public class MessageDAO {

    /**
     * 根据种类查找发布信息，有条数现在
     *
     * @param commodity_id -- 种类的id
     * @param start        -- 在哪一条记录开始
     * @param size         -- 返回多少条数据
     */
    public List<Message> findMessageByCommodityAndLimit(int commodity_id, int start, int size) {
        List<Message> list = new ArrayList<Message>();
        QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
        String sql = "select * from message where commodity_id=? order by date_time desc limit ?, ? ";//order by date_time
        Object params[] = {commodity_id, start, size};
        try {
            list = (List<Message>) queryRunner.query(sql, params, new BeanListHandler(Message.class));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    /**
     * 返回某分类下兼职信息的总共数量
     *
     * @param commodity_id 种类id
     */
    public int getTotalCount(int commodity_id) {
        int total = 0;
        QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
        String sql = "select count(*) from message where commodity_id=?";
        Object params[] = {commodity_id};
        try {
            Long num = (Long) queryRunner.query(sql, new ScalarHandler(), params);
            total = num.intValue();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return total;
    }

    /**
     * 获得兼职信息的详细情况
     *
     * @param id 兼职信息的id
     */
    public Message getMessageDetail(int id) {
        Message message = null;
        QueryRunner queryRunner = new QueryRunner(JdbcUtils.getDataSource());
        String sql = "select * from message where id=?";
        Object params[] = {id};
        try {
            message = (Message) queryRunner.query(sql, new BeanHandler(Message.class), params);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return message;
    }

    /**
     * 发布一条兼职信息
     *
     * @param title   标题
     * @param content 内容
     * @param time    兼职时间
     * @param comid   分类id
     * @param bid     商家id
     * @return true表示添加成功
     */
    public boolean addMessage(String title, String content, Timestamp time, int comid, int bid) {
        String sql = "INSERT INTO message (id, title, content, date_time, commodity_id, business_id) VALUES (NULL, ?, ?, ?, ?, ?);";
        Object[] params = {title, content, time, comid, bid};
        int rows = DAO_common.updateQuery(sql, params);
        return rows > 0;
    }

    /**
     * 删除一条兼职信息
     *
     * @param id  信息id
     * @param bid 商家id
     * @return
     */
    public boolean deleteMessage(int id, int bid) {
        String sql = "delete from message where id=? and business_id=?";
        Object[] params = {id, bid};
        int rows = DAO_common.updateQuery(sql, params);
        return rows > 0;
    }


    /**
     * 更新一条兼职信息
     *
     * @param title   标题
     * @param content 内容
     * @param time    兼职时间
     * @param comid   分类id
     * @param mid     兼职信息id
     * @return true表示添加成功
     */
    public boolean saveMessage(String title, String content, Timestamp time, int comid, int mid) {
        String sql = "update message set title=?,content=?,date_time=?,commodity_id=? where id=?";
        Object[] params = {title, content, time, comid, mid};
        int rows = DAO_common.updateQuery(sql, params);
        return rows > 0;
    }

    /**
     * 获得一个商家发布的兼职信息列表
     *
     * @param bid 商家id
     * @return
     */
    public List<Message> findMessageByBusinessAndLimit(int bid, int start, int size) {
        String sql = "select * from message where business_id=? order by date_time desc limit ?, ?";
        Object[] params = {bid, start, size};
        return DAO_common.beanListQuery(sql, Message.class, params);
    }

    /**
     * 获得一个商家发布的总兼职信息数量
     *
     * @param bid
     * @return
     */
    public int findBusinessMessageCount(int bid) {
        String sql = "select count(*) from message where business_id=?";
        Object[] params = {bid};
        return DAO_common.ScalarQuery(null, sql, params);
    }

    /**
     * 获得分页的所有兼职信息
     *
     * @param start
     * @param size
     * @param field
     * @return
     */
    public List<Message> getAllMessageOrderBy(int start, int size, String field) {
        String sql = "select * from message where 1 order by " + field + " limit ?,? ";
        Object[] params = {start, size};
        return DAO_common.beanListQuery(sql, Message.class, params);
    }

    /**
     * 获得所有兼职信息的数量
     *
     * @return
     */
    public int getAllMessageCount() {
        String sql = "select count(*) from message";
        Object[] params = {};
        return DAO_common.ScalarQuery(null, sql, params);
    }
}
