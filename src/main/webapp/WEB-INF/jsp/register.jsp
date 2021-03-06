<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>易购注册</title>
<link
	href="${pageContext.request.contextPath}/css/bootstrap/3.3.6/bootstrap.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/js/jquery/2.0.0/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/bootstrap/3.3.6/bootstrap.min.js"></script>
<script src="js/register.js"></script>
<link rel="stylesheet" type="text/css" href="css/register.css">
<script>
	function hyz() {
		$("#vertifyimg").attr("src", "createImg?a=" + new Date().getTime());
	}
	$("#logintag").mouseover(function(){
		$(this).css("color", "red");
		$(this).css("text-decoration", "none");
	})
	$("#logintag").mouseout(function(){
		$(this).css("color", "black");
	})
</script>
<style>
a:hover{
	text-decoration:none;
}
a:link{
	text-decoration:none;
}
a:active{
	text-decoration:none;
}
a:visited{
	text-decoration:none;
}
.header {
	width: 100%;
	height: 100px;
	margin: 30px 0px;
}

dd {
	margin: 0px;
	padding: 0px;
}

.foot3 .foot_p1 {
	text-align: center;
	margin: 1px;
}

.foot3 .foot_p1 a {
	margin: 0 10px;
}

.bottom-about {
	width: 100%;
	text-align: center;
	padding-top: 20px;
	float: left;
	background-color: #f5f5f5;
	border-top: #d6d6d6 solid 1px;
}

#logintag{
	color:black;
}

.bottom-about a {
	color: #666666;
	text-decoration: none;
	line-height: 20px;
}

.bottom-about a:hover {
	text-decoration: underline;
}

#owner {
	font-size: 12px;
	margin: 5px;
}
</style>
</head>
<body style="width: 1170px; margin: 0px auto;">
	<div class="login-header">
		<div class="header-logo">
			<img alt="" src="images/logo.jpg" width="140px" height="100px" />
		</div>
		<span
			style="line-height: 100px; font-size: 18px; color: #999; border-left: 1px solid #eaeaea; margin: 30px 0px 0px 30px; padding-left: 30px;">易购注册</span>
		<a href="${pageContext.request.contextPath}/index"
			style="color: #999; text-decoration: none; line-height: 100px; float: right; margin-right: 30px;">返回首页</a>
	</div>

	<div class="main">
		<div class="main_bg">
			<img data-order="101" src="images/loginbg.jpg" width="1000"
				height="500" alt border="0">
		</div>

		<div class="main_content registmain_cont">
			<div class="mc_outside">
				<div class="mc_inside">
					<!-- <div class="exchange_button1">用户注册</div> -->
					<div class="mci_content">
						<form action="${pageContext.request.contextPath}/registerCheck"
							method="post" id="registform">
							<div class="mcicont_input parentCls">
								<input id="Email" type="text" name="EmailOrPhone"
									class="long_input cont_input  inputElem" onkeyup="register();"
									placeholder="邮箱">
								<div id="EmailMsg" class="input_error" style="display: none;"><span class="glyphicon glyphicon-info-sign"></span></div>
							</div>
							<div class="mcicont_input">
								<input id="username" name="username"
									class="cont_input long_input" placeholder="用户名">
								<!--  onkeyup="register(); errlog();" -->
								<div id="usernameMsg" class="input_error" style="display: none;"><span class="glyphicon glyphicon-info-sign"></span></div>
							</div>
							<div class="mcicont_input">
								<input id="mobile" name="mobile" class="cont_input long_input"
									placeholder="手机号">
								<!--  onkeyup="register(); errlog();" -->
								<div id="mobileMsg" class="input_error" style="display: none;"><span class="glyphicon glyphicon-info-sign"></span></div>
							</div>
							<div class="mcicont_input">
								<input id="password" name="password" type="password"
									class="cont_input long_input" onkeyup="register();"
									placeholder="密码">
								<div id="passwordMsg" class="input_error" style="display: none;"><span class="glyphicon glyphicon-info-sign"></span></div>
							</div>
							<div class="mcicont_input">
								<input id="password2" name="password2" type="password"
									class="cont_input long_input" onkeyup="register();"
									placeholder="确认密码">
								<div id="password2Msg" class="input_error"
									style="display: none;"><span class="glyphicon glyphicon-info-sign"></span></div>
							</div>
							<div class="mcicont_input" id="ValidateCode">
								<input id="validateCode" type="text" name="getCode"
									onselectstart="return false;" onpaste="return false;"
									class="cont_input short_input" onkeyup="register();"
									placeholder="验证码"> <a href="#" id="vertifyhyz"
									onclick="hyz()"> <img alt=""
									src="${pageContext.request.contextPath}/createImg"
									id="vertifyimg" style="margin-left: 10px;"> 换一张
								</a>
								<div id="validateCodeMsg" class="input_error"
									style="display: none;"><span class="glyphicon glyphicon-info-sign"></span></div>
							</div>
							<div class="mcicont_line" style="margin: 0px 12px;">
								<div class="mciline_left"
									style="display: block; margin-top: 8px;">
									<span class="choose-checkbox"> <input id="checkBox"
										onclick="" type="checkbox" checked> <label
										for="checkBox" id="checkBoxLabel"></label>
									</span> 我已阅读并同意 <a href="#" target="_blank">《易购网上商城服务协议》</a>
								</div>
								<br>
								<div class="clear"></div>
								<div class="accepttip" style="display: none;">
									<i></i> 请同意易购网网上商城协议
									<div class="clear"></div>
								</div>
							</div>
							<div class="mcicont_btn spe_mcicbtn">

								<input type="submit" id="regist_submit"
									class="input_button_submit" value="立即注册" style="margin-left:5px;">
									<a href="${pageContext.request.contextPath}/login" id="logintag" style="float:right;">已有账号？立即登录</a>
							</div>
							 
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="clear"></div>
	</div>

	<div class="foot3 bottom-about ">
		<div class="w ">
			<p class="foot_p1 ">
				<a href="${pageContext.request.contextPath }/index">首页</a>|<a
					href="# ">设计合作</a>|<a href="# ">广告合作</a>|<a href="# ">联系我们</a>|<a
					href="# ">关于我们</a>
			</p>
			<p id="owner">京公网安备 xxxxxxxxx号 | 京ICP证xxxxxx号 |
				互联网商品信息服务资格证编号(京)-经营性-2018-0008
			<p id="owner">Copyright© 2018-2018 | 易购版权所有 | 消费者维权热线：4006067733</p>
			</p>
		</div>
	</div>
	<script type="text/javascript">
		
	</script>

</body>
</html>