/**
 * Created by Administrator on 2016/3/26.
 */
$(function() {
	
    var p=$('dl dd p');
    var h=$('dl dd h');
    
    h.click(function(){
    	p.slideToggle();
    });
    
    //点击后改变图标的方向
    $('#myselfinfo').click(function(){
    	$(this).toggleClass('current');
    });
    
	
	
	$('#loading').dialog({
		autoOpen : false,
		modal : true,
		closeOnEscape : false,
		resizable : false,
		draggable : false,
		width : 180,
		height : 50,
	}).parent().find('.ui-widget-header').hide();
	
	
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
	
    //如果已经存在cookie就显示用户名
    $('#personinfo').validate({
    	submitHandler : function (form) {
			$(form).ajaxSubmit({  
				url : 'UpdateUserAction',  //将数据提交给谁处理，会覆盖form中的action。
				type : 'POST',
				dataType: "json",
				beforeSubmit : function (formData, jqForm, options) { //在提交之前。
					$('#loading').dialog('open');//数据正在加载中对话框弹出
				},
				success : function (responseText, statusText) {//成功后
					//返回的responseText就是一个对象
					if (responseText.result) {//成功
						$.cookie('username', $('#username').val());
						$('#loading').css('background', 'url(/ljwparttime_struct2/img/success.gif) no-repeat 20px center').html('保存成功...');
						setTimeout(function () {
							$('#loading').dialog('close');
							$('#member').html($.cookie('username'));
						}, 2000);
					}
				},
			});
		},
		
        showErrors: function (errorMap, errorList) {
            var errors = this.numberOfInvalids();
            this.defaultShowErrors();
        },
        highlight: function (element, errorClass) {
            $(element).css('border', '1px solid #630');
        },
        unhighlight: function (element, errorClass) {
            $(element).css('border', '1px solid #ccc');
        },
        errorLabelContainer: 'ul.reg_error',
        wrapper: 'li',

        rules: {
            username: {
                required: true,
                minlength: 6,
                //验证用户名是否存在
				remote : {
					url : 'haveOtherUserAction',
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
            password: {
                required: true,
                minlength: 6,
            },
            email: {
                required: true,
                email: true
            },
        },
        messages: {
            username: {
                required: '帐号不得为空！',
                minlength: jQuery.format('帐号不得小于{0}位！'),
                remote: '帐号被占用！',
            },
            password: {
                required: '密码不得为空！',
                minlength: jQuery.format('密码不得小于{0}位！'),
            },
            email: {
                required: '邮箱不得为空！',
                minlength: '请输入正确的邮箱地址！',
            },
        }
    });

    //正则表达式验证手机
    $('#iphone').rules('add', {
        iphone: true,
        required: true,
        messages: {
            required: '手机不得为空！',
        }

    });
    //验证手机添加方法
    $.validator.addMethod('iphone', function (value, element) {
        var tel = /^[1][358][0-9]{9}$/;
        return this.optional(element) || (tel.test(value));
    }, '请输入正确的手机号！');
    //验证提示框
    $('#reg input[title]').tooltip({
        show: false,
        hide: false,
        position: {
            my: 'left center',
            at: 'right+20 center'
        },
    });
    //邮箱自动填充完整
    $('#email').autocomplete({
        delay: 0,
        autoFocus: true,
        source: function (request, response) {
            var hosts = ['qq.com', '163.com', '263.com', 'sina.com.cn', 'gmail.com', 'hotmail.com'],
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
    
});


