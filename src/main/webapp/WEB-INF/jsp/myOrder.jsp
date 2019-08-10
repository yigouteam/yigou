<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的订单</title>


<link
	href="${pageContext.request.contextPath}/css/bootstrap/3.3.6/bootstrap.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/center.css">	
<script
	src="${pageContext.request.contextPath}/js/jquery/2.0.0/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/bootstrap/3.3.6/bootstrap.min.js"></script>


<style>
div.boughtDiv {
    width: 100%;
	float: left;
}

div.orderType div {
	border-bottom: 2px solid #E8E8E8;
	float: left;
}

div.orderType a {
	border-right: 1px solid #E8E8E8;
	display: inline-block;
	font-size: 16px;
	font-weight: bold;
	color: black;
	margin-bottom: 10px;
	padding: 0px 20px;
	text-decoration: none;
}

div.orderType a:hover {
	color: #FF0036;
	text-decoration: none;
}

div.orderType div.selectedOrderType {
	border-bottom: 2px solid #FF0036;
}

div.orderType div.selectedOrderType a {
	color: #FF0036;
}

div.orderTypeLastOne {
	overflow: hidden;
	float: none !important;
	border-bottom: 2px solid #E8E8E8;
	height: 35px;
}

a.noRightborder {
	border-right-width: 0px !important;
}

table.orderListTitleTable {
	border: 1px solid #E8E8E8;
	width: 100%;
	margin: 20px 0px;
	background-color: #F5F5F5;
	text-align: center;
	font-size: 12px;
}

table.orderListTitleTable td {
	padding: 12px 0px;
}

table.orderListItemTable {
	border: 2px solid #ECECEC;
	width: 100%;
	margin: 20px 0px;
	font-size: 12px;
}

table.orderListItemTable:hover {
	border: 2px solid #aaa !important;
}

table.orderListItemTable td {
	padding: 8px 10px;
}

tr.orderListItemFirstTR {
	background-color: #F1F1F1;
}

div.orderItemWangWangGif {
	display: inline-block;
	width: 67px;
	height: 22px;
	background-image: url(img/fore/wangwang.gif);
	background-repeat: no-repeat;
	background-color: transparent;
	background-attachment: scroll;
	background-position: -0px -0px;
	position: relative;
	top: 0px;
	left: 2px;
}

td.orderItemDeleteTD {
	text-align: right;
}

span.orderListItemDelete {
	display: inline-block;
	margin: 0px 10px;
	color: #999999;
	font-size: 16px;
}

div.goodLinkDiv {
	position: relative;
	height: 80px;
}


.orderListItemProductPrice {
	color: #3C3C3C;
	font-size: 14px;
}

td.orderListItemNumberTD {
	text-align: center;
}

td.orderItemOrderInfoPartTD {
	border: solid 1px #ECECEC;
}

span.orderListItemNumber {
	color: #3C3C3C;
}

td.subtotalTD {
	text-align: center;
}

.subtotal {
	color: #3C3C3C;
	font-size: 14px;
	font-weight: bold;
}

div.orderListItemPriceWithTransport {
	color: #6C6C6C;
	font-size: 12px;
}

td.orderListItemButtonTD {
	text-align: center;
}

button.wait_to_review {
	border: 1px solid #DCDCDC;
	background-color: #fff;
	border-radius: 2px;
	color: #3C3C3C;
	font-size: 12px;
	font-weight: bold;
	padding: 6px 12px;
}

button.wait_to_review:hover {
	border-color: #C40000;
	color: #C40000;
}

button.wait_to_receipt{
   font-weight: bold;
}
button.wait_to_delivery{
   font-weight: bold;
}

a {
	color: #999;
}

a:hover {
	text-decoration: none;
	color: #FF0036;
}
</style>

