

/**
 * 输入框得到焦点隐藏信息
 */


$(document).ready(function(){	
	$(".cont_input").focus(function(){
		var labelId = $(this).attr("id") + "Msg";
		$("#" + labelId).text("");
		showError($("#" + labelId));
		
	});
	$(".cont_input").blur(function(){
		var id = $(this).attr("id");
		var funName = "validate" + id.substring(0,1).toUpperCase() + id.substring(1) + "()";
		eval(funName);
	});
	
	function validateUsername() {
		var id = "username";
		var value = $("#" + id).val();
		
		var results = true;
		
		//非空校验
		if(!value) {
			$("#" + id + "Msg").text("用户名不能为空！");
			showError($("#" + id + "Msg"));
			results = false;
			return results;
		}
		
		
		//长度校验
		if(value.length < 3 || value.length > 20) {
			$("#" + id + "Msg").text("用户名长度必须在3-20位之内！");
			showError($("#" + id + "Msg"));
			results = false;
			return results;
		}
		
		return results;
	}
	function validatePassword() {
		var id = "password";
		var value = $("#" + id).val();
		
		if(!value) {
			$("#" + id + "Msg").text("密码不能为空！");
			showError($("#" + id + "Msg"));
			return false;
		}
		
		if(value.length < 3 || value.length > 20) {
			$("#" + id + "Msg").text("密码长度必须在3-20位之内！");
			showError($("#" + id + "Msg"));
			return false;
		}
		return true;
	}
	function validatePassword2() {
		var id = "password2";
		var value = $("#" + id).val();
		
		if(!value) {
			$("#" + id + "Msg").text("确认密码不能为空！");
			showError($("#" + id + "Msg"));
			return false;
		}
		
		if(value != $("#password").val()) {
			$("#" + id + "Msg").text("两次输入不一致！");
			showError($("#" + id + "Msg"));
			return false;
		}
		return true;
	}
	
	function validateMobile() {
		var id = "mobile";
		var value = $("#" + id).val();
		
		var results = true;
		
		if(!value) {
			$("#" + id + "Msg").text("手机号不能为空！");
			showError($("#" + id + "Msg"));
			results = false;
			return false;
		}
		
		if(!/^(13[0-9]|14[0-9]|15[0-9]|166|17[0-9]|18[0-9]|19[8|9])\d{8}$/.test(value)){
			$("#" + id + "Msg").text("请输入正确的手机号！");
			showError($("#" + id + "Msg"));
			results = false;
			return false;
		}
		return results;
	}
	
	
	function validateEmail() {
		var id = "Email";
		var value = $("#" + id).val();
		
		if(!value) {
			$("#" + id + "Msg").text("email不能为空！");
			showError($("#" + id + "Msg"));
			return false;
		}

		if(!/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/.test(value)){
			$("#" + id + "Msg").text("错误的Email格式！");
			showError($("#" + id + "Msg"));
			return false;
		}
		
		//邮箱存在校验
		$.ajax({
			url: "registvalidate",
			data:{email:value},
			type:"POST",
			dataType:"text",
			async:false,            //是否异步请求
			cache:false,
			success:function(result) {
				if(result == "exist"){
					
					$("#" + id + "Msg").text("该邮箱已经注册！");
					showError($("#" + id + "Msg"));
					results = false;
					return false;
				}
			}		
		});
		return true;
	}
	function validateValidateCode() {
		var id = "validateCode";
		var value = $("#" + id).val();
		
		var results = true;
		if(!value){
			$("#" + id + "Msg").text("验证码不能为空！");
			showError($("#" + id + "Msg"));
			results = false;
			return results;
		}
		if(value.length != 4){
			$("#" + id + "Msg").text("验证码错误！");
			showError($("#" + id + "Msg"));
			results = false;
			return results;
		}
		
		//验证码是否正确
		
		$.ajax({
			url:"verifyCode",
			data:{verifycode:value},
			type:"POST",
			dataType:"text",
			async:false,
			cache:false,
			success:function(result) {
				if(result == "error") {
					$("#" + id + "Msg").text("验证码错误！");
					showError($("#" + id + "Msg"));
					
				}
			}
		})

		return results;
	}
	
	function validatecheckbox(){
		if(!$("input[type='checkbox']").is(':checked')){
			results = false;
			return false;
		}
		return true;
	}

	function showError(ele){
		var text = ele.text();
		
		if(!text){
			ele.css("display", "none");
		}
		else{
			ele.css("display", "inline");
		}
	}

	$("#registform").submit(function(){
		var bool = true;
		
		if(!validateUsername()){
			bool = false;
		}
		if(!validatePassword()){
			bool = false;
		}
		if(!validatePassword2()){
			bool = false;
		}
		if(!validateEmail()){
			bool = false;
		}
		if(!validateMobile()){
			bool = false;
		}
		if(!validateValidateCode()){
			bool = false;
		}
		if(!validatecheckbox()){
			bool = false;
		}

		return bool;
	})
	
});

