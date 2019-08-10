<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>支付</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/order.css" />
<link href="${pageContext.request.contextPath}/css/bootstrap/3.3.6/bootstrap.css"	rel="stylesheet">
<script	src="${pageContext.request.contextPath}/js/jquery/2.0.0/jquery.min.js"></script>
<script	src="${pageContext.request.contextPath}/js/bootstrap/3.3.6/bootstrap.min.js"></script>



<style>
   
    span.confirmMoneyText{
        color: #4D4D4D;
    }
    span.confirmMoney{
        display: block;
        color: #FF6600;
        font-weight: bold;
        font-size: 20px;
        margin: 10px;
        !important;
    }
    button.confirmPay{
        background-color: #00AAEE;
        border: 1px solid #00AAEE;
        text-align: center;
        line-height: 35px;
        font-size: 16px;
        font-weight: bold;
        color: white;
        width: 120px;
     
    }

    img.PayImg {
        width: 300px;
    }
    .clear_logo{
       height:auto;   
       overflow:hidden;
       width:100%;
    }
    .clear_footer{
        width:100%; 
        text-align:center;
        overflow:hidden;
    }
   
</style>
</head>
<body style="margin: 0px auto; width: 1170px;">  
<%@include file="top.jsp" %>
<br>
<div class="panel panel-info">
	<div class="panel-heading clear_logo">   
		<img class="pull-left" src="images/logo3.png" width="300" height="100">
	    	
	</div>
	<table class="table">
            <tr>
                <td>订单提交成功,请尽快完成付款!</td>
                <td>订单编号: ${order.orderCode} </td>
            </tr>
            <tr>
                <td>收货地址: ${address.province}${address.city}${address.area}${address.detailaddress}</td>
                <td>收货人: ${address.receiver}   ${address.mobile}</td>
            </tr>
             <c:forEach items="${order.orderItems}" var="oi">
                <tr>
                    <td>商品信息: ${oi.goods.goodsname} ${oi.goods.format} x ${oi.number}</td>
                    <td> </td>
                </tr>
            </c:forEach>
    </table>
 <div class="panel-body">
	<div style="float:left;width:100%; text-align:center;">
        <span class="confirmMoneyText">扫一扫付款（元）</span>
        <span class="confirmMoney">￥${order.total}</span>
 
    <div>
        <img class="PayImg" src="images/pay.jpg">
    </div>
   </div>
 </div> 
 
    <div class="panel-footer clear_footer"> 
        <a href="payed?order_id=${order.id}&total=${order.total}">
            <button class="confirmPay">确认支付</button>
        </a>
 
  </div>
</div>



  <%@include file="footer.jsp" %>
 </body>

</html>