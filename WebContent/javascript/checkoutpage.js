function navigateToHome(){
	window.location.href="index.jsp";
}
function gotoProfile(){
	window.location.href="profile.jsp";
}
function saveAddress(){
	//make an AJAX call to the SaveData servlet
	var input=document.getElementById("delivery_address").value;
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange=function(){
		
	};
	xhttp.open("");
	xhttp.send();
}
function select(option){
	var debit = document.getElementById("debit");
	var cod = document.getElementById("cod");
	var debit_div = document.getElementsByClassName('debit-selection-div')[0];
	var cod_div = document.getElementsByClassName('cod-selection-div')[0];
	if(option=='debit'){
		//clicked on debit card tab
		debit.classList.add("active");
		cod.classList.remove("active");
		debit_div.classList.add("show");
		cod_div.classList.remove("show");
	}else{
		//clicked on cash on delivery tab
		cod.classList.add("active");
		debit.classList.remove("active");
		cod_div.classList.add("show");
		debit_div.classList.remove("show");
	}
}
function checkCaptcha(num){
	var input=document.getElementById('user-input').value;
	var placeOrderBtn=document.getElementById('place-order-btn');
	var address = document.getElementById('delivery_address').value;
	//console.log('value is :'+input);
	if(input==num){
		if(address!='')
		placeOrderBtn.style.backgroundColor="#ef6336";
		else
			alert('Enter the Delivery Address');
	}else{
		alert("Incorrect captcha !!");
		window.location.reload();
	}
}
var cardName="";
function detectCard(cardNum){
	var pTag = document.getElementById('card_name');
	if(cardNum.length<2){
		pTag.innerHTML="";
		cardName="";
	}
	if(cardName==''&&cardNum.length==2){
		pTag.innerHTML="Running card detection algorithm...";
		detectionAlgorithm(cardNum);
		setTimeout(function(){
			if(cardName!=''){
				pTag.innerHTML="Detected : "+cardName;
				pTag.style.color="green";
			}else{
				pTag.innerHTML="Unable to detect";
				pTag.style.color="red";
			}
		},2000);
	}
}
function detectionAlgorithm(cardNum){
	if(cardNum==34 || cardNum==37){
		cardName="American Express";
	}else if(cardNum==50 || cardNum==51 ||cardNum==52 || cardNum==53 || cardNum==54 || cardNum==55){
		cardName="Master Card";
	}
}
function placeOrder(pid_csv,uid){
	var address = document.getElementById('delivery_address').value;
	var xhttp=new XMLHttpRequest();
	xhttp.onreadystatechange=function(){
		window.location.href="orders.jsp";
	};
	xhttp.open("GET","order?pids="+pid_csv+"&uid="+uid+"&addr="+address);
	xhttp.send();
}