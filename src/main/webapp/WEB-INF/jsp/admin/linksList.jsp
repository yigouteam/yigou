<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
	<title>订单列表</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/font_eolqem241z66flxr.css" media="all" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/news.css" media="all" />
</head>
<body class="childrenBody">
	<blockquote class="layui-elem-quote news_search">
		<div class="layui-inline">
		    <div class="layui-input-inline">
		    	<input type="text" value="" placeholder="请输入订单编号" class="layui-input search_input">
		    </div>
		    <a class="layui-btn search_btn">查询</a>
		</div>

		<div class="layui-inline">
			<a class="layui-btn layui-btn-danger batchDel">批量删除</a>
		</div>

	</blockquote>
	<div class="layui-form links_list">
	  	<table class="layui-table">
		    <colgroup>
				<col width="50">
				<col width="20%">
				<col>
				<col>
				<col>
				<col>
				<col>
				<col width="15%">
		    </colgroup>
		    <thead>
				<tr>
				    <th>订单号</th>
					<th>订单编号</th>
					<th>收货地址</th>
					
					<th>收货人姓名</th>
					<th>手机号</th>
					<th>订单总额</th>
					<th>下单时间</th>
					<th>订单状态</th>
					<th>操作</th>
				</tr> 
				<c:forEach items="${orders }" var="order" varStatus="st">
					<tr>
	                <td>${order.id}</td>
					<td>${order.orderCode}</td>
					<td>${order.address.province}${order.address.city}${order.address.area}${order.address.detailaddress}</td>		
					<td>${order.address.receiver}</td>
					<td>${order.address.mobile}</td>
					<td>${order.total}</td>
					<td>${order.ordertime}</td>
					<c:if test="${order.status=='0'}">						
					<td style="color: red;">已取消</td>
					</c:if>
					<c:if test="${order.status=='1'}">						
					<td style="color: red;">未付款</td>
					</c:if>
					<c:if test="${order.status=='2'}">						
					<td style="color: red;">待发货</td>
					</c:if>
					<c:if test="${order.status=='3'}">						
					<td style="color: red;">待收货</td>
					</c:if>
					<c:if test="${order.status=='4'}">						
					<td style="color: red;">待评价</td>
					</c:if>
					<c:if test="${order.status=='5'}">						
					<td style="color: red;">已完成</td>
					</c:if>
					<c:if test="${order.status=='6'}">						
					<td style="color: red;">已删除</td>
					</c:if>
					<td>
						<fieldset class="layui-elem-field site-demo-button" style="border: 0px; margin: 0px;">
							  <div class="layui-btn-group">
							    <button class="layui-btn layui-btn-primary layui-btn-sm orderbtn" order_id="${order.id}" id="orderbtn">查看详情</button>
							  </div> 
						</fieldset> 
					</td>
				</tr>
				</c:forEach>
				
		    </thead>
		    <tbody class="links_content"></tbody>
		</table>
	</div>
	<div id="page"></div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/admin/layui/layui.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/layer.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/linksList.js"></script>
	<script >
	
	
	</script>
</body>
</html>