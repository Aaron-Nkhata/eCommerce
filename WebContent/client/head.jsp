<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div id="divhead">
<table cellspacing="0" class="headtable">
<tr>
<td>
<a href="${pageContext.request.contextPath }/index.jsp">
<img src="${pageContext.request.contextPath}/client/images/campuslogo.JPG" width="200" height="60" border="0" />
</a>
</td>
<td style="text-align:right">
<img	src="${pageContext.request.contextPath}/client/images/cart1.png" width="26"	height="23"	style="margin-bottom:-4px"	/>&nbsp;<a href="${pageContext.request.contextPath}/client/cart.jsp">My cart</a>
| <a href="${pageContext.request.contextPath}/myAccount">My Account</a>
| <a   href="${pageContext.request.contextPath}/client/register.jsp">Sign up</a>
| <a href="#">Help</a>
<%--<br><br><br>Welcome${user.username} --%>
</td>
</tr>
</table>
</div>