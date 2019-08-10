<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>易购商城</title>

<link href="${pageContext.request.contextPath}/css/bootstrap/3.3.6/bootstrap.min.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/js/jquery/2.0.0/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/bootstrap/3.3.6/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".clickButton a").attr("href", "javascript:return false;");
		$(".clickButton a").each(function(index) {
			$(this).click(function() {
				changeImage(this, index);
			});
		});
		autoChangeImage();
	});

	function autoChangeImage() {
		for (var i = 0; i <= 10000; i++) {
			window.setTimeout("clickButton(" + (i % 5 + 1) + ")", i * 2000);
		}
	}

	function clickButton(index) {
		$(".clickButton a:nth-child(" + index + ")").click();
	}

	function changeImage(element, index) {
		var arryImgs = [ "images/ad.jpg", "images/ad2.jpg", "images/ad3.jpg",
				"images/ad4.jpg", "images/ad5.jpg" ];
		$(".clickButton a").removeClass("active");
		$(element).addClass("active");
		$(".imgs img").attr("src", arryImgs[index]);
	}
</script>
<style>
#footer{
	float: left;
	width: 100%;
	margin: 10px auto;
	border-top: 1px solid #D1D1DC;
}
li {
	list-style: none;
}
			
img {
	border: 0;
    margin-top: 6px;
}

.foot_box {
       float: left;
	    width: 100%;
	    background:url(images/background2.jpg);
	    overflow: hidden;
		padding: 20px 50px;
		margin: 30px 0px;
		height:100px;
}
			
.foot_box ul {
	width: 100%;
	height:100%;
}
			
.foot_box ul li {
      float: left;
      width:25%;
}
			
.foot_box ul li img {
	float: left
}
			
.foot_box ul li span {
		float: left;
		line-height: 50px;
	    font-family: "Microsoft YaHei";
		color: #000;
		font-size: 18px;
		padding-left: 20px;
}
.foot2 {
	    float: left;
        border-top: 1px solid #ededed;
	    width:100%;
	    height: 200px;
        padding: 20px 50px;
        margin: auto;
}

.foot2 dl a {    
        overflow: hidden;
        text-align: center;
        height: 20px;
        line-height: 20px;
        color: #8b8b8b;
}

 .foot2 dl {
        float: left;
        width: 25%;
        padding-left:50px;
 }

 .foot2 dl dt {
        color: #646464;
        font-size: 16px;
        font-weight: 700;
        height: 30px;
        line-height: 30px;
        text-align: left ;
}

.foot2 dl dd {
        text-align: left ;
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
	
#contanier {
	width: 100%;
}

#index_center {
	float: left;
	width: 100%;
	height: 500px;
	margin-bottom:50px;
}
#s_header {
	width: 100%;
	height: 50px;
	float: left;
	margin-top: 30px;
	background-repeat: no-repeat;
}
#s_center {
	float: left;
	width: 100%;
	height: 600px;
	margin-bottom:50px;
}


#Menu {
	float: left;
	width: 100%;
	height: 40px;
	line-height: 40px;
	margin-top:10px ;
}

.Category {
	float: left;
	width: 19%;
	height:100%;
	background: #FAA13D;
}
.Category em{
    width:10%;
    height:100%;
    font-size:18px;
    line-height: 40px;
    color:#FFFFFF;
    padding-left:10px;
}
.Category span {
	
	width: 80%;
	font-size: 18px;
	line-height: 40px;
	color: #FFFFFF;
    padding:10px;
}

.nave {
	float: left;
	width: 9%;
	height: 40px;
	font-size: 18px;
	background: #F9C950;
	text-align: center;
}

.nave a {
	color: white;
	text-decoration: none;
}

.nave:hover {
	background-color: #FAA13D;
	color: white;
	text-decoration: underline;
}

.box {
	float: left;
	height: 100%;
	width: 19%;
	background: url(images/background.jpg);
}

.Menu_list {
	width: 100%;
	height: 50px;
	font-size: 18px;
	text-align: center;
	line-height: 50px;
}

.Menu_list a {
	color: white;
	text-decoration: none;
}

.Menu_list:hover {
	background-color: white;
}

.Menu_list:hover a {
	color: black;
}

.imgsBox {
	overflow: hidden;
	float: left;
	width: 81%;
	height: 100%;
}



.logo2 {
	float: left;
	width: 60px;
	height: 50px;
	text-align: center;
	line-height: 70px;
	background: black;
	border-bottom: 3px solid black;
}

.logo2 li {
	font-size: 28px;
	color: white;
}

