package lyw.itcast.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import lyw.itcast.domain.MessagePage;
import lyw.itcast.domain.User;
import lyw.itcast.domain.User_business;
import lyw.itcast.domain.User_message;
import lyw.itcast.serivce.CollectBusinessService;
import lyw.itcast.serivce.RequestMessageService;
import lyw.itcast.serivce.UserService;

public class CollectionAction extends ActionSupport{
	/**
	 * 1、用户收藏商家信息(不能重复收藏)
	 */
	private Map<String,Object> dataMap;  //返回的json对象
	private String businessid; //获取用户提交收藏商家的id
	private String username;  //获取用户的用户名
 	public String addcollection(){
 		//dataMap中的数据将会被Struts2转换成JSON字符串，所以这里要先清空其中的数据  
        dataMap = new HashMap<String, Object>(); 
 		//得到CollectBusinessService业务对象
        CollectBusinessService cbservice=new CollectBusinessService();
		//先判断用户名是否为空
        if (username==null) {
        	//表示用户还没登录。返回false
			dataMap.put("result", false);
		}else{
			//将用户的id,还有商家的id,保存到User_business对象中。
			User_business userbusiness=new User_business();
	 		UserService userService=new UserService();//得到用户的业务对象,通过用户id将用户信息查询出来
	 		User user = userService.findUser(username);
	 		userbusiness.setUser_id(user.getUser_id());//设置userbusiness对象user_id和business_id的值
	 		userbusiness.setBusiness_id(businessid);
			
			//要判断用户是否已经是收藏过了。
	 		User_business user_business = cbservice.find(userbusiness);
	 		if(user_business!=null){ //表示已经申请过了
	 			dataMap.put("result", "exist");
	 		}else {
	 			//将用户收藏的商家信息保存到表中去。
				cbservice.add(userbusiness);
				dataMap.put("result", true);
			}
		}
        //System.out.println(username+":"+messageid);
		return SUCCESS;
	}
 	
 	/**
 	 * 2、显示用户收藏过的商家的信息
 	 * @return
 	 */
 	private String user_id; //获取用户的id号。
 	private String pagenum; //获取用户想要看的第几页
 	public String showbusiness(){
 		
 		//得到CollectBusinessService业务对象
        CollectBusinessService cbservice=new CollectBusinessService();
 		HttpServletRequest request=ServletActionContext.getRequest();
 		
 		String actionname=request.getRequestURI(); ///ljwparttime_struct2/UserBusinessAction
 		//根据用户id号,查看用户收藏过商家的信息
 		MessagePage page = cbservice.getPageData(user_id,pagenum,actionname);
 		
 		//将封装好了的page对象保存到request域中。
 		request.setAttribute("page", page);
 		
 		return SUCCESS;
 		
 	}
 	/**
 	 * 3、删除申请兼职的信息
 	 * @return
 	 */
 	private String business_id;
 	public String deletebusiness(){
 		//得到CollectBusinessService业务对象
        CollectBusinessService cbservice=new CollectBusinessService();
 		//通过用户id将用户申请的兼职信息删除
        if (cbservice.deletebusiness(user_id,business_id)) { //表示删除成功
        	ActionContext.getContext().getSession().put("success", "删除成功...");
        	return "success";
		}else {
			ActionContext.getContext().getSession().put("error", "删除失败...");
			return "error";
		}
 	}
 	
	public String getBusiness_id() {
		return business_id;
	}
	public void setBusiness_id(String business_id) {
		this.business_id = business_id;
	}
	public Map<String, Object> getDataMap() {
		return dataMap;
	}
	public void setDataMap(Map<String, Object> dataMap) {
		this.dataMap = dataMap;
	}
	public String getBusinessid() {
		return businessid;
	}
	public void setBusinessid(String businessid) {
		this.businessid = businessid;
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
