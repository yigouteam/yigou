
$(document).ready(function(){	
	$("#email").foucs(function(){
		$("#emailerror").css("display", "none");
	});
	
	$("#passwd").foucs(function(){
		$("#passwderror").css("display", "none");
	});
	
	$("#verify").foucs(function(){
		$("#verifyerror").css("display", "none");
	});
	
	$("#email").blur(function(){
		var value = $(this).val();
		alert(value);
		if(!value){
			$("#emailerror").css("display", "inline");
		}
	});
	
	$("#passwd").blur(function(){
		var value = $(this).val();
		if(!value){
			$("#passwderror").css("display", "inline");
		}
	});
	
	$("#verify").blur(function(){
		var value = $(this).val();
		if(!value){
			$("#verifyerror").css("display", "inline");
		}
	});
	
	
	/*function validateUsername() {
		alert("1");
		var id = "email";
		var value = $("#" + id).val();
		
		//邮箱非空校验
		if(!value) {
			$("#emailerror").css("display", "inline");
			return false;
		}
		return true;
	}
	
	
	function validatePassword() {
		alert("2");
		var id = "passwd";
		var value = $("#" + id).val();
		
		//密码非空校验
		if(!value) {
			$("#passwderror").css("display", "inline");
			return false;
		}
		return true;
	}
	

	function validateValidateCode() {
		alert("3");
		var id = "verify";
		var value = $("#" + id).val();

		//验证码非空校验
		if(!value){
			$("#verifyerror").css("display", "inline");
			return false;
		}	
		return true;
	}

	
	$("#loginform").submit(function(){
		var bool = true;
		
		if(!validateUsername()){
			bool = false;
		}
		if(!validatePassword()){
			bool = false;
		}
		if(!validateValidateCode()){
			bool = false;
		}	
		return bool;
	})*/
	
});

