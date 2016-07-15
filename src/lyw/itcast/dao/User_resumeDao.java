package lyw.itcast.dao;

import java.util.List;

import lyw.itcast.domain.User;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import lyw.itcast.domain.User_resume;
import lyw.itcast.exception.DaoException;
import lyw.itcast.utils.JdbcUtils;


public class User_resumeDao {
	
	
	//1、添加用户简历表。
	public boolean add(User_resume resume) {
		try {
			// 使用了DBUtils框架
			QueryRunner qr = new QueryRunner(JdbcUtils.getDataSource());
			String sql = "insert into user_resume(resume_id,title,name,sex,age,email,salary,experience,introduction,user_id,create_time,percent) "
					+ "values(?,?,?,?,?,?,?,?,?,?,?,?)";
			Object params[] = {resume.getResume_id(),resume.getTitle(),resume.getName(),resume.getSex(),resume.getAge(),resume.getEmail(),resume.getSalary(),resume.getExperience(),resume.getIntroduction(),resume.getUser_id(),resume.getCreate_time(),resume.getPercent()};
			qr.update(sql, params);
		} catch (Exception e) {
			throw new DaoException(e);
		}
		//成功添加返回true
		return true;
	}
	//2、查找所有的用户简历信息
	public List<User_resume> showresume(String user_id) {
		try {
			// 使用了DBUtils框架
			QueryRunner qr = new QueryRunner(JdbcUtils.getDataSource());
			String sql = "select * from user_resume where user_id=?";
			Object params[] = {user_id};
			return (List<User_resume>) qr.query(sql, new BeanListHandler(User_resume.class),params);
		} catch (Exception e) {
			throw new DaoException(e);
		}
	}
	//3、根据用户简历id查找用户的简历信息
	public User_resume findResume(String resume_id) {
		try {
			// 使用了DBUtils框架
			QueryRunner qr = new QueryRunner(JdbcUtils.getDataSource());
			String sql = "select * from user_resume where resume_id=?";
			Object params[] = {resume_id};
			return (User_resume) qr.query(sql,new BeanHandler(User_resume.class),params);
		} catch (Exception e) {
			throw new DaoException(e);
		}
	}
	//4、根据用户的简历id更新用户的简历信息
	public boolean updateresume(User_resume user_resume, String resume_id) {
		try {
			// 使用了DBUtils框架
			QueryRunner qr = new QueryRunner(JdbcUtils.getDataSource());
			String sql = "update user_resume  set title=?,name=?,sex=?,age=?,email=?,"
					+ "salary=?,experience=?,introduction=?,user_id=?,create_time=?,percent=? where resume_id=?";
			Object params[] = {user_resume.getTitle(),user_resume.getName(),user_resume.getSex(),user_resume.getAge(),
					user_resume.getEmail(),user_resume.getSalary(),user_resume.getExperience(),user_resume.getIntroduction(),
					user_resume.getUser_id(),user_resume.getCreate_time(),user_resume.getPercent(),resume_id};
			qr.update(sql, params);
		} catch (Exception e) {
			throw new DaoException(e);
		}
		//成功添加返回true
		return true;
	}
	//5、通过简历号将简历信息从简历表中删除
	public boolean deleteResume(String resume_id) {
		try {
			// 使用了DBUtils框架
			QueryRunner qr = new QueryRunner(JdbcUtils.getDataSource());
			String sql = "delete from user_resume  where resume_id=?";
			Object params[] = {resume_id};
			qr.update(sql, params);
		} catch (Exception e) {
			throw new DaoException(e);
		}
		//成功添加返回true
		return true;
	}
	//6更新用户简历的完整度
	public boolean updatepercent() {
		try {
			// 使用了DBUtils框架
			QueryRunner qr = new QueryRunner(JdbcUtils.getDataSource());
			String sql = "update user_resume set percent=percent+2";
			qr.update(sql);
		} catch (Exception e) {
			throw new DaoException(e);
		}
		//成功添加返回true
		return true;
	}

    /**
     * 删除用户的所有简历
     * @param user_id 用户id
     * @return 影响函数
     */
    public int deleteByUserId(String user_id){
        String sql = "delete from user_resume where user_id=?";
        Object[] params = {user_id};
        return DAO_common.updateQuery(sql, params);
    }
}
