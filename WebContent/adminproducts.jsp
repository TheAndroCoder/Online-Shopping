<%@page import="com.example.beans.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.example.utils.DBUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>View | Modify Products</title>
<style type="text/css">
table,th,td{
border:1px solid black;
}
</style>
</head>
<body>
	<%DBUtils utils=DBUtils.getInstance();
		ArrayList<Product> products=utils.getProducts();
		
	%>
	<table>
		<th>ID</th>
		<th>Name</th>
		<th>Edit-Action</th>
		<th>Delete-Action</th>
		<%for(int i=0;i<products.size();i++){ %>
			<tr>
				<td><%=products.get(i).getProductId() %></td>
				<td><%=products.get(i).getName() %></td>
				<td><a href="productdetail.jsp?type=modify&id=<%=products.get(i).getProductId()%>">EDIT</a></td>
				<td><a href="productRemoval?id=<%=products.get(i).getProductId()%>">REMOVE</a></td>
			</tr>
		<%} %>
	</table>
	<a href="productdetail.jsp?type=add">Add Product</a>
</body>
</html>