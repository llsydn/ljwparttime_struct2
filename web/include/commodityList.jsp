<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    /*按钮样式*/

    .button_commodity {
        font-size: 14px;
        padding: 10px 25px;
        width:129px;
        color:rgb(0, 17, 255);
        border: 1px rgb(93, 201, 30);
        background-color:rgb(179, 217, 150);
    }

    .button_commodity:hover {
        color: #9c539c;
        background-color: #d6d929;
        border-color: #1dc981;
    }

</style>


<ul>

    <%--第一种方法--%>
    <%--
    <c:forEach var="each" items="${CommodityClasses}">
        <li><a href="${each.commodity_id}">
        ${each.commodity_name}
        <c:out value="${each.commodity_name}" /> </a></li>
    </c:forEach>
--%>

    <s:iterator value="CommodityClasses" var="commodity">
        <li><input type="button" class="button_commodity"
                   the_id="${commodity.commodity_id}"
                   value="${commodity.commodity_name}"> <%--<s:property value="#commodity.commodity_name" />--%>
        </li>
    </s:iterator>
</ul>




