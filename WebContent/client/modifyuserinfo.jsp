<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>CampusUsedGoodsV2</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/client/css/main.css"
        type="text/css" />
</head>
<body class="main">
    <p:user />
    <jsp:include page="head.jsp" />
    <jsp:include page="menu_search.jsp" />
    <div id="divpagecontent" style="font-family:Comic Sans MS">
        <table width="100%" border="0" cellspacing="0">
            <tr>
                <td width="25%">
                    <table width="100%" border="0" cellspacing="0"
                        style="margin-top:30px">
                        
              
                        <tr>
                            <td class="listtd">
                                <img
                                    src="${pageContext.request.contextPath }/client/images/miniicon.gif" width="9" height="6" />&nbsp;&nbsp;&nbsp;&nbsp;
                                <a
                                    href="${pageContext.request.contextPath}/findOrderByUser">My Orders</a>
                            </td>
                        </tr>
                        <tr>
                            <td class="listtd">
                                <img
                                    src="${pageContext.request.contextPath }/client/images/miniicon.gif" width="9" height="6" />&nbsp;&nbsp;&nbsp;&nbsp;
                                <a
                                    href="${pageContext.request.contextPath}/logout">Logout</a>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    <div style="text-align:right; margin:5px 10px 5px 0px">
                        <a href="${pageContext.request.contextPath }/index.jsp">Home
                            page</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;
                        <a
                            href="${pageContext.request.contextPath }/client/myAccount.jsp">&nbsp;My
                            account</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;ModifyUserInfo
                    </div>
                    <table cellspacing="0" class="infocontent">
                        <tr>
                            <td>
                                <table width="100%" border="0" cellspacing="2"
                                    class="upline">
                                    <tr>
                                        <td style="text-align:right; width:20%">Mail
                                            box</td>
                                            <td>
                                        <input 
                                        	type="password"
											class="textinput"
                                        	placeholder="Enter email"
                                            id="logintextfield"
                                            /></td>
                                        <td style="width:40%; paddingleft: 20px">${user.email }</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="text-align:right">User name</td>
                                        <td style="paddingleft: 20px">${user.username }</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="text-align:right">Old
                                            password</td>
                                        <td>
                                        <input 
                                        	type="password"
											class="textinput"
                                        	placeholder="Enter Password"
                                            id="logintextfield"
                                            /></td>
                                        <td><font color="#999999">at least 8 characters,lower and uppercase
                                            </font></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align:right">New password</td>
                                        <td><input type="password" class="textinput" placeholder="Enter Password" id="logintextfield"
                                            /></td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="text-align:right">Gender</td>
                                        <td colspan="2">&nbsp;&nbsp;
                                            <input type="radio" name="radiobutton"
                                                value="radiobutton" ${user.gender=='男'?'checked':'' }/> Male
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <input type="radio" name="radiobutton"
                                                value="radiobutton" ${user.gender=='女'?'checked':'' }/> Female
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align:right">Mobile Number
                                            </td>
                                        <td colspan="2">
                                            <input name="text2" type="text" placeholder="valid number" id="logintextfield"
                                                value="${user.telephone}" class="textinput" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align:right">&nbsp;</td>
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                </table>
                                <p style="text-align:center">
                                    <a href="success.html">
                                        <img
                                            src="${pageContext.request.contextPath }/client/images/submitt1.JPG" border="0" width="200" height="30"/>
                                    </a>
                                </p>
                                <p style="text-align:center">&nbsp;</p>
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