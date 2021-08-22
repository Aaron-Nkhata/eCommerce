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
                <td width="40%" >
                    <table width="100%" border="0" cellspacing="0" style="margintop: 30px">
                       
                        <tr>
 
                            <td class="divmenu">
                           
                                <img
                                    src="${pageContext.request.contextPath }/client/images/miniicon.gif" width="9" height="6" />&nbsp;&nbsp;&nbsp;&nbsp;
                                <a
                                    href="${pageContext.request.contextPath }/client/modifyuserinfo.jsp">Edit User Info</a>
                                     
                            </td>
                           
                        </tr>
                        
                        <tr>
                            <td class="divmenu">
                                <img
                                    src="${pageContext.request.contextPath }/client/images/miniicon.gif" width="9" height="6" />&nbsp;&nbsp;&nbsp;&nbsp;
                                <a
                                    href="${pageContext.request.contextPath}/findOrderByUser">My Orders</a>
                            </td>
                        </tr>
                        <tr>
                            <td class="divmenu" >
                                <img
                                    src="${pageContext.request.contextPath }/client/images/miniicon.gif" width="9" height="6" />&nbsp;&nbsp;&nbsp;&nbsp;
                                <a
                                    href="${pageContext.request.contextPath}/logout">Logout</a>
                            </td>
                        </tr>
                    </table>
                </td>
                
                <td >
                    <div style="text-align:right; margin:5px 10px 5px 0px">
                        <a
                            href="${pageContext.request.contextPath }/index.jsp">HomePage</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;My account&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;welcome
                    </div>
                    <table cellspacing="0" class="infocontent">
                        <tr>
                            <td style="padding:20px" ><p>
                                <img
                                    src="${pageContext.request.contextPath }/client/images/background4.png" width="631" height="436" />
                            </p>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
</body>
</html>