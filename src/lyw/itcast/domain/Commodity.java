package lyw.itcast.domain;

/**
 * 兼职种类的类
 * 
 */
public class Commodity {
	private int commodity_id;// 种类ID
	private String commodity_name;// 种类名称
	public int getCommodity_id() {
		return commodity_id;
	}
	public void setCommodity_id(int commodity_id) {
		this.commodity_id = commodity_id;
	}
	public String getCommodity_name() {
		return commodity_name;
	}
	public void setCommodity_name(String commodity_name) {
		this.commodity_name = commodity_name;
	}
}
