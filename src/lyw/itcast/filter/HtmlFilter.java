package lyw.itcast.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;

public class HtmlFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	}
	@Override
	public void destroy() {
	}
	@Override
	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {

		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;
		
		//对request的加强
		MyHtmlRequest myreRequest=new MyHtmlRequest(request);
		chain.doFilter(myreRequest, response);
	}

}
class MyHtmlRequest extends HttpServletRequestWrapper {

	private HttpServletRequest request;

	public MyHtmlRequest(HttpServletRequest request) {
		super(request);
		this.request = request;
	}

	@Override
	public String getParameter(String name) {
		//获取提交的内容。
		String value = this.request.getParameter(name);
		
		if (value == null) { //如果内容是空，就直接返回
			return null;
		}
		//如果内容不是空的，就进过滤
		return filter(value);

	}
	public String filter(String message) {
		if (message == null) {
			return null;
		}
		char content[] = new char[message.length()];
		message.getChars(0, message.length(), content, 0);
		StringBuffer result = new StringBuffer(content.length + 50);
		for (int i = 0; i < content.length; i++) {
			switch (content[i]) {
			case '<':
				result.append("&lt;");
				break;
			case '>':
				result.append("&gt;");
				break;
			case '&':
				result.append("&amp;");
				break;
			case '"':
				result.append("&quot;");
				break;
			default:
				result.append(content[i]);
			}
		}
		return result.toString();
	}

}

