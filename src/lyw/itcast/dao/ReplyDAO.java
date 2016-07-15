package lyw.itcast.dao;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import lyw.itcast.domain.Reply;
import lyw.itcast.utils.JdbcUtils;

/**
 * 回复的数据库底层操作
 */
public class ReplyDAO {

    private List<Reply> getListReply(Connection conn, String sql, Object[] params) {
        QueryRunner qr = new QueryRunner(JdbcUtils.getDataSource());
        List<Reply> replyList = null;
        try {
            if (conn != null) {
                replyList = (List<Reply>) qr.query(conn, sql, new BeanListHandler(Reply.class), params);
            } else {
                replyList = (List<Reply>) qr.query(sql, new BeanListHandler(Reply.class), params);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return replyList;
    }

    /**
     * 根据评论id获得某评论的所有回复
     *
     * @param commentId 评论id
     * @return 回复的list
     */
    public List<Reply> getCommentReplys(int commentId, Connection conn) {
        List<Reply> replyList = null;
        String sql = "select * from reply where comment_id=?";
        Object[] params = {commentId};

        replyList = getListReply(conn, sql, params);//内部函数

        return replyList;
    }

    public List<Reply> getCommentReplys(int commentId) {
        return getCommentReplys(commentId, null);
    }

    /**
     * 获取某个区间的所有回复
     *
     * @param commentId 评论id
     * @param start     开始记录
     * @param size      要取的记录条数
     * @return reply list
     */
    public List<Reply> getReplyWithPage(int commentId, int start, int size, Connection conn) {
        List<Reply> replyList = null;
        String sql = "select * from reply where comment_id=? order by time desc limit ?,?";
        Object[] params = {commentId, start, size};

        replyList = getListReply(conn, sql, params);//内部函数

        return replyList;
    }

    public List<Reply> getReplyWithPage(int commentId, int start, int size) {
        return getReplyWithPage(commentId, start, size, null);
    }


    /**
     * 获得某评论的回复数量
     *
     * @param commentId 评论id
     * @return 回复数
     */
    public int getReplyCount(int commentId, Connection conn) {
        Long count = 0L;
        String sql = "select count(*) from reply where comment_id=?";
        Object[] params = {commentId};
        return DAO_common.ScalarQuery(conn, sql, params);
    }

    public int getReplyCount(int commentId) {
        return getReplyCount(commentId, null);
    }

    /**
     * 增加一条回复
     *
     * @param user_id  用户名
     * @param content   内容
     * @param commentId 评论id
     * @return true如果增加成功！
     */
    public boolean addReply(String user_id, String content, int commentId) {
        int row = 0;
        QueryRunner qr = new QueryRunner(JdbcUtils.getDataSource());
        Timestamp time = new Timestamp(System.currentTimeMillis());
        Object[] params = {user_id, commentId, content, time};

        String sql = "INSERT INTO reply (id, user_id, comment_id, content, time) VALUES (NULL, ?, ?, ? ,?);";
        try {
            row = qr.update(sql, params);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return row > 0;
    }

}
