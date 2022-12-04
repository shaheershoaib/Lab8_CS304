<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Locale" %>
<%@ include file="jdbc.jsp" %>
<%@ include file="auth.jsp"%>
<%
// Get the current list of products
@SuppressWarnings({"unchecked"})
HashMap<String, ArrayList<Object>> productList = (HashMap<String, ArrayList<Object>>) session.getAttribute("productList");

if (productList == null)
{	
	productList = new HashMap<String, ArrayList<Object>>();
}

// Add new product selected
// Get product information
String id = request.getParameter("id");

Iterator<Map.Entry<String, ArrayList<Object>>> iterator = productList.entrySet().iterator();

ArrayList<Object> product;



	if(productList.containsKey(id))
		productList.remove(id);



String sql = "DELETE FROM incart WHERE productId = ?"; 
try 
{	
	
	getConnection();
	Statement stmt = con.createStatement(); 
	stmt.execute("USE orders");

	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setInt(1, Integer.parseInt(id));
	ResultSet rst = pstmt.executeQuery();
	
}
catch (SQLException ex) 
{ 	out.println(ex); 
}
finally
{	
	closeConnection();	
}


%>
<jsp:forward page="showcart.jsp" />