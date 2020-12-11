$(document).ready(function(){
	$(".logout").click(function(){
		//sessionStorage.removeItem('UserName');
		window.location.href="index.jsp?action=logout";
	});
	$(".profile").click(function(){
		window.location.href="profile.jsp";
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
function navigateToHome(){
	window.location.href="index.jsp";
}
function removeItem(pid,wid){
	var xhttp=new XMLHttpRequest();
	xhttp.onreadystatechange=function(){
		location.reload(true);
	};
	xhttp.open("GET","remove?pid="+pid+"&wid="+wid,true);
	xhttp.send();
}