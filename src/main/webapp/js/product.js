function imgborder(i) {
	imgid = "listimg" + i;
	var imgborder1 = document.getElementById(imgid);
	imgborder1.style.border = "2px solid red";
	var bigimg = document.getElementById("bigimg");
	bigimg.src =  imgborder1.src;		
		
}
function noimgborder(i) {
	imgid = "listimg" + i;
	var imgborder = document.getElementById(imgid);
	imgborder.style.border = "0px";
}
function next() {
	var next = document.getElementById("");
	var bigimg = document.getElementById("arrow-left");
}
function Onaccount(){
	var account = document.getElementById("price-account");
	account.style.color = "red";
}
function Loseaccount() {
	var account = document.getElementById("price-account");
	account.style.color = "black";
}
function addnumber(){
	var text = document.getElementById("number");
	var num = parseInt(text.value);
	num += 1;
	text.value = num;
}
function reducenumber(){
	var text = document.getElementById("number");
	var num = parseInt(text.value);
	if(num > 1){
		num -= 1;
		text.value = num;
	}
}
function addsuccess(){
	var cart = document.getElementById("addsuccess");
	cart.style.display = "inline";
}
function changecolor(){
	var button = document.getElementById("")
}

function detailliover(x){
	var li = document.getElementsByClassName("detail-ul-li");
	li[x-1].style.color = "red";
	li[x-1].style.cursor = "pointer";

}

function detailliout(x){
	var li = document.getElementsByClassName("detail-ul-li");
	li[x-1].style.color = "#666";
}

function backdisplay(x){
	var back = document.getElementsByClassName("detail-ul-li");
	for (var i = 0; i < back.length; i++) {
		if (i != x-1){
			var temp = i+1;
			var t = "detail-li" + temp;
			var li = document.getElementById(t);

			li.style.background = "#fff";
			li.style.color = "#666";

			li.onmouseover = function(){
				li.style.color = "red";
				li.style.cursor = "pointer";			
			}
			li.onmouseout = function(){
				li.style.color = "#666";
			}
		}
	}
}

function displaydetail(x){
	var displaydiv = document.getElementsByClassName("displaydiv");
	for (var i = 0; i < displaydiv.length; i++) {
		if(i == x-1){
			var detailmessage = "detail-picture" + x;
			$("#"+detailmessage).slideDown("slow");
		}
		else{
			displaydiv[i].style.display = "none";
		}
	}

	var t = "detail-li" + x;
	var li = document.getElementById(t);

	li.style.background = "red";
	li.style.color = "#fff";
	li.onmouseout = function(){
		li.style.color = "#fff";
	};
	li.onmouseover = function(){
		li.style.color = "#fff";
		li.style.cursor = "text";
	}

	backdisplay(x);
}
	
function nodisplaydetail(){
	var displaysuccess = document.getElementById("addsuccess");
	var cart = document.getElementById("addsuccess");
	displaysuccess.style.display = "none";
	var number = document.getElementById("number");
	number.value = 1;
}