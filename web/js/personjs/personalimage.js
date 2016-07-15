$(function(){
	
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
	
	
	
	$("#fuPhoto").change(function() {
        var $file = $(this);
        var fileObj = $file[0];
        var windowURL = window.URL || window.webkitURL;
        var dataURL;
        var $img = $("#imgphoto");
        var filename=$file.val();  //文件名+路径
       
      
    	var size= this.files[0].size;//文件的大小字节
        size = size / 1024;//转换成kb
        //alert(size);
        if (size > 2.5 * 1024 * 1024) {
        	alert("上传的图片大小不能超过2.5M!");
            $("#fuPhoto").val("");
        	$img.attr('src',"../img/man.GIF");
        } 
        
        
        var index1=filename.lastIndexOf("."); 
        var index2=filename.length;
        var ext=filename.substring(index1+1,index2);//后缀名   
        //添加需要判断的后缀名类型
        if(ext!="gif" &&ext!="png" &&ext!="jpg" &&ext!="bmp" &&ext!="jpeg"){
        	alert('上传的头像不是有效文件!(gif,png,jpg,bmp,jpeg)');
        	$("#fuPhoto").val("");  //将input:file的值清空
        	$img.attr('src',"../img/man.GIF"); //并还原默认的图片
        }else{
        	var arr=filename.split('\\');
            var fileName=arr[arr.length-1];
            $(".showFileName").html(fileName);
        }
        
    });
	
	
	
	
	
	
});