<script>
	var deleteOrder = false;
	var deleteOrderid = 0;

	$(function() {
		$("a[orderStatus]").click(function() {
			var orderStatus = $(this).attr("orderStatus");
			if ('all' == orderStatus) {
				$("table[orderStatus]").show();
			} else {
				$("table[orderStatus]").hide();
				$("table[orderStatus=" + orderStatus + "]").show();
			}

			$("div.orderType div").removeClass("selectedOrderType");
			$(this).parent("div").addClass("selectedOrderType");
		});

		$("a.deleteOrderLink").click(function() {
			deleteOrderid = $(this).attr("oid");
			deleteOrder = false;
			$("#deleteConfirmModal").modal("show");
		});

		$("button.deleteConfirmButton").click(function() {
			deleteOrder = true;
			$("#deleteConfirmModal").modal('hide');
		});

		$('#deleteConfirmModal').on('hidden.bs.modal',function(e) {
				if (deleteOrder) {
						var page = "deleteOrder";
						$.post(
						 page, 
						{"order_id" : deleteOrderid}, 
						function(result) {
							if ("success" == result) {
								$("table.orderListItemTable[oid="+ deleteOrderid + "]").hide();
								window.location.reload();
							} else {
								location.href = "login.jsp";
							}
						});

					}
				})

		$(".wait_to_delivery").click(function() {
			var link = $(this).attr("link");
			$(this).hide();
			page = link;
			$.ajax({
				url : page,
				success : function(result) {
					alert("卖家将在付款后三天内发货，请耐心等待~")
					window.location.reload();
				}
			});

		});
		$(".wait_to_receipt").click(function() {
			var link = $(this).attr("link");
			$(this).hide();
			page = link;
			$.ajax({
				url : page,
				success : function(result) {
					alert("我们将收到您的货款~")
					window.location.reload();
				}
			});

		});
		$(".wait_to_review").click(function() {
			var link = $(this).attr("link");
			$(this).hide();
			page = link;
			$.ajax({
				url : page,
				success : function(result) {
					alert("评价功能尚待完成，有问题请联系客服哦~")
					window.location.reload();
				}
			});

		});
		
		$(".cancel_Order").click(function(){
			var link = $(this).attr("link");
			$(this).hide();
			$.ajax({
				url:link,
				success:function(result){
					alert("订单已取消~");
					window.location.reload();
				}
			});
		});

	});
</script>
</head>
<body style="margin: 0px auto; width: 1170px;">
	<%@include file="top.jsp"%>
	<%@include file="search.jsp"%>
	<!--当前位置-->
