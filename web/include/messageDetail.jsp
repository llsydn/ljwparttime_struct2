<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page language="java" pageEncoding="utf-8" %>
<!-- http://localhost:8080/ljwparttime_struct2/include/messageDetail.jsp?message_id=33 -->
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>兼职评论</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.cookie.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui-1.10.4.custom.css" type="text/css"/>
    <link rel="shortcut icon" type="image/x-icon" href="img/job.ico"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/personcss/personal.css">
</head>
<body>

<%--主要style--%>
<style>
    #header_content span {
        font-size: 16px;
        height: 45px;
        line-height: 45px;
        text-indent: 10px;
    }

    body {
        background-color: #666;
    }

    .mainDiv {
        margin: auto;
        width: 1100px;
    }

    .mainDiv .left {
        padding: 3px 2px;
        float: left;
        width: 68%;
    }

    .mainDiv .right {
        padding: 3px 2px;
        float: right;
        width: 28%;
    }

    .mainDiv .floatdiv {
        margin-top: 20px;
        font-family:"Times New Roman",Georgia,Serif;
        font-size: 20px;
        line-height: 20px;
        color: rgb(82, 122, 73);
        text-align: left;
        border-radius: 5px;
        background-color: lightyellow;
    }
    .right span {
        display: block;
        color: mediumblue
    }

    .left span {
        margin-top: 20px;
    }

    /*水平分割线*/
    .line {
        border: 1px solid #ccc;
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
<%--评论区--%>
<style>
    /*时间显示*/
    .comment_time {
        color: goldenrod;
    }

    .comic_comment ul > li:first-child {
        border-top: 1px solid #e5e9ef;
    }

    .comic_comment ul li.main-floor {
        border-top: 1px solid #e5e9ef;
        margin-left: 85px;
        position: relative;
    }

    .comic_comment ul li.main-floor span.uname {
        font-style: italic;
        color: rgb(255, 53, 0);
    }

    .comic_comment ul li .facebox {
        position: absolute;
        left: -85px;
        width: 60px;
    }

    .comic_comment ul li .facebox img {
        width: 48px;
        height: 48px;
        border-radius: 48px;
        margin: 0 auto;
        display: block;
        border: 1px solid #e5e9ef;
    }

    .comic_comment ul li .content {
        padding: 2px 0;
        font-size: 14px;
        text-shadow: none;
        overflow: hidden;
        word-wrap: break-word;
        color: fuchsia;
        font-family: "Microsoft YaHei", Verdana, Arial, sans-serif;
        line-height: 29px;
        font-weight: bold;
        text-decoration: underline;
    }

    /*回复*/
    .comic_comment .reply ul li img {
        padding-right: 10px;
        float: left;
        width: 24px;
        height: 24px;
        border-radius: 40px;
    }

    /*回复框*/
    .comic_comment .dcmp_content .user_face {
        float: left;
        width: 48px;
        height: 48px;
    }

    .comic_comment .dcmp_content .user_face img {
        width: 100%;
        height: 100%;
        border-radius: 48px;
    }

    .comic_comment #dcmp_textarea_container {
        position: relative;
        margin-left: 88px;
        margin-right: 102px;
    }

    .comic_comment .ipt-txt {
        font-size: 12px;
        background-color: #f4f5f7;
        border: 1px solid #e5e9ef;
        overflow: auto;
        border-radius: 4px;
        color: #555;
        width: 74%;
        height: 52px;
        transition: 0s;
        text-indent: 10px;
        font-family: "Microsoft YaHei", Verdana, Arial;
    }

    .comic_comment #dcmp_textarea_container button {
        width: 120px;
        float:right;
        height: 50px;
        font-size: 14px;
        font-family: "SimSun";
        background: #52ACEA;
        border-radius: 5px;
        background: #02a0e9 none repeat scroll 0 0;
        border: medium none;
        border-radius: 6px;
        bottom: 0;
        color: #fff;
        cursor: pointer;
        outline: medium none;
    }

    a.ywz {
        line-height: 41px;
        font-family: \u9ED1\u4F53, sans-serif;
        font-size: 15px;
        color: rgb(58, 64, 38);
        text-decoration: underline;
        border: 4px double rgb(0, 0, 0);
        -webkit-border-radius: 4px;
        -moz-border-radius: 4px;
        border-radius: 4px;
    }

    /*表情框*/
    .comic_comment .biaoqing_box {
        display: none;
        overflow: hidden;
        background: #fff;
        border: 1px solid #e5e9ef;
        margin-bottom: 10px;
        padding: 10px;
        border-radius: 5px;
        width: 450px;
        float: left;
        position: absolute;
        top: 25px;
        z-index: 100;
    }
