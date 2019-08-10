<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

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

<style>
.reg {
	margin-top: 20px;
}

.head_ing {
	text-align: center;
	font-size: 20px;
}
</style>
</head>
</head>
<body style="width: 1170px; margin: 0px auto;">

	<div class="panel panel-success reg">
		<div class="panel-heading">
			<div class="alert alert-success head_ing">
				<span class="glyphicon glyphicon-tag"></span> 请输入您的激活码：
			</div>

			<div style="width: 100%; margin-top: 50px; margin-left: 230px;">
				<form action="${pageContext.request.contextPath}/activesuccess">
					<div class="col-lg-6">
						<div class="input-group" style="line-height: 50px;">
							<span class="input-group-addon"> <input type="radio"></span>
							<input type="text" class="form-control" name="activecode">
						</div>
					</div>
					<button type="submit" class="btn btn-primary btn-lg active"
						style="margin-top: -6px;">立即激活</button>

				</form>

			</div>

		</div>


	</div>

	<%@include file="footer.jsp"%>
</body>
</html>
