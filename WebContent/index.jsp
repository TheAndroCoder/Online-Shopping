<%@page import="com.example.beans.User"%>
<%@page import="com.example.beans.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.example.utils.DBUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<title>Online Shopping Site for Mobiles,Electronics,Furniture,Grocery</title>

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="icon" type="image/png" href="images/shoppify.png"/>
<link rel="stylesheet" href="css/indexpage.css" type="text/css"/>
<script src="javascript/indexpage.js"></script>

</head>
<body>
<%
if(request.getParameter("action")!=null){
	session.removeAttribute("UserName");
	session.removeAttribute("id");
	session.removeAttribute("Email");
	response.sendRedirect("index.jsp");
}
User user =null;
if(session.getAttribute("id")!=null){
	user=DBUtils.getInstance().fetchUser(Integer.parseInt(session.getAttribute("id").toString()));
}
%>
<!-- Blue Header section starts -->
 <header class="header">
 	<label class="headerlabel">S h o p p i f y</label>
 	<!-- Search bar layout -->
 	<div class="search_div">
 		<input type="text" placeholder="Search for products, brands and more.." class="search_field" onkeyup="showProducts(this.value)"/>
 		<button class="search_btn"><i class="fa fa-search" style="font-size:16px;color:blue;"></i></button>
 	</div>
 	<div class="search-result-div">
 		
 	</div>
 	<!-- Search bar layout -->
 	<%if(user!=null){ %>
 	<label class="header_options" onclick="showCart('<%=user.getWishlist_id()%>')"><i class="fa fa-cart-plus"></i>&nbsp;&nbsp;Cart</label>
 	<%} %>
 	<label class="header_options">More&nbsp;<i class="fa fa-angle-down"></i></label>
 	<%if(session.getAttribute("UserName")!=null){ %>
 	<label class="header_options username-text"><%=session.getAttribute("UserName") %>&nbsp;<i class="fa fa-angle-down"></i></label>
 	<%}else{ %>
 	<label class="header_options" id="login">Login & Signup</label>
 	<%} %>
 </header>
 <!-- Search AJAX -->
 
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
 
 
 
 
 
 
 
 
 
 
 
 <!-- Modal for login and signup starts -->
 <div class="modal">
 	<div class="modal-content">
 	<div class="left_login_div">
 		<h2 style="color:white;margin-left:20px" class="login-text">Login</h2>
 		<h4 style="color:white;margin-left:20px;margin-right:20px;" class="desc-text">Get access to your orders, wishlist and Recommendations</h4>
 		<img src="https://media.hpshopping.in/wysiwyg/opp-laptops/hp-laptop.png" height="150px" width="200px" style="margin-left:40px;margin-top:100px;"/>
 	</div>
 	<div class="right_login_div">
 	<span class="close">&times;</span>
 	<form action="login" name="frm" method="post">
 		<input type="text" class="input-text email" name="email" id="email" required placeholder="Enter Email/Phone"/><br>
 		<input type="password" class="input-text password" name="password" id="password" required placeholder="Enter Password" onkeyup="checkPassword(this.value)"/><br>
 		<input type="submit" value="Login" class="input-btn login"/>
 		<input type="hidden" value="login" name="type" id="hidden">
 		
 	</form>
 	<button class="input-btn signup">New to Shoppify? Signup</button>
 	<h4 style="margin-top:90px;margin-left:40px">We no longer support login via social accounts</h4>
 	</div>
 	</div>
 </div>
 <!-- Modal for login and signup ends -->
 
 
 
 <!-- Dropdown menu on hover username after login starts-->
 	<div class="dropdown">
 		<div class="dropdown-item"><label class="dropdown-item-label profile"><i class="fa fa-user-circle-o"></i> &nbsp; My Profile</label></div>
 		<div class="dropdown-item"><label class="dropdown-item-label notifications"><i class="fa fa-bell"></i> &nbsp; Notifications</label></div>
 		<div class="dropdown-item"><label class="dropdown-item-label orders"><i class="fa fa-amazon"></i> &nbsp; Orders</label></div>
 		<div class="dropdown-item"><label class="dropdown-item-label wishlist"><i class="fa fa-star"></i> &nbsp; Wishlist</label></div>
 		<div class="dropdown-item"><label class="dropdown-item-label logout"><i class="fa fa-power-off"></i> &nbsp; Logout</label></div>
 	</div>
 <!-- Dropdoen menu on hover ends -->
 
 
 
 <!-- Image slider starts -->
<ul id="slides">
	<li class="slide showing"><img src="https://shoppingzaroori.files.wordpress.com/2015/04/online-shopping-web-site-shopping-zaroori-banner.png" width="100%" height="100%"/></li>
	<li class="slide"><img src="http://www.joburgshoppingfestival.co.za/wp-content/uploads/2017/01/JSF-Website-Banner_January-3.png" width="100%" height="100%"/></li>
	<li class="slide"><img src="http://www.shoppingspree.pk/catalog/view/theme/pav_styleshop/image/slider_images/shoppingspree-banner.png" width="100%" height="100%"/></li>
</ul>
 <!-- Image slider ends -->
 
 
 <!-- Page content starts -->
 <div class="big-adv-div">
 	<div class="big-adv1"><img src="https://1.bp.blogspot.com/-iCCDPE6I8Jc/Vs_gW2YjCVI/AAAAAAAAAfU/uIw2zWRz8rE/s640/microsoft-surface-laptops%2B-amazon-india-offers.jpg" width="100%" height="100%"></div>
 	<div class="big-adv2"><img src="https://www.gizbot.com/img/2018/04/flipkart-laptop-bonanza-17th-19th-april-offers-on-laptops-1523950944.jpg" width="100%" height="100%"></div>
 	<div class="big-adv3"><img src="https://rukminim1.flixcart.com/flap/960/960/image/0a67bd635866357c.jpg?q=75" width="100%" height="100%"></div>
 </div>
 <div class="recommended-div">
 	<div class="heading">
 	<h3 style="color:#000;padding-top:10px;padding-left:20px;margin:0">Recommended</h3>
 	<h4 style="margin:0;padding-left:20px;padding-top:5px;color:#808080">According to your recent searches</h4>
 	</div>
 	<%DBUtils utils = DBUtils.getInstance();
 	ArrayList<Product> products=utils.getProducts();
 	%>
 	<div class="list-div">
 		<%for(int i=0;i<products.size();i++){ %>
 			<div class="image-name" onclick="searchFor('<%=products.get(i).getProductId()%>','<%=products.get(i).getCategory()%>')">
 			<img alt="Shoppify" src="<%=products.get(i).getImageUrl()%>"><br><br>
 			<label><%=products.get(i).getName().substring(0,20)+"..." %></label>
 			</div>
 		<%} %>
 	</div>
 </div>
</body>
</html>