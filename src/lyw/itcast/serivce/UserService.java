package lyw.itcast.serivce;

import lyw.itcast.dao.UserDao;
import lyw.itcast.domain.FeedBack;
import lyw.itcast.domain.Page;
import lyw.itcast.domain.User;

import java.util.List;

public class UserService {
    UserDao dao = new UserDao();

    // 添加用户
    public boolean addUser(User user) {
        return dao.add(user);
    }

    // 查找用户名和密码是否正确
    public User find(String username, String password) {
        return dao.find(username, password);
    }

    // 通过用户名查找用户是否存在,返回的布尔值
    public boolean haveUser(String username) {
        return dao.haveUser(username);
    }

    // 通过用户名查找用户信息
    public User findUser(String username) {
        return dao.findUser(username);
    }

    // 更新用户。
    public boolean updateUser(User user, String user_id) {
        return dao.updateUser(user, user_id);
    }

    // 通过id号查找用户的信息
    public User findById(String user_id) {
        return dao.findById(user_id);
    }

    // 通过邮箱查找用户信息
    public User findByEmail(String userNameOrEmail) {
        return dao.findByEmail(userNameOrEmail);
    }

    //更新用户的部分信息。
    public boolean updateUserSome(User user, String user_id) {
        return dao.updateUserSome(user, user_id);
    }

    //添加用户的反馈意见
    public boolean addfeedback(FeedBack feedback) {
        return dao.addfeedback(feedback);
    }

    /**
     * 获取用户通过分页
     *
     * @param page 分页
     * @return list
     */
    public List<User> getUsersByPages(Page page) {
        return dao.getUsersByPages(page.getStart(), page.getPageSize());
    }

    /**
     * 获得所有用户的数量
     *
     * @return 数量
     */
    public Page getAllUsersCount(int page) {
        Page page1 = new Page(page);
        //每页显示5条记录
        page1.setPageSize(10);
        //设置总共有多少条记录
        page1.setTotal(dao.getAllUsersCount());
        return page1;
    }

    /**
     * 删除一个用户
     *
     * @param user_id 用户id
     * @return true 表示成功
     */
    public boolean deleteUser(String user_id) {
        User_messageService user_messageService = new User_messageService();
        //删除用户参与的所有兼职
        user_messageService.deleteByUserId(user_id);
        //删除用户的所有简历
        User_resumeService user_resumeService = new User_resumeService();
        user_resumeService.deleteByUserId(user_id);

        return dao.deleteUser(user_id) > 0;
    }

    /**
     * 更新用户信息
     *
     * @param user 用户
     * @return true 表示成功
     */
    public boolean updateUserSome(User user) {
        return dao.updateUserSome(user) > 0;
    }
}
