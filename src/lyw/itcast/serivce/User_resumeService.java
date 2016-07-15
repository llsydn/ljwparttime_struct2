package lyw.itcast.serivce;

import java.util.List;

import lyw.itcast.dao.DAO_common;
import lyw.itcast.dao.User_resumeDao;
import lyw.itcast.domain.User_resume;

public class User_resumeService {
	User_resumeDao user_resumeDao=new User_resumeDao();
	
	//添加用户简历表
	public boolean addresume(User_resume  resume){
		return user_resumeDao.add(resume);
	}
	//show用户简历
	public List<User_resume> Showresume(String user_id){
		return user_resumeDao.showresume(user_id);
	}
	//根据用户简历的id查找简历的信息
	public User_resume findResume(String resume_id){
		return user_resumeDao.findResume(resume_id);
	}
	//根据用户简历的id更新用户的简历信息
	public boolean Updateresume(User_resume user_resume, String resume_id) {
		return user_resumeDao.updateresume(user_resume,resume_id);
	}
	//通过简历号，将简历信息从简历表中删除
	public boolean deleteResume(String resume_id) {
		return user_resumeDao.deleteResume(resume_id);
	}
	//更新用户简历的完整度
	public boolean updatepercent() {
		return user_resumeDao.updatepercent();
	}

    /**
     * 删除用户的所有简历
     * @param user_id 用户id
     * @return true 表示真
     */
    public boolean deleteByUserId(String user_id){
        return user_resumeDao.deleteByUserId(user_id)>0;
    }
}
