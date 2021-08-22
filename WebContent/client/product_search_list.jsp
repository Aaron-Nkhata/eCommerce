<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>CampusUsedGoodsV2</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/client/css/main.css"
	        type="text/css" />
	<%--import css,js --%>
</head>
<body class="main">
    <jsp:include page="head.jsp" />
    <jsp:include page="menu_search.jsp" />
    <div id="divpagecontent">
        <table width="100%" border="0" cellspacing="0">
            <tr>
                <td><div style="text-align:right; margin:5px 10px 5px 0px">
                    <a href="index.jsp">Homepage</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;ALL&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp; Products list
                </div>
                    <table cellspacing="0" class="listcontent">
                        <tr>
                            <td>
                                <h1>Searched List</h1>
                                <hr />
                             
          
                                <table cellspacing="0" class="booklist">
                                    <tr>
                                        <c:forEach items="${bean.ps}" var="p"
                                            varStatus="vs">
                                            <td>
                                                <div class="divbookpic">
                                                    <p>
                                                        <a
                                                            href="${pageContext.request.contextPath}/findProductById?id=${p.id}"><img
                                                            src="${pageContext.request.contextPath}${p.imgurl}"
                                                            width="115"
                                                            height="129" border="0" /> </a>
                                                    </p>
                                                </div>
                                                <div class="divlisttitle">
                                                    <a href="${pageContext.request.contextPath}/findProductById?id=${p.id}">name:${p.name}<br
                                                        />price:￥${p.price} </a>
                                                </div>
                                            </td>
                                            <%-- <c:if test="${vs.count%4==0}">
                                        </c:if> --%>
                                        </c:forEach>
                                    </tr>
                                </table>
                                <div class="pagination">
                                    <ul>
                                        <c:if test="${bean.currentPage!=1}">
                                            <li class="nextPage">
                                                <a href="${pageContext.request.contextPath}/MenuSearchSerlvet?currentPage=${bean.currentPage-1}&textfield=${bean.searchfield}">&lt;&lt;last</a>
                                            </li>
                                        </c:if>
                                        <c:if test="${bean.currentPage==1}">
                                            <li class="disablepage">&lt;&lt;last</li>
                                        </c:if>
                                        <c:forEach begin="1" end="${bean.totalPage}"
                                            var="pageNum">
                                            <c:if
                                                test="${pageNum==bean.currentPage}">
                                                <li
                                                    class="currentpage">${pageNum }</li>
                                            </c:if>
                                            <c:if
                                                test="${pageNum!=bean.currentPage}">
                                                <li><a href="${pageContext.request.contextPath}/MenuSearchSerlvet?currentPage=${pageNum}&textfield=${bean.searchfield}">${pageNum}</a>
                                                </li>
                                            </c:if>
                                        </c:forEach>
                                        <c:if
                                            test="${bean.currentPage==bean.totalPage||bean.totalPage==0}">
                                            <li class="disablepage">next &gt;&gt;</li>
                                        </c:if>
                                        <c:if
                                            test="${bean.currentPage!=bean.totalPage&&bean.totalPage!=0}">
                                            <li class="nextpage">
                                                <a
                                                    href="${pageContext.request.contextPath}/MenuSearchSerlvet?currentPage=${bean.currentPage+1}&textfield=${bean.searchfield}">next&gt;&gt;</a>
                                            </li>
                                        </c:if>
                                    </ul>
                                </div></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
   
</body>
</html>
