<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商家忘记密码</title>
</head>
<style>
    .mainform{
        margin: auto;
        width: 600px;
    }
    .mainform .textinput{
        width:350px;
        -webkit-border-radius:6px;
        -moz-border-radius:6px;
        border-radius:6px;
        margin:0;
        padding:6px;
        -webkit-box-shadow:rgb(241, 255, 230) -4px 5px 2px 0;
        -moz-box-shadow:rgb(241, 255, 230) -4px 5px 2px 0;
        box-shadow:rgb(241, 255, 230) -4px 5px 2px 0;
        text-align:left;
        font-family:\u9ED1\u4F53,sans-serif;
        background-color:rgb(254, 255, 235);
    }
    .mainform .btn{
        width:350px;
        -webkit-border-radius:4px;
        -moz-border-radius:4px;
        border-radius:4px;
        border:2px solid rgb(237, 83, 101);
        font-family:\u9ED1\u4F53,sans-serif;
        font-size:17px;
        padding:4px;
        margin:5px;
        color:rgb(153, 133, 255);
        background: rgba(227, 200, 200, 0.890196) 5% 11%;
    }
</style>
<body>
<%--//主要div--%>
<div class="mainform">
    <form id="requestform">
        <div>
            <input type="text" name="email" id="email" placeholder="请输入邮箱" class="textinput" style="width: 350px">
        </div>
        <div>
            <img src="CheckCodeAction?t=0" id="valicodeBox">
            <input type="text" name="valicode" id="valicode" placeholder="请输入验证码" class="textinput" style="width:200px;">
        </div>
        <div>
            <input class="btn" type="button" value="提交" id="submit" style="width: 350px">
        </div>
    </form>
</div>


<link href="../css/jquery-ui-1.10.4.custom.css" rel="stylesheet" property=""/>
<script src="${pageContext.request.contextPath}/js/jquery-1.10.2.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.ui.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        //表单
        var $requestform = $('#requestform');
        //验证码
        var $valicode = $('#valicode');
        //邮件
        var $email = $('#email');
        //提交按钮
        var $submit = $('#submit');
        $submit.click(function () {

        });

        $requestform.validate({
            onkeyup: false,
            rules:{
                email:{
                    required:true,
                    email:true,
                    remote:{
                        url: 'businessreg',
                        type: 'POST',
                        data: {
                            type: "check",
                            account: function () {
                                return $email.val();
                            }
                        },
                        dataType: "json",
                        dataFilter: function (data, type) {
                            var jsonObj = jQuery.parseJSON(data);
                            return !jsonObj.success;
                        }
                    }
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
            messages:{
                email:{
                    required:"请输入注册邮箱",
                    email:"请输入正确的邮箱",
                    remote:"该邮箱不存在，无法找回密码！"
                },
                valicode:{
                    required:"请输入验证码",
                    remote:"验证码不正确"
                }
            }
        });

        //验证码箱子被点击就刷新
        var $valicodeBox = $('#valicodeBox');
        $valicodeBox.click(function () {
            $valicodeBox.attr("src", "CheckCodeAction?t=" + Math.random());
        });

        //邮箱自动填充完整，需要jquery的ui的css
        $email.autocomplete({
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
    });
</script>
</body>
</html>
