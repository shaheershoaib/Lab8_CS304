<%
	boolean authenticatedAdmin = session.getAttribute("adminLogIn") == null ? false : true;

	if (!authenticatedAdmin)
	{
		String loginMessage = "You have not been authorized to access the URL "+request.getRequestURL().toString();
        session.setAttribute("adminLogIn",loginMessage);        
		response.sendRedirect("adminLogin.jsp");
	}
%>
