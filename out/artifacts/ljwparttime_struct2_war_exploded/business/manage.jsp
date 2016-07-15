<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="head.jsp"/>

<%--主要style--%>
<style>
    .mainDiv {
        margin: auto;
        width: 1100px;
    }

    .mainDiv .row {
        margin-top: 15px;
        position: relative;
    }

    .row span {
        width: 90px;
        display: inline-block;
    }

    .row textarea {
        width: 728px;
        height: 122px;
        padding: 5px 10px;
        line-height: normal;
        overflow: auto;
        border: 1px solid #ddd;
        position: relative;
        zoom: 1;
        vertical-align: middle;
        display: inline-block;
        border-radius: 4px;
        box-shadow: none;
        transition: border 0.2s;
        font-size: 12px;
        background-color: #fff;
        outline: none;
    }

    /*提交按钮*/
    .row .submit {
        color: rgb(255, 255, 255);
        font-size: 14px;
        padding: 10px 25px;
        border: 2px solid rgb(197, 229, 145);
        border-radius: 0;
        background-color: rgb(120, 195, 0);
    }

    .row .submit:hover {
        color: #ffffff;
        background-color: #78c300;
        border-color: #c5e591;
    }

    /*水平分割线*/
    .line {
        border: 1px dashed #F00;
        width: auto;
        height: 1px
    }

    /*分类下拉框*/
    .row .clist {
        position: absolute;
        background: #fffa90;
        border: 1px solid #FBD8A1;
        left: 95px;
        z-index: 978;
        width: 150px;
    }

    /*每一项分类*/
    .clist li {
        font-family: \u5E7C\u5706, sans-serif;
        list-style: square outside;
        color: rgb(40, 92, 42);
        text-decoration: underline;
        padding: 5px 0 0 0;
    }
</style>
<%--分页style--%>
<style>
    .page .current {
        background: #7cca1c;
        color: #fff;
        border: 1px solid #63a612;
    }

    .page a {
        font-family: 'verdana', serif;
        color: #191919;
        display: inline-block;
        height: 30px;
        padding: 0 10px;
        border: 1px solid #e0e0e0;
        background: #f6f6f6;
        margin-right: 4px;
    }
</style>

<%--按钮css--%>
<style>
    .button {
        border: 1px solid #99a2aa;
        border-radius: 4px;
        cursor: pointer;
        display: inline-block;
        line-height: 24px;
        padding: 0 10px;
        margin-left: 5px;
    }

    .button:hover {
        border-color: #00a1d6;
        color: #00a1d6;
    }
</style>

