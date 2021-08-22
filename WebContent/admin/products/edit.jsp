<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<HTML>
<HEAD>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK href="${pageContext.request.contextPath}/admin/css/Style.css"
	type="text/css" rel="stylesheet">
<script language="javascript"
	src="${pageContext.request.contextPath}/admin/js/public.js"></script>
<script language="javascript"
	src="${pageContext.request.contextPath}/admin/js/check.js"></script>

</HEAD>
<script type="text/javascript">
	
	function setProductCategory(t) {
		var category = document.getElementById("category");

		var ops = category.options;
		for ( var i = 0; i < ops.length; i++) {

			if (ops[i].value == t) {
				ops[i].selected = true;
				return;
			}
		}

	};
</script>
<body onload="setProductCategory('${p.category}')">
	<form id="userAction_save_do" name="Form1"
		action="${pageContext.request.contextPath}/editProduct" method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="id" value="${p.id}" /> &nbsp;
		<table cellSpacing="1" cellPadding="5" width="100%" align="center"
			bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
			<tr>
				<td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4"
					height="26"><strong><STRONG>Edit product</STRONG> </strong></td>
			</tr>


			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">product name:</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="name" class="bg" value="${p.name }" /></td>
				<td align="center" bgColor="#f5fafe" class="ta_01">product price</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="price" class="bg" value="${p.price }" /></td>
			</tr>
			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">product number</td>
				<td class="ta_01" bgColor="#ffffff"><input type="text"
					name="pnum" class="bg" value="${p.pnum}" /></td>
				<td align="center" bgColor="#f5fafe" class="ta_01">product category</td>
				<td class="ta_01" bgColor="#ffffff"><select name="category"
					id="category">
						<option value="Shoes">Shoes</option>
						<option value="Clothes">Clothes</option>
						<option value="Ebikes">E-bikes</option>
						<option value="Jewelry">Jewelry</option>
						<option value="Books">Books</option>
						<option value="Furniture">Furniture</option>
						<option value="Gym">Gym</option>
						<option value="MusicInstruments">Music-Instruments</option>
						<option value="Art">Arts</option>
						<option value="Others">Others</option>

				</select></td>
			</tr>


			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">product name</td>
				<td class="ta_01" bgColor="#ffffff" colSpan="3"><input
					type="file" name="upload" size="30" value="" /></td>
			</tr>
			<TR>
				<TD class="ta_01" align="center" bgColor="#f5fafe">product description:</TD>
				<TD class="ta_01" bgColor="#ffffff" colSpan="3"><textarea
						name="description" cols="30" rows="3" style="WIDTH: 96%">${p.description}</textarea>
				</TD>
			</TR>
			<TR>
				<td align="center" colSpan="4" class="sep1"><img
					src="${pageContext.request.contextPath}/admin/images/shim.gif">
				</td>
			</TR>


			<tr>
				<td class="ta_01" style="WIDTH: 100%" align="center"
					bgColor="#f5fafe" colSpan="4"><input type="submit"
					class="button_ok" value="confirm"> <FONT face="Times New Roman">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>



					<input type="reset" value="reset" class="button_cancel"> <FONT
					face="Times New Roman">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT> <INPUT
					class="button_ok" type="button" onclick="history.go(-1)" value="back" />
					<span id="Label1"> </span></td>
			</tr>
		</table>
	</form>


</body>
</HTML>