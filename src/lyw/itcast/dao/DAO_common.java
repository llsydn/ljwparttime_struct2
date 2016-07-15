package lyw.itcast.dao;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import lyw.itcast.utils.JdbcUtils;

/**
 * 封装公用的DAO操作
 */
public class DAO_common {
    /**
     * 使用coon查询 如果coon为空那么就用qr里面的data_source
     *
     * @param coon   连接
     * @param qr     QueryRunner
     * @param sql    查询语句
     * @param params 参数变量
     * @return
     */
    public static int ScalarQuery(Connection coon, String sql, Object[] params) {
        QueryRunner qr = new QueryRunner(JdbcUtils.getDataSource());
        Long count = 0L;
        try {
            if (coon != null) {
                count = (Long) qr.query(coon, sql, new ScalarHandler(), params);
            } else {
                count = (Long) qr.query(sql, new ScalarHandler(), params);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count.intValue();
    }

    /**
     * 查询bean的list
     *
     * @param sql    查询语句
     * @param clazz  类
     * @param params 参数
     * @param <T>    类型
     * @return list<T>
     */
    public static <T> List<T> beanListQuery(String sql, Class<T> clazz, Object[] params) {

        //Class<T>代表这个类型所对应的类

        List<T> result = null;
        QueryRunner qr = new QueryRunner(JdbcUtils.getDataSource());
        try {
            result = (List<T>) qr.query(sql, new BeanListHandler(clazz), params);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 查询bean
     *
     * @param sql    查询语句
     * @param clazz  类
     * @param params 参数
     * @param <T>    类型
     * @return bean
     */
    public static <T> T beanQuery(String sql, Class<T> clazz, Object[] params) {
        T t = null;
        QueryRunner qr = new QueryRunner(JdbcUtils.getDataSource());
        try {
            t = (T) qr.query(sql, new BeanHandler(clazz), params);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return t;
    }

    /**
     * 通用的sql更新查询
     *
     * @param sql    sql语句
     * @param params 参数变量
     * @return
     */
    public static int updateQuery(String sql, Object[] params) {
        int row = 0;
        QueryRunner qr = new QueryRunner(JdbcUtils.getDataSource());
        try {
            row = qr.update(sql, params);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return row;
    }
}
