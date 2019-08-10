<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>订单详情</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/layui/css/layui.css" media="all" />
	<style type="text/css">
		.layui-form-item .layui-inline{ width:33.333%; float:left; margin-right:0;}
		@media(max-width:1240px){
			.layui-form-item .layui-inline{ width:100%; float:none; }
		}
		.layui-form-item{
			margin-bottom: 20px!important;
		}
	</style>

</head>

<body class="childrenBody" style="margin-left:8%; margin-top: 2%;">
	<div style="width: 90%;"	>
	<div class="layui-form links_list">
	  	<table class="layui-table" >
		    <colgroup>
				<col width="10">
				<col width="30%">
				<col width="20">
				<col width="10">
				<col width="10">
				<col width="15%">
		    </colgroup>
		    <thead>
				<tr style="background:#d6e9c6;">
				    <th>订单细则号</th>
				    <th>商品</th>
					<th>单价</th>
					<th>数量</th>
					<th>所属订单号</th>
					<th>小计</th>
				</tr> 
			<c:forEach items="${ois}" var="oi" varStatus="st">
				<tr>
	                <td>${oi.id}</td>
					<td>
					<img width="50" height="50" src="${pageContext.request.contextPath}/images/products/${oi.goods.id}/1.jpg">
					 ${oi.goods.goodsname}</td>
					<td>${oi.goods.price}</td>		
					<td>${oi.number}</td>
					<td>${oi.orderid}</td>
					<td>${oi.totalprice}</td>
					
				</tr>
			</c:forEach>
		    </thead>
		    <tbody class="links_content"> 
		    </tbody>
		</table>
	</div>
</div>	

	
	<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/admin/layui/layui.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/layer.js"></script>
  	
	
</body>
</html>