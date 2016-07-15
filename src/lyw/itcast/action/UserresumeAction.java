package lyw.itcast.action;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import lyw.itcast.domain.User;
import lyw.itcast.domain.User_resume;
import lyw.itcast.serivce.UserService;
import lyw.itcast.serivce.User_resumeService;
import lyw.itcast.utils.WebUtils;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class UserresumeAction extends ActionSupport implements ModelDriven<User_resume>{
	private User_resume user_resume;//用户简历表
	private String username;//接收用户名
	private List<User_resume> list;//保存用户创建的简历信息
	private Integer num;  //记录创建简历的数目
	private String resume_id; //获取到地址栏的resume_id
	
	//1、通过用户名查找用户的所有简历
	public String Showresume() throws Exception{
		//获取到actioncontent对象,就相当于获取了request,session,应用范围对象
		ActionContext context=ActionContext.getContext();
		
		//通过用户名查找用户的id,并且注入到user_resume对象。
		UserService userserivce = new UserService();
		
		username=new String(username.getBytes("iso-8859-1"),"UTF-8"); 
		
		User user=userserivce.findUser(username);
		context.getSession().put("user", user);
		
		//通过用户id查找出用户创建的简历
		User_resumeService resumeService=new User_resumeService();
		
		//得到用户所有的简历
		list=resumeService.Showresume(user.getUser_id());
		context.getSession().put("list", list);
		return SUCCESS;
		
	}
	
	private Integer percent=5; //完成度的计算
	//2、添加用户简历表信息
	public String addresume(){
		//先创建一个简历表的id
		user_resume.setResume_id(WebUtils.makeId());
		
		user_resume.setCreate_time(new Date());
		//通过用户名查找用户的id,并且注入到user_resume对象。
		UserService userserivce = new UserService();
		User user=userserivce.findUser(username);
		user_resume.setUser_id(user.getUser_id());
		
		
		//计算简历完成的程度。
		if (!user_resume.getAge().equals("")) {
			percent+=1;
		}
		if (!user_resume.getSalary().equals("")) {
			percent+=1;
		}
		if (!user_resume.getExperience().equals("")) {
			percent+=1;
		}
		//判断用户有没有上传过头像
		if (user.getImageurl()!=null) {
			percent+=2;
		}
		user_resume.setPercent(percent);
		
		//将用户的简历信息保存到request域中
		//ActionContext.getContext().put("user_resume", user_resume);
		
		User_resumeService resumeservice=new User_resumeService();
		num=user.getResumecount();
		if (num!=6) {
			num++;
			resumeservice.addresume(user_resume);
		}else {
			ActionContext.getContext().getSession().put("error", "对不起您最多只能创建6份简历....");
			return "error";
		}
		
		//将用户创建简历数目存放到用户表中去。
		user.setResumecount(num);
		userserivce.updateUser(user, user.getUser_id());
		
		ActionContext.getContext().getSession().put("success", "简历创建成功");
		
		return SUCCESS;
	}
	//3、用户信息的展示，要修改用户简历前,简历信息的展示
	public String showpersonresume_update(){
		HttpServletRequest request=ServletActionContext.getRequest();
		resume_id=request.getParameter("resume_id");
		
		User_resumeService resumeservice=new User_resumeService();
		User_resume user_resume=resumeservice.findResume(resume_id);
		
		//将简历信息保存到request域中。
		ActionContext.getContext().getSession().put("user_resume", user_resume);
		
		return "showpersonresume_update";
	}
	//3、查看个人用户的简历
	public String showpersonresume(){
		HttpServletRequest request=ServletActionContext.getRequest();
		resume_id=request.getParameter("resume_id");
		
		User_resumeService resumeservice=new User_resumeService();
		User_resume user_resume=resumeservice.findResume(resume_id);
		
		//将简历信息保存到request域中。
		ActionContext.getContext().getSession().put("user_resume", user_resume);
		
		return "showpersonresume";
	}
	
	//4、更新(修改)用户的简历
	public String updateresume(){
		HttpServletRequest request=ServletActionContext.getRequest();
		resume_id=request.getParameter("resume_id");
		
		User_resumeService resumeservice=new User_resumeService();
		//获取到简历表原来的信息
		User_resume userresume=resumeservice.findResume(resume_id);
		//这里要把user_id设置好。
		user_resume.setUser_id(userresume.getUser_id());
		//还要把percent设置好。
		//计算简历完成的程度。
		Integer percent=userresume.getPercent();  //得到原来的值
		if (percent!=8) {
			if (!user_resume.getAge().equals("") && userresume.getAge().equals("")) {
				percent+=1;
			}
			if (!user_resume.getSalary().equals("") && userresume.getSalary().equals("")) {
				percent+=1;
			}
			if (!user_resume.getExperience().equals("") && userresume.getExperience().equals("")) {
				percent+=1;
			}
			user_resume.setPercent(percent);
		}else {
			user_resume.setPercent(percent);
		}
		//重新设置时间
		user_resume.setCreate_time(new Date());
		
		//将简历信息保存到request域中。
		ActionContext.getContext().getSession().put("user_resume", user_resume);
		
		//根据用户的简历id更新用户的简历信息
		resumeservice.Updateresume(user_resume,resume_id);
		return "update";
	}
	
	//5、删除简历
	public String deleteresume(){
		//得到简历的id号(要删除的简历号)
		HttpServletRequest request=ServletActionContext.getRequest();
		resume_id=request.getParameter("resume_id");
		
		User_resumeService resumeservice=new User_resumeService();
		
		//注意这里要把用户表里面的简历数目-1;
		//获取到简历表原来的信息
		User_resume user_resume=resumeservice.findResume(resume_id);
		//通过用户名查找用户的id,并且注入到user_resume对象。
		UserService userserivce = new UserService();
		//通过用户id号,查找用户的信息。
		User user=userserivce.findById(user_resume.getUser_id());
		//将用户简历数目-1
		user.setResumecount(user.getResumecount()-1);
		//再更新用户的信息
		userserivce.updateUser(user, user.getUser_id());
		
		//将简历信息从简历表中删除
		resumeservice.deleteResume(resume_id);
		ActionContext.getContext().getSession().put("success", "删除成功...");
		
		return "deleteresume";
	}
	
	
	public User_resume getUser_resume() {
		return user_resume;
	}

	public void setUser_resume(User_resume user_resume) {
		this.user_resume = user_resume;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	
	public List<User_resume> getList() {
		return list;
	}

	public void setList(List<User_resume> list) {
		this.list = list;
	}
	
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public String getResume_id() {
		return resume_id;
	}

	public void setResume_id(String resume_id) {
		this.resume_id = resume_id;
	}
	@Override
	public User_resume getModel() {
		// struts通过这个方法将表单数据打入user
		if (user_resume == null) {
			user_resume = new User_resume();
		}
		return user_resume;
	}
}
