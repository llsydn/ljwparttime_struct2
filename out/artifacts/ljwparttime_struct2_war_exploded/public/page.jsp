<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<p style="background:#fff;height:30px;line-height:30px;width:82%;margin:0 auto;">
当前第[${page.pagenum }]页&nbsp;&nbsp;&nbsp;

<c:if test="${page.pagenum>1}">
	<a href="${page.url }?pagenum=${page.pagenum-1}&user_id=${user.user_id}" id="previous">上一页</a>
</c:if>
&nbsp;
<c:forEach var="pagenum" begin="${page.startPage}" end="${page.endPage}">
		<a href="${page.url }?pagenum=${pagenum}&user_id=${user.user_id}" id="epage" class="page">${pagenum}</a>
</c:forEach>
&nbsp;

<c:if test="${page.pagenum<page.totalpage}">
	<a href="${page.url}?pagenum=${page.pagenum+1}&user_id=${user.user_id}" id="next">下一页</a>
</c:if>

&nbsp;&nbsp;&nbsp; <span>共[${page.totalpage }]页,共[${page.totalrecord}]纪录,</span>
</p>
<style>
.current{
	background:#FD7A0E;
	border-radius:2px;
	text-decoration:none;
	padding:3px 6px 3px 7px;
	border:1px solid #FD7A0E;
	color:#0000CC;
	font-size:14px;
}
.page{
	background:white;
	border-radius:2px;
	text-decoration:none;
	padding:3px 6px 3px 7px;
	border:1px solid #ccc;
	color:#0000CC;
	font-size:14px;
}
#previous,#next{
	background:white;
	border-radius:2px;
	text-decoration:none;
	padding:3px 3px 3px 4px;
	border:1px solid #ccc;
	color:#0000CC;
	font-size:14px;
}
#previous:hover,#next:hover,#epage:hover{
	background:#FD7A0E;
	border:1px solid #FD7A0E;
}
</style>

<script type="text/javascript">
	
	$(function(){
		var pagenum=${page.pagenum}; //得到当前的pagenum
		$(".page").each(function(){  //遍历每一页,再判断与当前的pagenum是否相等
			var val=$(this).html();
			if(val==pagenum){        //如果是相等的就添加class属性
				//$(this).addClass("current"); 这个不太正确,因为不能覆盖原来的class.
				$(this).attr("class","current");
			}
		});
	});

 	//上一页
	/* $('#previous').click(function(){
		var pagenum=${page.pagenum-1};
		$.ajax({
			type:'get',
			url:'${page.url}',
			data:{pagenum:pagenum},
			success:function(data){
				//alert(data.page1);			
			},
		});
		
	}); */
</script>