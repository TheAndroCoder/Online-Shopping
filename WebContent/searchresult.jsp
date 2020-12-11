<%@page import="com.example.beans.Review"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.example.beans.User"%>
<%@page import="com.example.utils.UtilityManager"%>
<%@page import="com.example.beans.Product"%>
<%@page import="com.example.utils.DBUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=request.getParameter("cat").toUpperCase() %></title>
<!-- Jquery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="icon" type="image/png" href="images/shoppify.png"/>
<link rel="stylesheet" href="css/searchresultpage.css" type="text/css"/>
<script src="javascript/searchresultpage.js"></script>
</head>
<body>
<%
	//Fetch the particular product according to the pid sent as parameter
	int product_id=Integer.parseInt(request.getParameter("id"));
	DBUtils utils = DBUtils.getInstance();
	Product product = utils.getProductDetails(product_id);
	User user=null;
	ArrayList<Product> cartItems=null;
	ArrayList<Review> reviews = utils.fetchReviewsForProductId(product_id);
	if(session.getAttribute("id")!=null){
		user=utils.fetchUser(Integer.parseInt(session.getAttribute("id").toString()));
		//cartItems=utils.getCartItems(user.getWishlist_id());
	}
%>
<!-- Blue Header section starts -->
 <header class="header">
 	<label class="headerlabel" onclick="navigateToHome()">S h o p p i f y</label>
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
 	<!-- Dropdown menu on hover username after login starts-->
 	<div class="dropdown">
 		<div class="dropdown-item"><label class="dropdown-item-label profile"><i class="fa fa-user-circle-o"></i> &nbsp; My Profile</label></div>
 		<div class="dropdown-item"><label class="dropdown-item-label notifications"><i class="fa fa-bell"></i> &nbsp; Notifications</label></div>
 		<div class="dropdown-item"><label class="dropdown-item-label orders"><i class="fa fa-amazon"></i> &nbsp; Orders</label></div>
 		<div class="dropdown-item"><label class="dropdown-item-label wishlist"><i class="fa fa-star"></i> &nbsp; Wishlist</label></div>
 		<div class="dropdown-item"><label class="dropdown-item-label logout"><i class="fa fa-power-off"></i> &nbsp; Logout</label></div>
 	</div>
 <!-- Dropdoen menu on hover ends -->
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
 <!-- Left div for image and BuyNow/AddToCart Button starts -->
 <div class="left-div">
 	<img src="<%=product.getImageUrl() %>" alt="product_image.jpeg"/>
 	<%if(user!=null){ %>
 	<button class="addtocartbtn" onclick="addToCart('<%=product.getProductId()%>','<%=user.getWishlist_id()%>')"><i class="fa fa-shopping-cart"></i>  Add to Cart</button>
 	<button class="buynowbtn" onclick="buyNow('<%=product.getProductId()%>')"><i class="fa fa-bolt"></i>  Buy Now</button>
 	<%}else{ %>
 	<button class="addtocartbtn inactive" onclick="showError('atcInactive')"><i class="fa fa-shopping-cart"></i>  Add to Cart</button>
 	<button class="buynowbtn inactive" onclick="showError('bnInactive')"><i class="fa fa-bolt"></i>  Buy Now</button>
 	<%} %>
 	
 </div>
 <!-- Left div for image and BuyNow/AddToCart Button ends -->
 <!-- Right div for product details starts -->
 <%
 	//Get the amount beautified and also apply discount and get Actual Price
 	UtilityManager manager = new UtilityManager();
	String marked_price=manager.getBeautifiedAmount(Integer.parseInt(product.getPrice()));
	String cost_price = manager.getCostPrice(Integer.parseInt(product.getPrice()), Integer.parseInt(product.getDiscount()));
	String features[]=manager.getFeaturesArray(product.getFeaturesCsv());
 %>
 <div class="right-div">
 	<h3><%=product.getName() %></h3>
 	<p class="rating">3.8<i class="fa fa-star"></i></p><p class="reviewCount"><%=reviews.size() %> Reviews & 32 Ratings</p><br><br>
 	<p class="cost_price"><i class="fa fa-inr"></i> <%=cost_price %></p>
 	<p class="mark_price"><i class="fa fa-inr"></i><strike><%=marked_price %></strike></p>
 	<p class="discount"><%=product.getDiscount()+"% off" %></p><br><br>
 	<label style="color:grey;margin-left:20px;font-size:20px">Highlights</label>
 	<ul>
 	<%for(int i=0;i<features.length;i++){ %>
 		<li style="padding:3px"><%=features[i] %></li>
 	<%} %>
 	</ul>
 	<label style="color:grey;margin-left:20px;font-size:20px">Description</label>
 	<p style="margin-left:20px;margin-right:40px"><%=product.getDescription() %></p><hr>
 	<!-- Reviews starts -->
 	<%if(session.getAttribute("id")!=null){ %>
 	<input type="text" placeholder="Enter Your Review..." id="my_review"/>
 	<button id="submit_review" onclick="submitReview('<%=product_id%>','<%=user.getId()%>')">SUBMIT</button><hr>
 	<%} %>
 	<%if(reviews.size()!=0){ %>
 	<h3>USER REVIEWS</h3><hr>
 	<%for(int i=0;i<reviews.size();i++){ %>
 	<p style="font-weight:700;display:inline;margin-left:20px;"><%=utils.getUserNameForUid(reviews.get(i).getUid()) %></p>
 	<p style="display:inline;margin-left:20px;color:grey;"><%=reviews.get(i).getDate() %></p>
 	<p style="margin-left:20px;"><%=reviews.get(i).getReview() %></p><hr>
 	<%}}else{ %>
 		<h3>No Reviews Yet</h3><hr>
 	<%} %>
 	<!-- Reviews ends -->
 </div>
 <!-- Right div for product details ends -->
 
</body>
</html>