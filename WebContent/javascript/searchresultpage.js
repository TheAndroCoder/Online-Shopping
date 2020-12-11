$(document).ready(function(){
	$(".logout").click(function(){
		//sessionStorage.removeItem('UserName');
		window.location.href="index?action=logout";
	});
	$(".profile").click(function(){
		window.location.href="Profile";
	});
	$("#login").click(function(){
		$(".modal").show();
	});
	$(".close").click(function(){
		$(".modal").hide();
	});
	$(".signup").click(function(){
		var text = $(".signup").text();
		console.log(text);
		if(text=='New to Shoppify? Signup'){
			$(".login-text").html("Signup");
			$(".desc-text").html("We donot share your personal information with anyone.");
			$(".signup").html("Existing User? Log in");
			$(".login").attr("value","Continue");
			$("#hidden").attr("value","signup");
			$(".password").attr("placeholder","New Password(atleast 6 chars for security)");
		}else{
			$(".login-text").html("Login");
			$(".desc-text").html("Get access to your orders, wishlist and Recommendations");
			$(".signup").html("New to Shoppify? Signup");
			$(".login").attr("value","Login");
			$("#hidden").attr("value","login");
			$(".password").attr("placeholder","Enter Password");
		}
		
	});
	$(".username-text").click(function(){
		if($(".dropdown").css("display")=="none")
		$(".dropdown").show();
		else
			$(".dropdown").hide();
	});
	$(window).on('scroll',function(){
		if($(window).scrollTop()>50){
			$(".header").addClass("active");
		}else{
			$(".header").removeClass("active");
		}
	});
	
});
function checkPassword(password){
	var field = document.getElementById("password");
	if(password.length>0&&password.length<4){
		field.style.color="red";
	}else if(password.length>=4 && password.length<=6){
		field.style.color="yellow";
	}else{
		field.style.color="green";
	}
}
function navigateToHome(){
	window.location.href="index";
}
function addToCart(pid,wid){
	//console.log('Add to cart clicked with pid='+pid+" and wid="+wid);
	window.location.href="AddToCart?pid="+pid+"&wid="+wid;
}
function showError(clicked){
	if(clicked=='atcInactive'){
		alert('Login to add to cart');
	}else{
		alert('Login to Place Order');
	}
}
function showCart(wishlistId){
	window.location.href="Cart?wid="+wishlistId;
}
function buyNow(pid){
	window.location.href="Checkout?pid="+pid;
}
function submitReview(pid,uid){
	var review=document.getElementById("my_review").value;
	if(review==''){
		alert('Review Cannot be blank');
	}else{
		var xhttp=new XMLHttpRequest();
		xhttp.onreadystatechange=function(){
			if(this.readyState==4){
				location.reload();
			}
		};
		xhttp.open("GET","review?pid="+pid+"&uid="+uid+"&rev="+review,true);
		xhttp.send();
	}
}