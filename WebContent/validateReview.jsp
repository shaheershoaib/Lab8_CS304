<%@ page language="java" import="java.io.*,java.sql.*"%>
<%@ page import="java.sql.*,java.util.Locale" %>
<%@ page import="java.util.Date" %>
<%@ include file="jdbc.jsp" %>



<%

        
        String rating = request.getParameter("reviewRating");
        String desc = request.getParameter("reviewDesc");
        String custId = (String)session.getAttribute("loggedInCustomerId");
        String productId = request.getParameter("productId");

        boolean execute = true;
		if(rating == null || desc == null || productId == null)
        		execute = false;
        else if(rating.trim().length() == 0 || desc.trim().length() == 0 )
                execute = false;
                

if(execute){
		try 
		{
			getConnection();
			Statement stmt = con.createStatement(); 
			stmt.execute("USE orders");

			String sql = "INSERT INTO review(reviewRating, reviewDate, customerId, productId, reviewComment) VALUES (?, ?, ?, ?, ?)";
			PreparedStatement pstmt = con.prepareStatement(sql);			
			pstmt.setInt(1,Integer.parseInt(rating));
            pstmt.setTimestamp(2, new java.sql.Timestamp(new Date().getTime()));
            pstmt.setInt(3, Integer.parseInt(custId));
            pstmt.setInt(4, Integer.parseInt(productId));
            pstmt.setString(5, desc);
        
		
		    
			try{
			        pstmt.execute();
					response.sendRedirect("product.jsp?id="+Integer.parseInt(productId));
					
			}

			catch(SQLException S) 
			{
				session.setAttribute("incorrectReview", "Please enter a valid rating and review");
				response.sendRedirect("review.jsp?id="+Integer.parseInt(productId)+"\"");
			}
			
			
				

			

            
		} 
		catch (Exception ex) {
			out.println(ex);
		}
		finally
		{
			closeConnection();
           
		}	
		
}

else
{ 
session.setAttribute("incorrectReview", "Please enter a valid rating and review");
response.sendRedirect("review.jsp");

}
	




%>