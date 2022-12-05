<!DOCTYPE html>
<html>
<head>
<title>Warehouse Inventory Page</title>
</head>
<body>

<%@ include file="auth.jsp"%>
<%@ page import="java.text.NumberFormat" %>
<%@ include file="jdbc.jsp" %>



<%

// Print Customer information
String warehouseIdSQL = "SELECT * FROM warehouse";
String itemsInWarehouseSQL = "SELECT P.productName, PI.productId, PI.quantity FROM warehouse as W JOIN productinventory as PI ON W.warehouseId = PI.warehouseId JOIN product as P ON PI.productId = P.productId WHERE PI.warehouseId = ?";

NumberFormat currFormat = NumberFormat.getCurrencyInstance();

try 
{	
	
	
	getConnection();
	Statement stmt = con.createStatement(); 
	stmt.execute("USE orders");


    out.println("<h1>Products By Warehouse</h1><br>");

	PreparedStatement pstmt = con.prepareStatement(warehouseIdSQL);
	ResultSet rst = pstmt.executeQuery();
	
	while (rst.next())
	{

        pstmt = con.prepareStatement(itemsInWarehouseSQL);
        int warehouseId = rst.getInt(1);
        pstmt.setInt(1, warehouseId);
        ResultSet productsInWarehouse = pstmt.executeQuery();
        out.println(String.format("<h2>Warehouse Name: %s WarehouseId: %s<h2>", rst.getString(2), warehouseId));
        
        out.println("<table class=\"table\" border=\"1\">");
        while(productsInWarehouse.next()){

        
		out.println("<tr><td>Product Name: "+productsInWarehouse.getString(1)+"</td>");
        out.println("<td>Product Id: "+productsInWarehouse.getInt(2)+"</td>");
        out.println("<td>Product Quantity: "+productsInWarehouse.getInt(3)+"</td></tr>");
        }
        out.println("</table><br>");
        

	
		
	}
}
catch (SQLException ex) 
{ 	out.println(ex); 
}
finally
{	
	closeConnection();	
}
%>

</body>
</html>

