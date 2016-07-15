package lyw.itcast.action;

import com.opensymphony.xwork2.ActionSupport;
import lyw.itcast.domain.Admin;
import lyw.itcast.serivce.AdminService;

/**
 * 管理员登录与登出
 */
public class AdminLogin extends ActionSupport {
    //网页传过来的参数
    private String name;
    private String pwd;
    //表示操作类型
    private String type;

    //返回的信息
    private String msg;

    /**
     * 登录的action
     *
     * @return
     */
    public String login() {
        String result = "";
        AdminService adminService = new AdminService();
        Admin admin = adminService.login(name, pwd);
        if (admin != null) {
            //登录成功
            //保存在session中
            adminService.saveSession(admin);
            result = "success";
            msg = "登录成功";
        } else {
            result = "again";
            msg = "登录失败，重新登录";
        }
        return result;
    }

    /**
     * 登出的action
     *
     * @return
     */
    public void logout() {
        AdminService adminService = new AdminService();
        adminService.logout();
    }

    @Override
    public String execute() {
        String result = "default";
        if (type != null && name != null && pwd != null) {

            //检测是否已经登录，已经登录直接返回success
            AdminService adminService = new AdminService();
            Admin admin = adminService.getSessionAdmin();
            if (admin!=null){
                return "success";
            }

            if (type.equals("login")) {
                result = login();
            } else if (type.equals("logout")) {
                logout();
                return "logout";
            }
        }
        return result;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
