<%@page import="com.example.beans.Product"%>
<%@page import="com.example.utils.DBUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add / Modify Product</title>
<style tyep="text/css">
body{
background-color:#f1f3f5;
}
input[type='text']{
	width:500px;
	height:40px;
	background-color:white;
	margin-top:10px;
	font-size:18px;
	padding-left:10px;
}
input[type='submit']{
	width:100px;
	height:50px;
	background-color:green;
	color:white;
	margin-top:10px;
	font-size:18px;
}
</style>
</head>
<body>
	<%if(request.getParameter("type").equals("add")){ %>
		<form name="frm" action="addProduct" method="get">
			<input type="text" name="pname" required placeholder="Enter Product Name"><br>
			<input type="text" name="desc" required placeholder="Enter Product Description"><br>
			<input type="text" name="price" required placeholder="Enter Product Price"><br>
			<input type="text" name="disc" required placeholder="Enter Discount % (if available else 0)"><br>
			<input type="text" name="features" required placeholder="Enter Product Features CSV"><br>
			<input type="text" name="image" required placeholder="Enter Image URL"><br>
			<input type="text" name="category" required placeholder="Enter Product Category"><br>
			<input type="text" name="brand" required placeholder="Enter Product Brand"><br>
			<input type="submit" value="ADD"/>
		</form>
	<%}else{ 
		int id = Integer.parseInt(request.getParameter("id"));
		DBUtils utils=DBUtils.getInstance();
		Product product=utils.getProductDetails(id);
	%>
		<form name="frm" action="updateProduct" method="get">
			<input type="text" name="pname" required placeholder="Enter Product Name" value="<%=product.getName()%>"><br>
			<input type="text" name="desc" required placeholder="Enter Product Description" value="<%=product.getDescription()%>"><br>
			<input type="text" name="price" required placeholder="Enter Product Price" value="<%=product.getPrice()%>"><br>
			<input type="text" name="disc" required placeholder="Enter Discount % (if available else 0)" value="<%=product.getDiscount()%>"><br>
			<input type="text" name="features" required placeholder="Enter Product Features CSV" value="<%=product.getFeaturesCsv()%>"><br>
			<input type="text" name="image" required placeholder="Enter Image URL" value="<%=product.getImageUrl()%>"><br>
			<input type="text" name="category" required placeholder="Enter Product Category" value="<%=product.getCategory()%>"><br>
			<input type="text" name="brand" required placeholder="Enter Product Brand" value="<%=product.getBrand()%>"><br>
			<input type="hidden" name="ratingId" value="<%=product.getRatingId()%>"><br>
			<input type="hidden" name="reviewId" value="<%=product.getReviewId()%>"><br>	
			<input type="hidden" name="id" value="<%=id%>">	
			<input type="submit" value="UPDATE"/>
		</form>
	<%} %>
</body>
</html>