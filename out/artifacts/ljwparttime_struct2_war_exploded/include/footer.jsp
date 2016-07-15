<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
#footer{
 	position:fixed; 
 	bottom:0;
	width: 100%;
	height: 50px;
	margin: 0 auto;
	background: rgb(245, 245, 245);
	text-align: center;
	font-size: 16px;
	line-height: 50px;
	background:#abcdef;
}
#footer a {
	text-decoration: none;
	color: #555;
	font-size: 16px;
}
</style>
</head>
<div id="footer">
	<a href="${pageContext.request.contextPath}/connect/aboutus.html">关于我们 | </a> 
	<a href="${pageContext.request.contextPath}/connect/connectus.html">联系我们 | </a> 
	<a href="${pageContext.request.contextPath}/connect/copyright.html">隐私和版权 |</a> 
	<a href="javascript:void(0)">&copy;ljwparttime</a>
</div>
</html>