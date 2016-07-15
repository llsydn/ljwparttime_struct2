<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>个人中心页</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.ui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.cookie.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/personjs/personal.js"></script>
<link rel="shortcut icon" type="image/x-icon" href="../img/job.ico" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/personcss/personal.css">
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
					<a class="information" id="myselfinfo">我的信息</a></h>
					<p>
						<a href='UserinfoAction?username=${cookie.username.value}'>个人信息</a>
					</p>
					<p>
						<a href='${pageContext.request.contextPath}/person/userimage.jsp'>个人头像</a>
					</p>
					<p>
						<a href='${pageContext.request.contextPath}/person/personalimage.jsp'>修改头像</a>
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
				<span>这是个人中心页</span>
			</div>
			<div id="function">
				<ul>
					<li id="functionintro"><img alt="功能"
						src="${pageContext.request.contextPath}/img/person.ico">个人介绍</li>
					<li>在这里您可以完善您的个人信息</li>
					<li>上传头像和创建简历信息可以帮您更好地找到一份好的兼职</li>
				</ul>
			</div>
	
		</div>

	</div>
	<%--末尾--%>
	<jsp:include page="../include/footer.jsp" />
</body>