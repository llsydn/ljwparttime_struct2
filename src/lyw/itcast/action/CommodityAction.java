package lyw.itcast.action;

import com.opensymphony.xwork2.ActionSupport;
import lyw.itcast.domain.Commodity;
import lyw.itcast.serivce.CommodityService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * struct2的action类，相当与servlet
 */
public class CommodityAction extends ActionSupport {
    //分类的List集合，将会在jsp显示
    private List<Commodity> CommodityClasses;

    //传过来的分类
    private Commodity commodity;

    //返回的json
    private Map<String, Object> datamap;

    //操作类型
    private String type;

    //调用action默认会执行的方法
    @Override
    public String execute() throws Exception {
        CommodityClasses = new CommodityService().findall();
        for (Commodity com : CommodityClasses) {
            System.out.println(com.getCommodity_name());
        }
        return SUCCESS;
    }


    public String update() {
        CommodityService commodityService = new CommodityService();

        datamap = new HashMap<String, Object>();

        if (type.equals("update")) {
            if (commodityService.updateCommodity(commodity)) {
                datamap.put("msg", "修改兼职分类成功！");
                datamap.put("success", true);
            } else {
                datamap.put("msg", "修改兼职分类失败！");
                datamap.put("success", false);
            }
        } else if (type.equals("delete")) {
            if (commodityService.delete(commodity.getCommodity_id())) {
                datamap.put("msg", "删除兼职分类成功！");
                datamap.put("success", true);
            } else {
                datamap.put("msg", "删除兼职分类失败！");
                datamap.put("success", false);
            }
        } else if (type.equals("add")) {
            if (commodityService.add(commodity.getCommodity_name())) {
                datamap.put("msg", "添加兼职分类成功！");
                datamap.put("success", true);
            } else {
                datamap.put("msg", "添加兼职分类失败！");
                datamap.put("success", false);
            }
        } else {
            datamap.put("msg", "操作类型不明");
            datamap.put("success", false);
        }

        return SUCCESS;
    }


    public List<Commodity> getCommodityClasses() {
        return CommodityClasses;
    }

    public void setCommodityClasses(List<Commodity> commodityClasses) {
        CommodityClasses = commodityClasses;
    }

    public Commodity getCommodity() {
        return commodity;
    }

    public void setCommodity(Commodity commodity) {
        this.commodity = commodity;
    }

    public Map<String, Object> getDatamap() {
        return datamap;
    }

    public void setDatamap(Map<String, Object> datamap) {
        this.datamap = datamap;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