</style>
<%--兼职申请 --%>
<style>
    .request {
        width: 100px;
        height: 100px;
        float: left;
    }

    .collection {
        width: 100px;
        height: 100px;
        float: right;
    }

    #req_success {
        background: #fff;
        font-size: 18px;
        height: 130px;
        line-height: 40px;
        position: relative;
        clear: both;
        width: 300px;
        text-align: center;
        font-family: "SimSun";
        color: green;
        border-radius: 10px;
        box-shadow: 0 0 6px 3px #02a0e9;
    }

    #suc_photo {
        height: 40px;
        background: url(${pageContext.request.contextPath}/img/success.ico) no-repeat 50%;
        background-size: 30px;
    }

    #err_photo {
        height: 40px;
        background: url(${pageContext.request.contextPath}/img/error.png) no-repeat 50%;
        background-size: 30px;
    }

    .requestaction, .collectionaction {
        width: 100px;
        float: right;
        height: 50px;
        line-height: 50px;
        text-align: center;
        font-size: 14px;
        font-family: "SimSun";
        background: #52ACEA;
        border-radius: 5px;
        background: #02a0e9 none repeat scroll 0 0;
        border: medium none;
        border-radius: 6px;
        color: #fff;
        cursor: pointer;
        outline: medium none;
        text-decoration: none;
        margin-top: 20px;
        margin-bottom: 5px;
    }
</style>
<%--一些全局变量和函数--%>
<script type="text/javascript">
    var contextPath = "${pageContext.request.contextPath}";
    //当前的兼职信息id
    var g_message_id =${message_id};
    /**
     * 全局函数，判断有无登录
     */
    function isLogin() {
        if ($.cookie('username')) {
            return true;
        } else {
            return false;
        }
    }
    /**
     *获得用户的头像地址
     */
    function getFaceURL() {
    	<s:if test="#session.user.imageurl==null">
        return "${pageContext.request.contextPath}/img/touxiang_default.gif";
        </s:if>
        <s:else>
        return "${pageContext.request.contextPath}/<s:property value="#session.user.imageurl"/>";
        </s:else>

    }
</script>

<%--头部导航条--%>
<div id="header">
    <div id="header_content">
        <img src="${pageContext.request.contextPath}/img/job.ico" id="left_touxiang">
        <span>兼职招聘网</span>
        <div id="touxiang">
            <c:if test="${user.imageurl==null}">
                <a href="${pageContext.request.contextPath}/ChangPhotoAction">
                    <img alt="点击修改个人头像" title="点击修改个人头像"
                         src="${pageContext.request.contextPath}/img/touxiang_default.gif"
                         id="right_touxiang">
                </a>
            </c:if>
            <c:if test="${user.imageurl!=null}">
                <a href="${pageContext.request.contextPath}/person/personalimage.jsp">
                    <img alt="点击修改个人头像" title="点击修改个人头像" src="${pageContext.request.contextPath}/${user.imageurl}"
                         id="right_touxiang">
                </a>
            </c:if>
        </div>
        <a href="javascript:void(0)" id="logout">退出</a>
        <a href="javascript:void(0)" id="member">用户</a>
    </div>
    <script>
        //如果已经存在cookie就显示用户名
        if ($.cookie('username')) {
            $('#member, #logout').show();
            $('#member').html($.cookie('username'));

            //点击退出按钮。
            $('#member').click(function () {
                location.href = 'personinfomation?username=' + $.cookie('username');
            });
        }
        //点击退出按钮。
        $('#logout').click(function () {
            window.location.href = 'index.jsp';
        });
    </script>
