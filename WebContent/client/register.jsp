<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>CampusUsedGoods</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/client/css/main.css"
	        type="text/css" />
	<%--import css,js --%>
	
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/client/js/form.js"></script>
	<script type="text/javascript">
		function changeImage() {
			// change character
			document.getElementById("img").src = "${pageContext.request.contextPath}/imageCode?time=" + new Date().getTime();
			
		}
	</script>
</head>

<body class="main">
	<!-- 1.online bookstore top --- start -->
	<jsp:include page="head.jsp" />
	<!-- online bookstore top ---  end -->
	<!--2. online bookstore  menu start -->
	
	<!-- online bookstore  menu  end -->
	<!-- 3.online bookstore user register  start -->
	<div id="divcontent">
		<form
			action="${pageContext.request.contextPath}/client/registersuccess.jsp"
			method="post" onsubmit="return checkForm();">
			<table width="850px" border="0" cellspacing="0">
				<tr>
					<td style="padding: 30px;font-family:Comic Sans MS">
					<h2>User Registration</h2>
						<table width="70%" border="0" cellspacing="2" class="upline">
							<tr>
								<td style="text-align: right; width: 20%">Mail</td>
								<td style="width: 40%">
									<input type="text" class="textinput"
										 name="email" id="logintextfield" placeholder="a valid email" onkeyup="checkEmail();" />
								</td>
								<td colspan="2"><span id="emailMsg"></span><font
									color="#999999">a valid mail</font></td>
							</tr>
							
							<tr>
								<td style="text-align: right">User name</td>
								<td><input type="text" class="textinput" id="logintextfield"
									name="username" placeholder="Letter,Number, or underscore(_), don't start with a number"  onkeyup="checkUsername();" /></td>
								
								<td colspan="2"><span id="usernameMsg"></span><font
									color="#999999">Letter,Number, or underscore(_), don't start with a number </font></td>
							</tr>
							
							<tr>
								<td style="text-align: right">Password</td>
								<td><input type="password" class="textinput" id="logintextfield"
									name="password" placeholder="6-16 characters" onkeyup="checkPassword();" /></td>
								<td><span id="passwordMsg"></span><font color="#999999">6-16 characters</font></td>
							</tr>
							<tr>
								<td style="text-align: right">Repeat Password</td>
								<td><input type="password" class="textinput"
									id="logintextfield" name="repassword" onkeyup="checkConfirm();" />
								</td>
								<td><span id="confirmMsg"></span>&nbsp;</td>
							</tr>
							<tr>
								<td style="text-align: right">Gender</td>
								<td colspan="2">&nbsp;&nbsp; 
									<input type="radio"
									name="gender" value="male" checked="checked" />Male
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
									<input type="radio"
									name="gender" value="female" /> Female
								</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td style="text-align: right">Mobile</td>
								<td colspan="2"><input type="text" class="textinput"
									style="width: 350px" id="logintextfield" name="telephone" /></td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td style="text-align: right">Self Introduction</td>
								<td colspan="2"><textarea class="textarea" name="introduce"
								id="selfintroductiontextfield"></textarea>
								</td>
								<td>&nbsp;</td>
							</tr>
						</table>


						<h1>Registration verification</h1>
						<table width="80%" border="0" cellspacing="2" class="upline">
							<tr>
								<td style="text-align: right; width: 20%">Inputer verification code</td>
								<td style="width: 50%"><input type="text" class="textinput" id="logintextfield" />
								</td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td style="text-align: right; width: 20%;">&nbsp;</td>
								<td rowspan="2" style="width: 50%"><img
									src="${pageContext.request.contextPath}/imageCode" width="180"
									height="40" class="textinput" style="height: 45px;" id="img" />&nbsp;&nbsp;
									<a href="javascript:void(0);" onclick="changeImage()">Change one</a>
								</td>
							</tr>
						</table>

						<table width="70%" border="0" cellspacing="0">
							<tr>
								<td style="padding-top: 20px; text-align: center"><input
									type="image" src="images/signup.gif" name="submit" border="0" />
								</td>
							</tr>
						</table></td>
				</tr>
			</table>
		</form>
	</div>

	<!-- online bookstore user register  end -->
	<!--4. online bookstore foot start -->
	<%@ include file="foot.jsp" %>
	<!-- online bookstore foot start -->
</body>
</html>