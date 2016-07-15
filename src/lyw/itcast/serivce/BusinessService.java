package lyw.itcast.serivce;

import com.opensymphony.xwork2.ActionContext;
import lyw.itcast.dao.BusinessDAO;
import lyw.itcast.domain.Business;
import lyw.itcast.domain.Page;
import lyw.itcast.utils.QEncodeUtil;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.Cookie;
import java.io.File;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 商家的服务
 */
public class BusinessService {
    public static String KEY = "weituotian";//aes加密密匙

    private BusinessDAO businessDAO;

    public BusinessService() {
        businessDAO = new BusinessDAO();
    }

    /**
     * 判断是否邮箱
     *
     * @param email
     * @return
     */
    private boolean isEmail(String email) {
        String check = "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
        Pattern regex = Pattern.compile(check);
        Matcher matcher = regex.matcher(email);
        return matcher.matches();
    }

    /**
     * 判断是否手机
     *
     * @param mobiles
     * @return
     */
    public static boolean isMobileNO(String mobiles) {
        Pattern p = Pattern.compile("^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$");
        Matcher m = p.matcher(mobiles);
        return m.matches();
    }

    /**
     * 检测商家的帐号是否已经存在了
     *
     * @param account
     * @return true表示已经存在
     */
    public boolean isBusinessCreated(String account) {
        Business business = null;
        if (isEmail(account)) {
            business = businessDAO.findByMail(account);
        } else if (isMobileNO(account)) {
            business = businessDAO.findByPhone(Long.parseLong(account));
        } else {
            business = businessDAO.findByName(account);
        }
        if (business != null) {
            return true;
        }
        return false;
    }

    /**
     * 使用账户登录
     *
     * @param account
     * @param pwd
     * @return
     */
    public Business login(String account, String pwd) {
        Business business = null;
        if (isEmail(account)) {
            business = businessDAO.checkEmailPwd(account, pwd);
        } else if (isMobileNO(account)) {
            business = businessDAO.checkPhonePwd(account, pwd);
        } else {
            business = businessDAO.checkNamePwd(account, pwd);
        }
        return business;
    }

