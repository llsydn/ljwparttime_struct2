package lyw.itcast.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import lyw.itcast.domain.User;
import lyw.itcast.serivce.UserService;
import lyw.itcast.utils.WebUtils;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;

public class UserAction extends ActionSupport implements ModelDriven<User> {

    private static final long serialVersionUID = 1L;
    private String username;//用于接收用户名

    // 在struts.xml中指定为返回的json对象，这个map将自动转换为json格式
    private Map<String, Object> dataMap;

    // 这个User类，表单数据提交过来时会自动填满这个User的属性
    private User user;

    @Override
    public User getModel() {
        // struts通过这个方法将表单数据打入user
        if (user == null) {
            user = new User();
        }
        return user;
    }

    // 1、查找用户是否存在
    public String haveUser() {
        // 打印信息
        debugUser();
        UserService serivce = new UserService();
        dataMap = new HashMap<String, Object>();// 新建

        if (serivce.haveUser(user.getUsername())) {
            dataMap.put("result", false);// 返回这个用户名不能添加
        } else {
            dataMap.put("result", true);// 返回这个用户名可以添加
        }
        return SUCCESS;// 表示成功运行，返回json
    }

    //2、查找用户是否存在，但是不包括cookie中的user
    public String haveOtherUser() throws Exception {

        UserService serivce = new UserService();
        dataMap = new HashMap<String, Object>();// 新建

        //判断要更新用户信息的用户名(可以是cookie中的username,不可以是已存在的username)
        if (serivce.haveUser(user.getUsername()) &&
                (!user.getUsername().equals(getCookie("username")))) {
            dataMap.put("result", false);// 返回这个用户名不能添加
        } else {
            dataMap.put("result", true);// 返回这个用户名可以添加
        }
        return SUCCESS;// 表示成功运行，返回json
    }

    // 3、专门处理增加用户，用户注册
    public String processing() {

        // 给User创建一个独一无二的id
        user.setUser_id(WebUtils.makeId());

        UserService serivce = new UserService();

        dataMap = new HashMap<String, Object>();
        if (serivce.addUser(user))//成功添加
        {
            dataMap.put("result", true);// 返回成功添加
        } else {
            dataMap.put("result", false);// 返回失败
        }

        //将用户保存在session中。
        ActionContext.getContext().getSession().put("user", user);


        return SUCCESS;// 表示成功运行，返回json
    }

    //4、专门处理更新用户
    public String update() throws Exception {
        //得到业务对象
        UserService serivce = new UserService();

        //查找保存在cookie中的username的id,要更新的user
        String username = getCookie("username");
        User cookieuser = serivce.findUser(username);

        dataMap = new HashMap<String, Object>();

        //更新指定user_id的用户部分信息
        if (serivce.updateUserSome(user, cookieuser.getUser_id())) {
            dataMap.put("result", true);// 返回成功添加
        } else {
            dataMap.put("result", false);// 返回失败
        }

        return SUCCESS;// 表示成功运行，返回json
    }

    //5.在点击个人中心的时候，将user查询出来并保存在session中
    public String person() throws Exception {
        //得到业务对象
        UserService serivce = new UserService();

        //查找保存在cookie中的username的id,要更新的user
        String username = getCookie("username");
        User user = serivce.findUser(username);

        //将user对象保存在session中
        ActionContext.getContext().getSession().put("user", user);
        return "success";

    }

    /**
     * 管理员更新用户
     */
    public String adminUpdateUser() {
        debugUser();
        UserService userService = new UserService();

        dataMap = new HashMap<String, Object>();

        //更新指定user_id的用户部分信息
        if (userService.updateUserSome(user)) {
            dataMap.put("msg", "修改成功！");// 返回修改添加
            dataMap.put("success", true);// 返回修改添加
        } else {
            dataMap.put("msg", "修改失败");// 返回修改添加
            dataMap.put("success", false);// 返回失败
        }

        return SUCCESS;
    }

    public String adminDeleteUser(){
        debugUser();
        UserService userService = new UserService();

        dataMap = new HashMap<String, Object>();

        //更新指定user_id的用户部分信息
        if (userService.deleteUser(user.getUser_id())) {
            dataMap.put("msg", "删除成功！");// 返回修改添加
            dataMap.put("success", true);// 返回修改添加
        } else {
            dataMap.put("msg", "删除失败");// 返回修改添加
            dataMap.put("success", false);// 返回失败
        }

        return SUCCESS;
    }


    public void debugUser() {
        System.out.println("UserAction接收到的表单信息：:");
        System.out.println("User_Id:"+user.getUser_id());
        System.out.println("Username:" + user.getUsername());
        System.out.println("Password:" + user.getPassword());
        System.out.println("Email:" + user.getEmail());
        System.out.println("Iphone:" + user.getIphone());
        System.out.println("Sex:" + user.getSex());
    }

    public Map<String, Object> getDataMap() {
        return dataMap;
    }

    public void setDataMap(Map<String, Object> dataMap) {
        this.dataMap = dataMap;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    //获取cookie的值
    private String getCookie(String name) throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        Cookie[] cookies = request.getCookies();
        String cookieString = "";
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals(name)) {
                cookieString = cookie.getValue();
                //注意这里要解决中文乱码的问题
                cookieString = URLDecoder.decode(cookieString, "utf-8");
                return cookieString;
            }
        }
        return null;
    }
}
