$(document).ready(function(){
	
	$('body').click(function(event){
		if(!event.target=='.dropdown'){
			$(".dropdown").hide();
			console.log('Clicked');
		}
	});
	$(".logout").click(function(){
		//sessionStorage.removeItem('UserName');
		window.location.href="index?action=logout";
	});
	$(".profile").click(function(){
		window.location.href="profile.jsp";
	});
	$(".orders").click(function(){
		window.location.href="orders.jsp";
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
		$(".dropdown").show();
	});
	$(window).on('scroll',function(){
		if($(window).scrollTop()>50){
			$(".header").addClass("active");
		}else{
			$(".header").removeClass("active");
		}
	});
	var slides = document.querySelectorAll(".slide");
		console.log("length of slide="+slides.length);
		var currentSlide=0;
		var slideInterval=setInterval(nextSlide,4000);
		function nextSlide(){
		    slides[currentSlide].className = 'slide';
		    currentSlide = (currentSlide+1)%slides.length;
		    slides[currentSlide].className = 'slide showing';
		}
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
function showProducts(str){
	var search_result_div=document.getElementsByClassName('search-result-div')[0];
	console.log('xhttp made '+str);
	var xhttp=new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		  if (this.readyState == 4 && this.status == 200) {
			  if(str=='')
				  search_result_div.style.display="none";
			  else
				  {
				  search_result_div.style.display="block";
				  search_result_div.innerHTML = this.responseText;
				  }
		  }
		};
	xhttp.open("GET", "search?str="+str, true);
	xhttp.send();
}
function searchFor(id,category){
	//search for the specified product_id
	window.location.href="Search?id="+id+"&cat="+category;
}
function showCart(wishlistId){
	window.location.href="Cart?wid="+wishlistId;
}
