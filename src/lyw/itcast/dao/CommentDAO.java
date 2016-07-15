package lyw.itcast.dao;

import lyw.itcast.domain.Comment;
import lyw.itcast.domain.Page;
import lyw.itcast.utils.JdbcUtils;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;


import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 评论的数据库底层操作
 */
public class CommentDAO {

    /**
     * 一个数据集的handler，处理完的数据将是list<objectp[]>
     */
    class CommentHandler implements ResultSetHandler {

        private Map<Integer, String> meta = null;

        public Map<Integer, String> getMeta() {
            return meta;
        }

        /**
         * 保存列标题
         *
         * @param rs 结果集
         * @throws SQLException
         */
        private void setColumnData(ResultSet rs) throws SQLException {
            meta = new HashMap<Integer, String>();
            ResultSetMetaData rsmd = rs.getMetaData();
            int count = rsmd.getColumnCount();
            for (int i = 1; i <= count; i++) {
                meta.put(i, rsmd.getColumnName(i));
            }
        }

        @Override
        public Object handle(ResultSet rs) throws SQLException {
            List<Object[]> rows = new ArrayList<Object[]>();
            setColumnData(rs);

            while (rs.next()) {
                rows.add(this.handleRow(rs));
            }
            return rows;

        }

        /**
         * 处理结果集的每一行
         *
         * @param rs 结果集
         * @return 数组
         * @throws SQLException
         */
        public Object[] handleRow(ResultSet rs) throws SQLException {
            ResultSetMetaData meta = rs.getMetaData();
            int cols = meta.getColumnCount();
            Object[] result = new Object[cols];

            for (int i = 0; i < cols; i++) {
                result[i] = rs.getObject(i + 1);
            }

            return result;
        }
    }

    /**
     * 根据兼职信息id获得该兼职信息的所有评论
     *
     * @param comicId 兼职信息id
     * @return 评论的list
     */
    public List<Comment> getComicComments(int comicId, Page page) {
        QueryRunner qr = new QueryRunner(JdbcUtils.getDataSource());
        Object[] params = {comicId, page.getStart(), page.getPageSize()};

        String sql = "select * from comment where message_id=? order by time desc limit ?,?";

        List<Comment> lists_comment = null;
        try {
            lists_comment = (List<Comment>) qr.query(sql, new BeanListHandler(Comment.class), params);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return lists_comment;
    }

    /**
     * 获得该兼职信息的评论数量
     *
     * @param comicId 兼职信息id
     * @return 数量
     */
    public int getCommentCounts(int comicId) {
        QueryRunner qr = new QueryRunner(JdbcUtils.getDataSource());
        Object[] params = {comicId};

        String sql = "select count(*) from comment where message_id=?";
        Long count = 0L;
        try {
            count = (Long) qr.query(sql, new ScalarHandler(), params);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return count.intValue();
    }

    /**
     * 添加评论
     *
     * @param user_id 用户名
     * @param message_id  兼职信息id
     * @param content   内容
     * @return true如果成功更新
     */
    public boolean addComment(String user_id, int message_id, String content) {
        QueryRunner qr = new QueryRunner(JdbcUtils.getDataSource());

        Timestamp timestamp = new Timestamp(System.currentTimeMillis());

        Object[] params = {user_id, message_id, content, timestamp};

        String sql = "INSERT INTO comment (id, user_id, message_id, content, time) VALUES (NULL, ?, ?, ?, ?);";
        int row = 0;
        try {
            row = qr.update(sql, params);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return row > 0;
    }
}
