<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<jsp:include page="head.jsp"/>

<%--主要css--%>
<style>
    .mainDiv {
        margin: auto;
        width: 1100px;
    }
    .mainDiv .left {
        padding: 3px 2px;
        border:solid #d5d850 thin;
        float: left;
        width: 68%;
    }
    .mainDiv .floatdiv, .container-body {
        margin-top: 20px;
        font-family: \u534E\u6587\u9ED1\u4F53, \u9ED1\u4F53, sans-serif;
        font-size: 20px;
        line-height: 17px;
        color: rgb(82, 122, 73);
        text-align: left;
        -webkit-border-radius: 12px;
        -moz-border-radius: 12px;
        border-radius: 12px;
    }

    .container-body {
        margin-top: 50px;
        clear: both;
        border: solid #3bd829 thin;
    }

    .left span {
        font-family: \u5E7C\u5706, sans-serif;
        color: rgb(36, 10, 204);
    }

    .mainDiv .right {
        padding: 3px 2px;
        border: solid #3bd829 thin;
        float: right;
        width: 28%;
    }

    .right span {
        display: block;
    }

    /*水平分割线*/
    .line {
        border: 1px solid #abcdef;
        width: auto;
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
<%--列表css--%>
<style>
    /*商家登录按钮*/
    .businessLogin {
        font-family: \u5E7C\u5706, sans-serif;
        color: rgb(0, 214, 7);
        font-weight: bold;
        font-style: italic;
    }

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
        position: absolute;
        padding-left: 16px;
        right: 5px;
        top: 30px;
        width: 30px;
        display: none;
        cursor: pointer;
    }

    .message-list .r-info .history-delete:hover {
        color: #ff85ad;
    }

</style>


<%--主要div--%>
<div class="mainDiv">
    <div class="left floatdiv" style="height:80px;">
        <span>商家简介</span>
        <hr class="line"/>
        <s:property value="#seller.description"/>
        <s:if test="#seller.description!=null">
        	<s:property value="#seller.description"/>
        </s:if>
        <s:if test="#seller.description==null || #seller.description=='' ">
        	您还没有填写您的简介信息(请完善您的资料)
        </s:if>
    </div>
    <div class="right floatdiv">
        <span>商家:${seller.name}</span>
        <span>邮箱：${seller.email}</span>
        <span>电话: ${seller.phone}</span>
        <span>地址: 广东省中山市${seller.address}</span>
        <span>认证：
            <s:if test="#seller.level>0">通过</s:if>
            <s:else>未审核</s:else>
        </span>
        <%--商家登录--%>
        <s:if test="#session.business==null">
            <a href="businesshome" class="businessLogin" target="_blank">商家去登录-》</a>
        </s:if>
    </div>
    <%--主要list--%>
    <div class="container-body floatdiv">
        <div class="newlist_info">
            <div class="b-head">
                <i class="b-icon b-icon-history"></i>
                <span class="b-head-t" id="his_tip">商家发布过的兼职:</span>
            </div>
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
    <%--分页条--%>
    <div id="pagination" class="page" style="display: none;"></div>
</div>


<script src="${pageContext.request.contextPath}/js/jquery-page5.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        //设置当前激活的导航按钮
        $('#nav_space').addClass('active');

        //分页条
        var $pagination = $('#pagination');
        //商家id
        var bid = ${seller.id};

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
                if (thePage.pagaTotal > 1) {
                    //如果总页数大于2,显示分页条

                    //设置分页条的一些属性
                    $pagination.paging("settings", {
                        //总共数量
                        page_total: thePage.pagaTotal,
                        // 当前页面
                        page_current: g_curPage
                    });
                    //显示分页条
                    $pagination.slideDown();
                }

                //list列表的数据
                var data = json.data;

                //先清空ul
                $ul.empty();

                //遍历list
                $.each(data, function (n, each) {

                    //分类的实体
                    var commodity = each.commodity;
                    //点击打开的url
                    var url = "MessageDetailAction?message_id=" + each.id;

                    //外部的li
                    var li = $("<li class='history-record'></li>").appendTo($ul);
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
                    var a_type = $('<a class="typename" href="#">(' + commodity.commodity_name + ')</a>').appendTo(div_r);

                    //标题部分
                    var a_type = $('<div class="title" href="title">(' + each.title + ')</div>').appendTo(div_r);

                    //正文部分
                    var a_name = $('<a href="' + url + '" target="_blank" class="content"></a>').text("[" + each.content + "]").appendTo(div_r);


                })
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

        //初始化模块
        listMoudle.init();
        //页面载入完成调用第一页
        listMoudle.getPage(g_curPage);
    });
</script>
</body>
</html>
