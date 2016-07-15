package lyw.itcast.dao;

import lyw.itcast.domain.Commodity;
import lyw.itcast.utils.JdbcUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


/**
 * 兼职种类逻辑层
 */
public class CommodityDAO {
    /**
     * 返回所有兼职种类
     */
    public List<Commodity> findall() {
        List<Commodity> list = new ArrayList<Commodity>();
        try {
            QueryRunner qr = new QueryRunner(JdbcUtils.getDataSource());
            String sql = "select * from commodity where 1";
            Object params[] = {};
            list = (List<Commodity>) qr.query(sql, new BeanListHandler(Commodity.class), params);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    /**
     * 根据id找到对应的分类
     *
     * @param id 分类id
     * @return
     */
    public Commodity findById(int id) {
        String sql = "select * from commodity where commodity_id=?";
        Object[] params = {id};
        return DAO_common.beanQuery(sql, Commodity.class, params);
    }

    /**
     * 更新一个兼职分类
     *
     * @param id   兼职分类id
     * @param name 兼职分类名字
     * @return 影响行数
     */
    public int updateCommodity(int id, String name) {
        String sql = "update commodity set commodity_id=?,commodity_name=? where commodity_id=?";
        Object[] params = {id, name, id};
        return DAO_common.updateQuery(sql, params);
    }

    /**
     * 删除一个兼职分类
     * @param id 兼职分类id
     * @return 影响行数
     */
    public int delete(int id) {
        String sql = "delete from commodity where commodity_id=?";
        Object[] params = {id};
        return DAO_common.updateQuery(sql, params);
    }

    /**
     * 添加一个兼职分类
     * @param name 分类名字
     * @return 影响行数
     */
    public int add(String name) {
        String sql = "INSERT INTO commodity (commodity_id, commodity_name) VALUES (NULL, ?);";
        Object[] params = {name};
        return DAO_common.updateQuery(sql, params);
    }
}
