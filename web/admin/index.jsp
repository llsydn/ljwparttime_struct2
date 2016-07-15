<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp"%>

<div class="col-md-9">
    <h4 class="text-center">这里是管理员的首页</h4>
    <div id="fisrtpage">
         <div class="col-md-12" style="margin-top:20px;">
             <div class="alert alert-success alert-dismissable" style="text-align:center;">
                 <button type="button" class="close" data-dismiss="alert"
                         aria-hidden="true" style="margin-top:3px;">
                     &times;
                 </button>
                 <h4><small>欢迎您<i class="glyphicon glyphicon-user"></i><s:property value="#session.admin.name"/>，&nbsp;&nbsp;&nbsp;您当前访问的时间是:<i class="glyphicon glyphicon-time"></i><span id="current_time"></span></small></h4>
             </div>
         </div>
     </div>
</div>
<%@ include file="footer.jsp"%>
<script>
	/*显示当前时间*/
	setInterval(function() {
	    var now = (new Date()).toLocaleString();
	    $('#current_time').text(now);
	}, 1000);
</script>