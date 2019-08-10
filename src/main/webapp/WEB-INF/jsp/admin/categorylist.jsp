<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
	<title>商品列表</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/font_eolqem241z66flxr.css" media="all" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/news.css" media="all" />
	
	<style type="text/css">
		.productimg{
			margin: 0px;
			padding: 0px;
			margin-right: 10px;
			width:45px;
			height:45px;
		}
	</style>
</head>
	<blockquote class="layui-elem-quote news_search">
		<div class="layui-inline">
		    <div class="layui-input-inline">
		    	<input type="text" value="" placeholder="请输入商品类别名称" class="layui-input search_input">
		    </div>
		    <a class="layui-btn search_btn">查询</a>
		</div>

		<div class="layui-inline">
			<a id="firstlayui" class="layui-btn layui-btn-danger batchDel countdel">批量删除</a>
		</div>		
		
		<div class="layui-inline">
			<a id="addproduct" class="layui-btn layui-btn-danger batchDel2" style="background: #5a98de;">添加商品</a>
		</div>

	</blockquote>
	<div class="layui-form links_list">
	  	<table class="layui-table">
		    <colgroup>
				<col width="50">
				<col width="10%">
				<col width="15%">
				<col width="25%">
				<col>
				<col>
				<col>
				<col>
				<col>
				<col width="5%">
				<col width="5%">
		    </colgroup>
		    <thead>
				<tr style="background:#d6e9c6;">
					<th><input type="checkbox" name="allbox" class="allbox" lay-skin="primary" lay-filter="allChoose" id="allChoose"></th>
					<th>商品编号</th>
					<th>商品名称</th>
					<th>缩略图</th>
					<th>商品价格</th>
					<th>商品规格</th>
					<th>商品销量</th>
					<th>商品库存</th>
					<th>图片管理</th>
					<th>编辑</th>
					<th>删除</th>
				</tr> 
				<c:forEach items="${list}" var="c" varStatus="st">
					<tr>
						<td><input type="checkbox" good_id="${c.id}" name="checkdel" lay-skin="primary" lay-filter="allChoose" id="allChoose"></td>
						<td id="goodsid${st.index+1}">${c.id}</td>
						<td id="goodsname">${c.goodsname}</td>
						<td>
							<img class="productimg" src="${pageContext.request.contextPath}/images/products/${c.id}/1.jpg">
							<img class="productimg" src="${pageContext.request.contextPath}/images/products/${c.id}/2.jpg">
							<img class="productimg" src="${pageContext.request.contextPath}/images/products/${c.id}/3.jpg">
							<img class="productimg" src="${pageContext.request.contextPath}/images/products/${c.id}/4.jpg">
						</td>
						<td id="goodsprice">${c.price}</td>
						<td id="goodsformat">${c.format}
						<td id="goodssales">${c.sales}</td>
						<td id="goodsstock">${c.stock}</td>
						<td>
							<fieldset class="layui-elem-field site-demo-button" style="border: 0px; margin: 0px;">
								  <div class="layui-btn-group" value=""> 
								  <!-- 图片标签 -->
								    <button id="editimg" good_id="${c.id}" class="layui-btn layui-btn-primary layui-btn-sm editimg" style="border:0px;"><i class="layui-icon">&#xe64a;</i>  
								    </button>
								  </div> 
							</fieldset> 
						</td>	
						
						
						<td>
							<fieldset class="layui-elem-field site-demo-button" style="border: 0px; margin: 0px;">
								  <div class="layui-btn-group" > 
								  <!-- 编辑标签 -->
								    <button id="edit${st.index+1}" good_id="${c.id}" class="layui-btn layui-btn-primary layui-btn-sm edit" style="border:0px;"><i class="layui-icon"></i>  
								    </button>
								  </div> 
							</fieldset> 
						</td>	
						<td>
							<fieldset class="layui-elem-field site-demo-button" style="border: 0px; margin: 0px;">
								  <div class="layui-btn-group">
								  <!-- 删除标签 -->
								    <button id="delete${st.index+1}" good_id="${c.id}" class="layui-btn layui-btn-primary layui-btn-sm delete" style="border:0px;"><i class="layui-icon"></i></button>
								  </div> 
							</fieldset> 
						</td>	
					</tr>
				</c:forEach>		
		    </thead>
		    <tbody class="links_content"></tbody>
		</table>
	</div>
	<div id="submitDiv" style="display:none;"></div>
	
	<div style="text-align: center; margin-top: 20px;">
		<a class="layui-btn " href="?start=0" style="font-size: 15px;">首 页</a> 
		<a class="layui-btn " href="?start=${page.start-page.count}"  style="font-size: 15px;">上一页</a>
		<a class="layui-btn " href="?start=${page.start+page.count}"  style="font-size: 15px;">下一页</a>
		<a class="layui-btn " href="?start=${page.last}"  style="font-size: 15px;">末 页</a>
	</div>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/admin/layui/layui.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/linksList.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/layer.js"></script>
		<script>
			// 删除商品界面
			$(".delete").click(function() {
				 var good_id = $(this).attr("good_id");
		
				layer.confirm('确认要删除该商品吗？', {
					btn : [ '确定', '取消' ]
				}, function(index) {
		 			 $.post(
						"deleteproduct",
						{"goodsid":good_id},
						function(result){
							
						}); 
		 			
					layer.close(index);
					layer.msg("商品删除成功！");
					window.location.reload();
				}); 
			})
		</script>
		<script type="text/javascript">
			$(document).ready(function(){
				$(".layui-icon").click(function(){
					/* alert("ddd"); */
				})
			})
		</script>
</body>
</html>