    /**
     * 保存登录的cookies
     *
     * @param business
     */
    public void addLoginCookies(Business business) {
        try {
            Cookie bidCookie = new Cookie("bid", "" + business.getId());
            Cookie pwdCookie = new Cookie("pwd", QEncodeUtil.aesEncrypt(business.getPassword(), BusinessService.KEY));
            bidCookie.setMaxAge(3600 * 24 * 7);
            pwdCookie.setMaxAge(3600 * 24 * 7);
            ServletActionContext.getResponse().addCookie(bidCookie);
            ServletActionContext.getResponse().addCookie(pwdCookie);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    /**
     * 退出
     */
    public void logout() {
        //session中清空
        ActionContext.getContext().getSession().remove("business");

        //cookies中清空
        Cookie bidCookie = new Cookie("bid", "");
        bidCookie.setMaxAge(0);
        Cookie pwdCookie = new Cookie("pwd", "");
        pwdCookie.setMaxAge(0);
        ServletActionContext.getResponse().addCookie(pwdCookie);
        ServletActionContext.getResponse().addCookie(bidCookie);
    }

    /**
     * 将对象加入session
     *
     * @param value
     */
    public void saveSession(Business value) {
        ActionContext.getContext().getSession().put("business", value);
        //设置session的时间，以秒为单位
        ServletActionContext.getRequest().getSession().setMaxInactiveInterval(600);
    }

    /**
     * 从session中获得business实体,session中没有则尝试从cookies中获取
     *
     * @return
     */
    public Business getSessionBusiness() {
        Business business = (Business) ActionContext.getContext().getSession().get("business");
        if (business == null) {
            //尝试从cookies中读取商家
            Cookie bidCookie = this.findCookiesByName("bid");
            Cookie pwdCookie = this.findCookiesByName("pwd");
            try {
                //将存储在cookies的密码解密
                if (bidCookie != null && pwdCookie != null) {
                    String password = QEncodeUtil.aesDecrypt(pwdCookie.getValue(), KEY);
                    business = businessDAO.checkIdPwd(Integer.parseInt(bidCookie.getValue()), password);
                    if (business != null) {
                        //可以登录就又加入session中罗
                        this.saveSession(business);
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return business;
    }

    /**
     * 通过名字找到cookies的值
     *
     * @param name
     * @return
     */
    private Cookie findCookiesByName(String name) {
        Cookie[] cks = ServletActionContext.getRequest().getCookies();
        if (cks != null) {
            for (Cookie ck : cks) {
                if (ck.getName().equals(name)) {
                    return ck;
                }
            }
        }
        return null;
    }

    private Cookie deleteCookie(Cookie target) {
        if (target != null) {
            target.setValue("");
            target.setMaxAge(0);
        }
        return target;
    }

    /**
     * 添加商家的服务
     *
     * @param password
     * @param name
     * @param phone
     * @param email
     * @param address
     * @return
     */
    public Business addBusiness(String password, String name, String phone, String email, String address) {
        return businessDAO.addbusiness(password, name, phone, email, 0, address);
    }

    /**
     * 提供更新商家信息的service
     *
     * @param name
     * @param phone
     * @param email
     * @param address
     * @param id
     * @return
     */
    public Business updateInfo(String name, String phone, String email, String address, int id) {
        return businessDAO.updateInfo(name, phone, email, address, id);
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
        return businessDAO.updatePwd(id, pwd, newpwd);
    }


    /**
     * 更新商家的logo
     *
     * @param id      商家id
     * @param picname 图片名字
     * @return 成功返回true，失败返回false
     */
    public boolean updatePuc(int id, String picname) {
        Business business = businessDAO.updatePic(id, picname);
        if (business != null) {
            //保存更新后的商家到session中
            this.saveSession(business);
            return true;
        }
        return false;
    }

    /**
     * 清除一些临时文件
     */
    public void cleanTemp() {
        //临时头像文件清除
        String filepath = (String) ActionContext.getContext().getSession().get("templogo");
        if (filepath != null) {
            File templocalfile = new File(filepath);
            if (templocalfile.exists()) {
                templocalfile.delete();
            }
        }
    }

    /**
     * 更新商家的简介的服务
     *
     * @param descript
     * @param id
     * @return
     */
    public boolean updateDescription(String descript, int id) {
        Business business = businessDAO.updateDescription(descript, id);
        if (business != null) {
            //把更新后的商家存入session中
            this.saveSession(business);
            return true;
        }
        return false;
    }

    /**
     * 通过id找到商家的信息
     *
     * @param id
     * @return
     */
    public Business findById(int id) {
        return businessDAO.findById(id);
    }

    /**
     * 获得等级为0的商家门，也就是没有审核过的
     * @param page 页的类
     * @return list
     */
    public List<Business> getLevel0Bisinesses(Page page){
        return businessDAO.getLevel0Businesses(page.getStart(), page.getPageSize());
    }

    /**
     * 获得有多少商家是未审核的
     * @return
     */
    public Page getLevel0businessCount(int page){
        Page page1 = new Page(page);
        //每页显示5条记录
        page1.setPageSize(5);
        //设置总共有多少条记录
        page1.setTotal(businessDAO.getLevel0businessCount());
        return page1;
    }

    /**
     * 分页获得等级大于等于1的商家list，也就是审核过的
     * @param page 页的类
     * @return list
     */
    public List<Business> getLevel1Bisinesses(Page page){
        return businessDAO.getLevel1Businesses(page.getStart(), page.getPageSize());
    }

    /**
     * 获得有多少商家是审核的分页
     * @return page
     */
    public Page getLevel1businessCount(int page){
        Page page1 = new Page(page);
        //每页显示5条记录
        page1.setPageSize(5);
        //设置总共有多少条记录
        page1.setTotal(businessDAO.getLevel1businessCount());
        return page1;
    }


    /**
     * 更新一个商家，使它通过审核
     *
     * @param id 商家id
     * @return
     */
    public boolean updateBusinessLevel(int id) {
        return businessDAO.updateBusinessLevel(id,1);
    }

    /**
     * 更新一个商家，使它为没有通过审核状态
     *
     * @param id 商家id
     * @return true表示成功
     */
    public boolean updateBusinessLevel0(int id) {
        return businessDAO.updateBusinessLevel(id,0);
    }

    /**
     * 获得所有商家的类别
     * @param page 页的类
     * @return list
     */
    public List<Business> getAllBisinesses(Page page){
        return businessDAO.getAllBusinesses(page.getStart(), page.getPageSize());
    }

    /**
     * 获得所有商家的分页
     * @return page
     */
    public Page getAllBusinessPage(int page){
        Page page1 = new Page(page);
        //每页显示5条记录
        page1.setPageSize(10);
        //设置总共有多少条记录
        page1.setTotal(businessDAO.getAllBusinessCount());
        return page1;
    }
}
