<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<title>用户总数</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/font_eolqem241z66flxr.css" media="all" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/user.css" media="all" />
	<script type="text/javascript">
		$(".usersAdd_btn").click(function(){
			layer.open({
				type: 1
				,title: 弹出层
				,area: ['300px', '200px']
				
			});
		});
	</script>
</head>
<body class="childrenBody">
	<blockquote class="layui-elem-quote news_search">
		<div class="layui-inline">
		    <div class="layui-input-inline">
		    	<input type="text" value="" placeholder="请输入会员编号" class="layui-input search_input">
		    </div>
		    <a class="layui-btn search_btn">查询</a>
		</div>
		
		<div class="layui-inline">
			<a class="layui-btn layui-btn-danger batchDel">批量删除</a>
		</div>
		
		<div class="layui-inline">
			<a class="layui-btn layui-btn-normal usersAdd_btn">添加用户</a>
		</div>

	</blockquote>
	<div class="layui-form news_list">
	  	<table class="layui-table">
		    <colgroup>
				<col width="50">
				<col>
				<col width="10%">
				<col width="16%">
				<col width="12%">
				<col width="12%">
				<col width="15%">
		    </colgroup>
		    <thead>
				<tr>
					<th><input type="checkbox" name="" lay-skin="primary" lay-filter="allChoose" id="allChoose"></th>
					<th>会员编号</th>
					<th>登录名</th>
					<th>密码</th>
					<th>邮箱</th>
					<th>手机号</th>
					<th>操作</th>
				</tr> 
				<c:forEach items="${list}" var="c" varStatus="st">
					<tr>
						<td></td>
						<td>${c.id}</td>
						<td>${c.username}</td>
						<td>${c.passwd}</td>
						<td>${c.email}</td>
						<td>${c.tel}</td>
						<td>
							<fieldset class="layui-elem-field site-demo-button" style="border: 0px; margin: 0px;">
								  <div class="layui-btn-group">
								    <button class="layui-btn layui-btn-primary layui-btn-sm">修改密码</button>
								  </div> 
							</fieldset> 
						</td>
					</tr>
				</c:forEach>
				
		    </thead>
		    <tbody class="users_content"></tbody>
		</table>
	</div>
	<div id="page"></div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/admin/layui/layui.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/allUsers.js"></script>
</body>
</html>