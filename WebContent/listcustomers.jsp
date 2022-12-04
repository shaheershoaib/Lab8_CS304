<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Locale" %>
<%@ include file="jdbc.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>
<head>
<title>Your Shopping Cart</title>
</head>
<body>

<%

String sql = "SELECT customerId, firstName, lastName FROM customer";


try 
{	
	out.println("<h3>Customer Profile</h3>");
	
	getConnection();
	Statement stmt = con.createStatement(); 
	stmt.execute("USE orders");

	PreparedStatement pstmt = con.prepareStatement(sql);
	ResultSet rst = pstmt.executeQuery();
	out.println("<table class=\"table\" border=\"1\">");
    out.println("<tr> <th> ID </th> <th> First Name </th> <th> Last Name </th>  </tr>");
	while (rst.next())
	{
		
		out.println("<tr><td>"+rst.getString(1)+"</td>");	
		out.println("<td>"+rst.getString(2)+"</td>");
		out.println("<td>"+rst.getString(3)+"</td></tr>");

	}
    out.println("</table>");
}
catch (SQLException ex) 
{ 	out.println(ex); 
}


%>
</body>
</html> 

