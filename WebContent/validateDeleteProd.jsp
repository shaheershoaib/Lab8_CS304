<%@ page language="java" import="java.io.*,java.sql.*"%>
<%@ include file="jdbc.jsp" %>



<%

        
        String ID = request.getParameter("prodId");
	

        boolean execute = true;
		if(ID == null)
        		execute = false;
        else if(ID.trim().length() == 0)
                execute = false;
                

if(execute){
		try 
		{
			getConnection();
			Statement stmt = con.createStatement(); 
			stmt.execute("USE orders");

			String sql = "DELETE FROM product WHERE productId =  ?";
			PreparedStatement pstmt = con.prepareStatement(sql);			
			pstmt.setInt(1,Integer.parseInt(ID));
		
			
		    
			try{
			int x = pstmt.executeUpdate();
			
			
				if(x<=0)
				{
					session.setAttribute("notCorrectID", "Please enter a valid product ID" );
					response.sendRedirect("deleteProd.jsp");
				}

				else{response.sendRedirect("admin.jsp");}
			}

			catch(SQLException S) 
			{
				session.setAttribute("notCorrectID", "Please enter a valid product ID" );
				response.sendRedirect("deleteProd.jsp");
			}
			
			
				

			

            
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
session.setAttribute("notCorrectID", "Please enter a valid product ID" );
response.sendRedirect("deleteProd.jsp");

}
	




%>