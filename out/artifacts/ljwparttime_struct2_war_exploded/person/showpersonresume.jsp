<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>个人简历信息</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.ui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.cookie.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/personjs/showpersonresume.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui-1.10.4.custom.css" type="text/css" />
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/img/job.ico" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/personcss/showpersonresume.css">
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
		<div id="content_right">
			<div id="content_right_header">
				<span>您创建的简历信息如下...</span>  
				<span><a href="${pageContext.request.contextPath}/person/showresume.jsp">(点击这里返回上一层)</a></span>
			</div>
			
			<table id="resumetable"
				class="table table-border table-bordered table-hover">
				<tr>
					<td>简历标题*</td>
					<td><input type="text" name="title" id="title" value="${user_resume.title}" readonly/></td>
				</tr>
				<tr>
					<td>姓名*</td>
					<td><input type="text" name="name" id="name" value="${user_resume.name}" readonly/></td>
				</tr>
				<tr id="sexselect">
					<td>性别*</td>
					<td>
						<c:if test="${user_resume.sex=='male'}">
							<input type="radio" name="sex" value="male" id="male" <c:if test="${user_resume.sex=='male'}">checked</c:if>><label for="male">男</label></input> 
						</c:if>
						<c:if test="${user_resume.sex=='female'}">
							<input type="radio" name="sex" value="female" id="female" <c:if test="${user_resume.sex=='female'}">checked</c:if>><label for="female" readonly=true>女</label></input>
						</c:if>
					</td>
				</tr>
				<tr>
					<td>年龄</td>
					<td><input type="text" name="age" id="age" value="${user_resume.age}" readonly/></td>
				</tr>
				<tr>
					<td>邮箱*</td>
					<td><input type="text" name="email" id="email" value="${user_resume.email}" readonly/></td>
				</tr>
				<tr>
					<td>期望薪水</td>
					<td><input type="text" name="salary" id="salary" value="${user_resume.salary}" readonly/></td>
				</tr>
				<tr id="experience">
					<td>兼职经历</td>
					<td><textarea name="experience" readonly>${user_resume.experience}</textarea>
					</td>
				</tr>
				<tr id="relf">
					<td>自我介绍*</td>
					<td><textarea name="introduction" id="introduction" readonly>${user_resume.introduction}</textarea></td>
				</tr>
			</table>
		</div>

	</div>
	<%--末尾--%>
	<jsp:include page="../include/footer.jsp" />

</body>