<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!-- 整合了分类和分类下的兼职信息 -->

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<div style="position:relative">
	<div style="float: left;width:200px">
		<s:action name="findAllCommodity" executeResult="true" namespace="/" />
	</div>
	<div style="float: left;left:200px;position:absolute">
		<jsp:include page="messageList.jsp"/>
	</div>
</div>

<!-- 包括分页的js代码 -->
<!-- 分页条插件 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-page5.js"></script>
<!-- 分页代码 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/pagetest1.js"></script>




