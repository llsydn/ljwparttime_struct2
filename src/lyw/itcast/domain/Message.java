package lyw.itcast.domain;

import org.apache.struts2.json.annotations.JSON;

import java.io.Serializable;
import java.sql.Date;

/**
 * 兼职信息类
 */
public class Message implements Serializable {
    //属于哪个商家发的
    private int business_id;
    //属于哪个兼职分类
    private int commodity_id;
    //发布时间
    private Date date_time;
    //具体内容
    private String content;
    //标题
    private String title;
    //id
    private int id;

    //关联的商家实例，数据库中不存在此字段
    private Business business;
    //关联的种类实例，数据库中不存在此字段
    private Commodity commodity;

    @Override
    public String toString() {
        String response = "";
        response += "/n 商家id:" + business_id;
        response += "/n 分类id:" + commodity_id;
        response += "/n 内容:" + content;
        response += "/n 标题:" + title;
        response += "/n id:" + id;
        return response;
    }

    public int getBusiness_id() {
        return business_id;
    }

    public void setBusiness_id(int business_id) {
        this.business_id = business_id;
    }

    public int getCommodity_id() {
        return commodity_id;
    }

    public void setCommodity_id(int commodity_id) {
        this.commodity_id = commodity_id;
    }

    @JSON(format="yyyy-MM-dd HH:mm:ss")
    public Date getDate_time() {
        return date_time;
    }

    public void setDate_time(Date date_time) {
        this.date_time = date_time;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Business getBusiness() {
        return business;
    }

    public void setBusiness(Business business) {
        this.business = business;
    }

    public Commodity getCommodity() {
        return commodity;
    }

    public void setCommodity(Commodity commodity) {
        this.commodity = commodity;
    }
}