<%--列表css--%>
<style>
    /*list的css*/
    .b-icon {
        display: inline-block;
        vertical-align: middle;
        width: 12px;
        height: 12px;
        background: url(http://static.hdslb.com/images/base/icons.png) no-repeat;
    }

    .b-icon.b-icon-v-play {
        background-position: -282px -90px;
    }

    .b-icon.b-icon-v-dm {
        background-position: -282px -218px;
    }

    .b-icon.b-icon-v-fav {
        background-position: -282px -346px;
    }

    .b-icon.b-icon-v-coin {
        background-position: -282px -410px;
    }

    .b-icon.b-icon-delete {
        width: 12px;
        height: 16px;
        vertical-align: top;
        margin-top: 6px;
        background: url(http://static.hdslb.com/images/base/icons.png) -281px -1047px no-repeat;
    }

    .b-icon.b-icon-history {
        width: 28px;
        height: 28px;
        display: inline-block;
        margin-right: 8px;
        background: url(http://static.hdslb.com/images/base/icons.png) -83px -850px no-repeat;
    }

    .preview img {
        display: block;
    }

    .container-body {
        padding: 20px 0 0;
        width: 980px;
        margin: 0 auto;
    }

    .container-body::after, .b-head::after {
        content: "";
        display: block;
        visibility: hidden;
        height: 0;
        clear: both;
        font-size: 0;
    }

    .b-head {
        position: relative;
    }

    .b-head .b-head-t {
        vertical-align: middle;
        display: inline-block;
        font-size: 18px;
        line-height: 24px;
        color: #222;
    }

    /*stylesheet 3/4 | http://static.hdslb.com/css/core-v5/page-history.css*/
    .message-list {
        display: block;
        overflow: hidden;
        position: relative;
        padding: 8px 0 10px;
    }

    .message-list div {
        overflow: hidden;
    }

    .message-list .history-record {
        position: relative;
        display: block;
        margin-top: 20px;
    }

    .message-list .history-record:last-child .l-info {
        border-right: 1px solid transparent;
    }

    .message-list .l-info {
        width: 150px;
        position: absolute;
        top: 10px;
        left: 0;
        border-right: 1px solid #e5e9ef;
        overflow: visible;
    }

    .message-list .l-info .lastplay-time {
        overflow: visible;
        height: 120px;
        font-size: 14px;
    }

    .message-list .l-info .lastplay-time .history-red-round {
        position: absolute;
        right: -5px;
        top: -1px;
        width: 8px;
        height: 8px;
        display: block;
        border-radius: 16px;
        background: #f25d8e;
    }

    .message-list .l-info .lastplay-time .commodity {
        color: #333;
        margin-top: -6px;
        display: block;
        float: left;
    }

    .message-list .l-info .lastplay-time .lastplay-t {
        color: #99a2aa;
        margin-right: -15px;
        padding-right: 30px;
        float: right;
        display: block;
        margin-top: -6px;
        background: transparent;
    }

    .message-list .r-info {
        border: 1px solid transparent;
        margin-left: 175px;
        padding: 10px 0;
        margin-right: 5px;
        position: relative;
        background: #fff;
    }

    .message-list .r-info:hover {
        border: 1px solid #ddd;
        border-radius: 4px;
        box-shadow: #eee 0 1px 2px 1px;
    }

    .message-list .r-info:hover .preview .lasting-time, .message-list .r-info:hover .history-delete {
        display: inline;
    }

    .message-list .r-info .typename:hover, .message-list .r-info .content:hover {
        color: #00a1d6;
    }

    .message-list .r-info .preview {
        overflow: hidden;
        display: block;
        text-align: center;
        float: left;
        margin: 0 12px 0 10px;
        width: 112px;
        height: 70px;
        position: relative;
        border-radius: 5px;
    }

    .message-list .r-info .preview img {
        margin: 0 auto;
        display: block;
        height: 70px;
        max-width: 112px;
    }

    .message-list .r-info .preview .lasting-time {
        position: absolute;
        bottom: 0;
        right: 0;
        padding: 1px 5px;
        color: #fff;
        display: none;
        background: rgba(0, 0, 0, 0.498039);
    }

    .message-list .r-info .typename {
        margin-top: 10px;
        float: left;
        margin-right: 10px;
        color: #99a2aa;
        font-size: 13px;
    }

    .message-list .r-info .content {
        margin-top: 10px;
        height: 60px;
        line-height: 18px;
        display: block;
        overflow-y: auto;
        font-size: 13px;
        margin-right: 100px;
        margin-bottom: 5px;
        color: #222;
        font-weight: bold;
        clear: both;
    }

    .r-info .title {
        float: left;
        font-family: \u5E7C\u5706, sans-serif;
        line-height: 19px;
        margin: 0;
        padding: 0;
        border: 1px solid;
        color: rgb(182, 217, 76);
    }

    .message-list .r-info .w-info {
        font-family: 'microsoft yahei', simhei, sans-serif;
        float: left;
        margin-top: 3px;
    }

    .message-list .r-info .w-info i {
        margin: 0 5px 0 0;
        color: #999;
        display: block;
        width: auto;
        height: 12px;
        line-height: 12px;
        float: left;
        white-space: nowrap;
        padding-left: 18px;
    }

    .message-list .r-info .history-delete {
        color: #f25d8e;
        float: right;
        padding-left: 16px;
        margin-left: 15px;
        right: 5px;
        top: 30px;
        display: none;
        cursor: pointer;
        width: auto;
    }

    .message-list .r-info .history-delete:hover {
        color: #ff85ad;
    }

    /* 高亮刚刚添加和修改过的元素 */
    .highlight {
        border: double red;
    }

    /*最新发布显示li*/
    li.lastest {
        font-family: "Microsoft YaHei", Verdana, Arial, sans-serif;
        font-size: 15px;
        line-height: 11px;
    }
</style>


<%--主要div--%>
<div class="mainDiv">
    <%--part1--%>
    <div class="row">
        <span>标题:</span>
        <input id="input_tilte" type="text">
    </div>
    <div class="row">
        <span>详细说明:</span>
        <textarea id="textarea"></textarea>
    </div>
    <div class="row">
        <span>分类:</span>
        <input id="input_commodty" type="text" theid="0" value="请选择分类">
        <div id="listcontainer" class="clist" style="display: none">
            <ul id="commodityList">
                <s:iterator value="#clist" var="commodity">
                    <li theid="<s:property value="#commodity.commodity_id"/>">
                        <s:property value="#commodity.commodity_name"/>
                    </li>
                </s:iterator>
            </ul>
        </div>
    </div>
    <div class="row">
        <span>时间:</span>
        <input type="text" id="datepicker">
    </div>
    <div class="row">
        <input id="btn_submit" type="button" class="submit" value="提交">
        <input id="btn_save" type="button" class="submit" style="display: none;" value="保存修改">
    </div>
    <hr class="line"/>

    <%--part2--%>
    <%--分页条--%>
    <div id="pagination" class="page" style="display: none;"></div>

    <%--主要list--%>
    <div class="container-body">
        <div class="newlist_info">
            <div class="b-head"><i class="b-icon b-icon-history"></i><span class="b-head-t" id="his_tip">我发布的兼职信息</span>
                <span class="button host" id="sync" style="display: none">同步历史记录</span></div>
        </div>
        <div class="new_list history">
            <ul class="message-list" id="message_list">
                <li class="history-record">
                    <div class="l-info">
                        <div class="lastplay-time">
                            <i class="history-red-round"></i>
                            <span class="commodity">今天</span>
                            <span class="lastplay-t">18:14</span>
                        </div>
                    </div>
                    <div class="r-info">
                        <a class="typename" href="/newlist.html?typeid=27">(综合)</a>
                        <a href="//www.bilibili.com/video/av4699708" target="_blank" class="content">【YB素材】决裂的IF酱</a>
                        <i class="history-delete b-icon b-icon-delete">删除</i>
                    </div>
                </li>
            </ul>
        </div>
    </div>

</div>


<%--时间选择器的--%>
<%--http://trentrichardson.com/examples/timepicker/--%>
<link href="${pageContext.request.contextPath}/business/css/jquery-ui-timepicker-addon.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/business/js/jquery-ui-timepicker-addon.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
    });
</script>


<script src="${pageContext.request.contextPath}/js/jquery-page5.js"></script>
<script type="text/javascript">
    /**
     * 时间类型的格式化函数
     */
    Date.prototype.format = function (fmt) { //author: meizz
        var o = {
            "M+": this.getMonth() + 1,                 //月份
            "d+": this.getDate(),                    //日
            "h+": this.getHours(),                   //小时
            "m+": this.getMinutes(),                 //分
            "s+": this.getSeconds(),                 //秒
            "q+": Math.floor((this.getMonth() + 3) / 3), //季度
            "S": this.getMilliseconds()             //毫秒
        };
        if (/(y+)/.test(fmt))
            fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(fmt))
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        return fmt;
    };

    /**
     * 移动到指定元素
     * */
    function mScroll($ele) {
        var $html = $("html,body").stop(true);
        $html.animate({scrollTop: $ele.offset().top}, 1000);
    }

    /* 主机路径 */
    var g_contextPath = '${pageContext.request.contextPath}';

    $(document).ready(function () {

        //导航条相关
        //设置当前激活的导航按钮
        $('#nav_manage').addClass('active');
        //一开始就触发一次离开函数，以便归位
        $('div.n-left').mouseleave();

        <%--发布兼职信息的代码--%>

        //时间选择器
        var $datepicker = $('#datepicker');
        $datepicker.datetimepicker();

        //标题input
        var $input_tilte = $('#input_tilte');

        //详细情况输入框
        var $textarea = $('#textarea');

        //分类下拉选择
        var $listcontainer = $('#listcontainer');
        var $input_commodty = $('#input_commodty');
        //初始化选择的分类id为0，就是没有选择
        $input_commodty.attr("theid", 0);
        $input_commodty.click(function () {
            $listcontainer.slideToggle();
        });
        //每一个li被点击后
        $listcontainer.find('li').each(function () {
            var $thisli = $(this);
            $thisli.click(function () {
                //把选择的分类的id附加到input上
                $input_commodty.attr("theid", $thisli.attr("theid"));
                //更新input内的文字
                $input_commodty.val($thisli.text().trim());
                //隐藏下拉list
                $listcontainer.slideUp();
            });
        });

        function checkError() {
            if ($input_commodty.attr("theid") == "0") {
                //没有选择分类，返回
                openDialog($input_commodty, "请先选择一个分类");
                return false;
            }
            if ($input_tilte.val().length < 6) {
                openDialog($input_tilte, "标题少于6个字啦！");
                return false;
            }
            if ($textarea.val().length < 20) {
                openDialog($textarea, "请再详细描述一下情况啦");
                return false;
            }
            if ($datepicker.datetimepicker("getDate") == null) {
                openDialog($textarea, "请选择兼职时间啦");
                return false;
            }
            return true;
        }

        //提交按钮
        var $btnSubmit = $('#btn_submit');
        $btnSubmit.click(function () {
            var currentDate = $datepicker.datetimepicker("getDate");
            var time = Date.parse(currentDate);//将js Date类型转化为时间字符串

            if (checkError()) {
                //提交申请
                $.ajax({
                    url: "addMessage",
                    type: "POST",
                    datatype: "json",
                    data: {
                        title: $input_tilte.val(),
                        content: $textarea.val(),
                        time: time,
                        comid: $input_commodty.attr("theid"),
                        type: "add"
                    },
                    success: function (data, textStatus) {
                        openDialog($btnSubmit, data.msg);
                        if (data.success) {
                            //成功,刷新兼职信息列表
                            g_curPage = 1;
                            listMoudle.getPage(g_curPage);
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert(XMLHttpRequest + textStatus + errorThrown);
                    }
                });
            }
        });

        //保存修改按钮
        var $saveBtn = $('#btn_save');
        $saveBtn.click(function () {
            var currentDate = $datepicker.datetimepicker("getDate");
            var time = Date.parse(currentDate);//将js Date类型转化为时间字符串

            if (checkError()) {
                //提交申请
                $.ajax({
                    url: "addMessage",
                    type: "POST",
                    datatype: "json",
                    data: {
                        title: $input_tilte.val(),
                        content: $textarea.val(),
                        time: time,
                        comid: $input_commodty.attr("theid"),
                        mid: $saveBtn.attr("mid"),
                        type: "save"
                    },
                    success: function (data, textStatus) {
                        openDialog($saveBtn, data.msg);
                        if (data.success) {
                            //成功,刷新兼职信息列表
                            g_curPage = 1;
                            listMoudle.getPage(g_curPage);
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert(XMLHttpRequest + textStatus + errorThrown);
                    }
                });
            }
        });


        <%--显示兼职信息并且分页--%>
        //分页条
        var $pagination = $('#pagination');
        //商家id
        var bid =${seller.id};

        //兼职信息列表相关
        var $ul = $('#message_list');

        //当前页面
        var g_curPage = 1;

        //兼职信息列表模块
        var listMoudle = {
            /*
             *分页的对象
             *  */
            mypage: {
                current: 1,
                pageSize: 1,
                total: 1,
                pagaTotal: 1
            },
            /* 分页被点击 */
            onPageClick: function (page) {
                g_curPage = page;
                listMoudle.getPage(page);
            },
            /*
             *解析json数据
             *  */
            parse: function (json) {
                //分页的对象
                var thePage = listMoudle.mypage = json.mypage;

                //设置分页条的一些属性
                $pagination.paging("settings", {
                    //总共数量
                    page_total: thePage.pagaTotal,
                    // 当前页面
                    page_current: g_curPage
                });

                if (thePage.pagaTotal > 1) {
                    //如果总页数大于2,显示分页条
                    $pagination.slideDown();
                }

                //list列表的数据
                var data = json.data;

                //先清空ul
                $ul.empty();

                //最大的兼职信息id，一般越后发布越大
                var maxmid = 0;

                //遍历list
                $.each(data, function (n, each) {

                    //分类的实体
                    var commodity = each.commodity;
                    //兼职信息id
                    var mid = each.id;
                    if (mid > maxmid) {
                        maxmid = mid;
                    }
                    //点击打开的url
                    var url = "MessageDetailAction?message_id=" + mid;


                    //外部的li,同时绑定兼职信息id
                    var li = $("<li class='history-record'></li>").appendTo($ul).attr("mid", mid);
                    //左右两边的div
                    var div_l = $('<div class="l-info"></div>').appendTo(li);
                    var div_r = $('<div class="r-info"></div>').appendTo(li);

                    //显示时间
                    var lastplay_time = $(
                            ['<div class="lastplay-time">',
                                '<i class="history-red-round"></i>',
                                '<span class="lastplay-t">' + each.date_time + '</span>',
                                '</div>'].join("")
                    ).appendTo(div_l);
                    //(new Date(each.date_time)).format("yyyy-MM-dd,hh:mm")

                    //分类部分
                    var a_typename = $('<a class="typename" href="#">(' + commodity.commodity_name + ')</a>').appendTo(div_r);

                    //标题部分
                    var a_title = $('<div class="title" href="title">(' + each.title + ')</div>').appendTo(div_r);

                    //正文部分
                    var a_name = $('<a href="' + url + '" target="_blank" class="content"></a>').text("[" + each.content + "]").appendTo(div_r);

                    //删除按钮
                    var deleteBtn = $('<i class="history-delete b-icon b-icon-delete">删除</i>').appendTo(div_r).attr("mid", mid);
                    deleteBtn.click(function () {
                        openDialog(deleteBtn, "您确定要删除该兼职信息吗?", function () {
                            //点击确定按钮会触发
                            //兼职信息id
                            var mid = deleteBtn.attr("mid");
                            delMessage(mid, deleteBtn);
                        });
                    });

                    //修改按钮
                    var $modifyBtn = $('<i class="history-delete b-icon b-icon-delete">去修改,兼职信息id为' + mid + '</i>').appendTo(div_r);
                    $modifyBtn.click(function () {
                        //设置标题
                        $input_tilte.val(each.title);
                        //设置内容
                        $textarea.val(each.content);
                        //设置分类
                        $input_commodty.attr("theid", commodity.commodity_id);
                        $input_commodty.val(commodity.commodity_name);
                        //设置时间
                        $datepicker.datetimepicker("setDate", new Date(each.date_time));

                        //移动到最上面
                        mScroll($input_tilte);
                        //设置保存按钮并显示
                        $saveBtn.attr("mid", mid);
                        $saveBtn.val("保存修改，兼职信息id为" + mid);
                        $saveBtn.slideDown();

                    });

                    //跳转按钮
                    var $jumpBtn = $('<a class="history-delete b-icon b-icon-delete" target="_blank">查看申请人员</a>').appendTo(div_r);
                    $jumpBtn.attr("href", "businesshome?type=person&mid=" + mid);

                    //获取当前保存按钮的兼职信息id
                    var curMid = $saveBtn.attr("mid");
                    if (curMid && curMid == mid) {//如果与li的mid相同
                        li.addClass('highlight');//高亮这个li
                        li.before($("<li class='lastest'>最新修改:</li>"));
                    }
                });

                //找出最大的兼职信息id并且高亮
                $ul.find('li').each(function () {
                    var $this = $(this);
                    if ($this.attr("mid") == maxmid) {
                        $this.addClass("highlight");
                        $this.before($("<li class='lastest'>最新发布:</li>"));
                    }
                });
            },
            /* 获得某一页的评论 */
            getPage: function (page) {
                $.ajax({
                    url: "businessMessage",
                    type: "POST",
                    datatype: "json",
                    data: {
                        //商家id
                        bid: bid,
                        //哪一页
                        page: page
                    },
                    success: function (json, textStatus) {
                        listMoudle.parse(json);
                        //var data = $.parseJSON(rdata);
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert(XMLHttpRequest + textStatus + errorThrown);
                    }
                });
            },
            /* 初始化函数 */
            init: function () {
                //分页条的设置
                var setting = {
                    page_total: 1,// 总页数
                    page_current: g_curPage,// 当前页面
                    page_step: 1,// 步长
                    buttonClickCallback: function (page, ele) {
                        //ele是使用分页插件的jq元素
                        listMoudle.onPageClick(page);
                    }
                };
                //创建分页条,并且先隐藏起来
                $pagination.paging(setting).hide();
            }
        };

        function delMessage(mid, $ele) {
            $.ajax({
                url: "addMessage",
                type: "POST",
                datatype: "json",
                data: {
                    type: "del",
                    mid: mid
                },
                success: function (data, textStatus) {
                    openDialog($ele, data.msg);
                    if (data.success) {
                        //删除成功后刷新分页
                        listMoudle.getPage(g_curPage);
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(XMLHttpRequest + textStatus + errorThrown);
                }
            });
        }

        //初始化模块
        listMoudle.init();
        //页面载入完成调用第一页
        listMoudle.getPage(g_curPage);
    });
</script>
</body>
</html>
