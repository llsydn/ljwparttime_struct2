$(function(){
	//点击个人中心
	$('#personal').click(function () {
		if ($.cookie('username')) {
			//$('#personal').dialog('open');
			location.href ='personinfomation?username='+$.cookie('username');
			//location.href ='UserinfoAction?username='+$.cookie('username');
		} else {
			$('#error').dialog('open');
			setTimeout(function () {
				$('#error').dialog('close');
				$('#login').dialog('open');
			}, 1000);
		}
	});
	//错误显示。
	$('#error').dialog({
		autoOpen : false,
		modal : true,
		closeOnEscape : false,
		resizable : false,
		draggable : false,
		width : 180,
		height : 50,
	}).parent().find('.ui-widget-header').hide();
	
	
	//搜索按钮
	$('#search_button').button({
		icons : {
			primary : 'ui-icon-search',
		},
	});

	//先将用户和退出按钮隐藏起来
	$('#member, #logout').hide();

	//如果已经存在cookie就显示用户名
	if ($.cookie('username')) {
		$('#member, #logout').show();
		$('#reg_a, #login_a').hide();
		$('#member').html($.cookie('username'));
		
		//点击退出按钮。
		$('#member').click(function () {
			location.href ='personinfomation?username='+$.cookie('username');
		});
		
	} else {
		$('#member, #logout').hide();
		$('#reg_a, #login_a').show();
	}
	//点击退出按钮。
	$('#logout').click(function () {
		$.removeCookie('username');
		window.location.href = 'index.jsp';
	});
	
	//加载对话框
	$('#loading').dialog({
		autoOpen : false,
		modal : true,
		closeOnEscape : false,
		resizable : false,
		draggable : false,
		width : 180,
		height : 50,
	}).parent().parent().find('.ui-widget-header').hide();  //将对话框的标头去掉
	
	$('#reg_a').click(function () { //点击注册就弹出对话框
		$('#reg').dialog('open');
	});

	$('#reg').dialog({
		autoOpen : false,
		modal : true,
		resizable : false,
		width : 320,
		height : 400,
		buttons : {
			'提交' : function () {
				$(this).submit();
			}
		}
	}).buttonset().validate({
		//submit提交数据
		submitHandler : function (form) {
			$(form).ajaxSubmit({  
				url : 'AddUserServletAction',  //将数据提交给谁处理，会覆盖form中的action。
				type : 'POST',
				dataType: "json",
				beforeSubmit : function (formData, jqForm, options) { //在提交之前。
					$('#loading').dialog('open');//数据正在加载中对话框弹出
					$('#reg').dialog('widget').find('button').eq(1).button('disable');//提交按钮不可以多次按
				},
				success : function (responseText, statusText) {//成功后
					//返回的responseText就是一个对象
					if (responseText.result) {//成功
						$('#reg').dialog('widget').find('button').eq(1).button('enable');//启用按钮
						$('#loading').css('background', 'url(img/success.gif) no-repeat 20px center').html('数据新增成功...');
						//将用户名保存在cookie中。
						$.cookie('username', $('#username').val());
						setTimeout(function () {
							$('#loading').dialog('close');
							$('#reg').dialog('close');
							$('#reg').resetForm();
							$('#reg span.star').html('*').removeClass('succ');
							$('#loading').css('background', 'url(img/loading.gif) no-repeat 20px center').html('数据交互中...');
							//登陆成功后,将用户和退出按钮显示,注册和登陆按钮隐藏
							$('#member, #logout').show();
							$('#reg_a, #login_a').hide();
							$('#member').html($.cookie('username'));//显示用户名
						}, 2000);
					}else{
						$('#loading').css('background', 'url(img/success.gif) no-repeat 20px center').html('数据添加失败...');
					}
				},
				error : function(){   //失败后
					$('#reg').dialog('widget').find('button').eq(1).button('enable');//启用按钮
					$('#loading').css('background', 'url(img/error.png) no-repeat 20px center').html('数据新增失败...');
					setTimeout(function () {
						$('#loading').dialog('close');
						$('#reg').dialog('close');
						$('#reg').resetForm();
						$('#reg span.star').html('*').removeClass('succ');
						$('#loading').css('background', 'url(img/loading.gif) no-repeat 20px center').html('数据交互中...');
					}, 4000);
				}
			});
		},
		//显示错误信息
		showErrors : function (errorMap, errorList) {
			var errors = this.numberOfInvalids();
			
			if (errors > 0) {
				$('#reg').dialog('option', 'height', errors * 20 + 400);
			} else {
				$('#reg').dialog('option', 'height', 400);
			}
			this.defaultShowErrors();
		},
		highlight : function (element, errorClass) {
			$(element).css('border', '1px solid #630');
			$(element).parent().find('span').html('*').removeClass('succ');
		},
		unhighlight : function (element, errorClass) {
			$(element).css('border', '1px solid #ccc');
			$(element).parent().find('span').html('&nbsp;').addClass('succ');
		},
		errorLabelContainer : 'ol.reg_error',
		wrapper : 'li',
	
		rules : {
			username : {
				required : true,
				minlength : 6,
				//验证用户名是否存在
				remote : {
					url : 'haveUserAction',
					type : 'POST',
					data:{
						username:function(){
							return $('#username').val();
						}
					},
					dataType: "json",
					dataFilter: function(data,type) {
						var json = jQuery.parseJSON(data); 
						return json.result;
	                },
				},
			},
			password : {
				required : true,
				minlength : 6,
			},
			email : {
				required : true,
				email : true
			},
		},
		messages : {
			username : {
				required : '帐号不得为空！',
				minlength : jQuery.format('帐号不得小于{0}位！'),
				remote : '帐号被占用！',
			},
			password : {
				required : '密码不得为空！',
				minlength : jQuery.format('密码不得小于{0}位！'),
			},
			email : {
				required : '邮箱不得为空！',
				minlength : '请输入正确的邮箱地址！',
			},	
		}
	});
	
	//正则表达式验证手机
	$('#iphone').rules('add', {
		iphone : true,
		required : true,
		messages : {
			required : '手机不得为空！',
		}
		
	});
	$.validator.addMethod('iphone', function (value, element) {
		var tel = /^[1][358][0-9]{9}$/;
		return this.optional(element) || (tel.test(value));
	}, '请输入正确的手机号！');
	//验证提示框
	$('#reg input[title]').tooltip({
		show : false,
		hide : false,
		position : {
			my : 'left center',
			at : 'right+20 center'
		},
	});
	//邮箱自动填充完整
	$('#email').autocomplete({
		delay : 0,
		autoFocus : true,
		source : function (request, response) {
			var hosts = ['qq.com', '163.com', '263.com', 'sina.com.cn','gmail.com', 'hotmail.com'],
				term = request.term,		//获取用户输入的内容
				name = term,				//邮箱的用户名
				host = '',					//邮箱的域名
				ix = term.indexOf('@'),		//@的位置
				result = [];				//最终呈现的邮箱列表
			result.push(term);
			//当有@的时候，重新分别用户名和域名
			if (ix > -1) {
				name = term.slice(0, ix);
				host = term.slice(ix + 1);
			}
			if (name) {
				//如果用户已经输入@和后面的域名，
				//那么就找到相关的域名提示，比如bnbbs@1，就提示bnbbs@163.com
				//如果用户还没有输入@或后面的域名，
				//那么就把所有的域名都提示出来
				var findedHosts = (host ? $.grep(hosts, function (value, index) {
						return value.indexOf(host) > -1
					}) : hosts),
					findedResult = $.map(findedHosts, function (value, index) {
					return name + '@' + value;
				});
				result = result.concat(findedResult);
			}
			response(result);
		},	
	});

	//处理登陆按钮
	$('#login_a').click(function () {
		$('#login').dialog('open');
	});
	
	//登陆对话框
	$('#login').dialog({
		autoOpen : false,
		modal : true,
		resizable : false,
		width : 350,
		height : 300,
		buttons : {
			'登录' : function () {
				$(this).submit();
			}
		}
	}).validate({
		submitHandler : function (form) {
			$(form).ajaxSubmit({
				url : 'LoginAction',
				type : 'POST',
				dataType:'html',
				beforeSubmit : function (formData, jqForm, options) {
					$('#loading').dialog('open');
					$('#login').dialog('widget').find('button').eq(1).button('disable');
				},
				success : function (responseText, statusText) {
					if (responseText) {
						$('#login').dialog('widget').find('button').eq(1).button('enable');
						$('#loading').css('background', 'url(img/success.gif) no-repeat 20px center').html('登录成功...');
						if ($('#expires').is(':checked')) {
							$.cookie('username', $('#login_user').val(), {
								expires : 7,  //保存时间是7天
							});
						} else {   //没有选择保存日期的。
							$.cookie('username', $('#login_user').val());
						}
						setTimeout(function () {
							$('#loading').dialog('close');
							$('#login').dialog('close');
							$('#login').resetForm();
							$('#login span.star').html('*').removeClass('succ');
							$('#loading').css('background', 'url(img/loading.gif) no-repeat 20px center').html('数据交互中...');
							$('#member, #logout').show();
							$('#reg_a, #login_a').hide();
							$('#member').html($.cookie('username'));
						}, 2000);
					}
				},
			});
		},
		showErrors : function (errorMap, errorList) {
			var errors = this.numberOfInvalids();
			if (errors > 0) {
				$('#login').dialog('option', 'height', errors * 20 +300);
			} else {
				$('#login').dialog('option', 'height', 300);
			}
			this.defaultShowErrors();
		},
		highlight : function (element, errorClass) {
			$(element).css('border', '1px solid #630');
			$(element).parent().find('span').html('*').removeClass('succ');
		},
		unhighlight : function (element, errorClass) {
			$(element).css('border', '1px solid #ccc');
			$(element).parent().find('span').html('&nbsp;').addClass('succ');
		},
		errorLabelContainer : 'ol.login_error',
		wrapper : 'li',
		rules : {
			login_user : {
				required : true,
				minlength : 6,
			},
			login_pass : {
				required : true,
				minlength : 6,
				//验证用户是否存在。
				remote : {
					url : 'LoginAction',
					type : 'POST',
					data : {
						login_user : function () {
							return $('#login_user').val();
						},
					},
					dataType:'html',
					dataFilter: function(data, type) {
	                    if (data == "true")
	                         return true;
	                    else
	                         return false;
	                },
				},
			},
			checkcode : {
				required: true,
				remote : {
					url:'LoginAction', //判断验证码是否正确
					type:'POST',
					data : {
						checkcode : function () {
							return $('#checkcode').val();
						},
					},
					dataType:'html',
					dataFilter: function(data, type) {
	                    if (data == "true")
	                         return true;
	                    else
	                         return false;
	                },
					},
				},
		},
		messages : {
			login_user : {
				required : '帐号不得为空！',
				minlength : jQuery.format('帐号不得小于{0}位！'),
			},
			login_pass : {
				required : '密码不得为空！',
				minlength : jQuery.format('密码不得小于{0}位！'),
				remote : '帐号或密码不正确！',
			},
			checkcode:{
				required : '验证码不得为空！',
				remote : '验证码不正确！',
			},
		}
	});

});


























