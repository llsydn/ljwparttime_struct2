package lyw.itcast.action;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

import lyw.itcast.domain.User;
import lyw.itcast.domain.User_resume;
import lyw.itcast.serivce.UserService;
import lyw.itcast.serivce.User_resumeService;
import lyw.itcast.utils.OperateImage;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UploadAction extends ActionSupport{
	private File myFile; // 得到上传的文件
	private String myFileContentType;// 获取文件的类型
	private String myFileFileName;// 获取文件名
	private String destPath;// 要保存的路径
	private OperateImage image;//要剪切用户头像的 
	private String username;//获取是那个用户
	
	/**
	 * 修改头像调整的jsp
	 */
	public String changephoto(){
		//这里会进行权限验证，如果用户没有登陆，就不能直接修改头像
		return "success";
	}
	
	/*
	 * 头像上传action
	 * */
	@Override
	public String execute() throws Exception {
		/* Copy file to a safe location */
		// 查找数据库中该用户的信息
		UserService service = new UserService();
		username=new String(username.getBytes("iso-8859-1"),"UTF-8"); 
		User user = service.findUser(username);
		
		//先判断用户之前有没有上传过头像
		if (user.getImageurl() == null) {
			//这里要更新一下用户简历的完整度。//当用户上传完头像后,将简历的完整度再加2
			User_resumeService resumeservice=new User_resumeService();
			resumeservice.updatepercent();
		}
		
		
		destPath = "/upload/"+user.getUser_id();//文件保存的目录
		String path=ServletActionContext.getServletContext().getRealPath(destPath);//得到真实的路径
		//String suffix="";//后缀名 
		
		try {
			if (myFile!=null) {
				//suffix=myFileFileName.substring(myFileFileName.lastIndexOf("."));
				File destFile = new File(new File(path), user.getUser_id()+".jpg");//重新命名改文件
				
				if (!destFile.getParentFile().exists()) {
					destFile.getParentFile().mkdirs();
				}
				FileUtils.copyFile(myFile, destFile);
			}

		} catch (IOException e) {
			e.printStackTrace();
			return ERROR;
		}
		//设置用户头像对应的保存目录
		user.setImageurl(destPath+"/"+user.getUser_id()+".jpg");
		//更新用户信息
		service.updateUser(user, user.getUser_id());
		
		//在session中保存用户的信息
		ActionContext.getContext().getSession().put("user", user);
		
		
		
		ActionContext.getContext().put("success", "上传成功");
		
		return SUCCESS;
	}
	
	/** 
     * 裁剪头像 
	 * @throws Exception 
     */  
    public String cutPic() throws Exception{  
    	//System.out.println("cutPic");
    	username=new String(username.getBytes("iso-8859-1"),"UTF-8");  //不知道是什么问题,那个filter不能处理get提交过来的数据中文乱码问题
    	// 查找数据库中该用户的信息
    	UserService service = new UserService();
    	User user = service.findUser(username);
  
    	//原图名+保存的目录
    	String name = ServletActionContext.getServletContext().getRealPath(user.getImageurl());  
    	image.setSrcpath(name);
    	
    	//设置保存后头像的名称,是以用户的名称命名剪切后的头像
    	destPath = "/upload/"+user.getUser_id();
    	//String suffix=user.getImageurl().substring(user.getImageurl().lastIndexOf("."));
    	//裁剪目标图名,新头像的名称
        image.setSubpath(ServletActionContext.getServletContext().getRealPath(destPath+"/"+user.getUser_id()+".jpg"));
        
        try {  
            image.cut(); //执行裁剪操作  执行完后即可生成目标图在对应文件夹内。  
        } catch (IOException e) {  
            e.printStackTrace();  
        }  
        
        //设置用户头像对应的保存目录
		user.setImageurl(destPath+"/"+user.getUser_id()+".jpg");
		//更新用户信息
		service.updateUser(user, user.getUser_id());
		
		//在session中保存用户的信息
		ActionContext.getContext().getSession().put("user", user);
		
        return SUCCESS;  
    }  
	
	
	public File getMyFile() {
		return myFile;
	}
	public void setMyFile(File myFile) {
		this.myFile = myFile;
	}
	public String getMyFileContentType() {
		return myFileContentType;
	}
	public void setMyFileContentType(String myFileContentType) {
		this.myFileContentType = myFileContentType;
	}
	public String getMyFileFileName() {
		return myFileFileName;
	}
	public void setMyFileFileName(String myFileFileName) {
		this.myFileFileName = myFileFileName;
	}
	public String getDestPath() {
		return destPath;
	}
	public void setDestPath(String destPath) {
		this.destPath = destPath;
	}

	public OperateImage getImage() {
		return image;
	}

	public void setImage(OperateImage image) {
		this.image = image;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
}
