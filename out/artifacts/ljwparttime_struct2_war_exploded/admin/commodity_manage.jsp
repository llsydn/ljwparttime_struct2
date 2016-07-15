<%--
    分类管理
--%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>

<div class="col-md-10">
    <h4 class="text-center">分类管理</h4>
    <div class="row">
        <table class="table">
            <caption>所有分类列表:</caption>
            <thead>
            <tr>
                <th>分类id</th>
                <th>分类名字</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <s:iterator value="comlist" id="each">
                <tr>
                    <td class="editable mid"><span><s:property value="#each.commodity_id"/></span></td>
                    <td class="editable mname"><span><s:property value="#each.commodity_name"/></span></td>
                    <td>
                        <button class="btn btn-primary delete_com" mid="<s:property value="#each.commodity_id"/>">
                           	 删除
                        </button>
                    </td>
                </tr>
            </s:iterator>

            <%--添加新兼职分类--%>
            <tr>
                <td>
                    <span>新建兼职分类:</span>
                </td>
                <td>
                    <label>
                        <input type="text" class="form-control" id="com_newname"/>
                    </label>
                </td>
                <td>
                    <button class="btn btn-primary add_new" id="btn_addcom">
                       	 添加
                    </button>
                </td>
            </tr>
            </tbody>
        </table>
    </div>

</div>

<%--为bootstrap优化的分页插件--%>
<script src="${pageContext.request.contextPath}/admin/js/jquery-page-bootstrap.js"></script>
<script type="text/javascript">
    $(document).ready(function () {

        //侧边栏高亮当前选择
        $('#commodity_manage').addClass("active");
        //展开当前侧边栏栏目
        $('#collapse_manage').addClass("in");

        //双击出现的输入框
        var $editinput = $("<input style='width: 70%;float: left' type='text' class='form-control'/>");
        var $btn_cancel = $('<button style="float: left" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-remove"></span></button>');
        var $btn_ok = $('<button style="float: left" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-ok"></span></button>');

        /**
         * 隐藏修改input和按钮
         */
        function hideall() {
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
                    //这一个td
                    var $td = span.parent("td");
                    //这一行
                    var $tr = $td.parent("tr");

                    //更新内容
                    span.text($editinput.val());

                    //发送ajax请求
                    $.ajax({
                        url: "admincommodity",
                        type: "POST",
                        datatype: "json",
                        data: {
                            type: "update",
                            "commodity.commodity_id": $tr.find("td.mid").text(),
                            "commodity.commodity_name": $tr.find("td.mname").text()
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
            var $thistd = $(this);

            //双击事件
            $thistd.dblclick(function () {

                var oldspan = $editinput.data("editEle");
                if (oldspan) {
                    //有绑定的元素
                    oldspan.show();
                }

                //td的内容，隐藏起来
                var span = $thistd.children("span").hide();

                //显示并绑定元素
                $editinput.appendTo($thistd).data("editEle", span).show();
                $editinput.val(span.text());

                $btn_ok.appendTo($thistd).show();
                $btn_cancel.appendTo($thistd).show();

                //设置焦点
                $editinput.focus();
            });
        });

        //对于每一个删除按钮
        $('button.delete_com').each(function () {
            //指代删除按钮
            var $this = $(this);

            //按钮被点击
            $this.click(function () {

                //ajax提交请求
                $.ajax({
                    url: "admincommodity",
                    type: "POST",
                    datatype: "json",
                    data: {
                        type: "delete",
                        "commodity.commodity_id": $this.attr("mid")
                    },
                    success: function (rdata, textStatus) {
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

        //添加新兼职分类
        var $com_newname = $('#com_newname');
        var $btn_addcom = $('#btn_addcom');
        $btn_addcom.click(function () {
            if ($com_newname.val()!="") {
                //不为空
                //发送ajax请求
                $.ajax({
                    url: "admincommodity",
                    type: "POST",
                    datatype: "json",
                    data: {
                        type: "add",
                        "commodity.commodity_name": $com_newname.val()
                    },
                    success: function (rdata, textStatus) {
                        showDialog(rdata.msg, function () {
                            if (rdata.success) {
                                //成功的话重新加载本页面
                                window.location.reload(true);
                            }
                        });
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert(XMLHttpRequest + textStatus + errorThrown);
                    }
                });
            }
        });
    });
</script>

<%@ include file="footer.jsp" %>