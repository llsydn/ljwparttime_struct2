<%--
  Created by IntelliJ IDEA.
  User: ange
  Date: 2016/5/27
  Time: 22:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商家注册</title>
</head>
<body class="loginbody">
<%--
<form id="reg_form">
    <div>
        <input name="name" type="text" placeholder="商家名称">
    </div>
    <div>
        <input name="pwd" type="password" placeholder="密码">
    </div>
    <div>
        <input name="pwd2" type="password" placeholder="重复密码" id="pwd2">
    </div>
    <div>
        <input name="phone" type="text" placeholder="电话" id="phone">
    </div>
    <div>
        <input name="mail" type="email" placeholder="邮件" id="email">
    </div>
    <div>
        <input name="address" type="text" placeholder="地址">
    </div>
    <div>
        <input id="reg" type="submit" value="注册">
    </div>
</form>
--%>

<%--注册表单style--%>
<style>
    body {
        background: #FFFFFF;
        font-size: 14px;
        color: #333333;
        font-family: Arial, "微软雅黑", "宋体", sans-serif;
    }

    .error {
        float: left;
        color: red;
    }

    .loginbody {
        background: #D6E4FF;
    }

    .dataEye {
        /*background: url(../img/password-bg.jpg) no-repeat center top;*/
        position: absolute;
        left: 0;
        top: 0;
        right: 0;
        bottom: 0;
    }

    .mask {
        background: #CCCCCC;
        position: fixed;
        left: 0;
        top: 0;
        right: 0;
        bottom: 0;
        width: 100%;
        height: 100%;
        filter: alpha(opacity=50);
        -moz-opacity: 0.5;
        -khtml-opacity: 0.5;
        opacity: 0.5;
    }

    .loading-img {
        width: 32px;
        height: 32px;
        position: absolute;
        left: 50%;
        top: 50%;
        margin: -16px 0 0 -16px;
    }

    .loginbox, .not-box {
        width: 400px;
        margin: 50px auto 100px auto;
    }

    .registbox {
        margin-top: 20px;
    }

    .loginbox .logo-a, .not-box .logo-a {
        height: 150px;
        text-align: center;
    }

    .loginbox .login-content {
        border: 1px solid #CCCCCC;
        border-radius: 3px;
        padding-bottom: 20px;
    }

    .loginbox .login-content {
        background: #FFFFFF;
        height: auto !important;
        min-height: 100px;
        height: 100px;
        font-size: 14px;
    }

    .go-regist {
        text-align: center;
        height: 80px;
        line-height: 80px;
    }

    a {
        cursor: pointer;
    }

    a.link, .go-regist a, .loginbox label a {
        color: #006da7;
        cursor: pointer;
        line-height: 25px;
    }

    .loginbox .loginbox-title {
        background: #FFFFFF;
        height: 70px;
        border-radius: 3px 3px 0 0;
    }

    .login-error {
        display: none;
        width: 330px;
        margin: 0 auto;
        color: red;
    }

    .row {
        height: 35px;
        line-height: 22px;
        position: relative;
    }

    .tips {
        color: #999;
        font-size: 12px;
    }

    .loginbox .login-content .row {
        width: 330px;
        margin: 0 auto;
        padding: 20px 0;
        position: relative;
    }

    .loginbox .login-content .tips {
        padding: 5px 0;
        height: 25px;
        font-size: 14px;
    }

    .loginbox .login-content .btnArea {
        padding: 0;
        margin: 15px auto 5px auto;
    }

    .registbox .reg-content .row {
        padding: 10px 0;
    }

    .registbox .reg-content .tips {
        padding: 0;
    }

    .login-btn {
        display: block;
        /*background: url(../img/house.png) repeat-x left top;*/
        width: 330px;
        text-align: center;
        height: 35px;
        line-height: 35px;
        /*color: white;*/
        font-size: 16px;
        border-radius: 3px;
        border: 1px solid #215A8D;
    }

    .loginbox .login-content .tips input {
        margin-right: 5px;
    }

    .loginbox .login-content .row .field {
        position: absolute;
        left: 40px;
        top: 23px;
        height: 35px;
        line-height: 35px;
        pointer-events: none;
    }

    .registbox .reg-content .row .field {
        position: absolute;
        left: 10px;
        top: 13px;
        height: 35px;
        line-height: 35px;
    }

    .input-text-user {
        border: #D8D8D8 1px solid;
        border-radius: 3px;
        width: 290px;
        padding-left: 40px;
        height: 32px;
        line-height: 32px;
        /*background: white url(../img/house.png) no-repeat 0 top;*/
    }

    .input-text-password {
        border: #D8D8D8 1px solid;
        border-radius: 3px;
        width: 290px;
        padding-left: 40px;
        height: 32px;
        line-height: 32px;
        /*background: white url(../img/house.png) no-repeat 0 -50px;*/
    }

    .loginbox .login-content .row .noPic {
        background-image: none;
        padding: 0 15px;
        width: 300px;
        height: 34px;
        line-height: 34px;
    }

    .registbox .reg-content .row .noPic {
        background-image: none;
        padding: 0 15px;
    }

    .loginbox .loginbox-title h3 {
        color: #666666;
        padding: 0 20px;
        line-height: 50px;
        font-size: 16px;
        border-bottom: 1px solid #F2F2F2;
    }
