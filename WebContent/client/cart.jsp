<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>CampusUsedGoodsV2</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/client/css/main.css"
        type="text/css" />
    <script>
        function changeProductNum(count, totalCount, id) {
        count = parseInt(count);
        totalCount = parseInt(totalCount);
        if (count == 0) {
        var flag = window.confirm("Confirm to delete the product");
        if (!flag) {
        count = 1;
        }
        }
        if (count > totalCount) {
        alert("Reach the max-value of product");
        count = totalCount;
        }
        location.href = "${pageContext.request.contextPath}/changeCart?id="
        + id + "&count=" + count;
        }
    </script>
</head>
<body class="main">
    <p:user/>
    <jsp:include page="head.jsp" />
    <jsp:include page="menu_search.jsp" />
    <div id="divpagecontent">
        <table width="100%" border="0" cellspacing="0">
            <tr>
                <td>
                    <div style="text-align:right; margin:5px 10px 5px 0px">
                        <a href="${pageContext.request.contextPath }/index.jsp">home
                            page</a>
                        &nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;cart
                    </div>
                    <table cellspacing="0" class="infocontent">
                        <tr>
                            <td>
                                <img
                                    src="${pageContext.request.contextPath}/client/ad/Cartlogo.JPG" width="900" height="89" />
                                <table width="100%" border="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table cellspacing="1" class="carttable">
                                                <tr>
                                                    <td width="10%">ID</td>
                                                    <td width="30%">name</td>
                                                    <td width="10%">price</td>
                                                    <td width="20%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;number</td>
                                                    <td width="10%">Product</td>
                                                    <td width="10%">count</td>
                                                    <td width="10%">cancel</td>
                                                </tr>
                                            </table>
                                            <c:set var="total" value="0" />
                                            <c:forEach items="${cart}" var="entry"
                                                varStatus="vs">
                                                <table width="100%" border="0"
                                                    cellspacing="0">
                                                    <tr>
                                                        <td
                                                            width="10%">${vs.count}</td>
                                                        <td
                                                            width="30%">${entry.key.name }</td>
                                                        <td
                                                            width="10%">${entry.key.price }</td>
                                                        <td width="20%">
                                                            <input type="button"
                                                                value='-' style="width:20px"
                                                                onclick="changeProductNum('${entry.value-1}','${entry.key.pnum}','${entry.key.id}')">
                                                            <input name="text"
                                                                type="text" value="${entry.value}" style="width:40px;text-align:center" />
                                                            <input type="button"
                                                                value='+' style="width:20px"
                                                                onclick="changeProductNum('${entry.value+1}','${entry.key.pnum}','${entry.key.id}')">
                                                        </td>
                                                        <td
                                                            width="10%">${entry.key.pnum}</td>
                                                        <td
                                                            width="10%">${entry.key.price*entry.value}</td>
                                                        <td width="10%">
                                                            <a
                                                                href="${pageContext.request.contextPath}/changeCart?id=${entry.key.id}&count=0"
                                                                style="color:#FF0000; font-weight:bold">X</a>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <c:set
                                                    value="${total+entry.key.price*entry.value}" var="total" />
                                            </c:forEach>
                                            <table cellspacing="1" class="carttable">
                                                <tr>
                                                    <td style="text-align:right; padding-right:40px;">
                                                        <font style="color:#FF6600; font-weight:bold">summation：&nbsp;&nbsp;${total}Yuan</font>
                                                    </td>
                                                </tr>
                                            </table>
                                            <div style="text-align:right; margintop:10px">
                                                <a
                                                    href="${pageContext.request.contextPath}/showProductByPage">
                                                    <img src="ad/previous.JPG" width="100" height="40"
                                                        border="0" />
                                                </a>
                                                &nbsp;&nbsp;&nbsp;&nbsp;
                                                <a
                                                    href="${pageContext.request.contextPath}/client/order.jsp">
                                                    <img
                                                        src="${pageContext.request.contextPath}/client/ad/Next2.JPG" width="100" height="40" border="0" />
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
</body>
</html>