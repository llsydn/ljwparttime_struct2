<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ page import="java.net.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>创建简历</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.ui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.cookie.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/personjs/createresume.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui-1.10.4.custom.css" type="text/css" />
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/img/job.ico" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/personcss/createresume.css">
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
					<a href='${pageContext.request.contextPath}/person/personal.jsp'
						id="myselfinfo">我的信息</a>
				</dd>

				<dd class='text' id="resume">
					<span><a
						href='${pageContext.request.contextPath}/person/resume.jsp'>我的简历</a></span>
					<p>
						<a href="${pageContext.request.contextPath}/ShowresumeAction?username=${cookie.username.value}">查看简历</a>
					</p>
					<p>
						<a href='#' id="createresume">创建简历</a>
					</p>
					<!-- UserresumeAction -->
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
				<img alt="简历" src="${pageContext.request.contextPath}/img/jianli.png"> 
				<span>您正在创建简历...</span>
			</div>

			<s:form id="resumeinfo" method="post" action="UserresumeAction_addresume">
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
				<input type="hidden" value="<%=info%>" name="username">
				<table id="resumetable"
					class="table table-border table-bordered table-hover">
					<tr>
						<td>简历标题*</td>
						<td><input type="text" name="title" id="title"
							placeholder="例:求职销售 2年经验" value="${user_resume.title}"/></td>
					</tr>
					<tr>
						<td>姓名*</td>
						<td><input type="text" name="name" id="name"
							placeholder="您的真实姓名" value="${user_resume.name}"/></td>
					</tr>
					<tr id="sexselect">
						<td>性别*</td>
						<td><input type="radio" name="sex" value="male" id="male"
							checked="checked"><label for="male">男</label></input> <input
							type="radio" name="sex" value="female" id="female"><label
							for="female">女</label></input></td>
					</tr>
					<tr>
						<td>年龄</td>
						<td><input type="text" name="age" id="age"
							placeholder="请输入您真实的年龄" value="${user_resume.age}"/></td>
					</tr>
					<tr>
						<td>邮箱*</td>
						<td><input type="text" name="email" id="email"
							placeholder="请输入您的邮箱(验证)" value="${user_resume.email}"/></td>
					</tr>
					<tr>
						<td>期望薪水</td>
						<td><input type="text" name="salary" id="salary"
							placeholder="请输入您期望的薪水(元)" value="${user_resume.salary}"/></td>
					</tr>
					<tr id="experience">
						<td>兼职经历</td>
						<td><textarea placeholder="说出您的经历，可以加分的哟!" name="experience">${user_resume.experience}</textarea>
						</td>
					</tr>
					<tr id="relf">
						<td>自我介绍*</td>
						<td><textarea placeholder="说出您的亮点，可以提高15%的简历下载机会哦!"
								name="introduction" id="introduction">${user_resume.introduction}</textarea></td>
						<!-- 拦截器 -->
						<s:token></s:token>
					</tr>
					<tr>
						<td><input type="submit" value="保存" id="send"/></td>
						<td><input type="reset" value="重置" id="reset"/></td>
					</tr>
				</table>
			</s:form>

		</div>

	</div>
	<div id="loading">数据交互中...</div>

	<%--末尾--%>
	<jsp:include page="../include/footer.jsp" />

</body>