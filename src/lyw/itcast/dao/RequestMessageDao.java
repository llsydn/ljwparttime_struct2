package lyw.itcast.dao;

import java.sql.Timestamp;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import lyw.itcast.domain.Request_Message;
import lyw.itcast.domain.User_message;
import lyw.itcast.exception.DaoException;
import lyw.itcast.utils.JdbcUtils;

public class RequestMessageDao {
	
	/**
	 * 添加用户申请兼职的信息到user_message表中
	 * @param usermessage
	 * @return
	 */
	public boolean add(User_message usermessage) {
		try {
			//获取到当前时间
			Timestamp apply_time = new Timestamp(System.currentTimeMillis());
			
			// 使用了DBUtils框架
			QueryRunner qr = new QueryRunner(JdbcUtils.getDataSource());
			String sql = "insert into user_message(user_id,message_id,apply_time) values(?,?,?)";
			Object params[] = {usermessage.getUser_id(),usermessage.getMessage_id(),apply_time};
			qr.update(sql, params);
		} catch (Exception e) {
			throw new DaoException(e);
		}
		// 成功添加返回true
		return true;
	}
	/**
	 * 查找用户是否已经是申请过该兼职了。
	 * @param usermessage
	 * @return
	 */
	public User_message find(User_message usermessage) {
		try {
			// 使用了DBUtils框架
			QueryRunner qr = new QueryRunner(JdbcUtils.getDataSource());
			String sql = "select * from user_message where user_id=? and message_id=?";
			Object params[] = {usermessage.getUser_id(),usermessage.getMessage_id()};
			return (User_message) qr.query(sql, new BeanHandler(User_message.class),params);
		} catch (Exception e) {
			throw new DaoException(e);
		}
	}
	/**
	 * 查找简历的总数目
	 * @return
	 */
	public int getTotalrecord(String user_id) {
		try{
			QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
			
			String sql = "select count(*) from user_message where user_id=?";
			Object params[] = {user_id};
			long totalrecord = (Long) runner.query(sql, new ScalarHandler(),params);
			return (int)totalrecord;
		}catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	/**
	 * 获取分页数据
	 * @param startindex
	 * @param pagesize
	 * @return
	 * select * from (select m.title,c.commodity_name,b.name,um.apply_time from user_message um,message m,commodity c,business b where um.user_id="99f7b21c-8b0c-45b5-aed9-8efda8797629" and um.message_id=m.id and m.commodity_id=c. commodity_id and m.business_id=b.id) t limit 4,5;
	 */
	public List getPageData(String user_id,int startindex, int pagesize) {
		try{
			QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
			String sql = "select * from (select m.title,c.commodity_name,b.name,um.apply_time,um.user_id,um.message_id from user_message um,message m,commodity c,business b where um.user_id=? and um.message_id=m.id and m.commodity_id=c. commodity_id and m.business_id=b.id) t limit ?,?";
			Object params[] = {user_id,startindex,pagesize};
			return (List) runner.query(sql, new BeanListHandler(Request_Message.class),params);
		}catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	/**
	 * 根据用户的id将用户申请的兼职信息删除掉
	 * @param user_id
	 * @return
	 */
	public boolean deleteMessage(String user_id,String message_id) {
		try{
			QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
			String sql = "delete  from user_message where user_id=? and message_id=?";
			Object params[] = {user_id,message_id};
			runner.update(sql,params);
		}catch (Exception e) {
			throw new RuntimeException(e);
		}
		return true;
	}

}
