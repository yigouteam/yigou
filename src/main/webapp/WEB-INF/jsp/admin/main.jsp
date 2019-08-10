<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>首页</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/admin/layui/css/layui.css"
	media="all" />
<link href="${pageContext.request.contextPath}/css/bootstrap/3.3.6/bootstrap.css"
	rel="stylesheet">	
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/admin/css/font_eolqem241z66flxr.css"
	media="all" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/admin/css/main.css"
	media="all" />
<style type="text/css">
th, td {
	text-align: center !important;
}

.layui-table em {
	background-color: #F33;
	color: #FFF;
	display: block;
	width: 20px;
	height: 20px;
	margin: 0px;
	padding: 0px;
	text-align:center;
	margin-left: 22px;
	border-radius: 3px;
	-moz-border-radius: 3px;
	-webkit-border-radius: 3px;
	-ms-border-radius: 3px;
	-o-border-radius: 3px;
	font-style: normal;
}

.panel {
	margin-right: 100px;
}

.sysNotice {
	width: 700px;
}
</style>
</head>
<body class="childrenBody">
	<div class="panel_box row" style="border-bottom: 2px solid #e2e2e2; margin-bottom:20px;">
		<div class="panel col">
			<a href="javascript:;" data-url="allUsers">
				<div class="panel_icon" style="background-color: #009688;">
					<i class="layui-icon" data-icon="&#xe613;">&#xe613;</i>
				</div>
				<div class="panel_word userAll">
					<span>${total_user}</span> <cite>用户总数</cite>
				</div>
			</a>
		</div>
		<div class="panel col">
			<a href="javascript:;" data-url="img">
				<div class="panel_icon" style="background-color: #5FB878;">
					<i class="layui-icon" data-icon="&#xe64a;">&#xe64a;</i>
				</div>
				<div class="panel_word imgAll">
					<span>${total_goodsimg}</span> <cite>图片总数</cite>
				</div>
			</a>
		</div>
		<div class="panel col">
			<a href="javascript:;" data-url="categorylist">
				<div class="panel_icon" style="background-color: #5FB878;">
					<i class="layui-icon" data-icon="&#xe64a;">&#xe64a;</i>
				</div>
				<div class="panel_word waitNews">
					<span>${total_product}</span> <cite>商品总数</cite>
				</div>
			</a>
		</div>
		<div class="panel col">
			<a href="javascript:;" data-url="linksList">
				<div class="panel_icon" style="background-color: #5FB878;">
					<i class="layui-icon" data-icon="&#xe64a;">&#xe62a;;</i>
				</div>
				<div class="panel_word waitNews">
					<span>${total_order}</span> <cite>订单总数</cite>
				</div>
			</a>
		</div>

	</div>
	<div class="mainmiddle"
		style="width: 100%; position: relative; float: left;">
		<div class="shop"
			style="width: 440px; height: 900px; position: relative; float: left;">
         <section class="panel" style="width:100%;text-align:left;">
				<header class="panel-heading bm0">
					<span class='span-title'>系统概览</span>
					<span class="tools pull-right"><a href="javascript:;" class="iconpx-chevron-down"></a></span>
				</header>
				<div class="panel-body"  >
					<table class="table table-hover personal-task"  >
                         <tbody >
                         	<tr >
                         		<td>
                         			<strong>版本信息</strong>： 版本名称：<a href="http://www.layui.com/">Layui</a> 版本号: V01_UTF8_0.10

                         		</td>
                         		
                         	</tr>
                         	<tr>
                         		<td>
                                <strong>开发作者</strong>： LayUI_YIGOU&nbsp;&nbsp;&nbsp;&nbsp;
                                
                                </td>
                                <td> &nbsp;</td>
                         	</tr>
                         	<tr>
                         		<td>
                                <strong>网站域名</strong>：未定义
                                </td>
                                <td></td>
                         	</tr>
                         	<tr>
                         		<td>
                                <strong>网站目录</strong>：无
                                </td>
                                <td></td>
                         	</tr>
                         	<tr>
                         		<td>
                                <strong>服务器IP</strong>：127.0.0.1
                                </td>
                                <td></td>
                         	</tr>
                         	<tr>
                         		<td>
                                <strong>服务器环境</strong>：tomcat
                                </td>
                                <td></td>
                         	</tr>
                         	<tr>
                         		<td>
                                <strong>数据库版本</strong>： MySQL5.0

                                </td>
                                <td></td>
                         	</tr>
                         	<tr>
                         		<td>
                                <strong>最大上传限制</strong>： 50M

                                </td>
                                <td></td>
                         	</tr>
                         	<tr>
                         		<td>
                                <strong>当前登录用户</strong>： <span class="current_user">1</span>

                                </td>
                                <td></td>
                         	</tr>
                         </tbody>
					</table>
				</div>
			</section>
     
		</div>

		<div class="sysNotice col"
			style="position: relative; float: left; width: 1000px;">
			<blockquote class="layui-elem-quote title">销售排行</blockquote>
			<table class="layui-table">
				<colgroup>
					<col width="10%">
					<col>
					<col width="30%">
					<col>
					<col width="30%">
				</colgroup>
				<tbody>
					<tr>
						<th>排名</th>
						<th>商品编号</th>
						<th>商品名称</th>
						<th>商品价格</th>
						<th>销售数量</th>
					</tr>
					
					<c:forEach items="${saleslist}"  var="good" varStatus="st">
					<tr>
						<td><em>${st.index+1}</em></td>
						<td>${good.id}</td>
						<td>${good.goodsname}</td>
						<td>${good.price}</td>
						<td>${good.sales}</td>
					</tr>
					</c:forEach>
			</table>


			<table class="layui-table" lay-skin="line">
				<colgroup>
					<col>
					<col width="110">
				</colgroup>
				<tbody class="hot_news"></tbody>
			</table>
		</div>

	</div>






	<script type="text/javascript"
		src="${pageContext.request.contextPath}/admin/layui/layui.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/admin/js/main.js"></script>
</body>
</html>