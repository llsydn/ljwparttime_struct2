package lyw.itcast.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import lyw.itcast.domain.User;


public class GenerateLinkUtils {
	
	private static final String CHECK_CODE = "checkCode";
	
	/**
	 * 生成重设密码的链接
	 */
	public static String generateResetPwdLink(User user) {
		return "http://localhost:8080/ljwparttime_struct2/resetPasswordUIAction?userName=" 
				+ user.getUsername()+ "&" + CHECK_CODE + "=" + generateCheckcode(user);
	}
	
	
	public static String generateCheckcode(User user) {
		String userName = user.getUsername();
		String password = user.getPassword();
		return md5(userName + ":" + password);
	}
	

	private static String md5(String string) {
		MessageDigest md = null;
		try {
			md = MessageDigest.getInstance("md5");
			md.update(string.getBytes());
			byte[] md5Bytes = md.digest();
			return bytes2Hex(md5Bytes);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	private static String bytes2Hex(byte[] byteArray)
	{
		StringBuffer strBuf = new StringBuffer();
		for (int i = 0; i < byteArray.length; i++)
		{
			if (byteArray[i] >= 0 && byteArray[i] < 16)
			{
				strBuf.append("0");
			}
			strBuf.append(Integer.toHexString(byteArray[i] & 0xFF));
		}
		return strBuf.toString();
	}

}
