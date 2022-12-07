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
String productId = request.getParameter("id");


Iterator<Map.Entry<String, ArrayList<Object>>> iterator = productList.entrySet().iterator();



ArrayList<Object> product;



	if(productList.containsKey(productId)){
        product = productList.get(productId);
        int quantity = (int)product.get(3);
        product.set(3, quantity+1);
        productList.put(productId, product);
        
        
        session.setAttribute("productList", productList);
   }





%>
<jsp:forward page="showcart.jsp" />

</form>