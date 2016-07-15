<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>

<div class="col-md-10">
    <h4 class="text-center">兼职信息管理</h4>
    <div class="row">
        <table class="table">
            <caption>所有兼职信息:</caption>
            <thead>
            <tr>
                <th>分类</th>
                <th>标题</th>
                <th>内容</th>
                <th>发布时间</th>
                <th>商家</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <s:iterator value="mlist" id="each">
                <tr>
                    <td><s:property value="#each.commodity.commodity_name"/></td>
                    <td><s:property value="#each.title"/></td>
                    <td><s:property value="#each.content"/></td>
                    <td><s:property value="#each.date_time"/></td>
                    <td><s:property value="#each.business.name"/></td>
                    <td>
                        <button type="button"  class="btn btn-primary btn_vertify" bid="<s:property value="#each.id"/>">
                            删除
                        </button>
                    </td>
                </tr>
            </s:iterator>

            </tbody>
        </table>

    </div>
    <div class="row text-center">
        <%--分页条--%>
        <ul id="pagination" class="pagination">
        </ul>
    </div>
</div>


<script src="${pageContext.request.contextPath}/admin/js/jquery-page-bootstrap.js"></script>
<script type="text/javascript">
    $(document).ready(function () {

        //侧边栏高亮当前选择
        $('#message_manage').addClass("active");
        //展开当前侧边栏栏目
        $('#collapse_manage').addClass("in");

        //分页条的设置
        var $pagination = $('#pagination');
        var setting = {
            page_total: ${myPage.pagaTotal},// 总页数
            page_current: ${myPage.current},// 当前页面
            page_step: 1,// 步长
            buttonClickCallback: function (page, ele) {
                //ele是使用分页插件的jq元素
                window.location.href = "admin?type=message_manage&page=" + page;
            }
        };

        //创建分页条
        $pagination.paging(setting);

    });
</script>

<%@ include file="footer.jsp" %>
