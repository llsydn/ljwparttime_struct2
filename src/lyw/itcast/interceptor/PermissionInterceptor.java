package lyw.itcast.interceptor;

import java.net.URLDecoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.xml.sax.SAXException;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

/**
 * 权限拦截器，判断用户是否已经是登录的。
 * @author llsydn
 *
 */
public class PermissionInterceptor implements Interceptor{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
	}
	@Override
	public void init() {
		// TODO Auto-generated method stub
	}
	
	
	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		//要先判断用户是否已经是登陆的。
		Object user = ActionContext.getContext().getSession().get("user");
		
		//查找保存在cookie中的username是否存在,存在表示用户也是登陆的。
		String username=getCookie("username");
		
		if (user!=null || username!=null) {
			//如果用户不为空,代表用户已经登录,允许执行action中的方法。
			return invocation.invoke();
		}
		ActionContext.getContext().put("error", "对不起,请您登录后再来..");
		
		return "error";
		
	}
	//获取cookie的值
	private String getCookie(String name) throws Exception{
        HttpServletRequest request = ServletActionContext.getRequest();
        Cookie[] cookies = request.getCookies();
        String cookieString="";
        for(Cookie cookie : cookies)
        {
            if(cookie.getName().equals(name))
            {
            	cookieString=cookie.getValue();
            	//注意这里要解决中文乱码的问题
            	cookieString=URLDecoder.decode(cookieString,"utf-8");
                return cookieString;
            }
        }
        return null;
	}

}
