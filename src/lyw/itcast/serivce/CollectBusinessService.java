package lyw.itcast.serivce;

import java.util.List;

import lyw.itcast.dao.CollectBusinessDao;
import lyw.itcast.domain.MessagePage;
import lyw.itcast.domain.User_business;

public class CollectBusinessService {
	CollectBusinessDao cbDao=new CollectBusinessDao();
	/**
	 * 1、通过userbusiness对象,查找用户是否已经收藏了该商家的信息
	 * @param userbusiness
	 * @return
	 */
	public User_business find(User_business userbusiness) {
		return cbDao.find(userbusiness);
	}
	/**
	 * 2、将用户收藏的商家信息保存到表中去。
	 * @param userbusiness
	 */
	public boolean add(User_business userbusiness) {
		return cbDao.add(userbusiness);
	}
	
	/**
	 * 查找用户所收藏过的商家信息,并分页显示
	 * @param user_id
	 * @param pagenum
	 * @param actionname
	 * @return
	 */
	public MessagePage getPageData(String user_id, String pagenum,
			String actionname) {
		//得到收藏商家的总数
		int totalrecord = cbDao.getTotalrecord(user_id);
		
		if(pagenum==null){
			//代表用户想看第一页的数据
			MessagePage page = new MessagePage(totalrecord,1);  //算出了总页数，以及用户想看的页从数据库哪个地方开始取
			List list = cbDao.getPageData(user_id,page.getStartindex(), page.getPagesize());
			page.setList(list);
			page.setUrl(actionname);
			return page;
		}else{
			//代表用户想看指定的页
			MessagePage page = new MessagePage(totalrecord,Integer.parseInt(pagenum)); 
			List list = cbDao.getPageData(user_id,page.getStartindex(), page.getPagesize());
			page.setList(list);
			page.setUrl(actionname);
			return page;
		}
	}
	/**
	 * 通过user_id和business_id删除用户收藏的商家信息
	 * @param user_id
	 * @param business_id
	 */
	public boolean deletebusiness(String user_id, String business_id) {
		return cbDao.deletebusiness(user_id,business_id);
	}

}
