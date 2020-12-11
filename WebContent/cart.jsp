<%@page import="com.example.utils.UtilityManager"%>
<%@page import="com.example.beans.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.example.utils.DBUtils"%>
<%@page import="com.example.beans.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Shopping Cart</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="icon" type="image/png" href="images/shoppify.png"/>
<link rel="stylesheet" href="css/cartpage.css" type="text/css"/>
<script src="javascript/cartpage.js"></script>
</head>
<body>
	<%String wid = request.getParameter("wid");
		DBUtils utils=DBUtils.getInstance();
		User user = utils.fetchUser(Integer.parseInt(session.getAttribute("id").toString()));
		ArrayList<Product> products=utils.getCartItemsList(wid);
		int total=0,discount=0;
		UtilityManager manager=new UtilityManager();
		String pid_list="";
		for(int i=0;i<products.size();i++){
			pid_list+=products.get(i).getProductId()+",";
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
 	<label class="header_options" onclick="showCart('<%=user.getWishlist_id()%>')"><i class="fa fa-cart-plus"></i>&nbsp;&nbsp;Cart</label>
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
 <!-- Left div for showing the cart items starts -->
 <div class="cart-items-div">
 	<p style="font-size:21px;margin:0;padding:10px;border-bottom:1px solid #ccc">MY CART(<%=products.size() %>)</p>
 	<%if(products.size()==0){ %>
 		<p style="font-size:24px;margin-left:20px;">You have No Products in your cart</p>
 	<%}else{
 		for(int i=0;i<products.size();i++){
 		String markedPrice = manager.getBeautifiedAmount(Integer.parseInt(products.get(i).getPrice()));
 		String discountedPrice = manager.getCostPrice(Integer.parseInt(products.get(i).getPrice()), Integer.parseInt(products.get(i).getDiscount()));
 		//total+=manager.getCostPriceAsInteger(discountedPrice);
 		%>
 		<div class="cart-item-row-div">
 			<div style="float:left;width:100px;margin-top:20px;margin-left:20px;">
 				<img src="<%=products.get(i).getImageUrl()%>" width="100px" height="100px">
 			</div>
 			<div style="float:left;">
 				<h3 style="margin:0;padding:20px;width:600px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap"><%=products.get(i).getName() %></h3>
 				<label style="margin-left:20px;font-weight:700;font-size:24px"><i class="fa fa-inr"></i> <%=discountedPrice %></label>
 				<label style="color:grey;margin-left:20px"><strike><i class="fa fa-inr"></i> <%=markedPrice %></strike></label>
 				<label style="color:green;margin-left:20px;font-weight:700;font-size:18px"><%=products.get(i).getDiscount()+"% Off" %></label><br>
 				<button style="background-color:#B9BDFA;color:blue;margin-left:20px;width:100px;height:30px;margin-top:10px;font-size:15px;border:none;border-radius:5px;font-weight:700;cursor:pointer;" onclick="removeItem('<%=products.get(i).getProductId()%>','<%=user.getWishlist_id()%>')">REMOVE</button>
 			</div>
 		</div>
 	<%}} %>
 	<div class="bottom-div">
 		<div id="continueshoplink"><a href="index.jsp">CONTINUE SHOPPING</a></div>
 		<div id="placeorderlink"><a href="checkout.jsp?pid=<%=pid_list%>">PLACE ORDER</a></div>
 	</div>
 </div>
 <!-- left div for showing the cart items ends -->
 <!-- Right div for total cost starts -->
 <div class="cart-total-div">
 	<p style="color:grey;font-size:18px;margin:0;padding:20px;border-bottom:1px solid #ccc">PRICE DETAILS</p>
 	<%if(products.size()==0){ %>
 		<p>No Items</p>
 	<%}else{ 
 		
 		for(int i=0;i<products.size();i++){
 	 		String markedPrice = manager.getBeautifiedAmount(Integer.parseInt(products.get(i).getPrice()));
 	 		String discountedPrice = manager.getCostPrice(Integer.parseInt(products.get(i).getPrice()), Integer.parseInt(products.get(i).getDiscount()));
 	 		total+=manager.getCostPriceAsInteger(discountedPrice);
 	 		discount+=(Integer.parseInt(products.get(i).getPrice())-manager.getCostPriceAsInteger(discountedPrice));
 		%>
 		<div class="cart-total-item-row">
 			<h4 style="float:left;margin:0;margin-left:20px;margin-top:10px;"><%="Item "+(i+1) %></h4>
 			<h4 style="float:right;margin:0;margin-right:20px;margin-top:10px;"><i class="fa fa-inr"></i>  <%=discountedPrice %></h4>
 		</div>
 	<%}} %>
 	<div class="bottom-total-div">
 		<h4 style="float:left;margin-left:10px">Amount Payable</h4>
 		<h4 style="float:right;margin-right:10px;"><i class="fa fa-inr"></i>  <%=manager.getBeautifiedAmount(total) %></h4><br><br><br>
 		<p style="margin-left:10px;color:green;font-weight:700">Your total savings is &nbsp;<i class="fa fa-inr"></i>  <%=manager.getBeautifiedAmount(discount) %></p>
 	</div>
 </div>
 <!-- Right div for total cost ends -->
</body>
</html>