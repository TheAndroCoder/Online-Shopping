<%@page import="com.example.utils.DBUtils"%>
<%@page import="com.example.beans.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<link rel="icon" type="image/png" href="images/shoppify.png"/>
<link rel="stylesheet" href="css/profilepage.css" type="text/css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>My Profile</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="javascript/profilepage.js"></script>
</head>
<body>
<!-- Query for details -->
<%
String email = session.getAttribute("Email").toString();
		DBUtils utils = DBUtils.getInstance();
		User user = utils.getUserInfo(email);
		
%>
 
<!-- Blue Header section starts -->
 <div class="header">
 	<label class="headerlabel" onclick="navigateToHome()">S h o p p i f y</label>
 	<!-- Search bar layout -->
 	<div class="search_div">
 		<input type="text" placeholder="Search for products, brands and more.." class="search_field"/>
 		<button class="search_btn"><i class="fa fa-search" style="font-size:16px;color:blue;"></i></button>
 	</div>
 	<!-- Search bar layout -->
 	<label class="header_options"><i class="fa fa-cart-plus"></i>&nbsp;&nbsp;Cart</label>
 	<label class="header_options">More&nbsp;<i class="fa fa-angle-down"></i></label>
 	<%if(session.getAttribute("UserName")!=null){ %>
 	<label class="header_options username-text" id="u"><%=session.getAttribute("UserName") %>&nbsp;<i class="fa fa-angle-down"></i></label>
 	<%}else{ %>
 	<label class="header_options" id="login">Login & Signup</label>
 	<%} %>
 	
 </div>
 	<!-- Dropdown menu on click username after login starts-->
 	<div class="dropdown" id="drop">
 		<div class="dropdown-item"><label class="dropdown-item-label profile"><i class="fa fa-user-circle-o"></i> &nbsp; My Profile</label></div>
 		<div class="dropdown-item"><label class="dropdown-item-label notifications"><i class="fa fa-bell"></i> &nbsp; Notifications</label></div>
 		<div class="dropdown-item"><label class="dropdown-item-label orders"><i class="fa fa-amazon"></i> &nbsp; Orders</label></div>
 		<div class="dropdown-item"><label class="dropdown-item-label wishlist"><i class="fa fa-star"></i> &nbsp; Wishlist</label></div>
 		<div class="dropdown-item"><label class="dropdown-item-label logout"><i class="fa fa-power-off"></i> &nbsp; Logout</label></div>
 	</div>
 	<!-- Dropdown menu on click ends -->
 
 <!-- Blue Header section ends -->
 <div class="products_header">
 	<label class="product_options">Electronics&nbsp;<i class="fa fa-angle-down"></i></label>
 	<label class="product_options">TVs & Appliances&nbsp;<i class="fa fa-angle-down"></i></label>
 	<label class="product_options">Men&nbsp;<i class="fa fa-angle-down"></i></label>
 	<label class="product_options">Women&nbsp;<i class="fa fa-angle-down"></i></label>
 	<label class="product_options">Baby & Kids&nbsp;<i class="fa fa-angle-down"></i></label>
 	<label class="product_options">Home & Furniture&nbsp;<i class="fa fa-angle-down"></i></label>
 	<label class="product_options">Sports,Books & More&nbsp;<i class="fa fa-angle-down"></i></label>
 	<label class="product_options">Offer Zone&nbsp;<i class="fa fa-angle-down"></i></label>
 </div>
 <!-- left-side div starts -->
 <div class="options-div">
 	<div class="topmost-options-div" style="display:inline-block">
 	<i class="fa fa-user-circle-o" style="color:white;font-size:70px;margin:20px;"></i>
 	<%if(user.getFirst_name().equals("")){ %>
 	<label style="color:white;font-weight:800;font-size:20px">Hello , <%=user.getEmail_id().substring(0, 8)+"..." %></label>
 	<%}else{ %>
 	<label style="color:white;font-weight:800;font-size:20px">Hello , <%=user.getFirst_name() %></label>
 	<%} %>
 	</div>
 	<div class="offer-zone-div">
 		<i class="fa fa-plus" style="color:white;font-size:18px;font-weight:800;margin-left:20px;margin-top:23px;cursor:pointer;">&nbsp;&nbsp;Shoppify Offers Zone&nbsp;&nbsp;<i class="fa fa-angle-right"></i></i>
 	</div>
 	<div class="tabs-div">
 		<div class="myorders-div">
 			<i class="fa fa-shopping-cart" style="color:blue;font-size:18px;font-weight:800;margin-left:20px;margin-top:23px;cursor:pointer;">&nbsp;&nbsp;My Orders&nbsp;&nbsp;<i class="fa fa-angle-right"></i></i>
 		</div>
 		<div class="personalinfo-div">
 			<i class="fa fa-user-circle-o" style="color:blue;font-size:18px;font-weight:800;margin-left:20px;margin-top:23px;cursor:pointer;">&nbsp;&nbsp;Profile Information&nbsp;&nbsp;<i class="fa fa-angle-right"></i></i>
 		</div>
 		<div class="myreviews-div">
 			<i class="fa fa-star-half-o" style="color:blue;font-size:18px;font-weight:800;margin-left:20px;margin-top:23px;cursor:pointer;">&nbsp;&nbsp;My Reviews and Ratings&nbsp;&nbsp;<i class="fa fa-angle-right"></i></i>
 		</div>
 		<div class="allnotifications-div">
 			<i class="fa fa-bell" style="color:blue;font-size:18px;font-weight:800;margin-left:20px;margin-top:23px;cursor:pointer;">&nbsp;&nbsp;All Notifications&nbsp;&nbsp;<i class="fa fa-angle-right"></i></i>
 		</div>
 		<div class="mywishlist-div">
 			<i class="fa fa-th-list" style="color:blue;font-size:18px;font-weight:800;margin-left:20px;margin-top:23px;cursor:pointer;">&nbsp;&nbsp;My Wishlist&nbsp;&nbsp;<i class="fa fa-angle-right"></i></i>
 		</div>
 		<div class="logout-div">
 			<i class="fa fa-power-off" style="color:blue;font-size:18px;font-weight:800;margin-left:20px;margin-top:23px;cursor:pointer;">&nbsp;&nbsp;Logout&nbsp;&nbsp;<i class="fa fa-angle-right"></i></i>
 		</div>
 	</div>
 </div>
 <!-- left-side div ends -->
 <!-- Right-side div starts -->
 <div class="edit-info-div">
 	<div style="display:inline-block;width:200px;height:50px" >
 		<h3>Personal Information</h3>
 	</div>
 	<div style="display:inline-block;width:100px;height:50px;color:blue;cursor:pointer" id="edit-personal-info">Edit</div><br>
 	
 	<input type="text" placeholder="First name" id="first-name" readonly class="name-details" value="<%=user.getFirst_name()%>"/>
 	<input type="text" placeholder="Last Name" id="last-name" readonly class="name-details" value="<%=user.getLast_name()%>"/>
 	<button class="save-btn" id="save" onclick="saveDetails()">SAVE</button>
 	<img src="images/loader.gif" height="50px" width="50px" style="display:none" id="loader"/>
 	<h4>Your Gender</h4>
 	<%if(user.getGender().equals("M")){ %>
 	<input type="radio" value="Male" name="r1" disabled class="radio" checked><label style="margin-left:5px;">Male</label>
 	<input type="radio" value="Female" name="r1" disabled class="radio" style="margin-left:20px;"><label style="margin-left:5px;">Female</label>
 	<%}else{ %>
 	<input type="radio" value="Male" name="r1" disabled class="radio"><label style="margin-left:5px;">Male</label>
 	<input type="radio" value="Female" name="r1" disabled checked class="radio" style="margin-left:20px;"><label style="margin-left:5px;">Female</label>
 	<%} %><br>
 	<div style="display:inline-block;width:200px;height:50px" >
 		<h3>Email Address</h3>
 	</div>
 	<div style="display:inline-block;width:100px;height:50px;color:blue;cursor:pointer" id="edit-email-info">Edit</div><br>
 	<input type="text" class="email-details" id="email" readonly value="<%=session.getAttribute("Email") %>">
 	<button class="save-email-btn" onclick="saveEmail()">SAVE</button>
 	<br><br><br><br>
 	<div style="display:inline-block;width:200px;height:50px" >
 		<h3>Mobile Number</h3>
 	</div>
 	<div style="display:inline-block;width:100px;height:50px;color:blue;cursor:pointer" id="edit-mobile-info">Edit</div><br>
 	<input type="text" class="phone-details" placeholder="Mobile Number" id="phone" readonly value="<%=user.getPhone() %>">
 	<button class="save-phone-btn" onclick="savePhone()">SAVE</button>
 </div>
 
 <!-- Right-side div ends -->
 
 
 
 
 
 
 
 
</body>
</html>