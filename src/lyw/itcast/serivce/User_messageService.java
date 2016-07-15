package lyw.itcast.serivce;

import lyw.itcast.dao.DAO_common;
import lyw.itcast.dao.MessageDAO;
import lyw.itcast.dao.UserDao;
import lyw.itcast.dao.User_messageDAO;
import lyw.itcast.domain.User;
import lyw.itcast.domain.User_message;

import java.util.ArrayList;
import java.util.List;

/**
 *
 */
public class User_messageService {

    private User_messageDAO user_messageDAO;

    public User_messageService() {
        user_messageDAO = new User_messageDAO();
    }

    /**
     * 获得所有参加该兼职的用户表
     *
     * @param mid 兼职信息id
     * @return
     */
    public List<User_message> findByMessageId(int mid) {
        UserDao userDao = new UserDao();
        MessageDAO messageDAO = new MessageDAO();
        //遍历每一个user_message
        List<User_message> list = user_messageDAO.findByMessageId(mid);
        for (User_message user_message : list) {
            //绑定用户和兼职信息
            user_message.setUser(userDao.findById(user_message.getUser_id()));
            //user_message.setMessage(messageDAO.getMessageDetail(Integer.parseInt(user_message.getMessage_id())));
        }
        return list;
    }

    public List<User> findUsersByMid(int mid) {
        UserDao userDao = new UserDao();
        //要返回的userlist
        List<User> list1 = new ArrayList<User>();

        List<User_message> user_messageList = this.findByMessageId(mid);

        for (User_message user_message : user_messageList) {
            //找到这个用户
            User user = userDao.findById(user_message.getUser_id());
            list1.add(user);
        }
        return list1;
    }

    /**
     * 删除用户的所有参与的兼职
     * @param userId 用户id
     * @return true表示成功
     */
    public boolean deleteByUserId(String userId){
        return user_messageDAO.deleteByUserId(userId)>0;
    }
}
