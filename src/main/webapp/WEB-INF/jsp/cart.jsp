<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>购物车</title>

<link href="${pageContext.request.contextPath}/css/bootstrap/3.3.6/bootstrap.css" rel="stylesheet">
<script	src="${pageContext.request.contextPath}/js/jquery/2.0.0/jquery.min.js"></script>
<script	src="${pageContext.request.contextPath}/js/bootstrap/3.3.6/bootstrap.min.js"></script>

<style>
 div.cartDiv {
	margin: 20px auto;
	color: black;
}

span.cartTitlePrice {
	color: #C40000;
	font-size: 14px;
	font-weight: bold;
	margin-left: 5px;
	margin-right: 3px;
}

div.cartTitle button {
	background-color: #AAAAAA;
	border: 1px solid #AAAAAA;
	color: white;
	width: 53px;
	height: 25px;
	border-radius: 2px;
}

table.cartProductTable {
	width: 100%;
	font-size:12px;
}

table.cartProductTable th {
	font-weight: normal;
	color: #3C3C3C;
	padding: 20px 20px;
}

img.cartProductImg {
	padding: 1px;
	border: 1px solid #EEEEEE;
	width: 80px;
	height: 80px;
}

a.cartProductLink {
	color: #3C3C3C;
}

a.cartProductLink:hover {
	color: #C40000;
	text-decoration: underline;
}

div.cartProductLinkOutDiv {
	position: relative;
	height: 80px;
}

div.cartProductLinkInnerDiv {
	position: absolute;
	bottom: 0;
	height: 20px;
}

tr.cartProductItemTR td {
	padding: 20px 20px;
}

tr.cartProductItemTR {
	border: 1px solid #CCCCCC;
}

span.cartProductItemOringalPrice {
	text-decoration: line-through;
	color: #9C9C9C;
	display: block;
	font-weight: bold;
	font-size: 14px;
}

span.cartProductItemPromotionPrice {
	font-family: Arial;
	font-size: 14px;
	font-weight: bold;
	color: #C40000;
}

span.cartProductItemSmallSumPrice {
	font-family: Arial;
	font-size: 14px;
	font-weight: bold;
	color: #C40000;
}

div.cartProductChangeNumberDiv {
	border: solid 1px #E5E5E5;
	width: 80px;
}

div.cartProductChangeNumberDiv input {
	border: solid 1px #AAAAAA;
	width: 42px;
	display: inline-block;
}

div.cartProductChangeNumberDiv a {
	text-decoration: none;
}

div.cartProductChangeNumberDiv a {
	width: 14px;
	display: inline-block;
	text-align: center;
	color: black;
	text-decoration: none;
}

img.cartProductItemIfSelected, img.selectAllItem {
	cursor: pointer;
}

div.cartFoot {
	background-color: #E5E5E5;
	line-height: 50px;
	margin: 20px 0px;
	color: black;
	padding-left: 20px;
}

span.cartSumNumber {
	color: #C40000;
	font-weight: bold;
	font-size: 16px;
}

span.cartSumPrice {
	color: #C40000;
	font-weight: bold;
	font-size: 20px;
}

div.cartFoot button {
	background-color: #AAAAAA;
	border: 0px solid #AAAAAA;
	color: white;
	height: height%;
	width: 120px;
	height: 50px;
	font-size: 20px;
	text-align: center;
	/* 	border-radius: 2px; */
}
 
  table.cartProductTable th.operation{
	width:80px;
  }
table.cartProductTable th.selectAndImage{
	width:150px;
}

table td{
	font-size:12px;
}
</style>



</head>
<body style="margin: 0px auto; width: 1170px;">
<%@include file="top.jsp" %>

<script>
function formatMoney(num) {
    num = num.toString().replace(/\$|\,/g, '');
    if (isNaN(num))
        num = "0";
    sign = (num == (num = Math.abs(num)));
    num = Math.floor(num * 100 + 0.50000000001);
    cents = num % 100;
    num = Math.floor(num / 100).toString();
    if (cents < 10)
        cents = "0" + cents;
    for (var i = 0; i < Math.floor((num.length - (1 + i)) / 3); i++)
        num = num.substring(0, num.length - (4 * i + 3)) + ',' +
            num.substring(num.length - (4 * i + 3));
    return (((sign) ? '' : '-') + num + '.' + cents);
}

