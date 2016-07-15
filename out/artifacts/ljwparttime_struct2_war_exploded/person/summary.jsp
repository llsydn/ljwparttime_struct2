<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.net.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>个人中心</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.cookie.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/personjs/summary.js"></script>
<link rel="shortcut icon" type="image/x-icon" href="../img/job.ico" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/personcss/summary.css">
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
				<img alt="个人" src="${pageContext.request.contextPath}/img/account_.ico"> 
				<span>基本信息</span>
			</div>

			<div style="color:green;text-align:center;font-size:20px;line-height:100px;background:#abcdef">
				<p>欢迎来到个人中心，这是您的个人信息首页</p>
				<div id="left_body">
					<c:if test="${user.imageurl==null}">
						<a href="${pageContext.request.contextPath}/person/personalimage.jsp">
						<img alt="点击修改个人头像" src="${pageContext.request.contextPath}/img/touxiang_default.gif">
						</a>
					</c:if>
					<c:if test="${user.imageurl!=null}">
						<a href="${pageContext.request.contextPath}/person/personalimage.jsp">
						<img alt="点击修改个人头像" src="${pageContext.request.contextPath}/${user.imageurl}">
						</a>
					</c:if>
				</div>
				<div id="right_body">
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
        			<a><%=info%></a> &frasl;
        			<a>${user.email}</a> &frasl;
        			<a id="mobilephone">${user.iphone}</a>
				</div>
			</div>
		</div>
	</div>
	<%--末尾--%>
	<jsp:include page="../include/footer.jsp" />
	
</body>