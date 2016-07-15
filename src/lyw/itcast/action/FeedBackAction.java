package lyw.itcast.action;

import java.util.HashMap;
import java.util.Map;

import lyw.itcast.domain.FeedBack;
import lyw.itcast.domain.User;
import lyw.itcast.serivce.UserService;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class FeedBackAction extends ActionSupport implements ModelDriven<FeedBack>{
	
	private String username;//得到提交的用户名
	private Map<String, Object> dataMap;
	
	public String addfeedback(){
		dataMap = new HashMap<String, Object>();// 新建
		UserService serivce = new UserService();
		User user=serivce.findUser(username); //通过用户名找到用户信息
		feedback.setUser_id(user.getUser_id());
		
		//将反馈信息保存到反馈表中
		if(serivce.addfeedback(feedback)){
			dataMap.put("result", true);
		}
		return SUCCESS;
	}
	
	
	// 这个FeedBack类，表单数据提交过来时会自动填满这个FeedBack的属性
	private FeedBack feedback;
	
	@Override
	public FeedBack getModel() {
		// struts通过这个方法将表单数据打入user
		if (feedback == null) {
			feedback = new FeedBack();
		}
		return feedback;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Map<String, Object> getDataMap() {
		return dataMap;
	}
	public void setDataMap(Map<String, Object> dataMap) {
		this.dataMap = dataMap;
	}
}
