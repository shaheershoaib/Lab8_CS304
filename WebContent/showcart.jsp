<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Locale" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<%@ include file="auth.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>Your Shopping Cart</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<%
// Get the current list of products
@SuppressWarnings({"unchecked"})
HashMap<String, ArrayList<Object>> productList = (HashMap<String, ArrayList<Object>>) session.getAttribute("productList");


if (productList == null || productList.isEmpty())
{	out.println("<H1>Your shopping cart is empty!</H1>");
	productList = new HashMap<String, ArrayList<Object>>();
}
else
{
	NumberFormat currFormat = NumberFormat.getCurrencyInstance(Locale.US);

	out.println("<h1>Your Shopping Cart</h1>");
	out.print("<table><tr><th>Product Id</th><th>Product Name</th><th>Quantity</th>");
	out.println("<th>Price</th><th>Subtotal</th></tr>");

	double total =0;
	Iterator<Map.Entry<String, ArrayList<Object>>> iterator = productList.entrySet().iterator();
	while (iterator.hasNext()) 
	{	Map.Entry<String, ArrayList<Object>> entry = iterator.next();
		ArrayList<Object> product = (ArrayList<Object>) entry.getValue();
		if (product.size() < 4)
		{
			out.println("Expected product with four entries. Got: "+product);
			continue;
		}
		
		out.print("<tr><td>"+product.get(0)+"</td>");
		out.print("<td>"+product.get(1)+"</td>");

		out.print("<td align=\"center\">"+product.get(3)+"</td>");
		Object price = product.get(2);
		Object itemqty = product.get(3);
		double pr = 0;
		int qty = 0;
		
		try
		{
			pr = Double.parseDouble(price.toString());
		}
		catch (Exception e)
		{
			out.println("Invalid price for product: "+product.get(0)+" price: "+price);
		}
		try
		{
			qty = Integer.parseInt(itemqty.toString());
		}
		catch (Exception e)
		{
			out.println("Invalid quantity for product: "+product.get(0)+" quantity: "+qty);
		}		

		out.print("<td align=\"right\">"+currFormat.format(pr)+"</td>");
		out.print("<td align=\"right\">"+currFormat.format(pr*qty)+"</td>");
		//out.print("<td><a href=decreaseQuantity.jsp?id="+product.get(0)+">Decrease Quantity</a></td>");
		String decreaseQuantityForm = "<td><form name=\"decreaseQuanityForm\" method=post action=\"decreaseQuantity.jsp\"><input type=\"hidden\" name=\"id\" value = \""+product.get(0)+"\"><input class=\"submit\" type=\"submit\" name=\"decrease\" value=\"-\"></form></td>";
		out.print(decreaseQuantityForm);
		String increaseQuantityForm = "<td><form name=\"increaseQuantityForm\" method=post action=\"increaseQuantity.jsp\"><input type=\"hidden\" name=\"id\" value = \""+product.get(0)+"\"><input class=\"submit\" type=\"submit\" name=\"decrease\" value=\"+\"></form></td>";
		out.print(increaseQuantityForm);
		String deleteProductForm = "<td><form name=\"deleteProductForm\" method=post action=\"removeFromCart.jsp\"><input type=\"hidden\" name=\"id\" value = \""+product.get(0)+"\"><input class=\"submit\" type=\"submit\" name=\"decrease\" value=\"Remove From Cart\"></form></td>";
		//out.print("<td><a href=removefromcart.jsp?id="+product.get(0)+">Remove From Cart</a></td></tr>");
		out.print(deleteProductForm);
		out.println("</tr>");
		total = total +pr*qty;
	}
	out.println("<tr><td colspan=\"4\" align=\"right\"><b>Order Total</b></td>"
			+"<td align=\"right\">"+currFormat.format(total)+"</td></tr>");

			
	out.println("</table>");

if(!productList.isEmpty())
	out.println("<h2><a href=\"checkout.jsp\">Check Out</a></h2>");
}
%>
<h2><a href="listprod.jsp">Continue Shopping</a></h2>
</body>
</html> 

