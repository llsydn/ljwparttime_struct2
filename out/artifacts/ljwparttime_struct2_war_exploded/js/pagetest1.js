/**
 * 调动显示兼职信息的最大js
 */
//闭包操作
(function () {
    // 当前是第几页
    var page = 1;
    // 当前的兼职分类id
    var g_commodity_id = 1;
    // 缓存多少页
    var cache_size = 5;
    // 每一页显示的记录数
    var page_size = 9;
    // 一次保存的记录数
    var totalrecord = cache_size * page_size;
    // 所有的数据
    var data;
    // index 缓存页数中的序号从,0到cache_size-1，输出data时会用到
    var index = 0;
    // 一个标志，是否分页条已经创建了
    var flag_PagerInited = false;
    // 显示数据的div的JQ对象
    var page_content;
    // 分页条的JQ对象
    var pager;
    // 接受json的对象
    var Message = {
        business_id: "",// 属于哪个商家发的
        commodity_id: "",// 属于哪个兼职分类
        date_time: "",// 发布时间
        content: "",// 具体内容
        title: "",// 标题
        id: "" // id
    };

    // 页面加载完成调用的函数，初始化吧
    $(document).ready(function () {
        // 获得显示容器的JQ对象
        page_content = $('#page_content');
        pager = $('#pager');

        //对每一个分类按钮执行动作
        $('input.button_commodity').each(function () {
            //被点击的时候
            $(this).click(function () {
                var cid=$(this).attr("the_id");
                if (g_commodity_id!=cid) {//分类id不相同才请求新的分类
                    g_commodity_id =cid;
                    commodity_change(g_commodity_id);
                    //alert($(this).attr("the_id"));
                }

            });
        });

        //刚进入页面的时候，调用分类id为1的页面,1是分类id
        commodity_change(g_commodity_id);
    });

    /**
     * 变更兼职种类
     */
    function commodity_change(comodity_id) {
        // 当前页面重置为1
        page = 1;
        // ajax获得该种类总共的数量,获得完成后才做其它的工作
        $.ajax({
            url: "MessageCountAction",
            type: "GET",
            datatype: "json",
            timeout: 3000,
            data: {
                comodity_id: comodity_id
            },
            success: function (rdata, textStatus) {
                // alert("总共有数量：" + rdata);
                // 初始化导航条
                initPagination(rdata, comodity_id);
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert(XMLHttpRequest + textStatus + errorThrown);
                // 通常情况下textStatus和errorThrown只有其中一个包含信息
            }
        });
    }

    /**
     * 初始化导航条
     *
     * @param total
     *            从数据库得来的有多少条记录
     * @param comodity_id
     *            兼职分类id
     */
    function initPagination(total, comodity_id) {
        // 算出一共需要多少页
        var pagetotal = Math.ceil(total / page_size);

        if (pagetotal>1) {//如果总页数大于1才显示分页条
            pager.show();
            if (flag_PagerInited) {
                // 分页条已经创建了，就直接设置
                pager.paging("settings", {
                    page_total: pagetotal,// 总页数
                    page_current: page
                });
            } else {
                // 创建分页条
                pager.paging({
                    page_total: pagetotal,// 总页数
                    page_current: page,// 开始页面
                    page_step: 3,// 步长
                    buttonClickCallback: bcc
                    // 点击换页触发的函数
                });
                flag_PagerInited = true;
            }
        }else
        {
            //总页数小于1不显示分页条
            pager.hide();
        }


        // 开始获得数据，根据种类id
        getNewData((page - 1) * totalrecord, totalrecord);
    }

    /**
     * 根据页数获得该页所在的范围，进而判断是否需要缓存
     *
     * @param page
     */
    function getPageScope(page) {
        /**
         * 小数向上取整比如0/9=0，1/9=1，……9/9=1，……，11/9=2……，18/9=2
         */
        return Math.ceil((page) / cache_size);
    }

    /**
     * 向前端输出数据
     *
     * @param index
     *            从缓存中的第几页开始,0~cache_size-1
     */
    function showdata() {
        //清空ul
        page_content.empty();
        //特效时间，每一个li都不一样
        var effectTime = 500;
        // 共有page_size*cache_size条记录
        // start从哪一条记录开始
        var start = index * page_size;
        for (var i = 0; i < page_size; i++) {
            Message = data[start + i];
            if (Message) {// 该记录存在才打印
                var html = '<li style="display: none"><a target="_blank" href="MessageDetailAction?message_id=' + Message.id + '">';//添加链接到详细信息页面
                html += "(" + Message.commodity.commodity_name + ")[" + Message.title + "]<br>";
                html += "兼职时间:" + Message.date_time + "<br>";
                html += "简介:" + Message.content + "<br>";
                html += "</a></li>";
                var $li = $(html).appendTo(page_content);
                //出现的特效
                $li.slideDown(effectTime);
                effectTime += 150;
            }
        }

    }

    /**
     * ajax请求新的data，完成后展示
     *
     * @param comodity_id
     *            种类的id
     * @param start
     *            在哪一条记录开始
     * @param size
     *            返回多少条数据
     */
    function getNewData(start, size) {
        $.ajax({
            url: 'MessageListAction',
            type: 'GET',
            dataType: 'json',
            data: {
                comodity_id: g_commodity_id,
                start: start,
                size: size
            },
            success: function (rdata, textStatus) {
                data = rdata;
                showdata();
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alertObj(XMLHttpRequest);
                alertObj(textStatus);
                alertObj(errorThrown);
                // 通常情况下textStatus和errorThrown只有其中一个包含信息
            }
        });
    }

    /**
     * 换页被点击的响应函数
     *
     * @param num
     *            传递的是点击了第几页，从1开始计数
     */
    var bcc = function buttonClickCallback(num) {
        var scope_new = getPageScope(num);
        var scope_cur = getPageScope(page);
        // 设置在缓存中的序号
        index = (num - 1) % cache_size;

        if (scope_cur == scope_new) {
            // 此时不需要ajax去请求新的json
            // data不为空
            if (data) {
                showdata();
            }
        } else {
            // 请求ajax获取新的data
            getNewData((scope_new - 1) * totalrecord, totalrecord);
        }
        page = num;
        //alert("被点击，scope_new:" + scope_new);
    };
})();