<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Signin Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/admin/css/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <style>
        body {
            padding-top: 40px;
            padding-bottom: 40px;
            background-color: #eee;
        }

        .form-signin {
            max-width: 330px;
            padding: 15px;
            margin: 0 auto;
        }

        .form-signin .form-signin-heading,
        .form-signin .checkbox {
            margin-bottom: 10px;
        }

        .form-signin .checkbox {
            font-weight: normal;
        }

        .form-signin .form-control {
            position: relative;
            height: auto;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            padding: 10px;
            font-size: 16px;
        }

        .form-signin .form-control:focus {
            z-index: 2;
        }

        .form-signin input[type="email"] {
            margin-bottom: -1px;
            border-bottom-right-radius: 0;
            border-bottom-left-radius: 0;
        }

        .form-signin input[type="password"] {
            margin-bottom: 10px;
            border-top-left-radius: 0;
            border-top-right-radius: 0;
        }
    </style>
</head>

<body>

<div class="container">

    <form class="form-signin" action="adminLogin.action" method="post">
        <h2 class="form-signin-heading">管理员请登录</h2>
        <label for="inputEmail" class="sr-only">用户名:</label>

        <input name="name" type="text" id="inputEmail" class="form-control" placeholder="请输入管理员用户名" required autofocus value="<s:property value="name"/>">
        <label for="inputPassword" class="sr-only">密码:</label>
        <input name="pwd" type="password" id="inputPassword" class="form-control" placeholder="请输入管理员密码" required>
        <%--<div class="checkbox">--%>
            <%--<label>--%>
                <%--<input type="checkbox" value="remember-me"> 记住我--%>
            <%--</label>--%>
        <%--</div>--%>
        <%--隐藏的表单元素--%>
        <input type="hidden" value="login" name="type">
        <button class="btn btn-lg btn-primary btn-block" id="btn_login" type="submit">
            <s:if test="msg!=null">
                <s:property value="msg"/>
            </s:if>
            <s:else>
                登录
            </s:else>
        </button>
    </form>

</div> <!-- /container -->

<script src="${pageContext.request.contextPath}/js/jquery-1.10.2.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        var $btn_login = $('#btn_login');
        $btn_login.click(function () {
            //登录按钮被点击

        });
    });
</script>
</body>
</html>
