<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="lyw.itcast.domain.User"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>头像裁剪</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.cookie.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/personjs/userimage.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.Jcrop.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.Jcrop.min.css" type="text/css" />
<link rel="shortcut icon" type="image/x-icon" href="../img/job.ico" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/personcss/userimage.css">
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
						<a href="${pageContext.request.contextPath}/person/personal.jsp" id="myselfinfo" class="information">我的信息</a>
					</h>
					<p>
						<a href='UserinfoAction?username=${cookie.username.value}' id="gereninfo">个人信息</a>
					</p>
					<p>
						<a href='${pageContext.request.contextPath}/person/userimage.jsp' id="userimage">个人头像</a>
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
				<span>个人头像</span>
			</div>

			<div id="select">
				<p>原图:你可以对头像进行剪切,然后保存</p>

				<s:if test="#session.user.imageurl!=null">
					<img src="../${sessionScope.user.imageurl}" id="target" alt="" />
				</s:if>
				<s:if test="#session.user.imageurl==null">
					<img id="imgphoto" src="../img/man.GIF" id="target" alt="" />
				</s:if>


			</div>

			<p class="pre">头像预览</p>
			<div
				style="width:100px;height:100px;overflow:hidden; border:1px solid gray;"
				id="previewdiv">
				<s:if test="#session.user.imageurl!=null">
					<img src="../${sessionScope.user.imageurl}" alt="" id="preview" />
				</s:if>
				<s:if test="#session.user.imageurl==null">
					<img id="imgphoto" src="../img/man.GIF" alt="" id="preview" />
				</s:if>
			</div>
			<p class="intro">头像100*100</p>
			<div id="submit">
				<form action="cutPic?username=${cookie.username.value}"
					method="post">
					点击确定 <input type="hidden" name="image.x" id="x" /> <input
						type="hidden" name="image.y" id="y" /> <input type="hidden"
						name="image.width" id="w" /> <input type="hidden"
						name="image.height" id="h" /> <input type="submit" value="保存头像"
						id="sure" />
				</form>
			</div>
		</div>
	</div>
	<%--末尾--%>
	<jsp:include page="../include/footer.jsp" />
	

</body>