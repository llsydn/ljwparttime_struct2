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
    	p.slideToggle();
    });
    
    //点击后改变图标的方向
    $('#content #content_left dd span a').click(function(){
    	$(this).toggleClass('current');
    });
    
    
//    p.click(function(){
//    	$(this).addClass('current').siblings().removeClass('current');
//    });
//    
});
