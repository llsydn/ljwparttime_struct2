<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>兼职招聘网</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.ui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.cookie.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/index.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui-1.10.4.custom.css" type="text/css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css" />
<link rel="shortcut icon" type="image/x-icon" href="img/job.ico" />
</head>
<body>


	<div id="header">
		<div class="header_main">
			<img src="${pageContext.request.contextPath}/img/job.ico"
				class="work" /> <span>兼职招聘网</span>
			<div class="header_member">
				<a href="javascript:void(0)" id="reg_a">注册</a> 
				<a href="javascript:void(0)" id="member">用户</a> | 
				<a href="javascript:void(0)" id="login_a">登录</a> 
				<a href="javascript:void(0)" id="logout">退出</a> 
				<a href="javascript:void(0)" id="personal">个人中心</a>
			</div>
		</div>
	</div>


	<form id="reg" title="用户注册" method="post">
		<ol class="reg_error"></ol>
		<p>
			<label for="username">帐号：</label> <input type="text" name="username"
				class="text" id="username" title="请输入帐号，不少于6位！" /> <span
				class="star">*</span>
		</p>
		<p>
			<label for="password">密码：</label> <input type="password"
				name="password" class="text" id="password" title="请输入密码，不少于6位！" /> <span
				class="star">*</span>
		</p>
		<p>
			<label for="email">邮箱：</label> <input type="text" name="email"
				class="text" id="email" title="请输入正确的邮箱！" /> <span class="star">*</span>
		</p>
		<p>
			<label for="iphone">手机：</label> <input type="text" name="iphone"
				class="text" id="iphone" title="请输入正确的手机号！" /> <span class="star">*</span>
		</p>
		<p>
			<label>性别：</label> <input type="radio" name="sex" value="male"
				id="male" checked="checked"><label for="male">男</label></input> <input
				type="radio" name="sex" value="female" id="female"><label
				for="female">女</label></input>
		</p>
	</form>

	<form id="login" title="会员登录" action="#">
		<ol class="login_error"></ol>
		<p>
			<label for="login_user">用户名：</label> <input type="text"
				name="login_user" class="text" id="login_user" /> <span
				class="star">*</span>
		</p>
		<p>
			<label for="login_pass" id="pass">密&nbsp;&nbsp;&nbsp;码：</label> <input
				type="password" name="login_pass" class="text" id="login_pass" /> <span
				class="star">*</span>
		</p>
		<p>
			<label for="checkcode">验证码：</label> <input type="text"
				name="checkcode" class="text" id="checkcode" /> 
			<img src="CheckCodeAction" onclick="this.src='CheckCodeAction'" alt="请点击刷新验证码" style="cursor: pointer;"/>
		</p>
		<p>
			<span style="margin-left:45px;">
				<input type="checkbox" name="expires" id="expires" checked="checked" />
				<label for="expires">登录后有效期一周</label>
			</span>
		</p>
		<span style="margin-left:210px;"><a href="${pageContext.request.contextPath}/forgotpwd/forgotpwd.jsp" style="text-decoration:none;">忘记密码?</a></span>
	</form>

	<div id="loading">数据交互中...</div>
	<div id="error">请登录后操作...</div>


	<div id="banner">
		<div id="banner_search">
			<input type="text" name="search" id="search" />
			<button id="search_button">搜索</button>
		</div>
		<div id="banner_footer">
			<a href="javascript:void(0)">家教</a> <a href="javascript:void(0)">服务员</a>
			<a href="javascript:void(0)">临时工</a> <a href="javascript:void(0)">钟点工</a>
		</div>
	</div>

	<div id="content">
		<%--显示兼职分类的DIV--%>
		<jsp:include page="include/Message.jsp" />
	</div>

	<%--末尾--%>
	<jsp:include page="include/footer.jsp" />

</body>
</html>
