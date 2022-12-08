<!DOCTYPE html>
<html>
<head>
<title>Add Product</title>
</head>
<body>
<div style="margin:0 auto;text-align:center;display:inline">
<%@ include file="auth.jsp"%>

<h3>Add a Product</h3>
<%
// Print prior error login message if present
if (session.getAttribute("notAddedProd") != null){
	out.println("<p>"+session.getAttribute("notAddedProd").toString()+"</p>");
    session.setAttribute("notAddedProd", null);
}
%>

<br>
<form name="addProductForm" method=post action="validateAddProd.jsp">
<table style="display:inline">
<tr>
	<td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">Product Name:</font></div></td>
	<td><input type="text" name="prodname"  size=10 maxlength=40></td>
</tr>
<tr>
	<td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">Category ID:</font></div></td>
	<td><input type="number" name="prodcategory" size=10 min = "1" max = "5"></td>
</tr>

<tr>
	<td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">Price:</font></div></td>
	<td><input type="number" name="prodprice" size=10 min="0.00" max="10000.00" step="0.01"></td>
</tr>

<tr>
	<td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">Product Description:</font></div></td>
	<td><input type="tel" name="proddescr" size=10 maxlength="1000"></td>
</tr>


</table>

<br/>

<input class="submit" type="submit" name="Submit" value="Add Product">
</form>


</div>



</body>
</html>
