package lyw.itcast.utils;

import java.security.MessageDigest;
import java.util.Date;
import java.util.Enumeration;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.locale.converters.DateLocaleConverter;

import sun.misc.BASE64Encoder;



public class WebUtils {
	//把request中的数据封装到bean中
	public static <T> T request2Bean(HttpServletRequest request,Class<T> clazz){
		try{
			T t = clazz.newInstance();
			ConvertUtils.register(new DateLocaleConverter(), Date.class);
			Enumeration e = request.getParameterNames();
			while(e.hasMoreElements()){
				String name = (String) e.nextElement();
				String value = request.getParameter(name);
				BeanUtils.setProperty(t, name, value);
			}
			return t;
		}catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	public static String makeId(){
		return UUID.randomUUID().toString();
	}
	
	public static String md5(String password) {
		//加密算法
		try {
			// 确定计算方法
			MessageDigest md5 = MessageDigest.getInstance("MD5");
			BASE64Encoder base64en = new BASE64Encoder();
			// 加密后的字符串
			String newstr = base64en.encode(md5.digest(password.getBytes("utf-8")));
			return newstr;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	
	}
}