</style>
<%--地区选择style--%>
<style>
    dl, dt, dd {
        list-style: none;
        float: left;
    }

    .thRelative {
        position: relative;
        left: 0;
        top: 0;
    }

    .lineSearch {
        width: auto;
    }

    .lineSearch .boxSearch, .lineSearch .boxSearchHover {
        position: relative;
        width: 300px;
        padding-left: 7px;
        color: #777;
        height: 31px;
        border: 1px solid #dbdbdb;
        margin-right: 8px;
        line-height: 31px;
        cursor: pointer;
    }

    .search_form_suggest {
        border: 1px solid #FBD8A1;
        position: absolute;
        left: 0;
        z-index: 978;
        width: 308px;
        background: #fff;
    }

    .search_form_suggest h3 {
        font-size: 12px;
        font-weight: normal;
        height: 20px;
        line-height: 20px;
        padding: 0 0 5px 10px;
        color: #ff6f00;
        border-bottom: 1px solid #e6e6e6;
        margin-bottom: 4px;
    }

    .clear {
        clear: both;
    }

    .select_city_box {
        background: #FBFBFB;
        border-top: 1px solid #E5E5E5;
        border-bottom: 1px solid #E5E5E5;
        padding: 13px 3px;
    }

    .thLeft {
        float: left;
    }

    .tab_select dl {
        padding: 5px 0;
    }

    .tab_select dt {
        width: 46px;
        background: #FE984F;
        font: bold 12px/22px Tahoma, Geneva, sans-serif;
        color: #fff;
        text-align: center;
        margin-left: 5px;
    }

    .tab_select dd {
        line-height: 22px;
        width: 317px;
        _width: 310px;
    }

    .ico {
        background: url(../img/house.png) no-repeat;
    }

    a:link, a:visited {
        color: #0fa7ff;
        text-decoration: none;
        outline: none;
        cursor: pointer;
    }

    .tab_select dd a {
        color: #888;
        margin-left: 10px;
        display: inline-block;
    }

    .select_city_box span {
        padding: 0 17px;
        color: #888;
    }

    button, input {
        background: #fff;
        border: none;
    }

    .select_city_box .input_city {
        width: 180px;
        border: 1px solid #C1C1C1;
        background: #FFF;
        padding: 5px 8px;
        font: 12px/14px Arial, Helvetica, sans-serif;
        vertical-align: middle;
    }

    .search_city_result {
        line-height: 24px;
        margin: 10px 0 -5px 108px;
        height: 24px;
    }

    .search_hotList dd {
        line-height: 25px;
        padding-bottom: 2px;
    }

    .search_hotList dd a {
        color: #777;
        margin-right: 12px;
        word-break: break-all;
        white-space: nowrap;
        display: inline-block;
    }

    .thRight {
        float: right;
    }

    .btn_close {
        cursor: pointer;
        background-position: 0 -1px;
        width: 16px;
        height: 16px;
        text-indent: -9999px;
        overflow: hidden;
        _text-indent: 0;
        _font-size: 0;
        _line-height: 0;
    }

    .boxSearch .key_word {
        position: absolute;
        top: 5px;
        line-height: 22px;
        color: #777;
    }

    .boxSearch .ico_shBlue {
        margin-top: 7px;
        width: 12px;
        height: 17px;
        display: inline-block;
        background-position: left -165px;
    }

    .boxSearch .btn_search, .boxSearch .btn_search_current {
        border-left: 1px solid #dbdbdb;
        width: 30px;
        text-align: center;
        font-family: sans-serif
    }

    .size_14 {
        font-size: 14px;
    }
</style>

