<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<HTML>
<HEAD>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/admin/css/Style.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="${pageContext.request.contextPath}/admin/js/public.js"></script>
<script type="text/javascript">
	function addProduct() {
		window.location.href = "${pageContext.request.contextPath}/admin/products/add.jsp";
	}
</script>
</HEAD>
<body>
	<br>
	<form id="Form1" name="Form1"
		action="${pageContext.request.contextPath}/findProductByManyCondition"
		method="post">
		<table cellSpacing="1" cellPadding="0" width="100%" align="center"
			bgColor="#f5fafe" border="0">
			<TBODY>
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3">
						<strong>Search by Condition</strong>
					</td>
				</tr>
				<tr>
					<td>
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr>
								<td height="22" align="center" bgColor="#f5fafe" class="ta_01">
									product id</td>
								<td class="ta_01" bgColor="#ffffff"><input type="text"
									name="id" size="15" value="" id="Form1_userName" class="bg" />
								</td>
								<td height="22" align="center" bgColor="#f5fafe" class="ta_01">
									category</td>
								<td class="ta_01" bgColor="#ffffff">
								<select name="category" id="category">
									<option value="" selected="selected">select product category-</option>
									<option value="Shoes">Shoes</option>
									<option value="Clothes">Clothes</option>
									<option value="E-bikes">E-bikes</option>
									<option value="language">Jewelry</option>
									<option value="Books">Books</option>
									<option value="Furniture">Furniture</option>
									<option value="Gym">Gym</option>
									<option value="Music-Instruments">Music-Instruments</option>
									<option value="Arts">Arts</option>
									<option value="Others">Others</option>
								</select></td>
							</tr>

							<tr>
								<td height="22" align="center" bgColor="#f5fafe" class="ta_01">
									product name</td>
								<td class="ta_01" bgColor="#ffffff"><input type="text"
									name="name" size="15" value="" id="Form1_userName" class="bg" />
								</td>
								<td height="22" align="center" bgColor="#f5fafe" class="ta_01">
									Price range</td>
								<td class="ta_01" bgColor="#ffffff"><input type="text"
									name="minprice" size="10" value="" />- <input type="text"
									name="maxprice" size="10" value="" /></td>
							</tr>

							<tr>
								<td width="100" height="22" align="center" bgColor="#f5fafe"
									class="ta_01"></td>
								<td class="ta_01" bgColor="#ffffff"><font face="宋体"
									color="red"> &nbsp;</font>
								</td>
								<td align="right" bgColor="#ffffff" class="ta_01"><br>
									<br></td>
								<td align="right" bgColor="#ffffff" class="ta_01">
									<button type="submit" id="search" name="&#26597;&#35810;"
										value="Search" class="button_view">
										Search</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
									type="reset" name="reset" value="Cancel"
									class="button_view" />
								</td>
							</tr>
						</table>
					</td>

				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3"><strong>product list</strong>
					</TD>
				</tr>
				<tr>
					<td class="ta_01" align="right">
						<button type="button" id="add" name="add" value="&#28155;&#21152;"
							class="button_add" onclick="addProduct()">AddProduct
						</button>
					</td>
				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#f5fafe">
						<table cellspacing="0" cellpadding="1" rules="all"
							bordercolor="gray" border="1" id="DataGrid1"
							style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
							<tr style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">
								<td align="center" width="24%">product id</td>
	<td align="center" width="18%">product name</td>
								<td align="center" width="9%">product price</td>
								<td align="center" width="9%">product number</td>
								<td width="8%" align="center">product category</td>
	<td width="8%" align="center">edit</td>
								<td width="8%" align="center">delete</td>
							</tr>

							<c:forEach items="${ps}" var="p">
								<tr onmouseover="this.style.backgroundColor = 'white'"
									onmouseout="this.style.backgroundColor = '#F5FAFE';">
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="200">${p.id }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="18%">${p.name }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="8%">${p.price }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="8%">${p.pnum }</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center">
										${p.category}</td>
									<td align="center" style="HEIGHT: 22px" width="7%"><a
										href="${pageContext.request.contextPath}/findProductById?id=${p.id}&type=admin">
											<img
											src="${pageContext.request.contextPath}/admin/images/i_edit.gif"
											border="0" style="CURSOR: hand"> </a>
									</td>

									<td align="center" style="HEIGHT: 22px" width="7%"><a
										href="${pageContext.request.contextPath}/deleteProduct?id=${p.id}">
											<img
											src="${pageContext.request.contextPath}/admin/images/i_del.gif"
											width="16" height="16" border="0" style="CURSOR: hand">
									</a>
									</td>
								</tr>
							</c:forEach>
						</table>
					</td>
				</tr>
			</TBODY>
		</table>
	</form>
</body>
</HTML>

