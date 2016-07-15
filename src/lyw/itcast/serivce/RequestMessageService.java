package lyw.itcast.serivce;

import java.util.List;

import lyw.itcast.dao.RequestMessageDao;
import lyw.itcast.domain.MessagePage;
import lyw.itcast.domain.User_message;

public class RequestMessageService {
	/**
	 * 用户申请兼职
	 * @param user
	 * @return
	 */
	RequestMessageDao rmDao=new RequestMessageDao();
	public boolean add(User_message usermessage) {
		return rmDao.add(usermessage);
	}
	/**
	 * 查找用户是否已经是申请过该兼职
	 * @param usermessage
	 */
	public User_message find(User_message usermessage) {
		return rmDao.find(usermessage);
	}
	/**
	 * 查找用户所申请的所有简历信息
	 * @param pagenum
	 * @param actionname
	 * @return
	 */
	public MessagePage getPageData(String user_id,String pagenum, String actionname) {
		//得到简历的总数
		int totalrecord = rmDao.getTotalrecord(user_id);
		
		if(pagenum==null){
			//代表用户想看第一页的数据
			MessagePage page = new MessagePage(totalrecord,1);  //算出了总页数，以及用户想看的页从数据库哪个地方开始取
			List list = rmDao.getPageData(user_id,page.getStartindex(), page.getPagesize());
			page.setList(list);
			page.setUrl(actionname);
			return page;
		}else{
			//代表用户想看指定的页
			MessagePage page = new MessagePage(totalrecord,Integer.parseInt(pagenum)); 
			List list = rmDao.getPageData(user_id,page.getStartindex(), page.getPagesize());
			page.setList(list);
			page.setUrl(actionname);
			return page;
		}
	}
	/**
	 * 根据用户的id将用户的申请的兼职删除
	 * @param user_id
	 */
	public boolean deleteMessage(String user_id,String message_id) {
		return rmDao.deleteMessage(user_id,message_id);
	}
	
}
