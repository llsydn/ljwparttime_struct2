<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>重新设置密码</title>
<style type="text/css">
	body{
		background:url(${pageContext.request.contextPath}/img/password-bg.jpg);
		background-image:50%;
	}
	.text{
		border: medium none;
		border-radius: 6px;
		color: #333;
		font-family: "Microsoft YaHei",Verdana,Arial;
		font-size: 14px;
		height: 40px;
		line-height: 40px;
		margin: 5px;
		outline: medium none;
		width: 300px;
		text-indent:10px;
	}
	input:focus{
		box-shadow:0 0 5px 2px #02a0e9;
	}
	#box{
		background: rgba(255, 255, 255, 0.8) none repeat scroll 0 0;
		height: 490px;
		margin:0 auto;
		margin-top:80px;
		width: 800px
	}
	#nav{
		margin:0 auto;
		height: 100px;
		width: 450px;
	    /* background:#abcdef;  */
		margin-bottom:40px;
		text-align:center;
		line-height:180px;
	}
	#nav h3{
		color: #02a0e9;
		display: block;
		margin: 10px 0 0;
	}
	#content{
		/* background:#abcdef;  */
		height: 250px;
		width: 450px;
		margin:0 auto;
		position:relative;
		text-align:center;
		line-height:100px;
		color:#02a0e9;
	}
</style>
</head>
<body>
	<div id="box">
    	<div id="nav">
    		<h3>2.邮箱验证</h3>
    	</div>
    	<div id="content">
			${message}
		</div>
    </div>
</body>
</html>