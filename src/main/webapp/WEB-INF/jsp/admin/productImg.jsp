<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>图片管理</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/admin/layui/css/layui.css"
	media="all" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/admin/css/font_eolqem241z66flxr.css"
	media="all" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/admin/css/news.css"
	media="all" />
<style>
#goodsimg {
	width: 120px;
	height: 120px;
}
</style>
</head>
<body class="childrenBody">

	<div class="layui-form links_list">
		<table class="layui-table">
			<colgroup>
				<col width="10">
				<col width="10%">
				<col width="30%">
				<col width="40%">
				<col width="10%">

			</colgroup>
			<thead>
				<tr style="background: #d6e9c6;">
					<th>商品编号</th>
					<th>图片编号</th>
					<th>商品图片</th>
					<th>编辑</th>
					<th>删除</th>
				</tr>
				<c:forEach items="${imglist}" var="c" varStatus="st">
					<tr>
						<td>${c.goodsid}</td>
						<td>${c.id}</td>
						<td><img id="goodsimg"
							src="../images/products/${c.goodsid}/${c.id%4==0?4:c.id%4}.jpg">
						</td>
						<td>
							<fieldset class="layui-elem-field site-demo-button"
								style="border: 0px; margin: 0px;">
								<div class="layui-btn-group">
									
									<div class="layui-upload" id="uuuu">			
										<div class="layui-upload-list" >
											<img class="layui-upload-img" id="demo1">
									    </div>
									    <input type="hidden" name="id" id="img_id" value="${c.id}"> 
										<input type="hidden" name="product_id" id="product_id" value="${c.goodsid}"> 
								
										<button type="button" class="layui-btn up_btn" data-id="${c.id}" 
										lay-data="{url: 'updateProductImage?img_id='+${c.id}+'&product_id='+${c.goodsid}}">上传图片</button>
									   
									</div>
								</div>
							</fieldset>
						</td>
						<td>
							<fieldset class="layui-elem-field site-demo-button"
								style="border: 0px; margin: 0px;">
								<div class="layui-btn-group">
									<!--删除图片 -->
									<button id="deleteimg" good_id="${c.id}"
										class="layui-btn layui-btn-primary layui-btn-sm deleteimage">
										<i class="layui-icon"></i>
									</button>
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
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/admin/js/jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/admin/layui/layui.all.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/admin/js/linksList.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/admin/js/layer.js"></script>
	<script type="text/javascript">
		
	 $(function () {
	    $(".deleteimage").click(function() {
			var imgid = $(this).attr("good_id");
			layer.confirm('确认要删除该图片吗？', {
				btn : [ '确定', '取消' ]
			}, function(index) {
				$.post("deleteimg", {
					"imgid" : imgid
				}, function(result) {
				});
				layer.close(index);
				layer.msg("图片删除成功！");
			});
		});
	    
	    
		
		layui.use('upload', function(){
	
		  var $ = layui.jquery
		 ,upload = layui.upload;
		  
		  //普通图片上传
		  var uploadInst = upload.render({
		    elem: '.up_btn'
		    ,method: 'POST'	
		    ,before: function(obj){
		      //预读本地文件示例，不支持ie8
		      obj.preview(function(index, file, result){
		        $('#demo1').attr('src', result); //图片链接（base64）
		      });
		    }
		    ,done: function(res){
		      //如果上传失败
		      if(res.code > 0){
		        return layer.msg('上传失败');
		      }
		      //上传成功
		      else{
		    	  layer.msg('上传成功');
		    	  window.location.reload();
		      }
		    }
		    ,error: function(){
		    	layer.closeAll('loading');
                layer.msg('网络异常，请稍后重试！');
		    }
		  });
		});
		
	 })
	</script>

</body>
</html>