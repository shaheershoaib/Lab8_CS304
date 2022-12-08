<!DOCTYPE html>
<html>
<head>
<title>Login As Admin</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div style="margin:0 auto;text-align:center;display:inline">

<h3>Login As Admin</h3>

<%
// Print prior error login message if present
if (session.getAttribute("adminLogIn") != null){
	out.println("<p>"+session.getAttribute("adminLogIn").toString()+"</p>");
	session.setAttribute("adminLogIn", null);
}
%>

<br>
<form name="MyForm" method=post action="validateAdmin.jsp">
<table style="display:inline">
<tr>
	<td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">Username:</font></div></td>
	<td><input type="text" name="username"  size=10 maxlength=10></td>
</tr>
<tr>
	<td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">Password:</font></div></td>
	<td><input type="password" name="password" size=10 maxlength="10"></td>
</tr>
</table>
<br/>
<input class="submit" type="submit" name="Submit2" value="Log In">
</form>

</div>

</body>
</html>

