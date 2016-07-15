<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>管理员主页</title>

    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath}/admin/css/bootstrap.css" rel="stylesheet">

    <script src="${pageContext.request.contextPath}/js/jquery-1.10.2.js"></script>
	<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/img/job.ico" />
</head>
<body>

<nav class="navbar navbar-default navbar-fixed-top">
	    <div class="container">
	        <div class="navbar-header">
	        	<a class="navbar-brand" href="#">管理员主页</a>
	    	</div>
	    	<div class="nav navbar-nav navbar-right" role="navigation">
		        <ul class="nav navbar-nav">
		            <%--用户名--%>
		            <li class="active"><a href="javascript:void(0)"><span class="glyphicon glyphicon-user"></span><s:property value="#session.admin.name"/></a></li>
		            <li class="dropdown">
		                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
		                   	 操作<b class="caret"></b>
		                </a>
		                <ul class="dropdown-menu">
		                    <li><a href="adminLogin?type=logout">退出</a></li>
		                    <li class="divider"></li>
		                    <li><a href="#">功能</a></li>
		                </ul>
		            </li>
		        </ul>
	    	</div>
    </div>
</nav>


<div class="container" style="margin-top:70px;">
    <div class="row">

        <div class="col-md-2">
            <h4>功能列表</h4>
            <div class="panel-group" id="accordion">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title text-center">
                            <a data-toggle="collapse" data-parent="#accordion"
                               href="#collapse_manage">
                             	   管理
                            </a>
                        </h4>
                    </div>
                    <div id="collapse_manage" class="panel-collapse collapse">
                        <a href="admin?type=user_manage&page=1"  class="list-group-item" id="user_manage">用户管理</a>
                        <a href="admin?type=business_manage&page=1" class="list-group-item" id="business_manage">商家管理</a>
                        <a href="admin?type=message_manage&page=1" class="list-group-item" id="message_manage">兼职信息管理</a>
                        <a href="admin?type=commodity_manage" class="list-group-item" id="commodity_manage">分类管理</a>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title text-center">
                        <a data-toggle="collapse" data-parent="#accordion" href="#collapse_vertify">
                            	审核
                        </a>
                    </h4>
                </div>
                <div id="collapse_vertify" class="panel-collapse collapse">
                    <div class="panel-body">
                        <a href="admin?type=business_vertify&page=1" class="list-group-item" id="business_vertify">商家审核</a>
                    </div>
                </div>
            </div>
        </div>
