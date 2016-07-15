<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>商家主页</title>
</head>
<body>
<%--导航style--%>
<style>
    a {
        outline: 0;
        color: #00a1d6;
        text-decoration: none;
        cursor: pointer;
    }

    a:hover {
        color: #f25d8e;
    }

    a {
        color: inherit;
        text-decoration: none;
        transition: color 0.2s ease, background-color 0.2s ease;
    }

    a:hover {
        color: #00a1d6;
    }

    .wrapper, .headbackground {
        width: 1100px;
        margin: 0 auto;
        position: relative;
    }

    .n-left {
        box-shadow: #eee 0 0 0 1px;
        border-radius: 4px;
        padding: 0 8px;
        background: #fff;
    }

    .n-right {
        float: right;
        margin-right: 8px;
    }

    .n-right .n-btn:last-child {
        margin-right: 0;
    }

    .n-cursor {
        width: 0;
        height: 3px;
        transition: all 0.2s ease;
        position: absolute;
        bottom: 0;
        left: 0;
        background: #00a1d6;
    }

    .n-btn {
        display: inline-block;
        font-size: 14px;
        line-height: 56px;
        padding: 0 16px 0 40px;
        margin-right: 25px;
        background-image: url(http://static.hdslb.com/spacev2/1/img/icons2.png);
    }

    .n-btn.active {
        color: #00a1d6;
    }

    .n-index {
        background-position: -10px -322px;
    }

    .n-video {
        background-position: -10px -387px;
    }

    .n-bangumi {
        background-position: -10px -516px;
    }

    .n-fav {
        background-position: -10px -451px;
    }

    .n-setting {
        background-position: -10px -579px;
    }

    .n-qz {
        background-position: -10px -771px;
    }

    div, a {
        font-weight: normal;
        margin: 0;
        padding: 0;
        border: 0;
        vertical-align: baseline;
    }

    .host {
        display: none !important;
    }

    .my-space a.host {
        display: inline-block !important;
    }

    /*对话框*/
    .no-close .ui-dialog-titlebar-close {
        display: none;
    }

    /*导航条的头像*/
    .headbackground img {
        width: 180px;
        height: 180px;
        border: 3px solid rgb(242, 233, 233);
        -webkit-border-radius: 36px;
        -moz-border-radius: 36px;
        border-radius: 36px;
    }

    .headbackground {
        background-image: url(${pageContext.request.contextPath}/img/header.jpg);
    }
    .i_face {;
        z-index: 20;
        border-color: #fff;
        border-radius: 18px;
        display: block;
        height: 36px;
        width: 36px;
        margin: 3px 0;
        transition: 0.3s;
    }
</style>

<%--顶部--%>
<div class="headbackground">
    <s:if test='#seller.pic!=""'>
        <img id="nav_logo"
             src="${pageContext.request.contextPath}/upload/business/<s:property value="#seller.pic" />">
    </s:if>
    <s:else>
        <img id="nav_logo" src="${pageContext.request.contextPath}/img/house.png">
    </s:else>

</div>
<%--导航条--%>
<div class="wrapper" style="display: none">
    <div class="n-right">
        <a id="logout" href="#!/setting" class="n-btn n-setting">退出登录</a>
    </div>
    <div class="n-left">
        <a href="businesshome" class="n-btn n-fav n-favlist n-host" id="nav_space">主页</a>
        <a href="businesshome?type=modify" class="n-btn n-index" id="nav_modify">修改信息</a>
        <a href="businesshome?type=manage" class="n-btn n-video" id="nav_manage">兼职管理</a>
        <a href="businesshome?type=person" class="n-btn n-bangumi n-subs" id="nav_person">申请人员</a>
        <a href="#!/qz-index" class="n-btn n-qz n-qz-index n-qz-threads n-qz-replys n-qz-fav">兴趣圈</a>
    </div>
    <div class="n-cursor" style="left: 8px; width: 84px; height: 3px;"></div>
</div>



<%--对话框--%>
<div id="head_dialog" class="head_dialog" title="信息" style="display: none">
    <p id="text">我是商家主页的对话框</p>
</div>

<link href="${pageContext.request.contextPath}/css/jquery-ui-1.10.4.custom.css" rel="stylesheet" property=""/>
<script src="${pageContext.request.contextPath}/js/jquery-1.10.2.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.ui.js"></script>
<script type="text/javascript">
    /**
     * 全局函数，显示对话框
     * @param $ele
     * @param text
     */
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

    $(document).ready(function () {
        //导航条
        //商家登录后才显示导航条
       var $wrapper = $('.wrapper');

       <s:if test="#session.business!=null">
       		$wrapper.slideDown();
       </s:if>
        //设置当前激活的导航按钮
//        $('#nav_manage').addClass('active');
//        $('#nav_person').addClass('active');

        var cursor = $('div.n-cursor');
        var navDiv = $('div.n-left');
        //滚动转移
        navDiv.find('a').mouseenter(function () {
            cursor.css("left", $(this).position().left + "px");
        });
        navDiv.mouseleave(function () {
            var activeEle = navDiv.find('a.active');
            cursor.css("left", activeEle.position().left + "px");
        });


        //退出登录按钮
        var $logout = $('#logout');
        $logout.click(function () {
            $.ajax({
                url: "businesslogin",
                type: "POST",
                datatype: "json",
                data: {
                    type: "logout"
                },
                success: function (rdata, textStatus) {
                    window.location.reload(true);
                    //var data = $.parseJSON(rdata);
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(XMLHttpRequest + textStatus + errorThrown);
                }
            });
        });

        //对话框
        var dialog = $('#head_dialog');
        dialog.dialog({
            dialogClass: "no-close",
            autoOpen: false,
            show: "blind",
            hide: "explode"
        });
        //dialog.dialog('open');
    });
</script>

