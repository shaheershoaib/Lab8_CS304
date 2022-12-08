<!DOCTYPE html>
<html>
<head>
<title>BudgetBot Home Page</title>
</head>
<body>
<h1 align="center">BudgetBot</h1>

<%
	String userName = (String) session.getAttribute("authenticatedUser");
	if (userName != null){
		out.println("<h3 align=\"center\">Signed in as: "+userName+"</h3>");
		out.println("<h2 align=\"center\"><a href=\"logout.jsp\">Log out</a></h2>");
		
	}
	else{

		out.println("<h2 align=\"center\"><a href=\"signup.jsp\">Sign Up</a></h2>");
		out.println("<h2 align=\"center\"><a href=\"login.jsp\">Login</a></h2>");
	}

%>
<h2 align="center"><a href="listprod.jsp">Begin Shopping</a></h2>

<h2 align="center"><a href="listorder.jsp">List All Orders</a></h2>

<h2 align="center"><a href="customer.jsp">Customer Info</a></h2>

<h2 align="center"><a href="adminLogin.jsp">Administrators</a></h2>






</body>
</head>