<%--登录主页面--%>
<div class="dataEye">
    <div class="loginbox registbox">
        <div class="logo-a">
            <a title="商家注册" href="">
                <img style="width: 100px" src="../img/house.png">
            </a>
        </div>
        <div class="login-content reg-content">
            <div class="loginbox-title">
                <h3>注册</h3>
            </div>
            <form id="signupForm" novalidate="novalidate">
                <div class="login-error" style="display: none;"></div>
                <div class="row">
                    <label class="field" style="display: inline;" for="email">注册邮箱</label>
                    <input name="email" class="input-text-user noPic input-click" id="email" type="text" value="">
                </div>
                <div class="row">
                    <label class="field" style="display: inline;" for="pwd">密码</label>
                    <input name="pwd" class="input-text-password noPic input-click" id="pwd" type="password"
                           value="">
                </div>
                <div class="row">
                    <label class="field" for="pwd2">确认密码</label>
                    <input name="pwd2" class="input-text-password noPic input-click" id="pwd2"
                           type="password" value="">
                </div>
                <%--<div class="row">--%>
                <%--<label class="field" for="contact">联系人</label>--%>
                <%--<input name="contact" class="input-text-user noPic input-click" id="contact" type="text" value="">--%>
                <%--</div>--%>
                <div class="row">
                    <label class="field" style="display: inline;" for="company">公司名</label>
                    <input name="company" class="input-text-user noPic input-click" id="company" type="text" value="">
                </div>
                <div class="row">
                    <label class="field" style="display: inline;" for="phone">公司电话</label>
                    <input name="phone" class="input-text-user noPic input-click" id="phone" type="text" value="">
                </div>
                <div class="row">
                    <%--<label class="field" style="display: inline;" for="address">地址</label>--%>
                    <%--<input name="address" class="input-text-user noPic input-click" id="address" type="text" value="">--%>
                    <%--地区选择--%>
                    <div class="lineSearch">
                        <div class="boxSearch">
          <span class="key_word">
            广东省中山市
               <b id="city_name" class="size_14">南区街道</b>
          </span>
                            <a id="city_dropdown" class="thRight ico btn_search" href="javascript:void(0)">︾</a>
                        </div>

                        <div id="city_droplist" class="search_form_suggest" style="display: none;">
                            <h3>热门地区</h3>
                            <dl class="search_hotList">
                                <dd class="clr_after">
                                    <a href="#city_name">中山港街道</a>
                                    <a href="#city_name">中区街道</a>
                                    <a href="#city_name">东区街道</a>
                                    <a href="#city_name">南区街道</a>
                                    <a href="#city_name">西区街道</a>
                                    <a href="#city_name">郊区街道</a>
                                    <a href="#city_name">环城区街道</a>
                                    <a href="#city_name">岐江区街道</a>
                                    <a href="#city_name">莲峰区街道</a>
                                    <a href="#city_name">三乡镇</a>
                                    <a href="#city_name">烟墩区街道</a>
                                    <a href="#city_name">三角镇</a>
                                    <a href="#city_name">大涌镇</a>
                                    <a href="#city_name">小榄镇</a>
                                    <a href="#city_name">五桂山镇</a>
                                    <a href="#city_name">古镇镇</a>
                                    <a href="#city_name">东凤镇</a>
                                    <a href="#city_name">东升镇</a>
                                    <a href="#city_name">民众镇</a>
                                    <a href="#city_name">沙朗镇</a>
                                    <a href="#city_name">沙溪镇</a>
                                    <a href="#city_name">坦洲镇</a>
                                    <a href="#city_name">坦背镇</a>
                                    <a href="#city_name">板芙镇</a>
                                    <a href="#city_name">阜沙镇</a>
                                    <a href="#city_name">神湾镇</a>
                                    <a href="#city_name">南头镇</a>
                                    <a href="#city_name">南朗镇</a>
                                    <a href="#city_name">浪网镇</a>
                                    <a href="#city_name">黄圃镇</a>
                                    <a href="#city_name">港口镇</a>
                                    <a href="#city_name">翠亨村镇</a>
                                    <a href="#city_name">横门镇</a>
                                    <a href="#city_name">横栏镇</a>
                                </dd>
                            </dl>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <img id="valicodeBox" src="CheckCodeAction?t=0"/>
                    <label for="valicode">
                        <input id="valicode" name="valicode" type="text" class="input-text-user noPic input-click" style="width: 235px" placeholder="验证码">
                    </label>
                </div>
                <div class="row tips">
                    <input id="checkBox" type="checkbox" name="agree" value="agree">
                    <label for="checkBox">
                        我已阅读并同意
                        <a href="#" target="_blank">隐私政策、服务条款</a>
                    </label>
                </div>
                <div class="row btnArea">
                    <a class="login-btn" id="submit">注册</a>
                </div>
            </form>
        </div>
        <div class="go-regist">
            已有帐号,请<a class="link" href="login.jsp">登录</a>
        </div>
    </div>