</div>
<div class="maindiv">
    <div class="left">
        <div class="floatdiv">
            <div>
                <%--分类名称--%>
                <span style="color: cornflowerblue">(${message.commodity.commodity_name})</span>
                <%--标题--%>
                <span style="color: forestgreen;">[${message.title}]</span>
            </div>
            <hr class="line">
            <div>
                <%--时间--%>
                <span style="color: darkslategray">${message.date_time}</span>
            </div>
            <hr class="line">
            <div>
                <%--正文--%>
                <span style="color: black;">${message.content}</span>
            </div>
        </div>
        
        <div id="head_dialog" class="head_dialog" title="信息" style="display: none">
            <p id="text"></p>
        </div>
        <%--评论div--%>
        <div class="comic_comment">
            <div id="pagination2" class="page"></div>
            <ul id="comment_list" style="margin-top: 50px;background-color:aliceblue;">
                <li class="main-floor">
                    <div class="facebox">
                        <img src="http://i2.hdslb.com/bfs/face/7ddf84aa8c0290fa415d684cae77bbbdd99033cf.jpg_52x52.jpg"
                             class="face">
                    </div>
                    <div class="t">
                        <span>XYSG</span>
                    </div>
                    <div class="content">up必火(=・ω・=)</div>
                    <div class="elinfo">
                        <span class="floor-num">#10</span> <span class="floor-date">2016-04-16
						15:22</span> <i class="report"> <a href="javascript:;" class="huifu">回复</a>
                    </i>
                    </div>
                    <div class="reply">
                        <ul class="re_ul">
                            <li><img
                                    src="http://i1.hdslb.com/bfs/face/8a4b4e98980533fc216345aa95526368e854f293.jpg_52x52.jpg">
                                <div class="re_cnt">
                                    <div class="w">
                                        <span>Erdman</span> <span class="content">回复<a
                                            href="javascript:;">@破碎面具</a>:同求(°∀°)ﾉ</span>
                                    </div>
                                    <div class="info">
                                        <p>
                                            <span class="floor-date">2015-12-25 07:05</span> <a
                                                class="re_ta" href="javascript:;;">回复</a>
                                        </p>
                                    </div>
                                </div>
                            </li>
                            <li><img
                                    src="http://i1.hdslb.com/bfs/face/8a4b4e98980533fc216345aa95526368e854f293.jpg_52x52.jpg">
                                <div class="re_cnt">
                                    <div class="w">
                                        <span>Erdman</span> <span class="content">回复<a
                                            href="javascript:;">@破碎面具</a>:同求(°∀°)ﾉ</span>
                                    </div>
                                    <div class="info">
                                        <p>
                                            <span class="floor-date">2015-12-25 07:05</span> <a
                                                class="re_ta" href="javascript:;;">回复</a>
                                        </p>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </li>
            </ul>
            <div id="pagination" class="page"></div>
            <%--回复框--%>
            <div class="dcmp_content" style="margin-top: 20px;display: none">
                <div class="user_face">
                    <img src="${pageContext.request.contextPath}/img/comment.ico">
                </div>
                <div id="dcmp_textarea_container" class="dcmp-textarea-container">
				<textarea cols="80" name="msg" rows="5" id="comment_text"
                          placeholder="请自觉遵守互联网相关的政策法规，严禁发布色情、暴力、反动的言论。" class="ipt-txt"></textarea>
                    <button type="submit" class="b-btn submit-comment">发表评论</button>
                    <div class="dcmp_post">
                        <div class="ywz-wrapper" style="position: relative;">
                            <div class="biaoqing_box">
                                <a>(⌒▽⌒)</a><a>（￣▽￣）</a><a>(=・ω・=)</a><a>(｀・ω・´)</a><a>(〜￣△￣)〜</a><a>(･∀･)</a><a>(°∀°)ﾉ</a><a>(￣3￣)</a><a>╮(￣▽￣)╭</a><a>(
                                ´_ゝ｀)</a><a>←_←</a><a>→_→</a><a>(&lt;_&lt;)</a><a>(&gt;_&gt;)</a><a>(;¬_¬)</a><a>("▔□▔)/</a><a>(ﾟДﾟ≡ﾟдﾟ)!?</a><a>Σ(ﾟдﾟ;)</a><a>Σ(
                                ￣□￣||)</a><a>(´；ω；`)</a><a>（/TДT)/</a><a>(^・ω・^ )</a><a>(｡･ω･｡)</a><a>(●￣(ｴ)￣●)</a><a>ε=ε=(ノ≧∇≦)ノ</a><a>(´･_･`)</a><a>(-_-#)</a><a>（￣へ￣）</a><a>(￣ε(#￣)
                                Σ</a><a>ヽ(`Д´)ﾉ</a><a>(╯°口°)╯(┴—┴</a><a>（#-_-)┯━┯</a><a>_(:3」∠)_</a><a>(笑)</a><a>(汗)</a><a>(泣)</a><a>(苦笑)</a>
                            </div>
                            <a class="ywz">(・ω・) 颜文字</a>
                        </div>
                        <div class="dcmp_userinfo"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="right">
        <%--商家信息模块--%>
        <div class="floatdiv" title="查看该商家的信息">
            <a href="businesshome?bid=${message.business.id}" target="_blank" style="text-decoration:none;">
                <span>商家:${message.business.name}</span>
                <span>邮箱：${message.business.email}</span>
                <span>电话: ${message.business.phone}</span>
                <span>地址: 广东省中山市${message.business.address}</span>
                <span>认证:
                    <s:if test="message.business.level>0">通过</s:if>
                    <s:else>未审核</s:else>
                </span>
            </a>
        </div>
        <div class="request">
            <button class="requestaction">兼职申请</button>
            <div id="req_success" style="display:none" class="req">
                <div id="suc_photo"></div>
                <p>申请成功,您可以到个人中心查看...</p>
            </div>
            <div id="req_success" style="font-size:16px;color:red;display:none;" class="err">
                <div id="err_photo"></div>
                <p>申请失败,请您登录后再来...</p>
            </div>
            <div id="req_success" style="font-size:16px;color:red;display:none;" class="exist">
                <div id="err_photo"></div>
                <p>您已经申请过了,请不要重复申请...</p>
            </div>
        </div>
        <div class="collection">
            <button class="collectionaction">商家收藏</button>
            <div id="req_success" style="display:none" class="req1">
                <div id="suc_photo"></div>
                <p>收藏成功,您可以到个人中心查看...</p>
            </div>
            <div id="req_success" style="font-size:16px;color:red;display:none;" class="err1">
                <div id="err_photo"></div>
                <p>收藏失败,请您登录后再来...</p>
            </div>
            <div id="req_success" style="font-size:16px;color:red;display:none;" class="exist1">
                <div id="err_photo"></div>
                <p>您已经收藏过了,请不要重复该操作...</p>
            </div>
        </div>
    </div>
</div>
<%--末尾--%>

<%@ include file="/include/footer.jsp" %>
<!-- 商家收藏 -->
<script>
    $('.collectionaction').click(function () {
        var businessid =${message.business.id}; //获取商家的id号。
        var username = $.cookie('username'); //获取用户名

        //alert(messageid); console.log(messageid);console.log(username);
        $.ajax({
            type: 'post',
            url: 'CollectAction',
            data: {businessid: businessid, username: username},
            success: function (data) {
                //alert(data.result);
                if (data.result == true) {  //表示成功
                    setTimeout(function () {
                        $('.req1').show(1000);
                    }, 1000);
                    setTimeout(function () {
                        $('.req1').hide(1000);
                    }, 3000);
                }
                if (data.result == false) {
                    setTimeout(function () {
                        $('.err1').show(1000);
                    }, 1000);
                    setTimeout(function () {
                        $('.err1').hide(1000);
                    }, 3000);
                }
                if (data.result == "exist") {

                    setTimeout(function () {
                        $('.exist1').show(1000);
                    }, 1000);
                    setTimeout(function () {
                        $('.exist1').hide(1000);
                    }, 3000);
                }
            },
        });

    });
</script>
<!-- 兼职申请 -->
<script>
    $('.requestaction').click(function () {
        var messageid =${message.id}; //获取兼职信息的id号。
        var username = $.cookie('username');

        //alert(messageid); console.log(messageid);console.log(username);
        $.ajax({
            type: 'post',
            url: 'RequestAction',
            data: {messageid: messageid, username: username},
            success: function (data) {
                //alert(data.result);
                if (data.result == true) {  //表示成功
                    setTimeout(function () {
                        $('.req').show(1000);
                    }, 1000);
                    setTimeout(function () {
                        $('.req').hide(1000);
                    }, 3000);
                }
                if (data.result == false) {
                    setTimeout(function () {
                        $('.err').show(1000);
                    }, 1000);
                    setTimeout(function () {
                        $('.err').hide(1000);
                    }, 3000);
                }
                if (data.result == "exist") {

                    setTimeout(function () {
                        $('.exist').show(1000);
                    }, 1000);
                    setTimeout(function () {
                        $('.exist').hide(1000);
                    }, 3000);
                }
            },
        });

    });
</script>
<!-- 显示的代码 -->
<script type="text/javascript">
    <%--function createElement(content, descript) {--%>
    <%--return $('<div><span>' + descript + ':</span><span>' + content + '</span></div>');--%>
    <%--}--%>
    <%--//文档加载完毕运行--%>
    <%--$(document).ready(function () {--%>
    <%--//属于哪个商家发的--%>
    <%--var business_id = "${message.business_id}";--%>
    <%--//属于哪个兼职分类--%>
    <%--var commodity_id = "${message.commodity_id}";--%>
    <%--//发布时间--%>
    <%--var date_time = "${message.date_time}";--%>
    <%--//具体内容--%>
    <%--var content = "${message.content}";--%>
    <%--//标题--%>
    <%--var title = "${message.title}";--%>
    <%--//id--%>
    <%--var id = "${message.id}";--%>
    <%--$('body').append(--%>
    <%--createElement(business_id, "商家id"),--%>
    <%--createElement(commodity_id, "兼职分类id"),--%>
    <%--createElement(date_time, "发布时间"),--%>
    <%--createElement(content, "具体内容"),--%>
    <%--createElement(title, "标题"),--%>
    <%--createElement(id, "id")--%>
    <%--);--%>
    <%--});--%>
</script>
<%--评论相关js--%>
<%--监控元素出现--%>
<script src="${pageContext.request.contextPath}/js/jquery.onAppear.js"></script>
<%--分页插件--%>
<script src="${pageContext.request.contextPath}/js/jquery-page5.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.ui.js"></script>
<script>
    $(function () {
        //对话框
        var dialog = $('#head_dialog');
        dialog.dialog({
            dialogClass: "no-close",
            autoOpen: false,
            show: "blind",
            hide: "explode"
        });

    });
    function openDialog($ele, text, callback) {
        var dialog = $('#head_dialog');
        dialog.dialog("option", "position", {of: $ele});
        //设置按钮点击函数
        dialog.dialog("option", "buttons",
                [
                    {
                        text: "Ok",//确定按钮
                        icons: {
                            primary: "ui-icon-heart"
                        },
                        click: function () {
                            $(this).dialog("close");
                            callback && callback();//调用回调函数
                        }

                    }
                ]
        );
        dialog.dialog('open');
        dialog.find('#text').text(text);//设置文本
    }
</script>
<script src="${pageContext.request.contextPath}/js/comment.js"></script>
</body>
</html>