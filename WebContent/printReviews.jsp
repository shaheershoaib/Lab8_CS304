<%@ page language="java" import="java.io.*,java.sql.*"%>
<%@ page import="java.sql.*,java.util.Locale" %>
<%@ page import="java.util.Date" %>




<%
out.println("<br><br>");
out.println("<h3>Reviews</h3><br>");
   
   try{

			getConnection();
			Statement stmt = con.createStatement(); 
			stmt.execute("USE orders");

            sql = "SELECT reviewRating, reviewDate, firstName, lastName, reviewComment FROM review JOIN customer ON review.customerId = customer.customerId WHERE productId = ?";

            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, Integer.parseInt(productId));
            
            ResultSet rst = pstmt.executeQuery();

            while(rst.next()){
                    
                    out.println("<table>");
                    out.println(String.format("<tr><td>Reviewer: %s %s</td></tr>", rst.getString(3), rst.getString(4)));
                    out.println(String.format("<tr><td>Review Rating: %d</td></tr>", rst.getInt(1)));
                    out.println("<tr><td>Review Date: "+rst.getDate(2)+"</td></tr>");
                    out.println(String.format("<tr><td>Review Comment: %s</td></tr>", rst.getString(5)));
                    out.println("</table>");
                    out.println("<br>");

                    


            }

   }

   catch(Exception ex){out.println(ex);}




%>