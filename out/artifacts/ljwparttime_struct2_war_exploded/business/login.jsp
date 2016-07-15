<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>商家主页</title>
    <link href="${pageContext.request.contextPath}/css/jquery-ui-1.10.4.custom.css" rel="stylesheet" property=""/>
</head>
<%--样式--%>
<style>
    * {
        margin: 0;
        padding: 0;
        list-style: none;
        text-decoration: none;
        font-family: "微软雅黑", fantasy;
    }

    #content {
        overflow: hidden;
        width: 100%;
    }

    body {
        overflow: hidden;
    }

    .login_content {
        position: absolute;
        right: 13%;
        top: 50%;
        margin-top: -182px;
        width: 390px;
        height: 364px;
        z-index: 3;
        box-shadow: 3px 3px 15px #191e34;
    }

    .login_content_sdo {
        position: absolute;
        right: 13%;
        top: 50%;
        margin-top: -170px;
        width: 440px;
        height: 350px;
        border-radius: 4px;
    }

    .popWindow {
        position: absolute;
        right: 13%;
        top: 50%;
        z-index: 2;
        width: 360px;
        height: 252px;
        margin-top: 51px;
        border: 1px solid #0e101b;
        border-radius: 4px 4px 0 0;
        box-shadow: inset 0px 0px 10px #191e34;
        margin-right: 80px;
        opacity: 0;
        filter: alpha(opacity=0);
        box-shadow: 3px 3px 15px #191e34;
    }

    .left_info {
        position: absolute;
        left: 50px;
        top: -147px;
        width: 247px;
        height: 145px;
        background: url(http://k.static.u17i.com/v4/www/images/login_v2/left_info.png) 0px -1px;
    }

    .left_info_link {
        position: absolute;
        font-size: 18px;
        color: #fff100;
        left: 103px;
        top: 100px;
        text-decoration: underline;
    }

    .left_info .close {
        color: #fff;
        position: absolute;
        display: block;
        right: 6px;
        top: 39px;
    }

    .login_wrapper {
        width: 100%;
        height: 100%;
        position: absolute;
        left: 0px;
        top: 0px;
        z-index: 1;
        background-color: #191e34;
        opacity: 0.8;
        filter: alpha(opacity=80);
    }

    .popWindow_box {
        width: 100%;
        height: 190px;
        position: relative;
        z-index: 2;
        padding-top: 62px;
    }

    .popWindow_str1 {
        display: block;
        font-size: 20px;
        text-align: center;
        color: #f19942;
    }

    .sdo_login_btn {
        display: block;
        width: 270px;
        height: 41px;
        background-color: #5594fc;
        border-bottom: 4px solid #2b67cc;
        margin: 68px auto 0 auto;
        opacity: 0.9;
        filter: alpha(opacity=90);
        text-align: center;
        line-height: 40px;
        color: #fff;
        font-size: 22px;
        border-radius: 2px;
    }

    .login_content .logo {
        position: absolute;
        display: block;
        top: -55px;
        right: 0px;
        width: 110px;
        height: 45px;
    }

    .login_content .login_box {
        width: 390px;
        height: 300px;
        border: 1px solid #0e101b;
        border-radius: 4px 4px 0 0;
        box-shadow: inset 0px 0px 10px #191e34;
        position: relative;
    }

    .login_bottom {
        width: 390px;
        padding-bottom: 10px;
        position: absolute;
        border: 1px solid #0e101b;
        border-top: 1px solid #34354b;
        border-radius: 0 0 4px 4px;
        box-shadow: inset 0px 0px 10px #191e34;
    }

    .login_yqn_box {
        position: absolute;
        left: -78px;
        top: -78px;
        width: 104px;
        height: 147px;
        z-index: 2;
    }

    .login_yqn {
        position: absolute;
        width: 101px;
        height: 106px;
        left: 0px;
        bottom: 0px;
    }

    .login_yqn_pop {
        position: absolute;
        width: 130px;
        height: 46px;
        background: url(http://k.static.u17i.com/v4/www/images/login_v2/login_yqn_pop.png);
        right: -68px;
        top: 0px;
        font-size: 16px;
        line-height:40px;
        text-align:center;
        color: #DA0000;
    }

    .login_bottom .one_login_btn {
        text-align: center;
        font-size: 14px;
        color: #6fc2de;
        display: block;
        padding-top: 10px;
        position: relative;
        z-index: 2;
    }

    .login_bottom .login_list {
        position: relative;
        z-index: 2;
        margin: 14px 0 0 8px;
    }

    .login_bottom .login_list li {
        float: left;
        height: 30px;
        line-height: 30px;
        padding-left: 52px;
        border-left: 1px solid #4f5161;
        border-right: 1px solid #08080e;
        padding-right: 42px;
        position: relative;
    }

    .login_bottom .login_list li.qq {
        border-left: none;
        background: url(http://k.static.u17i.com/v4/www/images/login_v2/login_icon_qq.jpg) 34px 1px no-repeat;
    }

    .login_bottom .login_list li.wx {
        background: url(http://k.static.u17i.com/v4/www/images/login_v2/login_icon_wx.png) 34px 1px no-repeat;
    }

    .login_bottom .login_list li.sina {
        background: url(http://k.static.u17i.com/v4/www/images/login_v2/login_icon_sina.jpg) 34px 1px no-repeat;
    }

    .login_bottom .login_list li.sdo {
        border-right: none;
        background: url(http://k.static.u17i.com/v4/www/images/login_v2/login_icon_sdo.jpg) 34px 1px no-repeat;
    }

    .login_bottom .login_list li a {
        position: absolute;
        left: 0px;
        top: 0px;
        width: 100%;
        height: 100%;
    }

    .login_tips {
        position: absolute;
        left: 25px;
        top: 10px;
        font-size: 12px;
        color: #ed0000;
        z-index: 2;
    }

    .login_form {
        width: 345px;
        height: 120px;
        padding-top: 35px;
        margin: 0px 0 0 25px;
        position: relative;
        z-index: 2;
    }

    .r_check_box {
        width: 342px;
        height: 32px;
        margin: 0px 0 0 25px;
        position: relative;
        z-index: 2;
    }

    input {
        vertical-align: middle;
    }

    .login_btn {
        display: block;
        position: relative;
        z-index: 2;
        width: 342px;
        height: 50px;
        border-bottom: 4px solid #b0661e;
        text-align: center;
        line-height: 50px;
        color: #fff;
        font-size: 28px;
        background-color: #f19942;
        margin: 15px 0 0 25px;
        opacity: 0.9;
        filter: alpha(opacity=90);
        border-radius: 2px;
    }

    .login_link_list {
        width: 142px;
        margin: 15px auto;
        position: relative;
        z-index: 2;
        font-size: 13px;
        color: #6fc2de;
    }

    .login_link_list a {
        color: #6fc2de;
    }

    .rcb_left {
        float: left;
    }

    .rcb_left i.checked {
        background-position: 0px -21px;
    }

    .rcb_left i {
        float: left;
        width: 20px;
        height: 20px;
        background-image: url(http://k.static.u17i.com/v4/www/images/login_v2/check.png);
        background-repeat: no-repeat;
        cursor: pointer;
        margin-top: 4px;
        background-position: 0px 5px;
    }

    .rcb_left a {
        line-height: 32px;
        font-size: 13px;
        color: #6fc2de;
    }

    .login_input_box {
        width: 343px;
        height: 45px;
        background-color: #fff;
        margin-bottom: 18px;
        border-radius: 3px;
    }

    .password_box {
        margin-bottom: 10px;
    }

    .login_password {
        display: none;
    }

    .login_input_box input {
        width: 340px;
        padding: 0 40px 0 10px;
        font-size: 18px;
        color: #aaaaaa;
        height: 42px;
        line-height: 42px;
        border: 2px solid #c2c2c2;
        border-top-width: 3px;
        border-radius: 3px;
        background-color: transparent;
        outline: none;
    }

    .password_box input {
        background: url(http://k.static.u17i.com/v4/www/images/login_v2/icon2.png) 306px -75px no-repeat;
    }

    .username_box input {
        background: url(http://k.static.u17i.com/v4/www/images/login_v2/icon2.png) 306px 8px no-repeat;
    }

    .bg {
        display: block;
    }
</style>
<%--主体--%>
<body>
<div id="content" style="width: 1366px; height: 673px;">
    <!-- 背景图 -->
    <div class="bg_box">
        <img class="bg" style="width: 1366px; margin-top: -106.71px;"
             src="${pageContext.request.contextPath}/img/password-bg.jpg">
    </div>
    <!-- 背景图 end -->

    <!-- 登录框容器 -->
    <div class="login_content">
        <div class="login_box">
            <div class="login_wrapper"></div>
            <form name="login_member" id="login_member" action="" method="POST">
                <div class="login_tips">
                </div>
                <div class="login_form">
                    <div class="login_input_box username_box">
                        <input name="username" class="login_username" id="login_name" type="text"
                               placeholder="邮箱/手机/商家名称">
                    </div>
                    <div class="login_input_box password_box">
                        <input class="login_password_str" id="login_password" type="password" placeholder="密码">
                    </div>
                </div>
                <div class="r_check_box">
                    <div class="rcb_left">
                        <i class="checked" id="keeplogin"></i>
                        <a href="javascript:;">记住登录状态一个月</a>
                    </div>
                </div>
                <a class="login_btn" href="javascript:;">登 录</a>
                <div class="login_link_list">
                    <a href="${pageContext.request.contextPath}/forgotpwd/forgotpwd.jsp" target="_blank">忘记密码？</a> |
                    <a href="${pageContext.request.contextPath}/business/reg.jsp">新商家注册</a>
                </div>
            </form>
        </div>


        <div class="login_yqn_box" style="">
            <img class="login_yqn" src="${pageContext.request.contextPath}/img/Portrait.ico" style="height:106px;width:101px">
            <div class="login_yqn_pop">欢迎登陆</div>
        </div>

    </div>
    <!-- 登录框容器 end -->

</div>

<%--对话框--%>
<div id="head_dialog" class="head_dialog" title="信息">
    <div id="text">商家主页</div>
</div>

<script src="${pageContext.request.contextPath}/js/jquery-1.10.2.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.ui.js"></script>
<script type="text/javascript">
    /**
     * 全局函数，显示对话框
     * @param $ele
     * @param text
     */
    function openDialog($ele, text) {
        var dialog = $('#head_dialog');
        dialog.dialog("option", "position", {of: $ele});
        dialog.dialog('open');
        dialog.find('#text').html(text);//设置文本
    }

    $(document).ready(function () {
        var btn_login = $('a.login_btn');//登录按钮
        var name = $('#login_name');//名字
        var pwd = $('#login_password');//密码
        //提示
        var tips = $('div.login_yqn_pop');

        //对话框
        var dialog = $('#head_dialog');
        dialog.dialog({
            autoOpen: false,
            show: "blind",
            hide: "explode"
        });

        //保存密码checkbox
        var $keeplogin = $('#keeplogin');
        $keeplogin.click(function () {
            $keeplogin.toggleClass('checked');
        });

        btn_login.click(function () {
            var str_name = name.val();
            var str_pwd = pwd.val();
            if (str_name == "" || str_pwd == "") {
                tips.text("帐号或者密码不能为空！");
                return;
            }
            if (str_name.length < 5 || str_pwd.length < 6) {
                tips.text("帐号或者密码的长度太短了！");
            }
            //发送登录请求
            $.ajax({
                url: "businesslogin",
                type: "POST",
                datatype: "json",
                timeout: 3000,
                data: {
                    keeplogin:$keeplogin.hasClass('checked'),
                    account: str_name,
                    pwd: str_pwd,
                    type: "login"
                },
                success: function (data, textStatus) {
                    tips.text(data.msg);//显示信息
                    //登录成功
                    if (data.success) {
                        openDialog(btn_login,"登录成功！3s秒后转到<a href='businesshome'>首页</a>");
                        //3s后跳转到主页
                        setTimeout(function () {
                            window.location.href = "businesshome";
                        }, 3000);
                    } else {

                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(XMLHttpRequest + textStatus + errorThrown);
                }
            });
        });
    });
</script>

</body>
</html>
