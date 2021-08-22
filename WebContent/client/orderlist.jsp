<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html>
<head>

    <title>CampusUsedGoodsV2</title>

    <link
        rel="stylesheet"
        href="${pageContext.request.contextPath}/client/css/main.css"
        type="text/css" />
</head>

<body class="main">

    <p:user />

    <jsp:include page="head.jsp" />

    <jsp:include page="menu_search.jsp" />

    <div id="divpagecontent">

        <table
            width="100%"
            border="0"
            cellspacing="0">

            <tr>

                <td width="25%">

                    <table
                        width="100%"
                        border="0"
                        cellspacing="0"
                        style="margintop: 30px">

              

             

                        <tr>

                            <td class="listtd">

                                <img
                                    src="${pageContext.request.contextPath }/client/images/miniicon.gif"
                                    width="9"
                                    height="6" />&nbsp;&nbsp;&nbsp;&nbsp;

                                <a href="${pageContext.request.contextPath}/findOrderByUser">
                                    Query orders
                                </a>
                            </td>
                        </tr>

                        <tr>

                            <td class="listtd">

                                <img
                                    src="${pageContext.request.contextPath }/client/images/miniicon.gif"
                                    width="9"
                                    height="6" />&nbsp;&nbsp;&nbsp;&nbsp;

                                <a href="${pageContext.request.contextPath}/logout">Logout</a>
                            </td>
                        </tr>
                    </table>
                </td>

                <td>

                    <div style="text-align:right; margin:5px 10px 5px 0px">

                        <a href="${pageContext.request.contextPath }/index.jsp">Home page</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;

                        <a href="${pageContext.request.contextPath }/client/myAccount.jsp">&nbsp;My account</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;Query order
                    </div>

                    <table
                        cellspacing="0"
                        class="infocontent">

                        <tr>

                            <td style="padding:20px">

                                <p>

                                    <b>List of Orders</b>
                                </p>

                                <p>
                                    Total Number:

                                    <font style="color:#FF0000">${orders.size()}</font> orders
                                </p>

                                <table
                                    width="100%"
                                    border="0"
                                    cellspacing="0"
                                    class="tableopen">

                                    <tr>

                                        <td
                                            bgcolor="#A3E6DF"
                                            class="tableopentd01">Order ID</td>

                                        <td
                                            bgcolor="#A3E6DF"
                                            class="tableopentd01">Receiver</td>

                                        <td
                                            bgcolor="#A3E6DF"
                                            class="tableopentd01">Order time</td>

                                        <td
                                            bgcolor="#A3E6DF"
                                            class="tableopentd01">Order status</td>

                                        <td
                                            bgcolor="#A3E6DF"
                                            class="tableopentd01">Operation
                                        </td>
                                    </tr>

                                    <c:forEach
                                        items="${orders}"
                                        var="order">

                                        <tr>

                                            <td class="tableopentd02">${order.id}</td>

                                            <td class="tableopentd02">${order.receiverName }</td>

                                            <td class="tableopentd02">${order.ordertime}</td>

                                            <td class="tableopentd02">${order.paystate==0?"Unpaid":"Paid"}</td>

                                            <td class="tableopentd03">

                                                <a href="${pageContext.request.contextPath}/findOrderById?id=${order.id}">view</a>&nbsp;&nbsp;

                                                <c:if test="${order.paystate==0 }">

                                                    <a href="${pageContext.request.contextPath}/delOrderById?id=${order.id}">
                                                        delete
                                                    </a>
                                                </c:if>

                                                <c:if test="${order.paystate!=0 }">

                                                    <a href="${pageContext.request.contextPath}/delOrderById?id=${order.id}&type=client">
                                                        delete
                                                    </a>
                                                </c:if>
                                            </td>
                                        </tr>
                                    </c:forEach>
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