$(document).ready(function(){
	$('body').click(function(event){
		if(event.target.id!="drop" && event.target.id!="u"){
			$(".dropdown").hide();
			console.log('Clicked');
		}
	});
	$(".logout").click(function(){
		//sessionStorage.removeItem('UserName');
		window.location.href="index?action=logout";
	});
	$(".username-text").click(function(){
		$(".dropdown").show();
	});
	$("#edit-personal-info").click(function(){
		if($(".name-details").attr("readonly")){
			$(".name-details").css("background-color","white");
			$(".name-details").attr("readonly",false);
			$(".save-btn").show();
			$(".radio").attr("disabled",false);
		}else{
			$(".name-details").css("background-color","#ccc");
			$(".name-details").attr("readonly",true);
			$(".save-btn").hide();
			$(".radio").attr("disabled",true);
		}
		
	});
	$("#edit-email-info").click(function(){
		if($("#email").attr("readonly")){
			$("#email").attr("readonly",false);
			$("#email").css("background-color","white");
			$(".save-email-btn").show();
		}else{
			$("#email").attr("readonly",true);
			$("#email").css("background-color","#ccc");
			$(".save-email-btn").hide();
		}
	});
	$("#edit-mobile-info").click(function(){
		if($("#phone").attr("readonly")){
			$("#phone").attr("readonly",false);
			$("#phone").css("background-color","white");
			$(".save-phone-btn").show();
		}else{
			$("#phone").attr("readonly",true);
			$("#phone").css("background-color","#ccc");
			$(".save-phone-btn").hide();
		}
	});
	$(window).on('scroll',function(){
		if($(window).scrollTop()>50){
			$(".header").addClass("active");
		}else{
			$(".header").removeClass("active");
		}
	});
	$(".logout-div").click(function(){
		window.location.href="index?action=logout";
	});
});
function saveDetails(){
	var first_name = document.getElementById("first-name").value;
	var last_name=document.getElementById("last-name").value;
	var radios = document.getElementsByClassName("radio");
	if(radios[0].checked){
		var gender="M";
	}else{
		var gender="F";
	}
	var loader=document.getElementById("loader");
	loader.style.display="block";
	var btn = document.getElementById("save");
	btn.style.display="none";
	var xhttp=new XMLHttpRequest();
	xhttp.onreadystatechange=function(){
		if(this.readyState==4 && this.status==405){
			//After updations are done
			window.location.href="Profile";
		}
	};
	xhttp.open("GET","updateDetails?first="+first_name+"&last="+last_name+"&gender="+gender+"&type=personal",true);
	xhttp.send();
}
function saveEmail(){
	var email=document.getElementById("email").value;
	var json={"email":email,
			"type":"email"};
var xhttp=new XMLHttpRequest();
	xhttp.onreadystatechange=function(){
		if(this.readyState==4 && this.status==405){

			window.location.href="Profile";
		}
	};
//	$.get('updateDetails',{"email":email,"type":"email"},function(response){
//		window.location.href="profile.jsp"
//	});
	xhttp.open("GET","updateDetails?email="+email+"&type=email",true);
	xhttp.send(JSON.stringify(json));
}
function savePhone(){
	var phone=document.getElementById("phone").value;
	if(phone.length!=10){
		alert("Not a valid Phone Number");
		
	}else{
	var json={"email":email,
			"type":"email"};
var xhttp=new XMLHttpRequest();
	xhttp.onreadystatechange=function(){
		if(this.readyState==4 && this.status==405){

			window.location.href="Profile";
		}
	};
//	$.get('updateDetails',{"email":email,"type":"email"},function(response){
//		window.location.href="profile.jsp"
//	});
	xhttp.open("GET","updateDetails?phone="+phone+"&type=phone",true);
	xhttp.send(JSON.stringify(json));
	}
}
function navigateToHome(){
	window.location.href="index";
}