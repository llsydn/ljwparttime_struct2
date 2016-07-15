<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>成功信息</title>
<style>
	#redirect{
		background-color: #69bee6;
	    border-radius: 10px;
	    color: #fff;
	    height: 200px;
	    margin: 0 auto;
	    margin-top:100px;
	    width: 100%;
		line-height:200px;
		text-align:center;
		color:#fff;
	}
	#box{
		font-family: "黑体";
		margin: 100px auto;
    	max-width: 800px;
    	width: 90%;
	}
</style>
<link rel="shortcut icon" type="image/x-icon" href="img/job.ico" />
</head>

<body>
	<div id="box">
		
		<div id="redirect">
			<h3>
			<img src="${pageContext.request.contextPath}/img/logo1.png" style="position:relative;left:-10px;top:45px;width:100px;height:100px;">
			${message}
			<span id="totalSecond" style="color:blue">5</span>秒后为您跳转页面。。。。</h3>
		</div>
		
	</div>
	
	<script language="javascript" type="text/javascript">
	    var second = document.getElementById('totalSecond').textContent;
	
	    if (navigator.appName.indexOf("Explorer") > -1)
	    {
	        second = document.getElementById('totalSecond').innerText;
	    } else
	    {
	        second = document.getElementById('totalSecond').textContent;
	    }
	
		setInterval("redirect()", 1000);
	    function redirect()
	    {
	        if (second < 0)
	        {
	            location.href = 'http://localhost:8080/ljwparttime_struct2/';
	        } else
	        {
	            if (navigator.appName.indexOf("Explorer") > -1)
	            {
	                document.getElementById('totalSecond').innerText = second--;
	            } else
	            {
	                document.getElementById('totalSecond').textContent = second--;
	            }
	        }
	    }
   </script>
</body>
</html>
