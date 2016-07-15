<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>

<div class="col-md-10">
    <h4 class="text-center">商家注册申请审核</h4>
    <div class="row">
        <table class="table">
            <caption>待审核商家列表:</caption>
            <thead>
            <tr>
                <th>名字</th>
                <th>电话</th>
                <th>邮箱</th>
                <th>地址</th>
                <th>描述</th>
                <th>审核</th>
            </tr>
            </thead>
            <tbody>
            <s:iterator value="blist" id="each">
                <tr>
                    <td><s:property value="#each.name"/></td>
                    <td><s:property value="#each.phone"/></td>
                    <td><s:property value="#each.email"/></td>
                    <td><s:property value="#each.address"/></td>
                    <td><s:property value="#each.description"/></td>
                    <td>
                        <button type="button" data-complete-text="审核完成" class="btn btn-primary btn_vertify" bid="<s:property value="#each.id"/>">
                            审核确认
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
        $('#business_vertify').addClass("active");
        //展开当前侧边栏栏目
        $('#collapse_vertify').addClass("in");

        //分页条的设置
        var $pagination = $('#pagination');
        var setting = {
            page_total: ${myPage.pagaTotal},// 总页数
            page_current: ${myPage.current},// 当前页面
            page_step: 1,// 步长
            buttonClickCallback: function (page, ele) {
                //ele是使用分页插件的jq元素
                window.location.href = "admin?type=business_vertify&page=" + page;
            }
        };

        //创建分页条
        $pagination.paging(setting);

        //对于每一个确认按钮
        $('button.btn_vertify').each(function () {
            var $this = $(this);
            //按钮被点击
            $this.click(function () {

                //ajax提交请求
                $.ajax({
                    url: "businessupdate",
                    type: "POST",
                    datatype: "json",
                    timeout: 3000,
                    data: {
                        type: "level",
                        bid: $this.attr("bid")
                    },
                    success: function (rdata, textStatus) {
                        //var data = $.parseJSON(rdata);
                        //回调
                        showDialog(rdata.msg);
                        if (rdata.success) {
                            $this.attr("disabled",true);
                            $this.text("审核完成!");
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert(XMLHttpRequest + textStatus + errorThrown);
                    }
                });

            });
        });
    });
</script>

<%@ include file="footer.jsp" %>
