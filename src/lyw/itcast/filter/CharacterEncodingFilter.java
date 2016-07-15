package lyw.itcast.filter;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
//全站中文乱码解决。
public class CharacterEncodingFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}
	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest request=(HttpServletRequest) arg0;
		HttpServletResponse response=(HttpServletResponse) arg1;
	
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		//对于get请求的乱码问题
		MyCharacterEncodingRequest requestWrapper=new MyCharacterEncodingRequest(request);
		chain.doFilter(requestWrapper, response);
	}
}
/*
1.实现与被增强对象相同的接口        BufferedReader(没有无参的构造函数)
2,定义一个变量记住被增强对象
3，定义一个构造器，接收被增强对象
4，覆盖需要增强的方法
5，对于不想增强的方法，直接调用被增强对象（目标对象）的方法 
*/
class MyCharacterEncodingRequest extends HttpServletRequestWrapper{
	private HttpServletRequest request;

	public MyCharacterEncodingRequest(HttpServletRequest request) {
		super(request);
		this.request=request;
	}
	@Override
	public String getParameter(String name) {
		try {
			String value=this.request.getParameter(name);//获取提交的值
			if(value==null){ //如果值为空，就直接返回
				return null;
			}
			if(!this.request.getMethod().equalsIgnoreCase("get")){ //get GET
				return value;
			}
			value=new String(value.getBytes("ISO8859-1"),"utf-8");  //这里最好不要写死"utf-8"
			return value;
		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException(e);
		}
	}
}