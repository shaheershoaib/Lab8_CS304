<!DOCTYPE html>
<html>
<head>
<title>Delete Product</title>
</head>
<body>
<%@ include file="auth.jsp"%>
<div style="margin:0 auto;text-align:center;display:inline">

<%
// Print prior error login message if present
if (session.getAttribute("notCorrectID") != null){
	out.println("<p>"+session.getAttribute("notCorrectID").toString()+"</p>");
	session.setAttribute("notCorrectID", null);
}
%>

<h1>Delete Product By ID<h1>
<br>
<form name="updateProductForm" method=post action="validateDeleteProd.jsp">
<table style="display:inline">
<tr>
	<td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">Product Id:</font></div></td>
	<td><input type="number" name="prodId"  size=10 min = "1"></td>
</tr>


</table>

<br/>

<input class="submit" type="submit" name="Submit" value="Delete Product">
</form>


</div>



</body>
</html>

