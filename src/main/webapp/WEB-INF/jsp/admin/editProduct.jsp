<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>商品添加</title>
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

<body class="childrenBody" style="margin-left:13%; margin-top: 5%;">
	<form id="goodform" class="layui-form" style="width:80%;">
		
		<div class="layui-form-item">
			<label class="layui-form-label">商品编号</label>
			<div class="layui-input-block">
				<input type="text" name="goodsid" id="id" disabled class="layui-input layui-disabled" 
				lay-verify="required" value="${good.id}">
			</div>
		</div>
		
		<div class="layui-form-item">
			<label class="layui-form-label">商品名称</label>
			<div class="layui-input-block">
				<input type="text" name="goodsname" id="name" class="layui-input" 
				lay-verify="required" value="${good.goodsname}">
			</div>
		</div>
		
		<div class="layui-form-item" style="width: 50%;">
	    	<label class="layui-form-label">商品类别</label>
		    <div class="layui-input-block">
		      <select name="interest" id="listid" lay-filter="aihao" id="categoryselection" >
		        <option value=""></option>
		        <option value="0" selected="">新鲜水果</option>
		        <option value="1">方便速食</option>
		        <option value="2">牛奶饮品</option>
		        <option value="3">酒水畅销</option>
		        <option value="4">精选茗茶</option>
		        <option value="5">肉干熟食</option>
		        <option value="6">饼干蛋糕</option>
		        <option value="7">坚果炒货</option>
		        <option value="8">休闲零食</option>
		      </select>
		    </div>
	  	</div>	
		
		<div class="layui-form-item">
			<label class="layui-form-label">商品规格</label>
			<div class="layui-input-block">
				<input type="text" name="format" id="format" class="layui-input" value="${good.format}"> 
			</div>
			
		</div>
		<div class="layui-form-item">
			<div style="float: left;">
				<label class="layui-form-label">商品库存</label>
				<div class="layui-input-block">
					<input type="text" name="stock"  id="stock" class="layui-input" style="width:150px;" value="${good.stock}">
				</div>
			</div>
			<div style="float: left;">
				<label class="layui-form-label">商品价格</label>
				<div class="layui-input-block">
					<input type="text" name="price" id="price" class="layui-input" style="width:150px;" value="${good.price}">
				</div>
			</div>
		</div>

		<div class="layui-form-item">
				<label class="layui-form-label">商品简介</label>
				<div class="layui-input-block">
					<%-- <textarea name="introduction" id="introduction" class="layui-textarea linksDesc" value="${good.introduction}"></textarea> --%>
					<input type="text" name="introduction" id="introduction" class="layui-input linksDesc" value="${good.introduction}">
				</div>			
		</div>

		
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button type="button" class="layui-btn" id="proimg" style="margin-left: 30%;">确认修改</button>
		    </div>
		</div>
	</form>
	<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/admin/layui/layui.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/layer.js"></script>
  	<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/addProduct.js"></script>
 	
 	<script>
			$("#proimg").click(function(){
				var goodsid = $("#id").val();
				var goodsname = $("#name").val();
				var listid = $("#listid").val();
				var format = $("#format").val();
				var stock = $("#stock").val();
				var price = $("#price").val();
				var introduction = $("#introduction").val();
	
	 			$.post(
						"edit_product",
						{"id":goodsid,
						 "name":goodsname,
						 "listid":listid,
						 "format":format,
						 "stock":stock,
						 "price":price,
						 "introduction":introduction},
						 function(result){	
							 if(result == "success"){
								 layer.msg("恭喜您，修改成功！");
								 parent.location.reload(); 
							 }	 
							 else{
								 layer.msg("修改失败！");
							 }				 
					}); 	
			});
	</script> 

	
	<script>
		layui
				.use(
						[ 'form', 'layedit', 'laydate' ],
						function() {
							var form = layui.form, layer = layui.layer, layedit = layui.layedit, laydate = layui.laydate;

							//创建一个编辑器
							var editIndex = layedit.build('LAY_demo_editor');

							//监听指定开关
							form.on('switch(switchTest)', function(data) {
								layer.msg('开关checked：'
										+ (this.checked ? 'true' : 'false'), {
									offset : '6px'
								});
								layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF',
										data.othis)
							});
						});
	</script>
	
</body>
</html>