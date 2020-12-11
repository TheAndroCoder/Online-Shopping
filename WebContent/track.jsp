<%@page import="com.example.beans.Order"%>
<%@page import="com.example.beans.Track"%>
<%@page import="com.example.utils.DBUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Track Your Order</title>
<script src="javascript/track.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="css/track.css">
</head>
<body>
	<%
	String id=request.getParameter("id");
	DBUtils utils=DBUtils.getInstance();
	Track track=utils.getTrackingDetails(id);
	Order order=utils.getOrderDetailsForTrackingId(id);
	%>
	<header class="header">
		<label class="headerlabel" onclick="navigateToHome()">S h o p p i f y</label>
	</header>
	<div class="main-div">
		<div class="main-header">
			<%="Tracking Details for ID : "+track.getId() %>
		</div>
		<div class="address-div">
			<%="Delivery Address : "+track.getAddress() %><br><br>
			<%="Order Placed on : "+order.getOrder_date() %><br><br>
			<%="Expected Delivery by : "+order.getDelivery_date() %>
		</div>
		<div class="status-div">
			<%for(int i=0;i<5;i++){ 
				if(i<track.getStatus()){
				%>
				<div class="circle-stage active">
				<%=i+1 %>
				</div>
				<%if(i==0){ %>
					<p class="status active1">Order Placed</p><br>
				<%}else if(i==1){ %>
					<p class="status active1">Dispatched from seller facility</p><br>
				<%}else if(i==2){ %>
					<p class="status active1">Reached Your Nearest Hub</p><br>
				<%}else if(i==3){ %>
					<p class="status active1">Out For Delivery</p><br>
				<%}else{ %>
					<p class="status active1">Delivered</p><br>
				<%}}else{ %>
					<div class="circle-stage">
					<%=i+1 %>
					</div>
				<%if(i==0){ %>
					<p class="status">Order Placed</p><br>
				<%}else if(i==1){ %>
					<p class="status">Dispatched from seller facility</p><br>
				<%}else if(i==2){ %>
					<p class="status">Reached Your Nearest Hub</p><br>
				<%}else if(i==3){ %>
					<p class="status">Out For Delivery</p><br>
				<%}else{ %>
					<p class="status">Delivered</p><br>
				<%}} %>
			<%}%>
		</div>
	</div>
</body>
</html>