.s_title {
	width: 180px;
	height: 50px;
	float: left;
	border-bottom: 3px solid black;
	text-align: center;
	line-height: 70px;
}
.s_title a{
 color:#000000;
 text-decoration: none;
 font-weight: 1000;
 font-size: 24px;
}

.c_left {
	width: 20%;
	height: 100%;
	float: left;
	background-repeat: no-repeat;
}

.c_right {
	width: 80%;
	height: 100%;
	float: left;
}

.cr_tt {
	width: 25%;
	height: 50%;
	float: left;
	padding:20px;
	
}

.cr_tt img {
	margin: auto 10px;
	width: 180px;
	height: 180px;
}

.cr_tt:hover {
	border: 1px #B9B9B9 solid;
}

.cr_tt span {
	color: red;
	font-size: 20px;
	font-weight: bold;
}

a:visited {
	text-decoration: none;
}


li {
	list-style: none;
}

img {
	border: 0;
	margin-top: 6px;
}
.imgs {
  margin:auto 5px;
}
.imgs a {
	display: block;
	width: 100%;
	height: 490px;
}

.clickButton {
	
	width: 450px;
	height: 20px;
	position: relative;
	top: -1px;
	_top: -5px;
}

.clickButton div {
	float: right;
}

.clickButton a {
	border-left: #ccc 1px solid;
	line-height: 12px;
	height: 19px;
	font-size: 12px;
	float: left;
	padding: 0 7px;
	text-decoration: none;
	color: #FFF;
}

.clickButton a:hover  {
	background-color: #d34600;
}

</style>

</head>
<body style="margin: 0 auto; width: 1170px;">

	<%@include file="./top.jsp"%>
	<%@include file="./search.jsp"%>
	

	<div id="contanier">
		<div id="Menu">
			<div class="Category">
			    <em class="glyphicon glyphicon-list"></em>
				<span >所有产品分类</span>
				<em class="glyphicon glyphicon-chevron-down"></em>
			</div>
			<div class="nave">
				<a href="./productCategory?category_id=1">水果</a>
			</div>
			<div class="nave">
				<a href="./productCategory?category_id=2">速食</a>
			</div>
			<div class="nave">
				<a href="./productCategory?category_id=3">饮品</a>
			</div>
			<div class="nave">
				<a href="./productCategory?category_id=4">酒水</a>
			</div>
			<div class="nave">
				<a href="./productCategory?category_id=5">茗茶</a>
			</div>
			<div class="nave">
				<a href="./productCategory?category_id=6">肉类</a>
			</div>
			<div class="nave">
				<a href="./productCategory?category_id=7">糕点</a>
			</div>
			<div class="nave">
				<a href="./productCategory?category_id=8">坚果</a>
			</div>
			<div class="nave">
				<a href="./productCategory?category_id=9">零食</a>
			</div>
		</div>

		<div id="index_center">
			<div class="box">
              <c:forEach items="${categories }"  var="c">
				<div class="Menu_list">
					<a href="./productCategory?category_id=${c.id }">${c.classname }</a>
				</div>
			 </c:forEach>				
			<div class="Menu_list">
				<a href="#">宣传服务处</a>
			</div>
		</div>

			<div class="imgsBox">
				<div class="imgs">
					<a href="#"><img src="images/ad.jpg" width="947"
						height="500" /></a>					
				</div>
				<div class="clickButton">
					<div>
						<a class="active" href="">1</a> <a class="" href="">2</a> <a
							class="" href="">3</a> <a class="" href="">4</a> <a class=""
							href="">5</a>
					</div>
				</div>
			</div>
		</div>
      <c:forEach items="${categories }" var="c" >
		<div id="s_header">
			<div class="logo2">
				<li>${c.id}F</li>
			</div>
			<div class="s_title">
				<a href="#">${c.classname }</a>
			</div>
		</div>
		
		<div id="s_center">
			<div class="c_left">
				<img src="images/products/poster${c.id }.jpg" width="230" height="600">
		</div>		
		<div class="c_right">
			  <c:forEach items="${c.goods}" var="good">		
					<a href="./showProduct?good_id=${good.id }">
					<div class="cr_tt">
						<img src="images/products/${good.id }/1.jpg" >
						<span>￥${good.price}</span>
						<li>${good.goodsname } ${good.format }</li>						
					</div>
					</a>		
				</c:forEach>
			</div>	
		</div>
	</c:forEach>
	</div>
	<%@include file="./footer.jsp"%>
</body>
</html>