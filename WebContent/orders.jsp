<%@page import="com.example.beans.Product"%>
<%@page import="com.example.beans.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.example.utils.DBUtils"%>
<%@page import="com.example.beans.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Your Orders</title>
<link rel="stylesheet" href="css/orderspage.css" type="text/css">
<script src="javascript/orderspage.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<%
	DBUtils utils=DBUtils.getInstance();
	User user = utils.fetchUser(Integer.parseInt(session.getAttribute("id").toString()));
	ArrayList<Order> orders = utils.getOrdersForUid(user.getId());
	String pid_csv="";
	for(int i=0;i<orders.size();i++){
		pid_csv+=orders.get(i).getPid()+",";
	}
	ArrayList<Product> products=utils.getProductsFromPidList(pid_csv);
	%>
	<header class="header">
		<label class="headerlabel" onclick="navigateToHome()">S h o p p i f y</label>
	</header>
	<div class="orders-div">
		<h3 style="margin-left:20px;">MY ORDERS</h3><hr>
		<%for(int i=0;i<orders.size();i++){ %>
		<div class="orders-row-div">
			<div class="orders-row-div-header">
				<!-- This is actually Order Id but I am showing Tracking Id just to look good -->
				<button class="order-id-btn"><%=orders.get(i).getTracking_id() %></button>
				<a href="track.jsp?id=<%=orders.get(i).getTracking_id()%>"><button class="track-btn"><i class="fa fa-map-marker"></i> TRACK</button></a>
				<button class="invoice-btn"><i class="fa fa-file-pdf-o"></i> INVOICE</button>
			</div>
			<img alt="productImage" src="<%=products.get(i).getImageUrl()%>" height="100px" width="100px" style="margin-top:20px;margin-left:20px;float:left;">
			<p style="width:85%;float:left;margin:0;margin-top:10px;margin-left:20px;color:blue;font-size:18px;font-weight:700;"><%=products.get(i).getName().substring(0, 30)+"..." %></p>
			<p style="display:block;float:left;margin-left:20px;color:green"><%="Ordered on : "+orders.get(i).getOrder_date() %></p>
			<p style="display:inline;float:left;margin-left:20px;color:green"><%="Will be delivered by : "+orders.get(i).getDelivery_date() %></p>
			<button id="cancel-item" style="display:inline;float:right">CANCEL ORDER</button>
		</div>
		<%} %>
	</div>
</body>
</html>