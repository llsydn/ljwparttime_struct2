$(function() {
	//加载对话框
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
	
    var p=$('dl dd p');
    var span=$('dl dd span');
    span.click(function(){
    	$(this).addClass('current').siblings('p').removeClass('current');
    	p.slideToggle();
    });
    p.click(function(){
    	$(this).addClass('current').siblings().removeClass('current');
    });
    
    $('#resumetable').buttonset();
    
    $('form :input').blur(function(){
    	
    	//判断标题
    	if($(this).is('#title')){
    		if(this.value!=""){
	    		if(this.value==""||this.value.length<4){
		    		var tishi=$('<span class="error" style="font-size:12px;color:red;">标题不得小于4位</span>');
		    		$(this).parent().find('.right').remove();
		    		$(this).parent().find('.error').remove();
		    		$(this).parent().append(tishi);
	    		}else{
	    			var tishi=$('<span class="right" style="font-size:12px;color:green;">允许</span>');
	    			$(this).parent().find('.right').remove();
		    		$(this).parent().find('.error').remove();
	    			$(this).parent().append(tishi);
	        	}
    		}else{
    			var tishi=$('<span class="error" style="font-size:12px;color:red;">不能为空</span>');
    			$(this).parent().find('.right').remove();
	    		$(this).parent().find('.error').remove();
    			$(this).parent().append(tishi);
    		}
    	}
    	//姓名
    	if($(this).is('#name')){
    		if(this.value!=""){
	    		if(this.value==""||this.value.length<3){
		    		var tishi=$('<span class="error" style="font-size:12px;color:red;">名称不得小于三位</span>');
		    		$(this).parent().find('.right').remove();
		    		$(this).parent().find('.error').remove();
		    		$(this).parent().append(tishi);
	    		}else{
	    			var tishi=$('<span class="right" style="font-size:12px;color:green;">允许</span>');
	    			$(this).parent().find('.right').remove();
		    		$(this).parent().find('.error').remove();
	    			$(this).parent().append(tishi);
	        	}
    		}else{
    			var tishi=$('<span class="error" style="font-size:12px;color:red;">不能为空</span>');
    			$(this).parent().find('.right').remove();
	    		$(this).parent().find('.error').remove();
    			$(this).parent().append(tishi);
    		}
    		
    	}
    	//年龄
    	if($(this).is('#age')){
    		if(this.value!=""){
    			if(isNaN(this.value)||this.value<0 || this.value>100 || this.value==""){
    	    		var tishi=$('<span class="error" style="font-size:12px;color:red;">您的输入非法</span>');
    	    		$(this).parent().find('.right').remove();
    	    		$(this).parent().find('.error').remove();
    	    		$(this).parent().append(tishi);
        		}else{
        			var tishi=$('<span class="right" style="font-size:12px;color:green;">允许</span>');
        			$(this).parent().find('.right').remove();
    	    		$(this).parent().find('.error').remove();
        			$(this).parent().append(tishi);
            	}
    		}else{
    			$(this).parent().find('.right').remove();
	    		$(this).parent().find('.error').remove();
    			$(this).parent().append(tishi);
    		}
    		
    	}
    	//邮箱
    	if($(this).is('#email')){
    		var temp = document.getElementById("email");
            var myreg = /(\S)+[@]{1}(\S)+[.]{1}(\w)+/;
            if(temp.value!="")
            {
                if(!myreg.test(temp.value))
                {
                	var tishi=$('<span class="error" style="font-size:12px;color:red;">您的输入非法</span>');
                	$(this).parent().find('.right').remove();
    	    		$(this).parent().find('.error').remove();
    	    		$(this).parent().append(tishi);
                }
                else{
                	var tishi=$('<span class="right" style="font-size:12px;color:green;">允许</span>');
        			$(this).parent().find('.right').remove();
    	    		$(this).parent().find('.error').remove();
        			$(this).parent().append(tishi);
                }
        	}else{
        		var tishi=$('<span class="error" style="font-size:12px;color:red;">不能为空</span>');
    			$(this).parent().find('.right').remove();
	    		$(this).parent().find('.error').remove();
    			$(this).parent().append(tishi);
        	}
    	}
    	//月薪
    	if($(this).is('#salary')){
    		if(this.value!=""){
	    		if(isNaN(this.value)||this.value<0 || this.value>10000 || this.value==""){
		    		var tishi=$('<span class="error" style="font-size:12px;color:red;">您的输入非法</span>');
		    		$(this).parent().find('.right').remove();
		    		$(this).parent().find('.error').remove();
		    		$(this).parent().append(tishi);
	    		}else{
	    			var tishi=$('<span class="right" style="font-size:12px;color:green;">允许</span>');
	    			$(this).parent().find('.right').remove();
		    		$(this).parent().find('.error').remove();
	    			$(this).parent().append(tishi);
	        	}
    		}else{
    			$(this).parent().find('.right').remove();
	    		$(this).parent().find('.error').remove();
    			$(this).parent().append(tishi);
        	}
    	}
    });
    
    //textarae表单验证
    $('#introduction').blur(function(){ 
    	var value=$("#introduction").val();
    	if(value!=""){
    		if(value==""||value.length<15){
	    		var tishi=$('<div class="error1" style="font-size:12px;color:red;line-height:62px;height:62px;float:left;"><img src="../img/error.png">字数不能少于15个</div>');
	    		$(this).parent().find('.right1').remove();
	    		$(this).parent().find('.error1').remove();
	    		$(this).parent().append(tishi);
    		}else{
    			var tishi=$('<div class="right1" style="font-size:12px;color:green;line-height:62px;height:62px;float:left;"><img src="../img/reg_succ.png">允许</div>');
    			$(this).parent().find('.right1').remove();
	    		$(this).parent().find('.error1').remove();
    			$(this).parent().append(tishi);
        	}
		}else{
			var tishi=$('<div class="error1" style="font-size:12px;color:red;line-height:62px;height:62px;float:left;"><img src="../img/error.png">不能为空</div>');
			$(this).parent().find('.right1').remove();
    		$(this).parent().find('.error1').remove();
			$(this).parent().append(tishi);
		}
    }); 
    
    
    //防止表单提交
    $("#send").click(function(){ 
        var $parent = $(this).parent().parent(); 
        $("form :input").trigger('blur'); 
        var numError = $('form .error').length+$('form .error1').length; 
        if(numError){ 
           return false; 
        } 
     }); 
    $("#reset").click(function(){ 
        $("table tr .error").remove();
        $("table tr .error1").remove();
        $("table tr .right").remove();
        $("table tr .right1").remove();
    }); 
    
    
    
    
});