</div>

<%--加载进度条--%>
<div class="loading">
    <div class="mask">
        <div class="loading-img">
            <img width="24px" height="24px" src="../css/img/loading.gif">
        </div>
    </div>
</div>

<link href="../css/jquery-ui-1.10.4.custom.css" rel="stylesheet" property=""/>
<script src="${pageContext.request.contextPath}/js/jquery-1.10.2.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.ui.js"></script>
<script type="text/javascript">
    function myajax(url, data, callback) {
        $.ajax({
            url: url,
            type: "POST",
            datatype: "json",
            timeout: 3000,
            data: data,
            success: function (rdata, textStatus) {
                callback && callback(rdata);
                //var data = $.parseJSON(rdata);
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert(XMLHttpRequest + textStatus + errorThrown);
            }
        });
    }

    //远程验证
    function checkAccount(ele) {
        var obj = {
            url: 'businessreg',
            type: 'POST',
            data: {
                type: "check",
                account: function () {
                    return ele.val();
                }
            },
            dataType: "json",
            dataFilter: function (data, type) {
                //alert(data);
                var jsonObj = jQuery.parseJSON(data);
                ele.attr("title", jsonObj.msg);//设置信息
                ele.tooltip("open");//展开toolipsl
                return jsonObj.success;
            }
        };
        return obj;
    }

    $(document).ready(function () {
        //隐藏Loading
        $(".loading").hide();

        var btn_reg = $('#submit');

        var regform = $('#signupForm');//表单
        var phone = $('#phone');//手机
        var reg_email = $('#email');//邮箱控件
        var company = $('#company');//公司名称
//        var contact = $('#contact');//联系人
        var $valicode = $('#valicode');

        //验证码箱子被点击就刷新
        var $valicodeBox = $('#valicodeBox');
        $valicodeBox.click(function () {
            $valicodeBox.attr("src", "CheckCodeAction?t=" + Math.random());
        });

        //城市选择
        var btn_citydrop = $('#city_dropdown');//下拉按钮
        var list_drop = $('#city_droplist');//城市下拉列表
        var city_name = $('#city_name');//显示选中的城市名字
        btn_citydrop.click(function () {
            list_drop.slideToggle();
        });
        list_drop.find('.search_hotList').find('a').click(function () {
            city_name.text($(this).text());//地区选择后改变显示选择的地区
        });
        list_drop.mouseleave(function () {
            list_drop.slideUp();
        });

        //注册按钮被点击++++
        btn_reg.click(function () {
            if (btn_reg.text().indexOf("成功") > -1) {
                alert("注册成功不能重复注册！");
            } else {
                regform.submit();
            }
        });

        //tooltips自动提示
        var tooltipdata = {
            show: {
                effect: "slideDown",
                delay: 250
            },
            hide: {
                effect: "explode",
                delay: 250
            },
            position: {
                my: "center bottom-20",
                at: "center top"
            }
        };
        company.tooltip(tooltipdata);
        reg_email.tooltip(tooltipdata);
        phone.tooltip(tooltipdata);
        //失去焦点时候自动验证
//        reg_name.blur(function () {
//            reg_name.valid();
//        });
//        reg_email.blur(function () {
//            reg_email.valid();
//        });
//        company.blur(function () {
//            company.valid();
//        });


        //label淡入淡出效果
        var inputs = regform.find("input");
        inputs.focus(function () {
            $(this).prevAll("label").fadeOut();//input前面的label淡出
        });
        inputs.blur(function () {
            var $this = $(this);
            if (!$this.val()) {//如果input没有值就在显示label
                $(this).prevAll("label").fadeIn();
            }
        });

        //表单验证
        regform.validate({
            //提交按钮被点击后执行的函数,需要验证成功
            submitHandler: function (form) {
                toReg();
            },
            onkeyup: false,
            rules: {
                pwd: {
                    required: true,
                    rangelength: [5, 20]
                },
                pwd2: {
                    required: true,
                    equalTo: "#pwd"
                },
                email: {
                    required: true,
                    email: true,
                    remote: checkAccount(reg_email)
                },
                agree: {
                    required: true
                },
                valicode:{
                    required:true,
                    remote:{
                        url: 'businessreg',
                        type: 'POST',
                        data: {
                            type: "valicode",
                            valicode: function () {
                                return $valicode.val();
                            }
                        },
                        dataType: "json",
                        dataFilter: function (data, type) {
                            var jsonObj = jQuery.parseJSON(data);
                            return jsonObj.success;
                        }
                    }
                }
            },
            messages: {
                pwd: {
                    required: "需要填写密码",
                    rangelength: "密码长度要在5到20字符"
                },
                pwd2: {
                    required: "需要填写重复密码",
                    equalTo: "两次输入的密码不相同"
                },
                email: {
                    required: "需要邮箱",
                    email: "邮箱格式不正确！",
                    remote: "邮箱已经存在"
                },
                phone: {
                    required: "手机不得为空！",
                    iphone: "请输入正确的手机号吧",
                    remote: "手机已经被注册"
                },
                contact: {//联系人
                    required: "联系人不能为空",
                    cn_name: "名字必须包含中文"
                },
                company: {//联系人
                    required: "公司名称不能为空",
                    minlength: "不能少于2汉字",
                    cn_name: "公司名称必须包含中文",
                    remote: "公司名称已经被注册"
                },
                agree: {
                    required: "请同意条款"
                },
                valicode:{
                    required:"验证码不能为空",
                    remote:"验证码不正确！"
                }
            }
        });

        //验证中文名称
        $.validator.addMethod("cn_name", function (value, element) {
            var cn_name = /^[a-zA-Z0-9]*[\u4E00-\u9FA5\uF900-\uFA2D]+[a-zA-Z0-9]*$/;
            return this.optional(element) || (cn_name.test(value));
        });
        //验证手机方法
        $.validator.addMethod('iphone', function (value, element) {
            var tel = /^[1][358][0-9]{9}$/;
            return this.optional(element) || (tel.test(value));
        });

        //正则表达式验证手机
        phone.rules('add', {
            required: true,
            iphone: true,
            remote: checkAccount(phone)
        });
        //验证中文名
//        contact.rules('add', {//联系人
//            required: true,
//            cn_name: true
//        });
        company.rules('add', {
            required: true,
            minlength: 2,
            cn_name: true,
            remote: checkAccount(company)
        });

        //邮箱自动填充完整，需要jquery的ui的css
        reg_email.autocomplete({
            delay: 0,
            autoFocus: true,
            source: function (request, response) {
                var hosts = ['qq.com', '163.com', '263.com', 'sina.com.cn', 'gmail.com', 'hotmail.com'],
                        term = request.term,		//获取用户输入的内容
                        name = term,				//邮箱的用户名
                        host = '',					//邮箱的域名
                        ix = term.indexOf('@'),		//@的位置
                        result = [];				//最终呈现的邮箱列表
                result.push(term);
                //当有@的时候，重新分别用户名和域名
                if (ix > -1) {
                    name = term.slice(0, ix);
                    host = term.slice(ix + 1);
                }
                if (name) {
                    //如果用户已经输入@和后面的域名，
                    //那么就找到相关的域名提示，比如bnbbs@1，就提示bnbbs@163.com
                    //如果用户还没有输入@或后面的域名，
                    //那么就把所有的域名都提示出来
                    var findedHosts = (host ? $.grep(hosts, function (value, index) {
                        return value.indexOf(host) > -1
                    }) : hosts);
                    var findedResult = $.map(findedHosts, function (value, index) {
                        return name + '@' + value;
                    });
                    //数组连接
                    result = result.concat(findedResult);
                }
                response(result);
            }
        });

        //提交注册申请
        function toReg() {
            //暂时禁用提交按钮
            btn_reg.attr("disabled", true);
            btn_reg.text("提交中……");

//方式一  构造formdata
//        processData: false,
//        var theform=document.getElementById("signupForm");
//        var newFormData = new FormData(theform);
//        newFormData.append("address","weituotian");

            var data = {
                type: "reg",
                address: city_name.text()
            };
            //提取表单中字段
            var theform = document.getElementById("signupForm");
            for (var i = 0; i < theform.length; i++) {
                data[theform[i].name] = theform[i].value;
            }
            console.log(data);

            myajax("businessreg", data, function (data) {
                //回调函数
                if (data.success) {
                    //成功
                    btn_reg.text("注册成功");
                } else {
                    btn_reg.attr("disabled", false);
                    btn_reg.text("重新注册");
                }
            });
        }

    });

</script>

</body>

</html>
