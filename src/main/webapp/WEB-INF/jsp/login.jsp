<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>易购登录</title>
<link href="${pageContext.request.contextPath}/css/bootstrap/3.3.6/bootstrap.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/bootstrap/3.3.6/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/login.css">
<link rel="stylesheet" type="text/css" href="css/register.css">
<style>
	a{
		color: #000;
		text-decoration: none;
	}
	a:hover{
		color: red;
		text-decoration: none;
	}
	a:link{
		text-decoration: none;
	}
	a:visited{
		text-decoration: none;
	}
	.header{
		width: 100%;
		height: 100px;
		margin: 30px 0px;
	}
	dd{
	margin: 0px;
	padding: 0px;
	}
	.foot3 .foot_p1{
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
	.loginmsg{
		position: relative;
		float: left;
	}
	
	.inputerror{
		width:100%;
		position:relative;
		margin:0px; 
		padding: 0px; 
		color:red; 
		font-size:15px;
	}	
</style>

</head>
<body style="width: 1170px; margin: 0px auto;">
		<%@include file="search.jsp" %>
	    <div class="main">
	    	<div class="main_bg">
	    		<img data-order="101" src="images/loginbg.jpg" width="1000px" height="500px" overflow="hidden"; alt border="0">
	    	</div>
	    	<form name="login_post" action="" method="post" id="login_post.">
                <input type="hidden" name="way" value="fromRegister">
                <input type="hidden" name="serverPath" value="">   <!--服务器的位置-->
                <input type="hidden" name="mid" value="0">
                <input type="hidden" name="returnUrl" value>                  
	    	</form>
	    	<div class="main_content registmain_cont">
	    		<div class="mc_outside">
	    			<div class="mc_inside">
	    				<div class="mci_content">
	    					<form action="${pageContext.request.contextPath }/logincheck" >
	    					        <div class="mcicont_input parentCls">
	    					        	<div class="loginmsg">
	    					        		<!-- <input id="email" type="text" name="emailOrphone" class="textarea" placeholder="邮箱/手机号"> -->
	    					        		<input type="text" id="email" name="email"  class="textarea" name="emailOrphone" placeholder="邮箱/手机号"/>
	    					        		<div class="alert alert-danger" id="emailerror" role="alert" style="position:relative;float:left;padding:5px;margin:0px;display:none;">
												  <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
												  <span class="sr-only">Error:</span>
												  请输入邮箱或手机号
											</div>
	    					        	</div>
	    					        	
	    					        	<div class="loginmsg">       		
											<input type="password" id="passwd" class="textarea" name="password" placeholder="密码"/>
											
				    					    <div class="alert alert-danger" id="passwderror" role="alert" style="position:relative;float:left;padding:5px;margin:0px;display:none;">
												  <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
												  <span class="sr-only">Error:</span>
												  请输入密码
											</div>
	    					        	</div>
	    					        	
	    					        	<div class="loginmsg" >
	    					        		<div style="float:left;">
	    					        			<input type="text"  id="verify" class="textarea" name="verifycode" placeholder="验证码" style="width: 130px">
	    					        			<a href="#" id="vertifyhyz" onclick="hyz()" style="margin-left:10px;margin-top:43px;">
	    											<img alt="" src="${pageContext.request.contextPath}/createImg2" id="vertifyimg"  style="margin-left:10px;margin-top:43px;">
	    										</a> 
	    					        		</div>

	    									<div class="alert alert-danger" id="verifyerror" role="alert" style="position:relative;float:left;padding:5px;margin:0px;display:none;">
												  <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
												  <span class="sr-only">Error:</span>
												  请输入验证码
											</div>   								
	    									
	    					        	</div>
	    					        	
	    					        	<div class="loginmsg">	
	    						    		<input type="submit" class="input_button_submit" value="用户登录" >	
	    						    		
	    					        	</div>

	    						       <a href="${pageContext.request.contextPath}/register" class="forget">没有账号？立即注册</a>

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
				<a href="index.jsp">首页</a>|<a href="# ">设计合作</a>|<a href="# ">广告合作</a>|<a href="# ">联系我们</a>|<a href="# ">关于我们</a>
			</p>
			<p id="owner">
				京公网安备 xxxxxxxxx号  |  京ICP证xxxxxx号  |  互联网商品信息服务资格证编号(京)-经营性-2018-0008 
				<p id="owner">Copyright© 2018-2018  |  易购版权所有 | 消费者维权热线：4006067733</p>
            </p>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/js/jquery/2.0.0/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap/3.3.6/bootstrap.min.js"></script>
 	<script src="${pageContext.request.contextPath}/js/login.js"></script>
	<script>
		function hyz(){
			 $("#vertifyimg").attr("src", "createImg?a=" + new Date().getTime()); 
		}
	</script>
</body>
</html>