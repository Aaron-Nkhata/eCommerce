<%@ page language="java" pageEncoding="UTF-8"%>
<html>
<head>
    <meta http-equiv="Content-Language" content="zh-cn">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
            <style type="text/css">
                BODY {
                MARGIN: 0px;
                BACKGROUND-COLOR: #ffffff
                }
                BODY {
                FONT-SIZE: 12px;
                COLOR: #000000
                }
                TD {
                FONT-SIZE: 12px;
                COLOR: #000000
                }
                TH {
                FONT-SIZE: 12px;
                COLOR: #000000
                }
            </style>
            <link href="${pageContext.request.contextPath}/admin/css/Style.css"
                rel="stylesheet" type="text/css">
                <script type="text/javascript">
                    function exitSys() {
                    var flag = window.confirm("Sure to exit");
                    if (flag) {
                    window.top.open('', '_parent', '');
                    window.top.close();
                    }
                    }
                </script>
            </HEAD>
            <body>
             
                <table width="100%" height="70%" border="0" cellspacing="0"
                    cellpadding="0">
                    <tr>
                        
                        <td width="100%" height="60px"
                            background="${pageContext.request.contextPath}/admin/images/phones.jpg">
                        </td>
                    </tr>
                </table>
                <table width="100%" border="0" cellspacing="0" cellpadding="0" style="background-color:#080808">
                    <tr>
                        <td height="30" valign="bottom"
                            background="${pageContext.request.contextPath}/admin/images/mis_01.jpg">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="85%" align="left">
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font
                                        color="#000000">
                                        <script language="JavaScript">
                                        </script> </font>
                                    </td>
                                    <td width="15%">
                                        <table width="100%" border="0" cellspacing="0"
                                            cellpadding="0">
                                            <tr>
                                                <td width="16"
                                                    background="${pageContext.request.contextPath}/admin/images/mis_05b.jpg">
                                                    <img
                                                        src="${pageContext.request.contextPath}/admin/images/mis_05a.jpg"
                                                        width="6" height="18">
                                                </td>
                                                <td width="155" valign="bottom"
                                                    background="${pageContext.request.contextPath}/admin/images/mis_05b.jpg">
                                                    <font color="blue">
                                                    <a href="javascript:void(0)"
                                                        onclick="exitSys()">LogOut</a>
                                                       
                                                    </font></td>
                                                <td width="10" align="right"
                                                    background="${pageContext.request.contextPath}/admin/images/mis_05b.jpg">
                                                    <img
                                                        src="${pageContext.request.contextPath}/admin/images/mis_05c.jpg"
                                                        width="6" height="18">
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td align="right" width="5%"></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </body>
        </HTML>