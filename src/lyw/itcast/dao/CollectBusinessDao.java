package lyw.itcast.dao;

import java.sql.Timestamp;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import lyw.itcast.domain.Collect_Business;
import lyw.itcast.domain.Request_Message;
import lyw.itcast.domain.User_business;
import lyw.itcast.domain.User_message;
import lyw.itcast.exception.DaoException;
import lyw.itcast.utils.JdbcUtils;

public class CollectBusinessDao {
	
	/**
	 * 1、通过userbusiness对象,查找用户是否已经收藏了该商家的信息
	 * @param userbusiness
	 * @return
	 */
	public User_business find(User_business userbusiness) {
		try {
			// 使用了DBUtils框架
			QueryRunner qr = new QueryRunner(JdbcUtils.getDataSource());
			String sql = "select * from user_business where user_id=? and business_id=?";
			Object params[] = {userbusiness.getUser_id(),userbusiness.getBusiness_id()};
			return (User_business) qr.query(sql, new BeanHandler(User_business.class),params);
		} catch (Exception e) {
			throw new DaoException(e);
		}
	}
	/**
	 * 2、将用户收藏的商家信息保存到表中去
	 * @param userbusiness
	 * @return
	 */
	public boolean add(User_business userbusiness) {
		try {
			//获取到当前时间(这个类可以获取到时分秒)
			Timestamp coltime = new Timestamp(System.currentTimeMillis());
			
			// 使用了DBUtils框架
			QueryRunner qr = new QueryRunner(JdbcUtils.getDataSource());
			String sql = "insert into user_business(user_id,business_id,coltime) values(?,?,?)";
			Object params[] = {userbusiness.getUser_id(),userbusiness.getBusiness_id(),coltime};
			qr.update(sql, params);
		} catch (Exception e) {
			throw new DaoException(e);
		}
		// 成功添加返回true
		return true;
	}
	
	/**
	 * 查询用户收藏商家的总数
	 * @return
	 */
	public int getTotalrecord(String user_id) {
		try{
			QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
			
			String sql = "select count(*) from user_business where user_id=?";
			Object params[] = {user_id};
			long totalrecord = (Long) runner.query(sql, new ScalarHandler(),params);
			return (int)totalrecord;
		}catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	/**
	 * 获取分页数据
	 * @sql=select b.name,b.phone,b.email,b.address,ub.coltime from user_business ub,business b where ub.business_id=b.id and ub.user_id=? limit ?,?;
	 * @param user_id
	 * @param startindex
	 * @param pagesize
	 * @return
	 */
	public List getPageData(String user_id, int startindex, int pagesize) {
		try{
			QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
			String sql = "select b.name,b.phone,b.email,b.address,ub.* from user_business ub,business b where ub.business_id=b.id and ub.user_id=? limit ?,?;";
			Object params[] = {user_id,startindex,pagesize};
			return (List) runner.query(sql, new BeanListHandler(Collect_Business.class),params);
		}catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	/**
	 * 通过user_id和business_id删除用户收藏的商家信息
	 * @param user_id
	 * @param business_id
	 * @return
	 */
	public boolean deletebusiness(String user_id, String business_id) {
		try{
			QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
			String sql = "delete from user_business where user_id=? and business_id=?";
			Object params[] = {user_id,business_id};
			runner.update(sql,params);
		}catch (Exception e) {
			throw new RuntimeException(e);
		}
		return true;
	}
	
}
