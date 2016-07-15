<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>个人简历</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.ui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.cookie.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/personjs/resume.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui-1.10.4.custom.css" type="text/css" />
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/img/job.ico" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/personcss/showresume.css">
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
					<span><a class="myinfo" href="${pageContext.request.contextPath}/person/resume.jsp">我的简历</a></span>
					<p>
						<a href="${pageContext.request.contextPath}/ShowresumeAction?username=${cookie.username.value}" id="showresume">查看简历</a>
					</p>
					<p>
						<c:if test="${user.resumecount!=6}">
							<a href='${pageContext.request.contextPath}/person/createresume.jsp'>创建简历</a>
						</c:if>
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
				<span>您创建过的简历...</span>
			</div>

			<div id="function">
				<table border='1' class="resumtable">
					<tr>
						<th>简历名称</th>
						<th>类型</th>
						<th>下载浏览</th>
						<th>完整度</th>
						<th>创建时间</th>
						<th>操作</th>
					</tr>
					<s:iterator value="#session.list" id="resume" status="st">
					<tr>
						<td>
							<a href="dasdsa?resume_id=<s:property value="#resume.resume_id"/>">
								<s:property value="#resume.title"/>
							</a>
						</td>
						<td>兼职</td>
						<td>0/0</td>
						<td><!--主要作为一个温度计-->
							<meter min="0" max="10" value="<s:property value="#resume.percent"/>"></meter>
							${resume.percent}0%
						</td>
						<td>
							<%-- <s:property value="#resume.create_time"/> --%>
							<s:date name="#resume.create_time" format="yyyy-MM-dd"/>
						</td>
						<td>
							<a href="ShowpersonresumeAction_update?resume_id=<s:property value="#resume.resume_id"/>">修改 </a>
							<a href="ShowpersonresumeAction?resume_id=<s:property value="#resume.resume_id"/>">预览 </a>
							<a href="DeleteresumeAction?resume_id=<s:property value="#resume.resume_id"/>"  onClick="return confirm('确认要删除?')">删除 </a>
						</td>
					</tr>	
					</s:iterator>
					<tr>
						<td colspan="3">共可以创建<span style="color:red">6</span>份简历,您已创建了<span style="color:red">${user.resumecount}</span>份</td>
						<td colspan="3">
							<c:if test="${user.resumecount!=6}">
								<a href='${pageContext.request.contextPath}/person/createresume.jsp'>创建简历</a>
							</c:if>
							<c:if test="${user.resumecount==6}">
								<a href='javascript:void(0)' style="text-decoration:none;">对不起您最多只能创建6份简历</a>
							</c:if>
						</td>
					</tr>
				</table>
			</div>
		</div>

	</div>
	<div id="loading">数据交互中...</div>
	<%--末尾--%>
	<jsp:include page="../include/footer.jsp" />
	

</body>