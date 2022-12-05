<%@ page language="java" import="java.io.*,java.sql.*"%>
<%@ include file="jdbc.jsp" %>



<%

        
        String name = request.getParameter("prodname");
		String categoryId = request.getParameter("prodcategory");
        String price = request.getParameter("prodprice");
        String descr = request.getParameter("proddescr");
        



        boolean execute = true;
		if(name == null || categoryId == null || price == null || descr == null)
        		execute = false;
        else if(name.trim().length() == 0 || categoryId.trim().length() == 0 || price.trim().length() == 0 || descr.trim().length() == 0)
                execute = false;
                

if(execute){
		try 
		{
			getConnection();
			Statement stmt = con.createStatement(); 
			stmt.execute("USE orders");

			String sql = "INSERT INTO product(productName, categoryId, productPrice, productDesc) VALUES (?, ?, ?, ?)";
			PreparedStatement pstmt = con.prepareStatement(sql);			
			pstmt.setString(1,name);
			pstmt.setInt(2, Integer.parseInt(categoryId));
            pstmt.setDouble(3, Double.parseDouble(price));
            pstmt.setString(4, descr);

			
		    pstmt.execute();
            

            response.sendRedirect("admin.jsp");
					
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
session.setAttribute("notAddedProd", "Please fill out all the information correctly to add a product" );
response.sendRedirect("signup.jsp");

}
	




%>