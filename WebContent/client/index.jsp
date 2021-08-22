<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>CampusUsedGoodsV2 HomePage</title>
<%-- import css --%>
<link	rel="stylesheet"	href="${pageContext.request.contextPath}/client/css/main.css" type="text/css" />
<!-- import css and js script -->
<link type="text/css" href="${pageContext.request.contextPath }/client/css/autoplay.css" rel="stylesheet" />
<script	type="text/javascript"
src="${pageContext.request.contextPath }/client/js/autoplay.js"></script>

</head>

<body class="main">
<%@include file="head.jsp"%>
<%@include file="menu_search.jsp" %>
<%-- <div id="divad">
<img src="${pageContext.request.contextPath}/client/ad/index_ad.jpg"/>
</div> --%>

<!-- bookstore repeat graphic	start -->
<div id="box_autoplay">
<div class="list">
<ul>
<li><img src="${pageContext.request.contextPath }/client/ad/shoe2.jpg" width="900" height="335" /></li>
<li><img src="${pageContext.request.contextPath }/client/ad/phones.jpg" width="900" height="335" /></li>
<li><img src="${pageContext.request.contextPath }/client/ad/gym1.jpg" width="900" height="335" /></li>
<li><img src="${pageContext.request.contextPath }/client/ad/electronic.jpg" width="900" height="335" /></li>
<li><img src="${pageContext.request.contextPath }/client/ad/ebikes.jpg" width="900" height="335" /></li>
<li><img src="${pageContext.request.contextPath }/client/ad/bikes.jpg" width="900" height="335" /></li>
</ul>
</div>
</div>
<!-- bookstore repeat graphic	end -->

<div id="divcontent">
 
<table width="900px" border="0" cellspacing="0">
<tr>
<td width="497">
<table cellspacing="0" class="ctl">
<tr>
<td width="485" height="29">${n.details }</td>
</tr>
</table>
</td>
<td style="padding:5px 15px 10px 40px">
<table width="100%" border="0" cellspacing="0">
<tr>
<td>
</td>
</tr>
</table>
<table width="100%" border="0" cellspacing="0">
<tr>
<c:forEach items="${pList }" var="pArray">
<td style="width:80; text-align:center">
<a href="${pageContext.request.contextPath}/findProductById?id=${pArray[0]}">
<img
src="${pageContext.request.contextPath }${pArray[2]}" width="102" height="130" border="0" />
</a>
<br />
<a href="${pageContext.request.contextPath}/findProductById?id=${pArray[0]}">${pArray[1]}</a>
<%-- <br />author:${pArray[2] } --%>
</td>
</c:forEach>
</tr>
</table>
</td>
</tr>
</table>
</div>
<%@ include file="foot.jsp" %>
</body>
</html>

