/**
 * Created by Administrator on 2016/3/26.
 */
$(function() {
	//如果已经存在cookie就显示用户名
	if ($.cookie('username')) {
		$('#member').html($.cookie('username'));
		
		//点击退出按钮。
		$('#member').click(function () {
			location.href ='personinfomation?username='+$.cookie('username');
		});
		
	}
	//退出
	$('#logout').click(function () {
		$.removeCookie('username');
		window.location.href = '/ljwparttime_struct2/index.jsp';
	});
	
});
$(function(){
	var flag1=false; //定义标记,判断能否提交表单
	var flag2=false; //定义标记,判断能否提交表单
	var flag3=false; //定义标记,判断能否提交表单
	var newpassword;
	var newpassword2;
	var oldPassword;
	
	
	$("#oldPassword").blur(function(){
		var userName=$("#userName").val(); //得到用户名
		oldPassword=$("#oldPassword").val().trim(); //得到用户输入的旧密码
		
		if(oldPassword.length<6){
			$('#oldpwderror').html("<span class='error' style='font-size:14px;color:red'>请输入正确的密码</span>");
			flag3=false;
			return;
		}else{
			$.ajax({
				url:'CheckPasswordAction',
				type:'post',
				data:{
					userName:userName,
					oldPassword:oldPassword,
				},
 				success:function(data){  //接收返回的结果
					if(data=="true"){
						$('#oldpwderror').html("<span class='right' style='font-size:14px;color:green;'>输入的旧密码正确</span>");
						flag3=true;
						return;
					}else{
						$('#oldpwderror').html("<span class='error' style='font-size:14px;color:red;'>您输入的旧密码不正确</span>");
						flag3=false;
						return;
					}
				},
			});
		}
	});
	//判断新密码的
	$('#newPassword').blur(function(){
		newpassword=$('#newPassword').val().trim();
		if(newpassword.length<6){
			//alert(newpassword);
			$('#newpwderror').html("<span class='error' style='font-size:14px;color:red'>请输入6位以上的新密码</span>");
			flag1=false;
			return;
		}else{
			$('#newpwderror').html("<span class='right' style='font-size:14px;color:green;'>输入的密码允许</span>");
		}
		flag1=true;
	});
	//确认密码
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
        if(flag1&&flag2&&flag3){
            $("#registerId").submit();
        }
    });
	
});










