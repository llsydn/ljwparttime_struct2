package lyw.itcast.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import lyw.itcast.domain.User;
import lyw.itcast.serivce.CommentServices;
import lyw.itcast.serivce.ReplyServices;
import lyw.itcast.serivce.UserService;

/**
 * 增加评论和回复的servlet
 */
public class addCommentAction extends ActionSupport {

    //网页传来的参数，表示操作类型
    private String type;
    //网页传来的参数，表示提交评论的内容
    private String content;
  //网页传来的参数，表示评论的id
    private int cid;
  //网页传来的参数，表示兼职信息的id
    private int mid;
	

  //返回的json
    private Map<String, Object> result;
    
	//获取cookie的值
	private String getCookie(String name){
        HttpServletRequest request = ServletActionContext.getRequest();
        Cookie[] cookies = request.getCookies();
        for(Cookie cookie : cookies)
        {
            if(cookie.getName().equals(name))
            {
                return cookie.getValue();
            }
        }
        return null;
	}
    
    @Override
	public String execute() {
    	//处理用户信息
    	//从session获取登录后的用户
    	User user=(User)ActionContext.getContext().getSession().get("user");
    	if (user==null) {
    		//session中没有保存用户的话，那么就从cookies中获取
        	String username=getCookie("username");
        	UserService userService=new UserService();
        	user=userService.findUser(username);
		}

    	System.out.println("user.getUser_id()"+user.getUser_id());//打印调试
    	
    	boolean flag=false;
    	if (user!=null) {
    		if (type.equals("reply")) {
                //新建服务
                ReplyServices rps = new ReplyServices();
                flag=rps.addReply(user.getUser_id(), content, cid);
			}else if (type.equals("comment")) {
	            //新建服务
	            CommentServices coms = new CommentServices();
	            flag=coms.addComment(user.getUser_id(), mid, content);
			}
		}
    	result=new HashMap<String, Object>();
    	result.put("result", flag);
    	if (flag) {
    		result.put("msg", "发布成功！");
    		return SUCCESS;
		}
    	result.put("msg", "发布失败！");
    	return SUCCESS;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public int getMid() {
		return mid;
	}

	public void setMid(int mid) {
		this.mid = mid;
	}

	public Map<String, Object> getResult() {
		return result;
	}

}
