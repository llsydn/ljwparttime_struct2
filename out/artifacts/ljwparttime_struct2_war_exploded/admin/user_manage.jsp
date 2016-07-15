<%--
用户管理
--%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>

<style>
    .face-small {
        height: 50px;
        width: 50px;
        border-color: #fff;
        border-radius: 18px;
    }
</style>

<div class="col-md-10">
    <h4 class="text-center">用户管理</h4>
    <div class="row">
        <table class="table">
            <caption>所有用户:</caption>
            <thead>
            <tr>
                <th>头像</th>
                <th>用户名</th>
                <th>密码</th>
                <th>邮箱</th>
                <th>电话</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <s:iterator value="ulist" id="each">
                <tr uid="<s:property value="#each.user_id"/>">
                    <td>
                        <s:if test='#each.imageurl==null'>
                            <img class="face-small" src="${pageContext.request.contextPath}/img/touxiang_default.gif"/>
                        </s:if>
                        <s:else>
                            <img class="face-small"
                                 src="${pageContext.request.contextPath}<s:property value="#each.imageurl"/>"/>
                        </s:else>
                    </td>
                    <td class="editable uname"><span><s:property value="#each.username"/></span></td>
                    <td class="editable upwd"><span><s:property value="#each.password"/></span></td>
                    <td class="editable uemail"><span><s:property value="#each.email"/></span></td>
                    <td class="editable uphone"><span><s:property value="#each.iphone"/></span></td>
                    <td>
                        <button type="button" class="btn btn-primary btn_deleteUser" uid="<s:property value="#each.user_id"/>">
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

<%--为bootstrap优化的分页插件--%>
<script src="${pageContext.request.contextPath}/admin/js/jquery-page-bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.ui.js"></script>
<link href="${pageContext.request.contextPath}/css/jquery-ui-1.10.4.custom.css" rel="stylesheet" property=""/>
<script type="text/javascript">
    $(document).ready(function () {

        //侧边栏高亮当前选择
        $('#user_manage').addClass("active");
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
                window.location.href = "admin?type=user_manage&page=" + page;
            }
        };

        //创建分页条
        $pagination.paging(setting);

        //双击出现的输入框
        var $editinput = $("<input style='width: 70%;float: left' type='text' class='form-control'/>");
        var $btn_cancel = $('<button style="float: left" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-remove"></span></button>');
        var $btn_ok = $('<button style="float: left" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-ok"></span></button>');

        //邮箱自动填充完整，需要jquery的ui的css
        $editinput.autocomplete({
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
                    }) : hosts);
                    var findedResult = $.map(findedHosts, function (value, index) {
                        return name + '@' + value;
                    });
                    //数组连接
                    result = result.concat(findedResult);
                }
                response(result);
            }
        });

        /**
         * 隐藏修改input和按钮
         */
        function hideall(){
            $editinput.hide();
            $btn_cancel.hide();
            $btn_ok.hide();
        }

        //取消更改事件
        $btn_cancel.click(function () {

            //获取绑定的元素,并显示
            var span = $editinput.data("editEle");
            if (span) {
                span.show();
            }

            hideall();
        });

        //提交更改事件
        $btn_ok.click(function () {
            console.log("on_commit");

            //获取绑定的元素
            var span = $editinput.data("editEle");

            if (span) {
                //有绑定的元素
                span.show();
                if (span.text() == $editinput.val()) {
                    //与修改前相同，不提交
                } else {
                    var $td = span.parent("td");
                    var $tr = $td.parent("tr");

                    //更新内容
                    span.text($editinput.val());

                    //发送ajax请求
                    $.ajax({
                        url: "AdminUpdateUser",
                        type: "POST",
                        datatype: "json",
                        data: {
                            user_id: $tr.attr("uid"),
                            username: $tr.find("td.uname").text(),
                            password: $tr.find("td.upwd").text(),
                            email: $tr.find("td.uemail").text(),
                            iphone: $tr.find("td.uphone").text()
                        },
                        success: function (rdata, textStatus) {
                            showDialog(rdata.msg);

                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            alert(XMLHttpRequest + textStatus + errorThrown);
                        }
                    });
                }
            }

            hideall();
        });

        //对于每一个可编辑的td元素
        $("td.editable").each(function () {
            //td元素本身
            var $this = $(this);

            //双击事件
            $this.dblclick(function () {

                //先使输入框完成输入
                //$editinput.blur();

                var oldspan = $editinput.data("editEle");
                if (oldspan) {
                    //有绑定的元素
                    oldspan.show();
                }

                //td的内容，隐藏起来
                var span = $this.children("span").hide();

                //邮箱自动输入
                var $td = span.parent("td");
                if ($td.hasClass("uemail")) {
                    //启用
                    $editinput.autocomplete("enable");
                } else {
                    //禁用
                    $editinput.autocomplete("disable");
                }

                //显示并绑定元素
                $editinput.appendTo($this).data("editEle", span).show();
                $editinput.val(span.text());

                $btn_ok.appendTo($this).show();
                $btn_cancel.appendTo($this).show();

                //设置焦点
                $editinput.focus();
            });
        });

        //对于每一个删除按钮
        $('button.btn_deleteUser').each(function () {
            var $this = $(this);

            //按钮被点击
            $this.click(function () {

                //ajax提交请求
                $.ajax({
                    url: "AdminDeleteUser",
                    type: "POST",
                    datatype: "json",
                    data: {
                        user_id: $this.attr("uid")
                    },
                    success: function (rdata, textStatus) {
                        //var data = $.parseJSON(rdata);
                        //回调
                        showDialog(rdata.msg);
                        if (rdata.success) {
                            $this.attr("disabled", true);
                            $this.text("删除成功！");
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
