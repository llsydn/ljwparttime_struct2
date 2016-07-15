package lyw.itcast.domain;

/**
 * 分页的辅助类
 */
public class Page {
    //当前页面
    private int current;
    //每一页显示多少条
    private int pageSize = 10;
    //private int start;//数据库中开始查询的语句
    //总记录数
    private int total;
    //总共多少页
    private int pagaTotal;

    public Page() {
        this.current = 0;
    }

    /**
     * 构造函数
     *
     * @param current 初始化当前是第几页数
     */
    public Page(int current) {
        this.current = current;
    }

    /**
     * 获得总页数
     *
     * @return
     */
    public int getPagaTotal() {
        return pagaTotal;
    }

    /**
     * 设置总页数
     *
     * @param pagaTotal
     */
    public void setPagaTotal(int pagaTotal) {
        this.pagaTotal = pagaTotal;
    }

    /**
     * 获得总共有多少条记录
     * @return
     */
    public int getTotal() {
        return total;
    }

    /**
     * 设置有多少个数据
     *
     * @param total 数据的数量，以此来计算能有多少页
     */
    public void setTotal(int total) {
        this.total = total;
        pagaTotal = (total / pageSize) + ((total % pageSize) == 0 ? 0 : 1);
//        if (pagaTotal==0){
//            //这种情况是当0条记录时，才返回0页，如果只有1条记录，上面也会产生1
//            pagaTotal=1;
//        }
    }

    public int getCurrent() {
        return current;
    }

    public void setCurrent(int current) {
        this.current = current;
    }

    /**
     * 获得当前页，对应哪一条数据开始
     *
     * @return
     */
    public int getStart() {
        return (current - 1) * pageSize;
    }

    /**
     * 设置每一页有多少条数据
     *
     * @param pageSize
     * @return
     */
    public Page setPageSize(int pageSize) {
        this.pageSize = pageSize;
        return this;
    }

    /**
     * 获得每一页有多少条数据
     *
     * @return
     */
    public int getPageSize() {
        return pageSize;
    }

}
