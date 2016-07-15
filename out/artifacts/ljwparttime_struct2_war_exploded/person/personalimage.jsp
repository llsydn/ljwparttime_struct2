<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>修改个人头像</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.cookie.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/personjs/personalimage.js"></script>
<link rel="shortcut icon" type="image/x-icon" href="../img/job.ico" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/personcss/personalimage.css">
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
					<a class="information" id="myselfinfo"
						href="${pageContext.request.contextPath}/person/personal.jsp">我的信息</a></h>
					<p>
						<a href='UserinfoAction?username=${cookie.username.value}'>个人信息</a>
					</p>
					<p>
						<a href='${pageContext.request.contextPath}/person/userimage.jsp'>个人头像</a>
					</p>
					<p>
						<a href='${pageContext.request.contextPath}/person/personalimage.jsp' id="changimage">修改头像</a>
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
				<span>修改个人头像</span>
			</div>
			<div id="photo">
				<!--当前照片-->

				<div id="curruntpic">
					<div class="title">
						<b>当前照片</b>
					</div>
					<div id="photocontainer">
						<s:if test="#session.user.imageurl!=null">
							<img src="../${sessionScope.user.imageurl}"
								style="border-width:1px;" width="120px" height="120px">
						</s:if>
						<s:if test="#session.user.imageurl==null">
							<img id="imgphoto" src="../img/man.GIF" style="border-width:1px;"
								width="120px" height="120px" />
						</s:if>
					</div>
				</div>


				<form name="form1" method="post"
					action="upload?username=${cookie.username.value}" id="form1"
					enctype="multipart/form-data">

					<!--Step 1-->
					<div id="selectphoto">
						<div class="title">
							<b>更换照片</b>
						</div>
						<div id="uploadcontainer">
							<div class="uploadtooltip">请选择新的照片文件，文件需小于2.5MB</div>
							<div class="uploaddiv">
								<input type="file" name="myFile" id="fuPhoto" title="修改照片">点击这里上传头像
								<span class="showFileName"></span>
							</div>
							<div>
								<input type="submit" value="上 传" id="btnUpload" />
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<%--末尾--%>
	<jsp:include page="../include/footer.jsp" />
	
</body>