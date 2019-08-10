<%@page import="com.yigou.entity.Goods"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品详情</title>
<link href="${pageContext.request.contextPath}/css/bootstrap/3.3.6/bootstrap.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/js/jquery/2.0.0/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/bootstrap/3.3.6/bootstrap.min.js"></script>
<link rel="icon" type="image/x-icon" href="../images/favicon.ico" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/fore/product.css">
<script type="text/javascript" src="js/product.js"></script>

<style>
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
	    background: #C40000;
	    text-align: center;
		}
		.nave {
	    float: left;
	    width: 130px;
	    height: 40px;
	    font-size: 18px;
	    text-align: center;
	    padding: 0px 12px;
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
		.dropdown-li{
			text-align: center;
		}
		
		*{
			margin: 0px;
			padding: 0px;
		}
	
		.navaaa{
			width: 40px;
			height: 1100px;
			position: fixed;
			background:/* #37383c*/#7a6e6e;
			float: right;
			left:97%;
			top: 0%;
			z-index: 0;
		}
		.buy-cart .addcart:hover{
			color: #fff;
			background-color: rgb(227,23,13);
		}
		img{
			margin: 0px;
		}
</style>
<script type="text/javascript">
$(document).ready(function(){
	dropdownOpen();//调用
	$(".list-img").mouseover(function(){
		$(this).css("cursor","pointer");
		$(this).css("border","2px solid red");
	});
	$('.list-img').mouseout(function(){
		$(this).css("cursor","auto");
		$(this).css("border","2px solid #ddd");
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
	$(".salesimg-div1").mouseover(function() {
		$(".goods-name1").css("display","block");
	});
	$(".salesimg-div1").mouseout(function() {
		$(".goods-name1").css("display","none");
	});
	$(".salesimg-div2").mouseover(function() {
		$(".goods-name2").css("display","block");
	});
	$(".salesimg-div2").mouseout(function() {
		$(".goods-name2").css("display","none");
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
function buyLink(){
	 var count = $("#number").val();
     var inventory = $("#stock").val();

     if (eval(count) > eval(inventory)) {
         alert("库存量不足");
         return fasle;
     }
	var path="${pageContext.request.contextPath}";
	document.addorbuy.action=""+path+"/buynow?product_id="+${product.id}+"&number=" + $("#number").val();
	document.addorbuy.submit();
}

function addCartLink(){
	 var count = $("#number").val();
     var inventory = $("#stock").val();

     if (eval(count) > eval(inventory)) {
         alert("库存量不足");
         return fasle;
     }
	var path="${pageContext.request.contextPath}";
	document.addorbuy.action=""+path+"/addCart";
	document.addorbuy.submit();
}

</script>
</head>

<body style="margin: 0px auto; width: 1170px;">
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
	<div class="category-detail" style="width: 100%;position: relative;float: left;">
		<ol class="breadcrumb">
			<li><a href="${pageContext.request.contextPath }/index">首页</a></li>
				<li class="active">${category.classname }</li>
				<li class="active">${product.goodsname }</li>
		</ol>	
	</div>

	<div class="w">
		<div class="view-wrap">
			<div id="preview" class="preview">
				<img id="bigimg" class="bigimg" src="images/products/${product.id }/1.jpg">
			</div>
			<div id="product-list">
				<ul class="product-list-ul">
					<li class="product-list-li" style="font-size:30px; line-height:75px;color:grey;" >
					<!-- <img id="arrow-left" class="arrow" src="images/arrow-left.png"> -->	
					<div class="glyphicon glyphicon-chevron-left" > </div>
					</li>
					<li class="product-list-li">
						<img id="listimg1" class="listimg" src="images/products/${product.id }/1.jpg" onmouseover="imgborder(1)" onmouseout="noimgborder(1)">
					</li>
					<li class="product-list-li">
						<img id="listimg2" class="listimg" src="images/products/${product.id }/2.jpg" onmouseover="imgborder(2)" onmouseout="noimgborder(2)">
					</li>
					<li class="product-list-li">
						<img id="listimg3" class="listimg" src="images/products/${product.id }/3.jpg" onmouseover="imgborder(3)" onmouseout="noimgborder(3)">
					</li>
					<li class="product-list-li">
						<img id="listimg4" class="listimg" src="images/products/${product.id }/4.jpg" onmouseover="imgborder(4)" onmouseout="noimgborder(4)">
					</li>
					<li class="product-list-li" style="font-size:30px; line-height:75px;color:grey;" >
						<span class="glyphicon glyphicon-chevron-right"> </span>
					</li>
				</ul>
			</div>
		</div>
	<div class="item-info">
			<div class="item-info-right">
				<div class="item-name">	${product.goodsname }</div>
				<div class="summary-price">
					<div class="price-tag">价格：</div>
					<div class="price-rmb">￥${product.price}</div>
				</div>
				<div class="summary-account">
					<div class="price-tag">规格：</div>
					<div class="price-account">
					${product.format }
					</div>
				</div>
			</div>
			
			<div class="summary">
				<div class="alreadysales">
					销量：
					<em style="color: #FF0036;
    				font-weight: 700;">${product.sales }</em>
				</div>
              <form action="" name="addorbuy" method="post">
				<div class="stock">				
						<span>数量：</span>
					<div id="number-text">
						<input id="number" type="text" name="number"  value="1">
					</div>
					<div class="buy-add">
						<img class="numimg" src="images/jia.png" onclick="addnumber()" style=" width: 20px; height: 24px;margin-top: -2px;">
					</div>
					<div class="buy-reduce">
						<img class="numimg" src="images/jian.png" onclick="reducenumber()" style=" width: 20px; height: 24px;margin-left: -20px;margin-top: 19px;"> 
					</div>
					<input id="product_id" type="hidden" name="product_id" value="${product.id}"/> 
					<input id="stock" type="hidden" value="${product.stock}"/>                    
					<span style="font-size: 14px;color: #999;">(库存：${product.stock } )</span>
				</div>

				<div class="buyDiv">
				 <a onclick="buyLink()" class="buyLink">
                    <button class="buyButton">立即购买</button>
                </a>
                <a class="addCartLink" onclick="addCartLink()">
                    <button class="addCartButton"><span class="glyphicon glyphicon-shopping-cart"></span>加入购物车</button>
                </a>

				</div>
			</form>
		</div>			
	</div> 
	<div class="item-right">
		<div class="adverspandiv">
			<span style="font-size: 16px;color: #666; line-height: 40px;">易购推荐</span>
		</div>
		<c:forEach items="${hot}" var="hot" varStatus="status">
			<div class="sales">
				<div class="salesimg-div1">
					<div class="salesimg-childdiv">
						<a href="showProduct?good_id=${hot.id }"><img class="salessimg" src="images/products/${hot.id }/1.jpg" style="margin:0px;"></a>
					</div>

						<div class="goods-name1">
							<a href="showProduct?good_id=${hot.id }" style="color: #fff;font-size: 16px;text-align: center;">${hot.goodsname} ${hot.format }</a>
						</div> 
			</div>
			<div class="salesimg-meg">
			  <div class="megleft">
				  <div class="ranknumberimg">${status.index + 1}</div>
				  <div style="position: relative;float: left;">热销${hot.sales }</div>	
			   </div>
			<div class="megright"><em>￥${hot.price }</em> </div>
		  </div>	
	   </div>
	</c:forEach>		
   </div>				
	<div id="product-detail">
		<div class="product-detail-list">
			<ul class="detail-ul">
				<li id="detail-li1" class="detail-ul-li" onclick="displaydetail(1)" onmouseover="detailliover(1)" onmouseout="detailliout(1)">商品详情</li>
	
			</ul>
		</div>
		<div id="detail-picture1"  class="displaydiv">
			<div id="detail-brand">
				<ul class="message-ul">
				<% String str= ((Goods)request.getAttribute("product")).getIntroduction();
					
					String []arr = str.split("  ");
					
					for(int i=0;i<arr.length;i++){
				%>
				<li class="message-li"><%=arr[i] %></li>				
				<%} %>
				</ul>
			</div>

			<div id="detail-message">
				<ul class="message-ul">
					
				</ul>
			</div>
			<div id="big-picture">
				<img class="biggest-img" src="images/products/${product.id }/1.jpg">
				<img class="biggest-img" src="images/products/${product.id }/2.jpg">
				<img class="biggest-img" src="images/products/${product.id }/3.jpg">
				<img class="biggest-img" src="images/products/${product.id }/4.jpg">
			</div>	
		</div>
		<div id="detail-picture2" class="">
			<div class="p2"></div>
		</div>

	</div>
	
   
   		<%@include file="footer.jsp" %>
   
</body>
</html>