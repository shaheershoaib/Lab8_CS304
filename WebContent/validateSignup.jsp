<%@ page language="java" import="java.io.*,java.sql.*"%>
<%@ include file="jdbc.jsp" %>



<%

        
        String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
        String email = request.getParameter("email");
        String phonenum = request.getParameter("phonenumber");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String postalCode = request.getParameter("postalcode");
        String country = request.getParameter("country");
        String userid = request.getParameter("username");
        String password = request.getParameter("password");



        boolean execute = true;
		if(userid == null || password == null || email == null || phonenum == null || address == null || city == null || state == null || postalCode == null || country == null || userid == null || password == null)
        		execute = false;
        else if(userid.trim().length() == 0 || password.trim().length() == 0 || email.trim().length() == 0 || phonenum.trim().length() == 0 || address.trim().length() == 0 || city.trim().length() == 0 || state.trim().length() == 0 || postalCode.trim().length() == 0 || country.trim().length() == 0 || userid.trim().length() == 0 || password.trim().length() == 0)
                execute = false;
                

if(execute){
		try 
		{
			getConnection();
			Statement stmt = con.createStatement(); 
			stmt.execute("USE orders");

			String sql = "INSERT INTO CUSTOMER(firstName, lastName, email, phonenum, address, city, state, postalCode, country, userid, password) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement pstmt = con.prepareStatement(sql);			
			pstmt.setString(1,firstname);
			pstmt.setString(2, lastname);
            pstmt.setString(3, email);
            pstmt.setString(4, phonenum);
            pstmt.setString(5, address);
            pstmt.setString(6, city);
            pstmt.setString(7, state);
            pstmt.setString(8, postalCode);
            pstmt.setString(9, country);
            pstmt.setString(10, userid);
            pstmt.setString(11, password);
			
		    pstmt.execute();
            session.setAttribute("authenticatedUser", userid);
            

            sql = "SELECT customerId FROM CUSTOMER WHERE userId = ? and password = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, userid);
            pstmt.setString(2,password);
            ResultSet getCustId = pstmt.executeQuery();

            if(getCustId.next())
                session.setAttribute("loggedInCustomerId", String.valueOf(getCustId.getInt(1)));

            response.sendRedirect("index.jsp");
					
		} 
		catch (SQLException ex) {
			out.println(ex);
		}
		finally
		{
			closeConnection();
           
		}	
		
}

else
{ 
session.setAttribute("notSignedUp", "Please fill out all the information to sign up" );
response.sendRedirect("signup.jsp");

}
	




%>