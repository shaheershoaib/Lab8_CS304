<!DOCTYPE html>
<html>
<head>
<title>Review Product</title>
</head>
<body>
<%@ include file="auth.jsp"%>
<div style="margin:0 auto;text-align:center;display:inline">

<%
// Print prior error login message if present
if (session.getAttribute("incorrectReview") != null){
	out.println("<p>"+session.getAttribute("incorrectReview").toString()+"</p>");
	session.setAttribute("incorrectReview", null);
}
%>

<h1>Review Product<h1>
<br>
<form name="reviewForm" method=post action="validateReview.jsp">
<table style="display:inline">
<tr>
	<td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">Rating (Out Of 5):</font></div></td>
	<td><input type="number" name="reviewRating"  size=10 min = "1" max = "5"></td>
</tr>

<tr>
    <td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">Review:</font></div></td>
	<td><input type="text" name="reviewDesc"  size=10 maxlength = "1000"></td>
</tr>

<tr>
	<%  out.println("<td><input type=\"hidden\" name=\"productId\" value = "+request.getParameter("id")+"></td>"); %>
</tr>


</table>

<br/>

<input class="submit" type="submit" name="Submit" value="Review Product">
</form>


</div>



</body>
</html>

