<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品分类</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/fore/category.css"> 
<link href="${pageContext.request.contextPath}/css/bootstrap/3.3.6/bootstrap.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/js/jquery/2.0.0/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/bootstrap/3.3.6/bootstrap.min.js"></script>
 <style type="text/css">
		#Menu {
	    float: left;
	    width: 100%;
	    height: 40px;
	    line-height: 40px;
		}
		.Category {
	    float: left;
	    width: 17%;
	    height: 100%;
	    background: red;
	    text-align: center;
		}
		.nave {
	    float: left;
	    width: 11%;
	    height: 40px;
	    font-size: 18px;
	    text-align: center;
	    padding: 0px 10px;
		}
		a{
			color: #000;
			text-decoration: none;
		}
		li {
	    list-style: none;
		}
		.Category a {
	    display: block;
	    line-height: 40px;
	    font-size: 16px;
	    color: #FFFFFF;
	    padding: 0px;
	    margin: 0px;
		}
		.dropdown-menu{
	    	width: 100%;
	    	margin: 0px;
	    	padding: 0px;
		}
		.dropdown-menu>li>a {
		    display: block;
		    padding: 3px 0px;
		    clear: both;
		    font-size: 17px;
		    font-weight: 400;
		    line-height: 40px;
		    color: #333;
		    white-space: nowrap;
		}
		.dropdown-menu>li>a:hover{
			color: #fff;
			background-color: red;
		}
		img{
			margin: 0px;
		}
		
		*{
			margin: 0px;
			padding: 0px;
		}
		a.dropdown-toggle:hover{
			background: rgb(227,23,13);
			color: #fff;
		}
		.navaaa{
			width: 40px;
			height: 1100px;
			position: fixed;
			background:#7a6e6e;
			float: right;
			left:97%;
			top: 0%;
			z-index: 0;
			}
		a:hover{
			text-decoration: none;
		}
		.nave a:hover{
			color: red;
		}
	</style>
	<script type="text/javascript">

		$(document).ready(function(){
			dropdownOpen();//调用
			$(".list-img").mouseover(function(){
				$(this).css("cursor","pointer");
				$(this).css("border","1px solid red");
			});
			$('.list-img').mouseout(function(){
				$(this).css("cursor","auto");
				$(this).css("border","1px solid #ddd");
			});
			$(".glyphicon").click(function() {
      			$("html,body").animate({scrollTop:0}, 300);
			}); 
			$(".glyphicon").mouseover(function() {
      			$(this).css("cursor","pointer");
			}); 
			$(".glyphicon").mouseout(function() {
      			$(this).css("cursor","auto");
			}); 
			$(".salesimg-div").mouseover(function() {
				$(".goods-name").css("display","block");
			});
			$(".salesimg-div").mouseout(function() {
				$(".goods-name").css("display","none");
			});
		});
	
		/**
		* 鼠标划过就展开子菜单，免得需要点击才能展开
		*/
		function dropdownOpen() {
			var $dropdownLi = $('li.dropdown');
			$dropdownLi.mouseover(function(){
				$(this).addClass('open');
			});
			$dropdownLi.mouseout(function(){
				$(this).removeClass('open');
			});
		}
	</script>
</head>
<body style="margin:0 auto; width:1170px;">
   <%@include file="top.jsp" %>
   <%@include file="search.jsp" %>

   <div id="Menu">
		<div class="Category">
			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" style="font-size: 18px;">
				<span class="glyphicon glyphicon-th-list" ></span>
						所有商品分类&nbsp;&nbsp;
				<span class="glyphicon glyphicon-chevron-down"></span>
				</a>
				<ul class="dropdown-menu">	
				  <c:forEach items="${categories }" var="c" >	
				   <li class="dropdown-li"><a href="productCategory?category_id=${c.id }">${c.classname }</a></li>								
				  </c:forEach>
				</ul>
			</li>
		</div>
		<div class="naveli" style="width: 83%;height: 100%;position: relative;float: left; border-bottom: 2px solid red;">
			<div class="nave"><a href="./productCategory?category_id=1">水果</a></div>
			<div class="nave"><a href="./productCategory?category_id=2">速食</a></div>
			<div class="nave"><a href="./productCategory?category_id=3">饮品</a></div>
			<div class="nave"><a href="./productCategory?category_id=4">酒水</a></div>
			<div class="nave"><a href="./productCategory?category_id=5">茗茶</a></div>
			<div class="nave"><a href="./productCategory?category_id=6">肉类</a></div>
			<div class="nave"><a href="./productCategory?category_id=7">糕点</a></div>
			<div class="nave"><a href="./productCategory?category_id=8">坚果</a></div>
			<div class="nave"><a href="./productCategory?category_id=9">零食</a></div>
		</div>	
	</div>
	
	 <c:forEach items="${goods}" var="goods">
		<div class="list-img">
			<div class="imgchilddiv">
				<a href="showProduct?good_id=${goods.id }"><img src="images/products/${goods.id }/1.jpg" id="goods_img"></a>
			</div>
		<div class="img_message">
		<div class="goods_price"><strong>￥</strong>${goods.price }	</div>
		<div class="goods_detail">
			<a id="goods_detail_a" href="showProduct?good_id=${goods.id }">${goods.goodsname}</a>
		</div>	
		</div>
	</div>
   </c:forEach>

   <%@include file="footer.jsp" %>
   <script>
	/**
	* 鼠标划过就展开子菜单，免得需要点击才能展开
	*/
	function dropdownOpen() {
		var $dropdownLi = $('li.dropdown');
		$dropdownLi.mouseover(function(){
			$(this).addClass('open');
		});
		$dropdownLi.mouseout(function(){
			$(this).removeClass('open');
		});
	}
   </script>
</body>
</html>

