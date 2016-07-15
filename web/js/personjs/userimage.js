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
	
	$('#sure').click(function(){
		//$(this).attr({"disabled":"disabled"});
		$(this).css('background','#ccc');
		$('#sure').append("<p id='success'>保存成功</p>");
	});
	
	var x;  
	var y;  
	var width;  
	var height;  
	$(function(){  
	    var jcrop_api, boundx, boundy;    //定义全局变量
	    $("#select img").Jcrop({  
	        onChange: updatePreview,  
	        onSelect: updatePreview,
	        setSelect:[20,20,50,50],
	    	minSize:[100,100], 
	    	boxWidth:300,
	        aspectRatio: 1  
	    },function(){  
	        // Use the API to get the real image size  
	        var bounds = this.getBounds();  
	        boundx = bounds[0];  //原来图片的宽度
	        boundy = bounds[1];  //原来图片的高度
	        // Store the API in the jcrop_api variable  
	        jcrop_api = this;  
	    });
	    function updatePreview(c){  
	    	//console.log(c);
	        if (parseInt(c.w) > 0){//选框的宽度不为0,parseInt是转换成Int类型
	        	
	        	var rx=$("#previewdiv").width()/c.w;
	        	var ry=$("#previewdiv").width()/c.h;
	        	
	            $("#preview").css({  
	                width: Math.round(rx * boundx) + "px",     
	                height: Math.round(ry * boundy) + "px",  
	                marginLeft: "-"+ Math.round(rx  * c.x) + "px",  
	                marginTop: "-" + Math.round(ry  * c.y) + "px"  
	            });  
	            $("#w").val(c.w);  //c.w 裁剪区域的宽  
	            $("#h").val(c.h);  //c.h 裁剪区域的高  
	            $("#x").val(c.x);  //c.x 裁剪区域左上角顶点相对于图片左上角顶点的x坐标  
	            $("#y").val(c.y);  //c.y 裁剪区域顶点的y坐标
	        }  
	      };  
	});
});


