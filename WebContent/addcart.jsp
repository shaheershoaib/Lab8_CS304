<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Locale" %>
<%@ include file="jdbc.jsp" %>

// Get the current list of products
<%
@SuppressWarnings({"unchecked"})
HashMap<String, ArrayList<Object>> productList = (HashMap<String, ArrayList<Object>>) session.getAttribute("productList");

if (productList == null)
{	// No products currently in list.  Create a list.
	productList = new HashMap<String, ArrayList<Object>>();
}

// Add new product selected
// Get product information
String id = request.getParameter("id");
String name = request.getParameter("name");
String price = request.getParameter("price");
Integer quantity = new Integer(1);


String sql = "INSERT INTO incart(productId, quantity, price) VALUES (?, ?, ?)"; 
try 
{	
	out.println("<h3>Customer Profile</h3>");
	
	getConnection();
	Statement stmt = con.createStatement(); 
	stmt.execute("USE orders");

	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setInt(1, Integer.parseInt(id));
	pstmt.setString(2, name);
	pstmt.setDouble(3, Double.parseDouble(price));	
	ResultSet rst = pstmt.executeQuery();
	
}
catch (SQLException ex) 
{ 	out.println(ex); 
}
finally
{	
	closeConnection();	
}



// Store product information in an ArrayList
ArrayList<Object> product = new ArrayList<Object>();
product.add(id);
product.add(name);
product.add(price);
product.add(quantity);


if (productList.containsKey(id))
{	product = (ArrayList<Object>) productList.get(id);
	int curAmount = ((Integer) product.get(3)).intValue();
	product.set(3, new Integer(curAmount+1));
}
else
	productList.put(id,product);

session.setAttribute("productList", productList);
%>
<jsp:forward page="showcart.jsp" />