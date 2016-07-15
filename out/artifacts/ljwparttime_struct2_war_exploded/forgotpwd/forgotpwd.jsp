<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>忘记密码</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.10.2.js"></script>
    <script type="text/javascript">
    	$(function(){
    		//定义标记,判断能否提交表单
            var flag1 = false;
    		
    		$('#userNameOrEmail').blur(function(){
    			var userNameOrEmail=$(this).val().trim();
    			
    			console.log(userNameOrEmail);
    			if(userNameOrEmail.length<6){
    				return;
    			}
    			
    			if(userNameOrEmail.length>=6){
	    			$.ajax({
	    				url:'CheckuserNameOrEmailAction',
	    				type:'post',
	    				data:{
	    					userNameOrEmail:userNameOrEmail,
	    				},
	    				//dataType:'json',/* ,指定返回的结果 */
 	    				success:function(data){  //接收返回的结果
	    					if(data=="true"){
	    						$('#nameemail').html("<span class='right' style='font-size:14px;color:green;'>用户或者邮箱存在</span>");
	    						
	    					}else{
	    						$('#nameemail').html("<span class='error' style='font-size:14px;color:red;'>用户或者邮箱不存在</span>");
	    						flag1=false;
	    						return;
	    					}
	    				},
	    			});
    			}
    			flag1 = true;
    		});
			
    		//定义标记,判断能否提交表单
            var flag2 = false;
    		
    		$('#checkcode').blur(function(){
    			var checkcode=$(this).val().trim();
    			
    			console.log(userNameOrEmail);
    			if(checkcode.length<6){
    				return;
    			}
    			
    			if(checkcode.length>=6){
	    			$.ajax({
	    				url:'CheckuserNameOrEmailAction',
	    				type:'post',
	    				data:{
	    					checkcode:checkcode,
	    				},
	    				success:function(data){  //接收返回的结果
	    					if(data=="true"){
	    					}else{
	    						alert("您输入的验证码不正确,请重新输入!");
	    						flag2=false;
	    						return;
	    					}
	    				},
	    			});
    			}
    			flag2 = true;
    		});
    		
    		//提交表单
    	    $("#register").click(function(){
    	    	//alert(flag1&&flag2);
   	            if(flag1 && flag2){
   	                $("#registerId").submit();
   	            }
    	    });
    		
    	});
    </script>
   <link rel="shortcut icon" type="image/x-icon" href="../img/job.ico" />
   <link rel="stylesheet" type="text/css" href="../css/forgotpwd/forgotpwd.css">
  </head>
  
  <body>
    <div id="box">
    	<div id="nav">
    		<h3>1.请输入您要找回的账号</h3>
    	</div>
    	<div id="content">
		    <form action="SendEmailAction" method="post" id="registerId">
		    	<span style="color:red" id="nameemail"></span>
		    	
		 		<input type="text" class="text" name="userNameOrEmail" id="userNameOrEmail" placeholder="请输入您注册时的邮箱或用户名"/>
			    <input type="text" class="text" name="checkcode" id="checkcode" placeholder="请输入验证码" /> 
			    <img src="CheckCodeAction"  onclick="this.src='CheckCodeAction'" alt="请点击刷新验证码"/>
				<input type="button" value="提交" id="register"/>
			</form>
		</div>
    </div>
    
  </body>
</html>
