<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>CampusUsedGoodsV2</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/client/css/main.css"
        type="text/css" />
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
                        <a href="${pageContext.request.contextPath }/index.jsp">Home
                            page</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;
                        <a
                            href="${pageContext.request.contextPath }/client/myAccount.jsp">My Account
                        </a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;
                        <a href="${pageContext.request.contextPath }/findOrderByUser">Order Tracking</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;Order Details
                    </div>
                    <table cellspacing="0" class="infocontent">
                        <tr>
                            <td>
                                <table width="100%" border="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <p>Order Number:${order.id}</p> 
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table cellspacing="1" class="carttable">
                                                <tr>
                                                    <td width="10%">ID</td>
                                                    <td width="40%">product
                                                        name</td>
                                                    <td width="10%">product
                                                        price</td>
                                                    <td width="10%">number</td>
                                                    <td
                                                        width="10%">summation</td>
                                                </tr>
                                            </table>
                                            <c:forEach items="${order.orderItems}"
                                                var="item" varStatus="vs">
                                                <table width="100%" border="0"
                                                    cellspacing="0">
                                                    <tr>
                                                        <td
                                                            width="10%">${vs.count }</td>
                                                        <td
                                                            width="40%">${item.p.name}</td>
                                                        <td
                                                            width="10%">${item.p.price }</td>
                                                        <td
                                                            width="10%">${item.buynum }</td>
                                                        <td
                                                            width="10%">${item.buynum*item.p.price }</td>
                                                    </tr>
                                                </table>
                                            </c:forEach>
                                            <table cellspacing="1" class="carttable">
                                                <tr>
                                                    <td style="text-align:right; padding-right:40px;"><font
                                                        style="color:#FF0000">Total:&nbsp;&nbsp;${order.money}</font>
                                                    </td>
                                                </tr>
                                            </table>
                                            <p>
                                                receiverAddress:${order.receiverAddress }&nbsp;&nbsp;&nbsp;&nbsp;<br />
                                                receiverName:&nbsp;&nbsp;&nbsp;&nbsp;${order.receiverName }&nbsp;&nbsp;&nbsp;&nbsp;<br />
                                                receiverPhone:${order.receiverPhone }&nbsp;&nbsp;&nbsp;&nbsp;
                                            </p>
                                            <hr>
                                            <c:if test="${order.paystate != 1 }">
                                                <p style="text-align:right">
                                                    <a
                                                        href="${pageContext.request.contextPath}/client/pay.jsp?id=${order.id}&money=${order.money}">
                                                        <img
                                                            src="${pageContext.request.contextPath }/client/images/checkout11.JPG" width="204" height="51"
                                                            border="0" />
                                                    </a>
                                                </p>
                                            </c:if>
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
    <jsp:include page="foot.jsp" />
</body>
</html>