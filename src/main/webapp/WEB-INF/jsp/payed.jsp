<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>支付成功</title>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/order.css" />
<link
	href="${pageContext.request.contextPath}/css/bootstrap/3.3.6/bootstrap.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/js/jquery/2.0.0/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/bootstrap/3.3.6/bootstrap.min.js"></script>




<style>
    div.payedDiv{
        border: 1px solid #D4D4D4;
        border-radius:10px;
        width: 100%;
        margin: 20px auto ;
    }
    div.payedTextDiv{
        height: 80px;
        background-color: #ECFFDC;
        padding: 20px  25px;
    }
    div.payedTextDiv span{
        font-weight: bold;
        font-size: 20px;
   
    }
    div.Info{
        padding: 25px 30px;
    }
  
    span.payedInfoPrice{
        color: #B10000;
        font-weight: bold;
        font-size: 14px;
        font-family: arial;
    }
    div.paedCheckLinkDiv{
        margin-left: 10px;
    }
    a.payedCheckLink{
        color: #2D8CBA;
    }
   
    div.Line{
        border-top: 1px dotted #D4D4D4;
        margin: 0px 31px;
    }
    div.warningDiv{
        width:100%;
        height:80px;
        line-height:80px;
        text-align:center;
        color:black;
       
    }
</style>
</head>
<body style="margin: 0px auto; width: 1170px;">

<%@include file="top.jsp" %>

<div class="payedDiv">
    <div class="payedTextDiv">
        <img src="images/paySuccess.png" style="margin-bottom:13px;">
        <span>您已成功付款!</span>

    </div>
    <div class="Info">
        <ul class="list-group">
            <li class="list-group-item">收货地址: ${address.province} ${address.city}${address.area}${address.detailaddress} </li>
            <li class="list-group-item">收货人:  ${address.receiver}</li>
            <li class="list-group-item">电话:  ${address.mobile }</li>
            <li class="list-group-item">实付款：<span class="payedInfoPrice">￥${param.total}</li>
            <li class="list-group-item">我们将在付款后三天内发货哦    </li>
        </ul>

        <div class="paedCheckLinkDiv">
            您可以
            <a class="payedCheckLink" href="myOrder">查看已买到的宝贝</a>
            <a class="payedCheckLink" href="myOrder">查看交易详情 </a>
        </div>

    </div>

    <div class="Line"></div>

    <div class="warningDiv">
        <b>温馨提示：</b>下单后，<span class="redColor boldWord">不要轻信任何人的发送退款的消息哦！</span>我们没有系统升级，订单异常等问题，谨防假冒客服电话诈骗！
    </div>

</div>
	<%@include file="footer.jsp"%>
	
</body>
</html>	
