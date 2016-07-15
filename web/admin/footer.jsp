<%@ page contentType="text/html;charset=UTF-8" language="java" %>
</div>
</div>

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">×
                </button>
                <h4 class="modal-title" id="myModalLabel">
                   	 消息
                </h4>
            </div>
            <div class="modal-body">
                	按下 ESC 按钮退出。
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary"
                        data-dismiss="modal">确定
                </button>
                <%--<button type="button" class="btn btn-primary">--%>
                    <%--提交更改--%>
                <%--</button>--%>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>
<script>
    /**
     * 全局函数，显示对话框,此函数依赖于bootstrap.js
     * @param text 修改对话框的文本
     * @param callback 对话框确定按钮被点击的回调函数
     */
    function showDialog(text, callback) {
        var mydialog = $('#myModal');
        mydialog.find('div.modal-body').text(text);
        mydialog.modal('show');
        mydialog.on('hide.bs.modal', function () {
            // 执行一些动作...
            callback && callback();
        })
    }


    $(document).ready(function () {
        //初始化模态框
        var mydialog = $('#myModal');
        mydialog.modal('hide');
    });
</script>
<script src="${pageContext.request.contextPath}/admin/js/bootstrap.js"></script>
</body>
</html>