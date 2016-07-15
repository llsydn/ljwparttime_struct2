package lyw.itcast.dao;

import lyw.itcast.domain.Business;

import java.util.List;

/**
 *
 */
public class BusinessDAO {
    /**
     * 检查商家名字和密码是否正确
     *
     * @param name
     * @param pwd
     * @return
     */
    public Business checkNamePwd(String name, String pwd) {
        String sql = "select * from business where name=? and password=?";
        Object[] params = {name, pwd};
        return DAO_common.beanQuery(sql, Business.class, params);
    }

    /**
     * 检测手机和密码是否正确
     *
     * @param phone
     * @param pwd
     * @return
     */
    public Business checkPhonePwd(String phone, String pwd) {
        String sql = "select * from business where phone=? and password=?";
        Object[] params = {phone, pwd};
        return DAO_common.beanQuery(sql, Business.class, params);
    }

    /**
     * 检测邮件和密码是否正确
     *
     * @param email
     * @param pwd
     * @return
     */
    public Business checkEmailPwd(String email, String pwd) {
        String sql = "select * from business where email=? and password=?";
        Object[] params = {email, pwd};
        return DAO_common.beanQuery(sql, Business.class, params);
    }

    /**
     * 检查商家id和密码是否正确
     *
     * @param id
     * @param pwd
     * @return
     */
    public Business checkIdPwd(int id, String pwd) {
        String sql = "select * from business where id=? and password=?";
        Object[] params = {id, pwd};
        return DAO_common.beanQuery(sql, Business.class, params);
    }

    /**
     * 通过名字找到商家
     *
     * @param name
     * @return
     */
    public Business findByName(String name) {
        String sql = "select * from business where name=?";
        Object[] params = {name};
        return DAO_common.beanQuery(sql, Business.class, params);
    }

    /**
     * 通过邮件找到商家
     *
     * @param enaul
     * @return
     */
    public Business findByMail(String enaul) {
        String sql = "select * from business where email=?";
        Object[] params = {enaul};
        return DAO_common.beanQuery(sql, Business.class, params);
    }

    /**
     * 通过电话找到商家
     *
     * @param phone
     * @return
     */
    public Business findByPhone(long phone) {
        String sql = "select * from business where phone=?";
        Object[] params = {phone};
        return DAO_common.beanQuery(sql, Business.class, params);
    }

    /**
     * 通过id找到商家
     *
     * @param id
     * @return
     */
    public Business findById(int id) {
        String sql = "select * from business where id=?";
        Object[] params = {id};
        return DAO_common.beanQuery(sql, Business.class, params);
    }

    /**
     * 添加新的商家
     *
     * @param password
     * @param name
     * @param phone
     * @param email
     * @param level    信用等级
     * @param address
     * @return
     */
    public Business addbusiness(String password, String name, String phone, String email, int level, String address) {
        String sql = "INSERT INTO business (id, password, name, phone, email, level, pic, address) VALUES (NULL, ?, ?, ?, ?, ?, ?, ?);";
        Object[] params = {password, name, phone, email, level, "", address};
        int rows = DAO_common.updateQuery(sql, params);
        if (rows > 0) {
            return this.findByName(name);
        }
        return null;
    }

    /**
     * 更新商家信息的操作
     *
     * @param name
     * @param phone
     * @param email
     * @param address
     * @param id
     * @return 返回null表示更新失败，返回business表示更新后的商家实体
     */
    public Business updateInfo(String name, String phone, String email, String address, int id) {
        String sql = "UPDATE business SET name =?, phone = ?, email=?, address=? WHERE id = ?;";
        Object[] params = {name, phone, email, address, id};
        int rows = DAO_common.updateQuery(sql, params);
        if (rows > 0) {
            return this.findById(id);
        }
        return null;
    }

    /**
     * 更新商家的密码
     *
     * @param id
     * @param pwd
     * @param newpwd
     * @return null表示更新失败，否则返回一个更新后的商家实体
     */
    public Business updatePwd(int id, String pwd, String newpwd) {
        String sql = "update business set password=? where id=? and password=?";
        Object[] params = {newpwd, id, pwd};
        int rows = DAO_common.updateQuery(sql, params);
        if (rows > 0) {
            //修改成功
            return findById(id);
        }
        return null;
    }

    /**
     * 更新商家的图片路径
     *
     * @param id      商家id
     * @param picname 图片名字
     * @return 成功就返回更新后的商家，否则返回空
     */
    public Business updatePic(int id, String picname) {
        String sql = "update business set pic=? where id=?";
        Object[] params = {picname, id};
        int rows = DAO_common.updateQuery(sql, params);
        if (rows > 0) {
            return findById(id);
        }
        return null;
    }

    /**
     * 更新商家的简介
     *
     * @param descript
     * @param id
     * @return
     */
    public Business updateDescription(String descript, int id) {
        String sql = "update business set description=? where id=?";
        Object[] params = {descript, id};
        int rows = DAO_common.updateQuery(sql, params);
        if (rows > 0) {
            return findById(id);
        }
        return null;
    }

    /**
     * 更新一个商家的等级，0代表没有审核
     *
     * @param id    商家id
     * @param level 商家等级
     * @return true为成功
     */
    public boolean updateBusinessLevel(int id, int level) {
        String sql = "update business set level=? where id=?";
        Object[] params = {level, id};
        int rows = DAO_common.updateQuery(sql, params);
        return rows > 0;
    }


    /**
     * 获得等级为0的商家门，也就是没有审核过的
     *
     * @param start 开始记录
     * @param size  多少条
     * @return list
     */
    public List<Business> getLevel0Businesses(int start, int size) {
        String sql = "select * from business where level=0 limit ?,?";
        Object[] params = {start, size};
        return DAO_common.beanListQuery(sql, Business.class, params);
    }

    /**
     * 获得有多少商家是未审核的
     *
     * @return
     */
    public int getLevel0businessCount() {
        String sql = "select count(*) from business where level=0";
        Object[] params = {};
        return DAO_common.ScalarQuery(null, sql, params);
    }

    /**
     * 获得等级大于等于1的商家，也就是审核过的
     *
     * @param start 开始记录
     * @param size  多少条
     * @return list
     */
    public List<Business> getLevel1Businesses(int start, int size) {
        String sql = "select * from business where level>=1 limit ?,?";
        Object[] params = {start, size};
        return DAO_common.beanListQuery(sql, Business.class, params);
    }

    /**
     * 获得有多少商家是审核的
     *
     * @return
     */
    public int getLevel1businessCount() {
        String sql = "select count(*) from business where level>=1";
        Object[] params = {};
        return DAO_common.ScalarQuery(null, sql, params);
    }

    /**
     * 获得所有商家
     *
     * @return
     */
    public List<Business> getAllBusinesses(int start, int size) {
        String sql = "select * from business where 1 limit ?,?";
        Object[] params = {start, size};
        return DAO_common.beanListQuery(sql, Business.class, params);
    }

    /**
     * 获得所有商家的数量
     *
     * @return
     */
    public int getAllBusinessCount() {
        String sql = "select count(*) from business where 1";
        Object[] params = {};
        return DAO_common.ScalarQuery(null, sql, params);
    }
}
