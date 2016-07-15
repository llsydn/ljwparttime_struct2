<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="lyw.itcast.domain.User"%>
<%@ page import="java.net.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>个人信息</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.ui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.cookie.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/personjs/personal.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui-1.10.4.custom.css" type="text/css" />
<link rel="shortcut icon" type="image/x-icon" href="../img/job.ico" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/personcss/mypersonal.css">
</head>
<body>

	<div id="header">
		<div id="header_content">
			<p class="image">
				<img src="${pageContext.request.contextPath}/img/job.ico" id="left_touxiang">
			</p>
			<div id="touxiang">
				<c:if test="${user.imageurl==null}">
					<a href="${pageContext.request.contextPath}/person/personalimage.jsp">
					<img alt="点击修改个人头像" title="点击修改头像" src="${pageContext.request.contextPath}/img/touxiang_default.gif" id="right_touxiang">
					</a>
				</c:if>
				<c:if test="${user.imageurl!=null}">
					<a href="${pageContext.request.contextPath}/person/personalimage.jsp">
					<img alt="点击修改个人头像" title="点击修改头像" src="${pageContext.request.contextPath}/${user.imageurl}" id="right_touxiang">
					</a>
				</c:if>
			</div>
			<a href="javascript:void(0)" id="logout">|退出</a> <a
				href="javascript:void(0)" id="member">用户</a>
		</div>
	</div>

	<div id="content">
		<div id="content_left">
			<dl>
				<dt id="myself">
					<span>个人中心</span>
				</dt>

				<dd class='text'>
					<a href="${pageContext.request.contextPath}/person/summary.jsp">概况</a>
				</dd>

				<dd class='text' id='myinfo'>
					<h>
					<a href="${pageContext.request.contextPath}/person/personal.jsp"
						id="myselfinfo" class="information">我的信息</a></h>
					<p>
					<% //获取到用户名。防止中文乱码的问题
			            String info = "";
			            Cookie[] cook = request.getCookies();
			            if (cook != null) {
			                for (int i = 0; i < cook.length; i++) {
			                    if (cook[i].getName().equals("username")) {
			                        info = cook[i].getValue();
			                    }
			                }
			            }
            			info = URLDecoder.decode(info, "utf-8"); 
       				 %>
					<a href='UserinfoAction?username=${cookie.username.value}'
							id="gereninfo">个人信息</a>
					</p>
					<p>
						<a href='${pageContext.request.contextPath}/person/userimage.jsp'>个人头像</a>
					</p>
					<p>
						<a
							href='${pageContext.request.contextPath}/person/personalimage.jsp'>修改头像</a>
					</p>
				</dd>

				<dd class='text'>
					<span><a href='${pageContext.request.contextPath}/person/resume.jsp'>我的简历</a></span>
				</dd>

				<dd class='text'>
					<a href="${pageContext.request.contextPath}/UserMessageAction?user_id=${user.user_id}" id="request">兼职申请</a>
				</dd>

				<dd class='text'>
					<a href="${pageContext.request.contextPath}/UserBusinessAction?user_id=${user.user_id}">个人收藏</a>
				</dd>

				<dd class='text'>
					<a href="${pageContext.request.contextPath}/person/personalsafety.jsp">帐号安全</a>
				</dd>
			</dl>
		</div>

		<div id="content_right">
			<div id="content_right_header">
				<img alt="个人" src="${pageContext.request.contextPath}/img/personal.ico"> 
				<span>基本信息</span>
			</div>

			<form id="personinfo" method="post" action="#">
				<ul class="reg_error"></ul>
				<p>
					<label for="username">帐号：</label> <input type="text"
						name="username" class="text" id="username" title="请输入帐号，不少于6位"
						value="${user.username}" /> <span>*</span>
				<p class="ti_shi">您的登录帐号</p>
				</p>
				<p>
					<label for="password">密码：</label> <input type="password"
						name="password" class="text" id="password" title="请输入密码，不少于6位"
						value="${user.password}" /> <span>*</span>
				<p class="ti_shi">您的登录密码</p>
				</p>
				<p>
					<label for="email">邮箱：</label> <input type="text" name="email"
						class="text" id="email" title="请输入正确的邮箱！" value="${user.email}" />
					<span>*</span>
				<p class="ti_shi">您的邮箱帐号</p>
				</p>
				<p>
					<label for="iphone">手机：</label> <input type="text" name="iphone"
						class="text" id="iphone" title="请输入正确的手机号！" value="${user.iphone}" />
					<span>*</span>
				<p class="ti_shi">您的手机号</p>
				</p>
				<p id="sub_xiugai">
					<input type="submit" value="保存" id="xiugai" />
				</p>
			</form>

		</div>

	</div>
	<div id="loading">数据交互中...</div>
	<%--末尾--%>
	<jsp:include page="../include/footer.jsp" />
	

</body>