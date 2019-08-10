<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>易购注册</title>


<link href="${pageContext.request.contextPath}/css/bootstrap/3.3.6/bootstrap.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/js/jquery/2.0.0/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/bootstrap/3.3.6/bootstrap.min.js"></script>
	
<style>
  .reg{
     margin-top:20px;
  }
  .head_ing{
     text-align:center;
     font-size:20px;
  }
   
</style>
</head>
</head>
<body style="width:1170px; margin: 0px auto;">

  <div class="panel panel-success reg">
	<div class="panel-heading">
		<div class="alert alert-success head_ing">
        <span class="glyphicon glyphicon-ok-sign"></span>
        恭喜激活成功
    </div>
	</div>
	<div class="panel-body">
		<div class="jumbotron">
		 <br><br><br><br>
		  <p  style="text-align:center;">马上去<a href="login">登录</a></p>	
		  <br><br><br><br>  
		</div>
	</div>
</div>	

<%@include file="footer.jsp" %>
</body>
</html>
