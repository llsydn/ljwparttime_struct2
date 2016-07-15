<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="head.jsp"/>
<%--主要style--%>
<style>
    .mainDiv {
        margin: auto;
        width: 1100px;
    }

    /*提交按钮*/
    .row .submit {
        color: rgb(255, 255, 255);
        font-size: 14px;
        padding: 10px 25px;
        border: 2px solid rgb(197, 229, 145);
        border-radius: 0;
        background-color: rgb(120, 195, 0);
    }

    .row .submit:hover {
        color: #ffffff;
        background-color: #78c300;
        border-color: #c5e591;
    }

    /*水平分割线*/
    .line {
        border: 1px dashed #F00;
        width: auto;
        height: 1px
    }

</style>
<%--表格style--%>
<style>
    /*基本*/
    table {
        width: 100%;
        border-collapse: collapse;
    }

    tr:nth-of-type(odd) {
        background: #eee;
    }

    th {
        background: #333;
        color: white;
        font-weight: bold;
    }

    td, th {
        padding: 6px;
        border: 1px solid #ccc;
        text-align: left;
    }

    /*css3*/
    @media only screen and (max-width: 760px),
    (min-device-width: 768px) and (max-device-width: 1024px) {

        /* Force table to not be like tables anymore */
        table, thead, tbody, th, td, tr {
            display: block;
        }

        thead tr {
            position: absolute;
            top: -9999px;
            left: -9999px;
        }

        tr {
            border: 1px solid #ccc;
        }

        td {
            /* Behave  like a "row" */
            border: none;
            border-bottom: 1px solid #eee;
            position: relative;
            padding-left: 50%;
        }

        td:before {
            /* Now like a table header */
            position: absolute;
            /* Top/left values mimic padding */
            top: 6px;
            left: 6px;
            width: 45%;
            padding-right: 10px;
            white-space: nowrap;
        }

        /*
        Label the data
        */
        td:nth-of-type(1):before {
            content: "姓名";
        }

        td:nth-of-type(2):before {
            content: "性别";
        }

        td:nth-of-type(3):before {
            content: "出生年月";
        }
    }
</style>

<%--主要div--%>
<div class="mainDiv">
    <h3>您正在查看兼职信息id为<s:property value="message.business_id"/>的申请人员:</h3>
    <h3>(<s:property value="message.commodity.commodity_name"/>)<s:property value="message.title"/></h3>
    <%--part1--%>
    <table>
        <thead>
        <tr>
            <th>用户名</th>
            <th>邮箱</th>
            <th>手机</th>
            <th>申请时间</th>
        </tr>
        </thead>
        <tbody>
        <s:iterator value="umlist" id="each">
            <tr>
                <td><s:property value="#each.user.username"/></td>
                <td><s:property value="#each.user.email"/></td>
                <td><s:property value="#each.user.iphone"/></td>
                <td><s:property value="#each.apply_time"/> </td>
            </tr>
        </s:iterator>
        </tbody>
    </table>
    <hr class="line"/>

</div>

<script type="text/javascript">
    $(document).ready(function () {
        //导航条相关
        //设置当前激活的导航按钮
        $('#nav_person').addClass('active');
        //一开始就触发一次离开函数，以便归位
        $('div.n-left').mouseleave();

    });
</script>
</body>
</html>