<div class="now_positionm">
<span>当前位置：</span><a href="index">首页></a><a href="user_center">个人中心></a><a>我的订单</a>
</div>
<!--centers-->
<div class="centers_m">
	<!--清除浮动-->
    <div class="clear_sm"></div>
	<!--left-->
    <div class="centers_ml">
    	<!--头像-->
        <div class="center_header">
        	<a href="#"><img src="images/touxiang.jpg"/></a>
            <em>您好，<font>${user.username}</font></em>
        </div>
        <!--列表go-->
        <div class="centers_listm">
        	<div class="centers_listm_one">
            	<img src="images/zshy.png"/>
                <em>会员中心</em>
            </div>
            <!--一条开始-->
            <div class="centers_listm_one_in">
                <img src="images/shezhi.png"/>
                <em>资料管理</em>
                <b></b>
            </div>
            <span class="gjszmdm">
                <a href="user_center" class="center_in_self"><font>信息资料</font></a>
                <a href="user_address" class="center_in_self"><font>收货地址</font></a>
            </span>
            <!--一条开始-->
            <div class="centers_listm_one_in">
                <img src="images/ddgl.png"/>
                <em>订单管理</em>
                <b></b>
            </div>
            <span class="gjszmdm">
                <a href="myOrder" class="center_in_self"><font>我的订单</font></a>
                <a href="#" class="center_in_self"><font>评价订单</font></a>
               
            </span>
            <!--一条开始-->
            <div class="centers_listm_one_in">
                <img src="images/suo.png"/>
                <em>账户安全</em>
                <b></b>
            </div>
            <span class="gjszmdm">
                <a href="password" class="center_in_self"><font>账户安全</font></a>
                <a href="password" class="center_in_self"><font>邮箱管理</font></a>
                <a href="password" class="center_in_self"><font>手机管理</font></a>
                <a href="password" class="center_in_self"><font>支付管理</font></a>
               
            </span>    
            <!--一条开始-->
            <div class="centers_listm_one_in">
                <img src="images/wdssc.png"/>
                <em>收藏管理</em>
                <b></b>
            </div>
            <span class="gjszmdm">
            	<a href="cart" class="center_in_self"><font>我的购物车</font></a>
              
            </span>    
            
          
        </div>
        <script type="text/javascript">
		$(function(){//第一步都得写这个
			$(".centers_listm_one_in").click(function(){
			$(this).next(".gjszmdm").slideToggle().siblings("gjszmdm").slideUp()
			});
		})
		</script>
    </div>
    <!--right-->
    <div class="centers_mr">
		<div class="boughtDiv">
			<div class="orderType">
				<div class="selectedOrderType">
					<a orderStatus="all" href="#">所有订单</a>
				</div>
				<div>
					<a orderStatus="1" href="#">待付款</a>
				</div>
				<div>
					<a orderStatus="2" href="#">待发货</a>
				</div>
				<div>
					<a orderStatus="3" href="#">待收货</a>
				</div>
				<div>
					<a orderStatus="4" href="#" class="noRightborder">待评价</a>
				</div>
				<div class="orderTypeLastOne">
					<a class="noRightborder"> </a>
				</div>
			</div>
			<div style="clear: both"></div>
			<div class="orderListTitle">
				<table class="orderListTitleTable">
					<tr>
						<td>我的商品</td>
						<td width="121px">单价</td>
						<td width="121px">数量</td>
						<td width="141px">合计</td>
						<td width="121px">交易操作</td>
					</tr>
				</table>

			</div>

			<div class="orderListItem">
				<c:forEach items="${orders}" var="o">
					<table class="orderListItemTable" orderStatus="${o.status}"
						oid="${o.id}">
						<tr class="orderListItemFirstTR">
							<td colspan="2"><b>${o.ordertime}</b> <span>订单号:
									${o.orderCode} </span></td>
							<td colspan="2"></td>
							<td colspan="1"></td>
							<td class="orderItemDeleteTD"><a class="deleteOrderLink"
								oid="${o.id}" href="#nowhere"> <span
									class="orderListItemDelete glyphicon glyphicon-trash"></span>
							</a></td>
						</tr>
						<c:forEach items="${o.orderItems}" var="oi" varStatus="st">
							<tr class="orderItemProductInfoPartTR">
								<td class="orderItemProductInfoPartTD"><img width="80"
									height="80" src="images/products/${oi.goods.id}/1.jpg"></td>
								<td class="orderItemProductInfoPartTD">
									<div class="goodLinkDiv">
										<a href="showProduct?good_id=${oi.goods.id}">${oi.goods.goodsname}</a>
									</div>
								</td>
								<td class="orderItemProductInfoPartTD" width="100px"><span
									class="orderListItemProductPrice">￥${oi.goods.price}</span></td>
								<c:if test="${st.count==1}">
									<td valign="top" rowspan="${fn:length(o.orderItems)}"
										class="orderListItemNumberTD orderItemOrderInfoPartTD"
										width="100px"><span class="orderListItemNumber">${o.totalNumber}</span>
									</td>
									<td valign="top" rowspan="${fn:length(o.orderItems)}"
										width="120px"
										class="subtotalTD orderItemOrderInfoPartTD">
										<span class="subtotal">￥${o.total}</span>
									</td>
									<td valign="top" rowspan="${fn:length(o.orderItems)}"
										class="orderListItemButtonTD orderItemOrderInfoPartTD"
										width="100px">
										<c:if test="${o.status=='0'}">	
										       <a href="#">交易已关闭</a>
										</c:if>									
										<c:if test="${o.status=='1' }">
											<a href="pay?order_id=${o.id}&total=${o.total}">
												<button class="btn btn-default btn-sm">一键支付</button>
											</a>
											   <p></p>
											    <button class="btn btn-default btn-sm cancel_Order"
											     link="cancelOrder?order_id=${o.id}">取消订单</button>
										</c:if> 
										<c:if test="${o.status=='2' }">
											<button class="btn btn-default btn-sm wait_to_delivery"
												link="update_delivery_status?order_id=${o.id}">提醒发货</button>
										</c:if> 
										<c:if test="${o.status=='3' }">
											<button class="btn btn-default btn-sm wait_to_receipt"
												link="update_receipt_status?order_id=${o.id}">确认收货</button>
										</c:if> 
										<c:if test="${o.status=='4' }">
											<button class="wait_to_review"
												link="update_review_status?order_id=${o.id}">一键评价</button>
										</c:if>
										<c:if test="${o.status=='5' }">
											<a href="#">交易已完成</a>
										</c:if>
										</td>
								</c:if>
							</tr>
						</c:forEach>
					</table>
				</c:forEach>

			</div>
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

	<%@include file="footer.jsp"%>
</body>
</html>
