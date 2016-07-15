package lyw.itcast.dao;

import lyw.itcast.domain.User;
import lyw.itcast.domain.User_message;

import java.util.List;

/**
 *
 */
public class User_messageDAO {

    /**
     * 获得所有参加该兼职的用户表
     * @param mid 兼职信息id
     * @return
     */
    public List<User_message> findByMessageId(int mid){
        String sql = "select * from user_message where message_id=?";
        Object[] params = {mid};
        return DAO_common.beanListQuery(sql, User_message.class, params);
    }

    /**
     * 删除用户的所有参与的兼职
     * @param userId 用户id
     * @return 影响行数
     */
    public int deleteByUserId(String userId){
        String sql = "delete from user_message where user_id=?";
        Object[] params = {userId};
        return DAO_common.updateQuery(sql, params);
    }
}
