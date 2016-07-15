package lyw.itcast.dao;

import lyw.itcast.domain.Admin;

/**
 * Created by ange on 2016/6/13.
 */
public class AdminDAO {

    /**
     * 管理员登录
     * @param name 用户名
     * @param pwd 密码
     * @return 成功返回管理员
     */
    public Admin login(String name,String pwd){
        String sql = "select * from admin where name=? and password=?";
        Object[] params = {name, pwd};
        return DAO_common.beanQuery(sql, Admin.class, params);
    }


}
