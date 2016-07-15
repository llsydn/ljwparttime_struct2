package lyw.itcast.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import lyw.itcast.domain.Business;
import lyw.itcast.serivce.BusinessService;

/**
 *
 */
public class BusinessAction extends ActionSupport {
    //登录用的变量
    private String account;//帐号
    private String pwd;//密码
    private String type;//操作类型

    private boolean success;//是否成功
    private String msg;//返回信息

    //注册用的变量
    private String company;//商家名字
    private String contact;//联系人
    private String address;//地址
    private String email;//邮箱地址
    private String phone;//电话

    //更新密码时的新密码
    private String newpwd;

    //验证码
    private String valicode;

    //更新的简介
    private String descript;

    //保持登录
    private boolean keeplogin;

    //传过来的商家id
    private int bid;

    /**
     * 处理登录登出的action方法
     *
     * @return
     */
    public String login() {
        success = false;
        BusinessService businessService = new BusinessService();
        if (type.equals("login")) {
            //登录操作
            Business business = businessService.login(account, pwd);
            if (business != null) {
                businessService.saveSession(business);//保存在session中

                //增加cookies
                if (keeplogin) {
                    businessService.addLoginCookies(business);
                }

                success = true;
                msg = "登录成功！";

            } else {
                msg = "登录失败";
            }
        } else if (type.equals("logout")) {
            //登出操作
            businessService.logout();
            return "logout";
        } else {
            msg = "操作类型有误!";
        }
        return "success";
    }

    /**
     * 处理注册的action
     *
     * @return
     */
    public String reg() {
        BusinessService businessService = new BusinessService();
        if (type.equals("check")) {
            //检查帐号是否存在
            if (businessService.isBusinessCreated(account)) {
                success = false;
                msg = "账户已存在";
            } else {
                success = true;
                msg = "帐号可以注册";
            }
        } else if (type.equals("reg")) {
            //执行注册操作
            //调用注册服务
            Business business = businessService.addBusiness(pwd, company, phone, email, address);
            if (business != null) {
                success = true;
                msg = "注册成功！";
                businessService.saveSession(business);//保存在session中
            } else {
                success = false;
                msg = "注册失败";
            }
        } else if (type.equals("valicode")) {
            //验证码检验是否正确
            String truecode = (String) ActionContext.getContext().getSession().get("checkcode");
            if (valicode.equals(truecode)) {
                success = true;
                //msg = "验证码正确！";
            } else {
                success = false;
                //msg = "验证码不正确!";
            }
        }
        return SUCCESS;
    }

    /**
     * 处理更新操作的action
     *
     * @return
     */
    public String update() {
        //新建服务
        BusinessService businessService = new BusinessService();
        //获得旧的商家
        Business oldBusiness = businessService.getSessionBusiness();//session中保存的商家
        Business newBusiness = null;
        if (type.equals("pwd")) {
            //更新密码
            newBusiness = businessService.updatePwd(oldBusiness.getId(), pwd, newpwd);
            if (newBusiness != null) {
                businessService.saveSession(newBusiness);//将更新后的商家保存在session中
                success = true;
                msg = "更新密码成功";
            } else {
                success = false;
                msg = "更新密码失败";
            }

        } else if (type.equals("info")) {
            //更新信息
            newBusiness = businessService.updateInfo(company, phone, email, address, oldBusiness.getId());
            if (newBusiness != null) {
                businessService.saveSession(newBusiness);//将更新后的商家保存在session中
                success = true;
                msg = "更新信息成功";
            } else {
                success = false;
                msg = "更新信息失败";
            }
        } else if (type.equals("descript")) {
            if (businessService.updateDescription(descript, oldBusiness.getId())) {
                //更新
                success = true;
                msg = "更新简介成功";
            } else {
                success = false;
                msg = "更新简介失败";
            }
        } else if (type.equals("level")) {
            if (businessService.updateBusinessLevel(bid)) {
                //更新
                success = true;
                msg = "商家审核成功";
            } else {
                success = false;
                msg = "商家审核失败";
            }
        } else if (type.equals("level0")) {
            if (businessService.updateBusinessLevel0(bid)) {
                success = true;
                msg = "设置商家未通过审核成功!";
            } else {
                success = false;
                msg = "设置商家未通过审核失败!";
            }
        }
        return SUCCESS;
    }

    public String getValicode() {
        return valicode;
    }

    public void setValicode(String valicode) {
        this.valicode = valicode;
    }

    public String getNewpwd() {
        return newpwd;
    }

    public void setNewpwd(String newpwd) {
        this.newpwd = newpwd;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public String getDescript() {
        return descript;
    }

    public void setDescript(String descript) {
        this.descript = descript;
    }

    public boolean isKeeplogin() {
        return keeplogin;
    }

    public void setKeeplogin(boolean keeplogin) {
        this.keeplogin = keeplogin;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getBid() {
        return bid;
    }

    public void setBid(int bid) {
        this.bid = bid;
    }
}
