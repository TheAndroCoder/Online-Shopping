<%@page import="com.example.utils.UtilityManager"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.example.beans.Product"%>
<%@page import="java.util.Random"%>
<%@page import="com.example.beans.User"%>
<%@page import="com.example.utils.DBUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Shoppify : Secure Payment</title>
<link rel="stylesheet" href="css/checkoutpage.css" type="text/css"/>
<script src="javascript/checkoutpage.js"></script>
<link rel="icon" type="image/png" href="images/shoppify.png"/>
</head>
<body>
<%
	String pid_list = request.getParameter("pid");
	DBUtils utils = DBUtils.getInstance();
	UtilityManager manager = new UtilityManager();
	ArrayList<Product> products=utils.getProductsFromPidList(pid_list);
	User user = utils.fetchUser(Integer.parseInt(session.getAttribute("id").toString()));
	String pid_csv="";
	for(int i=0;i<products.size();i++){
		pid_csv+=products.get(i).getProductId()+",";
	}
%>
	<header class="header">
		<label class="headerlabel" onclick="navigateToHome()">S h o p p i f y</label>
	</header>
	<div class="address-div">
		<div class="address-div-header">
			<label>BASIC USER INFORMATION</label>
			<button class="edit-info-btn" onclick="gotoProfile()">CHANGE</button>
		</div>
		<h3>Deliver To : <%=user.getFirst_name()+" "+user.getLast_name() %></h3>
		<h3>Email : <%=user.getEmail_id() %></h3>
		<h3>Contact : <%=user.getPhone() %></h3>
		<h3>Delivery Address</h3>
		<input type="text" id="delivery_address" placeholder="Delivery Address"/>
	</div>
	<div class="payment-div">
		<div class="payment-div-header">
			<label>PAYMENT OPTIONS</label>
		</div>
		<div class="payment-options-div">
			<button class="payment-option-btn" onclick="select('debit')" id="debit">DEBIT CARD</button>
			<button class="payment-option-btn active" onclick="select('cod')" id="cod">CASH ON DELIVERY</button>
		</div>
		<div class="selection-div">
			<div class="debit-selection-div">
				<input type="text" placeholder="Enter Card Number" onkeyup="detectCard(this.value)" id="card_number"/>
				<p id="card_name" style="display:inline;margin-left:5px;"></p>
				<p>Expiry Date</p>
				<input type="month" id="expiry_month">
				<p>CVV</p>
				<input type="password" id="cvv" placeholder="Enter cvv" style="outline:none;"><br>
				<button id="verify_debit" onclick="verifyDebit()">VERIFY</button>
			</div>
			<div class="cod-selection-div show">
				<h2>Are You a Human?</h2>
				<h4>Enter the text given below</h4>
				<h3><%
					//Captcha generation code goes here
					Random random=new Random();
					String randNumber="";
					for(int i=0;i<4;i++){
						int num = random.nextInt(10);
						randNumber+=Integer.toString(num);
					}
					out.println(randNumber);
				%></h3>
				<input type="text" placeholder="Enter here" id="user-input"/>
				<button class="check-captcha-btn" onclick="checkCaptcha('<%=randNumber%>')">SUBMIT</button>
			</div>
		</div>
	</div>
	<div class="payment-details-div">
		<div class="payment-details-header">
			<label style="color:white;margin-top:10px;font-weight:700;float:left;margin-left:20px;">PAYMENT DETAILS</label>
		</div>
		<div class="items-list">
			<%for(int i=0;i<products.size();i++){ %>
				<div class="items-row-div">
					<p style="color:blue;font-size:15px;margin-left:10px;float:left;"><%=products.get(i).getName().substring(0,20)+"..." %></p>
					<p style="color:blue;float:right;margin-right:10px;"><i class="fa fa-inr"></i><%=manager.getBeautifiedAmount(Integer.parseInt(products.get(i).getPrice())) %></p>
				</div>
			<%} %>
		</div>
		<div class="payment-details-footer">
			<button id="place-order-btn" onclick="placeOrder('<%=pid_csv%>','<%=user.getId()%>')">PLACE ORDER</button>
		</div>
	</div>
</body>
</html>