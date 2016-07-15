package lyw.itcast.serivce;

import lyw.itcast.dao.CommodityDAO;
import lyw.itcast.domain.Commodity;

import java.util.List;

public class CommodityService {
    CommodityDAO commodityDAO;

    public CommodityService() {
        super();
        this.commodityDAO = new CommodityDAO();
    }

    public List<Commodity> findall() {
        return commodityDAO.findall();
    }

    /**
     * 更新一个兼职分类
     *
     * @param commodity 兼职分类
     * @return true表示成功
     */
    public boolean updateCommodity(Commodity commodity) {
        return commodityDAO.updateCommodity(commodity.getCommodity_id(), commodity.getCommodity_name()) > 0;
    }

    /**
     * 删除一个兼职分类
     *
     * @param id 兼职分类id
     * @return true 表示成功
     */
    public boolean delete(int id) {
        return commodityDAO.delete(id) > 0;
    }

    /**
     * 添加一个兼职分类
     * @param name 分类名字
     * @return true 表示成功
     */
    public boolean add(String name) {
        return commodityDAO.add(name)>0;
    }
}
