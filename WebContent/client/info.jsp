<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>CampusUsedGoodsV2</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/client/css/main.css"
        type="text/css" />
</head>
<body class="main">
    <jsp:include page="head.jsp" />
    <jsp:include page="menu_search.jsp" />
    <div id="divpagecontent">
        <table width="100%" border="0" cellspacing="0">
            <tr>
                <td><div style="text-align:right; margin:5px 10px 5px 0px">
                    <a href="${pageContext.request.contextPath }/index.jsp">Home
                        page</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;
                    <a
                        href="${pageContext.request.contextPath}/showProductByPage?category=${p.category}">&nbsp;${p.category}</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;${p.name}
                </div>
                    <table cellspacing="0" class="infocontent">
                        <tr>
                            <td><img
                                src="${pageContext.request.contextPath }/client/ad/Cartlogo.JPG" width="900" height="84" />
                                <table width="100%%" border="0" cellspacing="0">
                                    <tr>
                                        <td width="30%">
                                            <div class="divbookcover">
                                                <p>
                                                    <img
                                                        src="${pageContext.request.contextPath}${p.imgurl}"
                                                        width="213" height="269"
                                                        border="0" />
                                                </p>
                                            </div>
                                            <div style="text-align:center; margintop:25px; font-size:24px">
                                                <a
                                                    href="${pageContext.request.contextPath}/addCart?id=${p.id}">
                                                    <img
                                                        src="${pageContext.request.contextPath }/client/images/buybutton1.JPG" width="150" height="30" border="0" />
                                                </a>
                                            </div>
                                        </td>
                                        <td style="padding:20px 5px 5px 5px;font-size:16px">
                                            <img
                                                src="${pageContext.request.contextPath }/client/images/miniicon3.gif" width="20" height="13" />
                                            <font
                                                class="bookname">&nbsp;&nbsp;${p.name}</font>
                                            <hr />Price:<font color="#FF0000">￥${p.price}</font>
                                            <hr />Category ${p.category }
                                            <hr />
                                            <p>
                                                <b>Product Description:</b>
                                            </p> ${p.description}
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