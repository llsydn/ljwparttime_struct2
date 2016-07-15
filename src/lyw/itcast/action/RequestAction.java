package lyw.itcast.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import lyw.itcast.domain.MessagePage;
import lyw.itcast.domain.User;
import lyw.itcast.domain.User_message;
import lyw.itcast.serivce.RequestMessageService;
import lyw.itcast.serivce.UserService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class RequestAction extends ActionSupport{
	/**
	 * 1、用户兼职申请(不能重复申请)
	 * @return
	 */
	private Map<String,Object> dataMap;  //返回的json对象
	private String messageid; //获取用户提交申请的兼职信息的id
	private String username;  //获取用户的用户名
 	public String requestaction(){
 		//dataMap中的数据将会被Struts2转换成JSON字符串，所以这里要先清空其中的数据  
        dataMap = new HashMap<String, Object>(); 
 		//得到RequestMessageService业务对象
 		RequestMessageService rmservice=new RequestMessageService();
		//先判断用户名是否为空
        if (username==null) {
        	//表示用户还没登录。返回false
			dataMap.put("result", false);
		}else{
			//将用户的id,还有兼职信息的id,保存到usermessage对象中。
			User_message usermessage=new User_message();
	 		UserService userService=new UserService();
	 		User user = userService.findUser(username);
			usermessage.setUser_id(user.getUser_id());
	 		usermessage.setMessage_id(messageid);
			
			//要判断用户是否已经是申请过了。
	 		User_message user_message = rmservice.find(usermessage);
	 		if(user_message!=null){ //表示已经申请过了
	 			dataMap.put("result", "exist");
	 		}else {
	 			//将用户申请的兼职保存到表中去。
				rmservice.add(usermessage);
				dataMap.put("result", true);
			}
		}
        //System.out.println(username+":"+messageid);
        return SUCCESS;
	}
 	
 	/**
 	 * sql=select m.title,c.commodity_name,b.name,um.apply_time 
 	 * from user_message um,message m,commodity c,business b 
 	 * where um.user_id="?" 
 	 * and um.message_id=m.id and m.commodity_id=c. commodity_id and m.business_id=b.id;
 	 * 2、个人兼职申请展示
 	 * @return
 	 */
 	private String user_id; //获取用户的id号。
 	private String pagenum; //获取用户想要看的第几页
 	public String usermessage(){
 		
 		RequestMessageService rmservice=new RequestMessageService();
 		HttpServletRequest request=ServletActionContext.getRequest();
 		
 		String actionname=request.getRequestURI(); ///ljwparttime_struct2/UserMessageAction
 		//根据用户id号,查看用户申请的所有兼职
 		MessagePage page = rmservice.getPageData(user_id,pagenum,actionname);
 		
 		//将封装好了的page对象保存到request域中。
 		request.setAttribute("page", page);
 		
 		return SUCCESS;
 	}
 	/**
 	 * 3、删除申请兼职的信息
 	 * @return
 	 */
 	private Map<String,Object> deleteMap;  //返回的json对象
 	private String message_id;
 	public String deletemessage(){
 		//dataMap中的数据将会被Struts2转换成JSON字符串，所以这里要先清空其中的数据  
 		deleteMap = new HashMap<String, Object>(); 
 		
 		RequestMessageService rmservice=new RequestMessageService();
 		//通过用户id将用户申请的兼职信息删除
 		rmservice.deleteMessage(user_id,message_id);//表示删除成功
 	    
 		ActionContext.getContext().getSession().put("success", "删除成功...");
 		
 		return "success";
 	}
	public String getMessage_id() {
		return message_id;
	}
	public void setMessage_id(String message_id) {
		this.message_id = message_id;
	}
	public Map<String, Object> getDeleteMap() {
		return deleteMap;
	}
	public void setDeleteMap(Map<String, Object> deleteMap) {
		this.deleteMap = deleteMap;
	}
	public Map<String, Object> getDataMap() {
		return dataMap;
	}
	public void setDataMap(Map<String, Object> dataMap) {
		this.dataMap = dataMap;
	}
	public String getMessageid() {
		return messageid;
	}
	public void setMessageid(String messageid) {
		this.messageid = messageid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getPagenum() {
		return pagenum;
	}
	public void setPagenum(String pagenum) {
		this.pagenum = pagenum;
	}
}
