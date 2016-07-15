package lyw.itcast.serivce;

import com.opensymphony.xwork2.ActionContext;
import lyw.itcast.dao.AdminDAO;
import lyw.itcast.domain.Admin;
import lyw.itcast.domain.Business;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.Cookie;

/**
 * Created by ange on 2016/6/13.
 */
public class AdminService {
    AdminDAO adminDAO=null;
    public AdminService() {
        adminDAO = new AdminDAO();
    }

    /**
     * 将对象加入session
     *
     * @param value
     */
    public void saveSession(Admin value) {
        ActionContext.getContext().getSession().put("admin", value);
        //设置session的时间，以秒为单位
        ServletActionContext.getRequest().getSession().setMaxInactiveInterval(600);
    }

    /**
     * 从session中获得管理员
     * @return
     */
    public Admin getSessionAdmin() {
         return  (Admin) ActionContext.getContext().getSession().get("admin");
    }
    /**
     * 退出
     */
    public void logout() {
        //清空session
        ActionContext.getContext().getSession().remove("admin");

        //清空cookies
//        Cookie adminName = new Cookie("admin_name", "");
//        adminName.setMaxAge(0);
//        Cookie adminPwd = new Cookie("admin_pwd", "");
//        adminPwd.setMaxAge(0);
//        ServletActionContext.getResponse().addCookie(adminPwd);
//        ServletActionContext.getResponse().addCookie(adminName);
    }

    /**
     * 管理员登录
     * @param name 用户名
     * @param pwd 密码
     * @return 成功返回管理员
     */
    public Admin login(String name, String pwd){
        return adminDAO.login(name, pwd);
    }
}
