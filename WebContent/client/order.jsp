<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>CampusUsedGoodsV2</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/client/css/main.css"
        type="text/css" />
    <script type="text/javascript">
        function createOrder(){
        document.getElementById("orderForm").submit();
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
                <td><div style="text-align:right; margin:5px 10px 5px 0px">
                    <a href="${pageContext.request.contextPath }/index.jsp">Home
                        page</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;<a
                    href="${pageContext.request.contextPath}/client/cart.jsp">&nbsp;cart</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;Order
                </div>
                    <form id="orderForm"
                        action="${pageContext.request.contextPath}/createOrder" method="post">
                        <table cellspacing="0" class="infocontent">
                            <tr>
                                <td><table width="100%" border="0" cellspacing="0">
                                    <tr>
                                        <td><img src="ad/Cartlogo.JPG"
                                            width="920" height="50" />
                                            <p>Hello,${user.username} Fill in your current address and press order now </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><table cellspacing="1"
                                            class="carttable">
                                            <tr>
                                                <td width="10%">ID</td>
                                                <td width="40%">product
                                                    name</td>
                                                <td width="10%">price</td>
                                                <td
                                                    width="10%">category</td>
                                                <td
                                                    width="10%">number</td>
                                                <td
                                                    width="10%">summation</td>
                                            </tr>
                                        </table>
                                            <c:set value="0" var="totalPrice"/>
                                            <c:forEach items="${cart}"
                                                var="entry" varStatus="vs">
                                                <table width="100%" border="0"
                                                    cellspacing="0">
                                                    <tr>
                                                        <td
                                                            width="10%">${vs.count}</td>
                                                        <td
                                                            width="40%">${entry.key.name }</td>
                                                        <td
                                                            width="10%">${entry.key.price }</td>
                                                        <td
                                                            width="10%">${entry.key.category}</td>
                                                        <td width="10%">
                                                            <input
                                                                name="text" type="text" value="${entry.value}" style="width:20px" readonly="readonly"/>
                                                        </td>
                                                        <td
                                                            width="10%">${entry.key.price*entry.value}</td>
                                                    </tr>
                                                </table>
                                                <c:set var="totalPrice"
                                                    value="${totalPrice+entry.key.price*entry.value}"/>
                                            </c:forEach>
                                            <table cellspacing="1"
                                                class="carttable">
                                                <tr>
                                                    <td style="text-align:right; padding-right:40px;"><font
                                                        style="color:#FF0000">Total:&nbsp;&nbsp;${totalPrice} Yuan</font>
                                                        <input type="hidden"
                                                            name="money" value="${totalPrice}">
                                                    </td>
                                                </tr>
                                            </table>
                                            <p style="padding:10px">
                                                Receiver address:<input
                                                name="receiverAddress" type="text" value=""
                                                style="width:350px" id="logintextfield" placeholder="address"/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#"></a>
                                                <br style="padding-top:10px"/>
                                                receiver:&nbsp;&nbsp;&nbsp;&nbsp;<input
                                                name="receiverName"
                                                type="text" value="${user.username}"
                                                style="width:150px" id="logintextfield" />&nbsp;&nbsp;&nbsp;&nbsp;<a href="#"></a>
                                                <br style="padding-top:10px"/> contact information<input
                                                type="text" name="receiverPhone"
                                                value="${user.telephone}"
                                                style="width:150px" id="logintextfield"/>&nbsp;&nbsp;&nbsp;&nbsp;<a
                                                href="#"></a>
                                            </p>
                                            <hr />
                                            <p style="text-align:right">
                                                <img src="ad/order-button.png"
                                                    width="204" height="51"
                                                    border="0"
                                                    onclick="createOrder();"/>
                                            </p>
                                        </td>
                                    </tr>
                                </table>
                                </td>
                            </tr>
                        </table>
                    </form>
                </td>
            </tr>
        </table>
    </div>
    <jsp:include page="foot.jsp" />
</body>
</html>
