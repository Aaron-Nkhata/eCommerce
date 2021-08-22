<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>CampusUsedGoodsV2</title>
    <link rel="stylesheet"
        href="${pageContext.request.contextPath }/client/css/main.css"
        type="text/css" />
</head>
<body class="main">
    <jsp:include page="head.jsp" />
    <div id="divcontent">
        <form action="${pageContext.request.contextPath}/login" method="post">
            <table width="900px" border="0" cellspacing="0">
                <tr>
                    <td style="padding: 30px"><div style="height: 470px">
                        <b>&nbsp;&nbsp;Hello&nbsp;&raquo;&nbsp;Login or Register</b>
                        <div>
                            <table width="85%" border="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <div id="logindiv">
                                            <table width="100%" border="0"
                                                cellspacing="0">
                                                <tr>
                                                    <td style="text-align: center; padding-top: 20px"><img
                                                        src="${pageContext.request.contextPath }/client/images/logicon.jpg"
                                                        width="100"
                                                        height="100" /></td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: center; padding-top: 20px;"><font
                                                        color="#ff0000">${requestScope["register_message"]}</font>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align:center">
                                                        <table width="80%"
                                                            border="0" cellspacing="0"
                                                            style="margin-top:15px; margin-left: auto; margin-right: auto">
                                                            <tr>
                                                                <td
                                                                    style="text-align: right; padding-top: 5px; width: 25%; font-size:12px;font-family:Comic Sans MS">Username </td>
                                                                <td style="text-align: left;padding-top: 5px;">
	                                                                <input name="username" type="text" class="textinput" placeholder="username" id="logintextfield"/>
                                                                 </td>
                                                            </tr>
                                                            <tr> 
                                                                <td
                                                                    style="text-align: right; padding: 10px;font-family:Comic Sans MS">Password </td>
                                                                <td style="text-align: left; padding-top: 10px;">
                                                                    <input
                                                                    	name="password" 
                                                                    	type="password" 
                                                                    	class="textinput" 
                                                                    	placeholder="password"
                                                                    	id="logintextfield"/>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td
                                                                    colspan="2" style="text-align: center"><input
                                                                    type="checkbox" name="checkbox" value="checkbox" />
                                                                    Stay Login&nbsp;&nbsp; <input type="checkbox"
                                                                        name="checkbox" value="checkbox" />Forget Password</td>
                                                            </tr>
                                                            <tr>
                                                                <td
                                                                    colspan="2"
                                                                    style="padding-top: 10px; text-align: center"><input
                                                                    name="image" type="image"
                                                                    src="${pageContext.request.contextPath }/client/images/login.JPG"
                                                                    width="83" height="22" /></td>
                                                            </tr>
                                                            <tr>
                                                                
                                                            <!-- <tr>
                                                            <input
                                                            name="image" type="image" onclick="return formcheck()"
                                                            <td
                                                            colspan="2"
                                                            style="padding-top:10px; text-align:center"><a
                                                            href="register.jsp"><img name="image"
                                                            src="images/signupbutton.gif" width="135" height="33" />
                                                            </a></td>
                                                            </tr> -->
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                    <td style="text-align: left; padding-top: 30px; width: 60%"><h1></h1>
                                        <p style="text-align: left">
                                            <a
                                                href="${pageContext.request.contextPath }/client/register.jsp">
                                                <img
                                                    src="${pageContext.request.contextPath }/client/images/registerbutton2.png"
                                                    width="135" height="33" />
                                            </a>
                                        </p></td>
                                </tr>
                            </table>
                        </div>
                    </div></td>
                </tr>
            </table>
        </form>
    </div>
    <jsp:include page="foot.jsp" />
</body>
</html>