<%@ page language="java" import="java.io.*,java.sql.*"%>
<%@ include file="jdbc.jsp" %>
<%
	String authenticatedUser = null;
	session = request.getSession(true);

	try
	{
		authenticatedUser = validateLogin(out,request,session);
	}
	catch(IOException e)
	{	System.err.println(e); }

	if(authenticatedUser != null)
		response.sendRedirect("admin.jsp");		// Successful login
	else
		response.sendRedirect("adminLogin.jsp");		// Failed login - redirect back to login page with a message 
%>


<%!
	String validateLogin(JspWriter out,HttpServletRequest request, HttpSession session) throws IOException
	{
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String retStr = null;
		int custId = -1;

		if(username == null || password == null)
				return null;
		if((username.length() == 0) || (password.length() == 0))
				return null;
        if(username.equals("admin") && password.equals("admin")){
            retStr = "";
		}

        if(retStr!=null){
            session.setAttribute("adminLogIn", "");
        }

        else {session.setAttribute("adminLogIn", "Incorrect Admin User/Password");}
        return retStr;
    }
%>

