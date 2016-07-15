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
	}
	input:focus{
		box-shadow:0 0 5px 2px #02a0e9;
	}
	#register{
		background: #02a0e9 none repeat scroll 0 0;
		border: medium none;
		border-radius: 6px;
		bottom: 0;
		color: #fff;
		cursor: pointer;
		outline: medium none;
		padding: 10px 25px;
		position: absolute;
		right: 50px;
	}
	.right{
		background: url(${pageContext.request.contextPath}/img/success.ico) no-repeat;
		background-size: 12px;
		padding-left: 15px;
	}
	.error{
		background:url(${pageContext.request.contextPath}/img/error.png) no-repeat;
		background-size: 12px;
		padding-left: 15px;
	}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.10.2.js"></script>
<script type="text/javascript">
	$(function(){
		var flag1=false; //定义标记,判断能否提交表单
		var flag2=false; //定义标记,判断能否提交表单
		var newpassword;
		var newpassword2;
		
		$('#newPassword').blur(function(){
			newpassword=$('#newPassword').val().trim();
			if(newpassword.length<6){
				//alert(newpassword);
				$('#newpwderror').html("<span class='error' style='font-size:14px;color:red'>请输入6位以上的密码</span>");
				flag1=false;
				return;
			}else{
				$('#newpwderror').html("<span class='right' style='font-size:14px;color:green;'>输入的密码允许</span>");
			}
			flag1=true;
		});
		$('#newPassword2').blur(function(){
			newpassword2=$('#newPassword2').val().trim();
			if(newpassword==newpassword2 && newpassword.length>=6){
				$('#newpwderror2').html("<span class='right' style='font-size:14px;color:green;'>两次密码一致</span>");
				
			}else{
				$('#newpwderror2').html("<span class='error' style='font-size:14px;color:red'>两次密码不正确</span>");
				flag2=false;
				return;
			}
			flag2=true;
		});
		
		//提交表单
	    $("#register").click(function(){
	    	$("form :input").trigger('blur'); 
            if(flag1&&flag2){
                $("#registerId").submit();
            }
	    });
		
	});

</script>
</head>
<body>
	<div id="box">
    	<div id="nav">
    		<h3>3.重新设置您的密码</h3>
    	</div>
    	<div id="content">
			<form action="resetPasswordAction" method="post" id="registerId">
				<label for="userName">用户名:</label>&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="text" class="text" name="userName" value="${userName}" readonly="readonly" style="cursor:pointer;"/><br/>
				
				<label for="newPassword">新密码:</label>&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="password" class="text" name="newPassword" id="newPassword" placeholder="请输入6位以上的密码"/>
				<br/>
				
				<label for="newPassword2">确认新密码:</label>
				<input type="password" class="text" name="newPassword2" id="newPassword2" placeholder="再输入一次 "/>
				<br/><span id="newpwderror" style="margin-left:100px;">${errors.newPassword }</span><br/>
				<span id="newpwderror2" style="margin-left:100px;">${errors.newPassword2 }</span><br/>
				
				<input type="button" value="修改" id="register"/>
			</form>
		</div>
    </div>
</body>
</html>