package lyw.itcast.dao;

import lyw.itcast.domain.FeedBack;
import lyw.itcast.domain.User;
import lyw.itcast.exception.DaoException;
import lyw.itcast.utils.JdbcUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

public class UserDao {
    // 添加用户
    public boolean add(User user) {
        try {
            // 使用了DBUtils框架
            QueryRunner qr = new QueryRunner(JdbcUtils.getDataSource());
            String sql = "insert into user(user_id,username,password,email,iphone) values(?,?,?,?,?)";
            Object params[] = {user.getUser_id(), user.getUsername(),
                    user.getPassword(), user.getEmail(), user.getIphone()};
            qr.update(sql, params);
        } catch (Exception e) {
            throw new DaoException(e);
        }
        // 成功添加返回true
        return true;
    }

    // 检查用户名和密码是否正确
    public User find(String username, String password) {
        try {
            QueryRunner qr = new QueryRunner(JdbcUtils.getDataSource());
            String sql = "select * from user where username=? and password=?";
            Object params[] = {username, password};
            return (User) qr.query(sql, new BeanHandler(User.class), params);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // 查找用户是否存在
    public boolean haveUser(String username) {
        Long num = null;
        try {
            QueryRunner qr = new QueryRunner(JdbcUtils.getDataSource());
            String sql = "select count(*) from user where username=?";
            Object params[] = {username};
            num = (Long) qr.query(sql, new ScalarHandler(), params);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (num.intValue() > 0) {
            return true;
        }
        return false;
    }


    // 通过用户名查找用户信息
    public User findUser(String username) {
        try {
            // 使用了DBUtils框架
            QueryRunner qr = new QueryRunner(JdbcUtils.getDataSource());
            String sql = "select * from user where username=?";
            Object params[] = {username};
            return (User) qr.query(sql, new BeanHandler(User.class), params);
        } catch (Exception e) {
            throw new DaoException(e);
        }
    }

    // 更新用户的信息,通过cookie中user_id更新
    public boolean updateUser(User user, String user_id) {
        try {
            // 使用了DBUtils框架
            QueryRunner qr = new QueryRunner(JdbcUtils.getDataSource());
            String sql = "update user  set username=?,password=?,email=?,iphone=?,imageurl=?,resumecount=? where user_id=?";
            Object params[] = {user.getUsername(), user.getPassword(),
                    user.getEmail(), user.getIphone(), user.getImageurl(),
                    user.getResumecount(), user_id};
            qr.update(sql, params);
        } catch (Exception e) {
            throw new DaoException(e);
        }
        // 成功添加返回true
        return true;
    }

    // 通过用户的id号查找用户信息
    public User findById(String user_id) {
        try {
            // 使用了DBUtils框架
            QueryRunner qr = new QueryRunner(JdbcUtils.getDataSource());
            String sql = "select * from user where user_id=?";
            Object params[] = {user_id};
            return (User) qr.query(sql, new BeanHandler(User.class), params);
        } catch (Exception e) {
            throw new DaoException(e);
        }
    }

    // 通过邮箱查找用户的信息
    public User findByEmail(String userNameOrEmail) {
        try {
            // 使用了DBUtils框架
            QueryRunner qr = new QueryRunner(JdbcUtils.getDataSource());
            String sql = "select * from user where email=?";

            Object params[] = {userNameOrEmail};
            return (User) qr.query(sql, new BeanHandler(User.class), params);
        } catch (Exception e) {
            throw new DaoException(e);
        }
    }

    //更新用户的部分信息。
    public boolean updateUserSome(User user, String user_id) {
        try {
            // 使用了DBUtils框架
            QueryRunner qr = new QueryRunner(JdbcUtils.getDataSource());
            String sql = "update user  set username=?,password=?,email=?,iphone=? where user_id=?";
            Object params[] = {user.getUsername(), user.getPassword(), user.getEmail(), user.getIphone(), user_id};
            qr.update(sql, params);
        } catch (Exception e) {
            throw new DaoException(e);
        }
        //成功添加返回true
        return true;
    }

    //添加反馈意见
    public boolean addfeedback(FeedBack feedback) {
        try {
            // 使用了DBUtils框架
            QueryRunner qr = new QueryRunner(JdbcUtils.getDataSource());
            String sql = "insert into feedback(user_id,comment,style,feedbacktime) values(?,?,?,?)";
            Object params[] = {feedback.getUser_id(), feedback.getComment(), feedback.getStyle(), new Date()};
            qr.update(sql, params);

        } catch (Exception e) {
            throw new DaoException(e);
        }
        // 成功添加返回true
        return true;
    }

    /**
     * 获取用户通过分页
     *
     * @param start 开始位置
     * @param end   总共数量
     * @return list
     */
    public List<User> getUsersByPages(int start, int end) {
        String sql = "select * from user limit ?,?";
        Object[] params = {start, end};
        return DAO_common.beanListQuery(sql, User.class, params);
    }

    /**
     * 获得所有用户的数量
     *
     * @return 数量
     */
    public int getAllUsersCount() {
        String sql = "select count(*) from user";
        Object[] params = {};
        return DAO_common.ScalarQuery(null, sql, params);
    }

    /**
     * 删除一个用户
     *
     * @param user_id 用户id
     * @return 影响行数
     */
    public int deleteUser(String user_id) {
        String sql = "delete from user where user_id=?";
        Object[] params = {user_id};
        return DAO_common.updateQuery(sql, params);
    }

    /**
     * 更新用户信息
     * @param user 用户
     * @return 影响行数
     */
    public int updateUserSome(User user) {
        String sql = "update user  set username=?,password=?,email=?,iphone=? where user_id=?";
        Object params[] = {user.getUsername(), user.getPassword(), user.getEmail(), user.getIphone(), user.getUser_id()};
        return DAO_common.updateQuery(sql, params);
    }
}