var deleteOrderItem = false;
var deleteOrderItemid = 0;
$(function(){

	$("a.deleteOrderItem").click(function(){
		deleteOrderItem = false;
		var oiid = $(this).attr("oiid")
		deleteOrderItemid = oiid;
		$("#deleteConfirmModal").modal('show');	   
	});
	$("button.deleteConfirmButton").click(function(){
		deleteOrderItem = true;
		$("#deleteConfirmModal").modal('hide');
	});
	
	$('#deleteConfirmModal').on('hidden.bs.modal', function (e) {
		if(deleteOrderItem){
			var page="deleteOrderItem";
			$.post(
				    page,
				    {"oiid":deleteOrderItemid},
				    function(result){
						if("success"==result){
							$("tr.cartProductItemTR[oiid="+deleteOrderItemid+"]").hide();
							location.href="cart";
						}
						else{
							location.href="login";
						}
				    }
				);
			
		}
	})	
	
	$("img.cartProductItemIfSelected").click(function(){
		var selectit = $(this).attr("selectit")
		if("selectit"==selectit){
			$(this).attr("src","images/cartNotSelected.png");
			$(this).attr("selectit","false")
			$(this).parents("tr.cartProductItemTR").css("background-color","#fff");
		}
		else{
			$(this).attr("src","images/cartSelected.png");
			$(this).attr("selectit","selectit")
			$(this).parents("tr.cartProductItemTR").css("background-color","#FFF8E1");
		}
		syncSelect();
		syncCreateOrderButton();
		calcCartSumPriceAndNumber();
	});
	$("img.selectAllItem").click(function(){
		var selectit = $(this).attr("selectit")
		if("selectit"==selectit){
			$("img.selectAllItem").attr("src","images/cartNotSelected.png");
			$("img.selectAllItem").attr("selectit","false")
			$(".cartProductItemIfSelected").each(function(){
				$(this).attr("src","images/cartNotSelected.png");
				$(this).attr("selectit","false");
				$(this).parents("tr.cartProductItemTR").css("background-color","#fff");
			});			
		}
		else{
			$("img.selectAllItem").attr("src","images/cartSelected.png");
			$("img.selectAllItem").attr("selectit","selectit")
			$(".cartProductItemIfSelected").each(function(){
				$(this).attr("src","images/cartSelected.png");
				$(this).attr("selectit","selectit");
				$(this).parents("tr.cartProductItemTR").css("background-color","#FFF8E1");
			});				
		}
		syncCreateOrderButton();
		calcCartSumPriceAndNumber();
		

	});
	
	$(".orderItemNumberSetting").keyup(function(){
		var pid=$(this).attr("pid");
		var stock= $("span.orderItemStock[pid="+pid+"]").text();
		var price= $("span.orderItemPromotePrice[pid="+pid+"]").text();
		
		var num= $(".orderItemNumberSetting[pid="+pid+"]").val();
		num = parseInt(num);
		if(isNaN(num))
			num= 1;
		if(num<=0)
			num = 1;
		if(num>stock)
			num = stock;
		
		syncPrice(pid,num,price);
	});

	$(".numberPlus").click(function(){
		
		var pid=$(this).attr("pid");
		var stock= $("span.orderItemStock[pid="+pid+"]").text();
		var price= $("span.orderItemPromotePrice[pid="+pid+"]").text();
		var num= $(".orderItemNumberSetting[pid="+pid+"]").val();

		num++;
		if(num>stock)
			num = stock;
		syncPrice(pid,num,price);
	});
	$(".numberMinus").click(function(){
		var pid=$(this).attr("pid");
		var stock= $("span.orderItemStock[pid="+pid+"]").text();
		var price= $("span.orderItemPromotePrice[pid="+pid+"]").text();
		
		var num= $(".orderItemNumberSetting[pid="+pid+"]").val();
		--num;
		if(num<=0)
			num=1;
		syncPrice(pid,num,price);
	});	
	
	$("button.createOrderButton").click(function(){
		var params = "";
		$(".cartProductItemIfSelected").each(function(){
			if("selectit"==$(this).attr("selectit")){
				var oiid = $(this).attr("oiid");
				params += "&oiid="+oiid;
			}
		});
		params = params.substring(1);
		location.href="buy?"+params;
	});
	
	
	
})

