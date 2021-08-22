<%@ page language="java" pageEncoding="UTF-8"%>
<HTML>
<HEAD>
    <meta http-equiv="Content-Language" content="zh-cn">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <LINK href="${pageContext.request.contextPath}/admin/css/Style.css"
        type="text/css" rel="stylesheet">
</HEAD>
<body>
    <form id="userAction_save_do" name="Form1"
        action="${pageContext.request.contextPath}/manager/AddNoticeServlet"
        method="post">
        &nbsp;
        <table cellSpacing="1" cellPadding="5" width="100%" align="center"
            bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
            <tr>
                <td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4"
                    height="26"><strong>Add notice</strong>
                </td>
            </tr>
            <tr>
                <td align="center" bgColor="#f5fafe" class="ta_01">title of notice</td>
                <td class="ta_01" bgColor="#ffffff" colSpan="3">
                    <input type="text" name="title" class="bg" maxlength="10"/>
                </td>
            </tr>
            <tr>
                <td class="ta_01" align="center" bgColor="#f5fafe">content of notice</td>
                <td class="ta_01" bgColor="#ffffff" colSpan="3">
                    <textarea name="details" cols="30" rows="3" style="WIDTH:96%"></textarea>
                </td>
            </tr>
            <tr>
                <td align="center" colSpan="4" class="sep1">
                    <img src="${pageContext.request.contextPath}/admin/images/shim.gif">
                </td>
            </tr>
            <tr>
                <td class="ta_01" style="WIDTH: 100%" align="center"
                    bgColor="#f5fafe" colSpan="4">
                    <input type="submit" class="button_ok" value="submit">
                    <font face="Times New Roman">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font>
                    <input type="reset" value="reset" class="button_cancel">
                    <font face="Times New Roman">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font>
                    <input class="button_ok" type="button" onclick="history.go(-1)" value="return" />
                    <span id="Label1"></span>
                </td>
            </tr>
        </table>
    </form>
</body>
</HTML>