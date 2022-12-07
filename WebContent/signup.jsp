<!DOCTYPE html>
<html>
<head>
<title>Login Screen</title>
</head>
<body>

<div style="margin:0 auto;text-align:center;display:inline">

<h3>Sign Up</h3>
<%
// Print prior error login message if present
if (session.getAttribute("notSignedUp") != null){
	out.println("<p>"+session.getAttribute("notSignedUp").toString()+"</p>");
    session.setAttribute("notSignedUp", null);
}
%>

<br>
<form name="MyForm" method=post action="validateSignup.jsp">
<table style="display:inline">
<tr>
	<td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">First Name:</font></div></td>
	<td><input type="text" name="firstname"  size=10 maxlength=40></td>
</tr>
<tr>
	<td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">Last Name:</font></div></td>
	<td><input type="text" name="lastname" size=10 maxlength="40"></td>
</tr>

<tr>
	<td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">Email:</font></div></td>
	<td><input type="email" name="email" size=10 maxlength="50"></td>
</tr>

<tr>
	<td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">Phone Number:</font></div></td>
	<td><input type="number" name="phonenumber" size=10 maxlength="20"></td>
</tr>

<tr>
	<td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">Address:</font></div></td>
	<td><input type="text" name="address" size=10 maxlength="50"></td>
</tr>

<tr>
	<td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">City:</font></div></td>
	<td><input type="text" name="city" size=10 maxlength="40"></td>
</tr>

<tr>
	<td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">State:</font></div></td>
	<td><input type="text" name="state" size=10 maxlength="20"></td>
</tr>

<tr>
	<td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">Postal Code:</font></div></td>
	<td><input type="postal" name="postalcode" size=10 maxlength="20"></td>
</tr>

<tr>
	<td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">Country:</font></div></td>
	<td><input type="text" name="country" size=10 maxlength="40"></td>
</tr>

<tr>
	<td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">Username:</font></div></td>
	<td><input type="text" name="username" size=10 maxlength="20"></td>
</tr>

<tr>
	<td><div align="right"><font face="Arial, Helvetica, sans-serif" size="2">Password:</font></div></td>
	<td><input type="password" name="password" size=10 maxlength="30"></td>
</tr>

</table>

<br/>

<input class="submit" type="submit" name="Submit" value="Sign Up">
</form>


</div>



</body>
</html>