function syncCreateOrderButton(){
	var selectAny = false;
	$(".cartProductItemIfSelected").each(function(){
		if("selectit"==$(this).attr("selectit")){
			selectAny = true;
		}
	});
	
	if(selectAny){
		$("button.createOrderButton").css("background-color","#C40000");
		$("button.createOrderButton").removeAttr("disabled");
	}
	else{
		$("button.createOrderButton").css("background-color","#AAAAAA");
		$("button.createOrderButton").attr("disabled","disabled");		
	}
		
}
function syncSelect(){
	var selectAll = true;
	$(".cartProductItemIfSelected").each(function(){
		if("false"==$(this).attr("selectit")){
			selectAll = false;
		}
	});
	
	if(selectAll)
		$("img.selectAllItem").attr("src","images/cartSelected.png");
	else
		$("img.selectAllItem").attr("src","images/cartNotSelected.png");
	
	
	
}
function calcCartSumPriceAndNumber(){
	var sum = 0;
	var totalNumber = 0;
	$("img.cartProductItemIfSelected[selectit='selectit']").each(function(){
		var oiid = $(this).attr("oiid");
		var price =$(".cartProductItemSmallSumPrice[oiid="+oiid+"]").text();
		price = price.replace(/,/g, "");
		price = price.replace(/￥/g, "");
		sum += new Number(price);	
		
		var num =$(".orderItemNumberSetting[oiid="+oiid+"]").val();
		totalNumber += new Number(num);	
		
	});
	
	$("span.cartSumPrice").html("￥"+formatMoney(sum));
	$("span.cartTitlePrice").html("￥"+formatMoney(sum));
	$("span.cartSumNumber").html(totalNumber);
}
function syncPrice(pid,num,price){
	$(".orderItemNumberSetting[pid="+pid+"]").val(num);
	var cartProductItemSmallSumPrice = formatMoney(num*price); 
	$(".cartProductItemSmallSumPrice[pid="+pid+"]").html("￥"+cartProductItemSmallSumPrice);
	calcCartSumPriceAndNumber();
	
	var page = "changeOrderItem";
	$.post(
		    page,
		    {"pid":pid,"number":num},
		    function(result){
				if("success"!=result){
					location.href="login";
				}
		    }
		);

}
</script>


<div class="cartDiv">
	<div class="cartTitle pull-right">
		<span>已选商品  (不含运费)</span>
		<span class="cartTitlePrice">￥0.00</span>
		<button class="createOrderButton" disabled="disabled">结 算</button>
	</div>
	
	
	<div class="cartProductList">
		<table class="cartProductTable">
			<thead>
				<tr>
					<th class="selectAndImage">
							<img selectit="false" class="selectAllItem" src="images/cartNotSelected.png">				
					全选
					
					</th>
					<th>商品信息</th>
					<th>单价</th>
					<th>数量</th>
					<th width="120px">金额</th>
					<th class="operation">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${carts}" var="oi">
					<tr oiid="${oi.id}" class="cartProductItemTR">
						<td>
							<img selectit="false" oiid="${oi.id}" class="cartProductItemIfSelected" src="images/cartNotSelected.png">
							<a style="display:none" href="#nowhere"><img src="images/cartSelected.png"></a>
							<img class="cartProductImg"  src="images/products/${oi.product.id}/1.jpg">
						</td>
						<td>
							<div class="cartProductLinkOutDiv">
								<a href="showProduct?good_id=${oi.product.id}" class="cartProductLink">${oi.product.goodsname}</a>
								
							</div>
							
						</td>
						<td>
							<span class="cartProductItemOringalPrice">￥${oi.product.price}</span>
							<span  class="cartProductItemPromotionPrice">￥${oi.product.price}</span>
							
						</td>
						<td>
						
							<div class="cartProductChangeNumberDiv">
								<span class="hidden orderItemStock " pid="${oi.product.id}">${oi.product.stock}</span>
								<span class="hidden orderItemPromotePrice " pid="${oi.product.id}">${oi.product.price}</span>
								<a  pid="${oi.product.id}" class="numberMinus" href="#nowhere">-</a>
								<input pid="${oi.product.id}" oiid="${oi.id}" class="orderItemNumberSetting" autocomplete="off" value="${oi.number}">
								<a  stock="${oi.product.stock}" pid="${oi.product.id}" class="numberPlus" href="#nowhere">+</a>
							</div>					
						
						 </td>
						<td >
							<span class="cartProductItemSmallSumPrice" oiid="${oi.id}" pid="${oi.product.id}" >
							￥<fmt:formatNumber type="number" value="${oi.product.price*oi.number}" minFractionDigits="2"/>
							</span>
						
						</td>
						<td>
							<a class="deleteOrderItem" oiid="${oi.id}"  href="#nowhere">删除</a>
						</td>
					</tr>
				</c:forEach>				
			</tbody>
		
		</table>
	</div>
	
	<div class="cartFoot">
		<img selectit="false" class="selectAllItem" src="images/cartNotSelected.png">
		<span>全选</span>
<!-- 		<a href="#">删除</a> -->
		
		<div class="pull-right">
			<span>已选商品 <span class="cartSumNumber" >0</span> 件</span>
			
			<span>合计 (不含运费): </span> 
			<span class="cartSumPrice" >￥0.00</span>
			<button class="createOrderButton" disabled="disabled" >结  算</button>
		</div>
		
	</div>
	
</div>
<div class="modal" id="deleteConfirmModal" tabindex="-1" role="dialog" >
	<div class="modal-dialog deleteConfirmModalDiv">
		<div class="modal-content">
			<div class="modal-header">
				<button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
				<h4 class="modal-title">确认删除？</h4>
			</div>
			<div class="modal-footer">
				<button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
				<button class="btn btn-primary deleteConfirmButton" id="submit" type="button">确认</button>
			</div>
		</div>
	</div>
</div>

<%@include file="footer.jsp" %>



 </body>
</html>


