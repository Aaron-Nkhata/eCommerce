<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/admin/css/Style.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="${pageContext.request.contextPath}/admin/js/public.js">
</script>
</head>
<body>
	<br>
	<form id="Form1" name="Form1" action="${pageContext.request.contextPath}/download" method="post">
		<table cellSpacing="1" cellPadding="0" width="100%" align="center" 
		bgColor="#f5fafe" border="0">
			<tbody>
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3">
						<strong>search condition</strong>
					</td>
				</tr>
				<tr>
					<td>
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr>
								<td height="22" align="center" bgColor="#f5fafe" class="ta_01">
									Input year:
								</td>
								<td class="ta_01" bgColor="#ffffff">
									<input type="text" name="year" size="15" value="" 
									id="Form1_userName" class="bg" />
								</td>
								<td height="22" align="center" bgColor="#f5fafe" class="ta_01">
									Select month
								</td>
								<td class="ta_01" bgColor="#ffffff">
									<select name="month" id="month">
										<option value="0">--select month--</option>
										<option value="1">January</option>
										<option value="2">February</option>
										<option value="3">Mar</option>
										<option value="4">April</option>
										<option value="5">May</option>
										<option value="6">June</option>
										<option value="7">July</option>
										<option value="8">August</option>
										<option value="9">September</option>
										<option value="10">October</option>
										<option value="11">November</option>
										<option value="12">December</option>
									</select>
								</td>
							</tr>
							<tr>
								<td width="100" height="22" align="center" 
								bgColor="#f5fafe" class="ta_01">
								</td>
								<td class="ta_01" bgColor="#ffffff">
									<font face="Times New Roman" color="red"> &nbsp;</font>
								</td>
								<td align="right" bgColor="#ffffff" class="ta_01">
									<br><br>
								</td>
								<td align="center" bgColor="#ffffff" class="ta_01">
									<input type="submit" id="search" name="search" value="Download"
									class="button_view"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
									<input type="reset" name="reset" value="reset" class="button_view" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>

