<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.net.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>兼职申请</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.cookie.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/personjs/summary.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/personcss/personrequest.css">
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/img/job.ico" />
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

				<dd class='text' id='summary'>
					<a href="${pageContext.request.contextPath}/person/summary.jsp">概况</a>
				</dd>

				<dd class='text'>
					<a href='${pageContext.request.contextPath}/person/personal.jsp'
						id="myselfinfo">我的信息</a>
				</dd>

				<dd class='text'>
					<span><a
						href='${pageContext.request.contextPath}/person/resume.jsp'>我的简历</a></span>
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
				<img alt="个人" src="${pageContext.request.contextPath}/img/resume2.ico"> 
				<span>您申请过的兼职信息...</span>
			</div>
			<div id="content_body" style="height:600px">
				<table class="reqtable">
					<caption>兼职申请记录</caption>
					<tr>
						<th>兼职类型</th>
						<th>兼职标题</th>
						<th>商家名称</th>
						<th>申请时间</th>
						<th>操作</th>
					</tr>
					<c:forEach var="page" items="${page.list}" varStatus="status">
					<tr>
						<td>${page.commodity_name}</td>
						<td>${page.title}</td>
						<td>${page.name}</td>
						<td>${page.apply_time}</td>
						<td><a href="DeleteMessageAction?user_id=${page.user_id}&message_id=${page.message_id}" onClick="return confirm('确认要删除?')" id="delete_message">删除 </a></td>
					</tr>
					</c:forEach>
				</table>
				<%--  --%>
				<div id="page" style="text-align:center;margin:10px;">
					<!-- 分页 -->
					<jsp:include page="../public/page.jsp"/> 
				</div>
			</div>
		</div>
	</div>
	<%--末尾--%>
	<jsp:include page="../include/footer.jsp" />
	
</body>