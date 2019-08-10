<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品添加</title>
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
<style type="text/css">
.layui-form-item .layui-inline {
	width: 33.333%;
	float: left;
	margin-right: 0;
}

@media ( max-width :1240px) {
	.layui-form-item .layui-inline {
		width: 100%;
		float: none;
	}
}

.layui-form-item {
	margin-bottom: 20px !important;
}
</style>

</head>

<body class="childrenBody" style="margin-left: 13%; margin-top: 5%;">
	<form id="goodform" action="add_Product" method="post"
		class="layui-form" style="width: 80%;">

		<div class="layui-form-item">
			<label class="layui-form-label">商品名称</label>
			<div class="layui-input-block">
				<input type="text" name="goodsname" id="name" class="layui-input"
					lay-verify="required" placeholder="请输入商品名称">
			</div>
		</div>
		<div class="layui-form-item" style="width: 50%;">
			<label class="layui-form-label">商品类别</label>
			<div class="layui-input-block">
				<select name="categoryname" lay-filter="aihao"
					id="categoryselection">
					<option value=""></option>
					<option value="1" selected="">新鲜水果</option>
					<option value="2">方便速食</option>
					<option value="3">牛奶饮品</option>
					<option value="4">酒水畅销</option>
					<option value="5">精选茗茶</option>
					<option value="6">肉干熟食</option>
					<option value="7">饼干蛋糕</option>
					<option value="8">坚果炒货</option>
					<option value="9">休闲零食</option>
				</select>
			</div>
		</div>


		<div class="layui-form-item">
			<label class="layui-form-label">商品规格</label>
			<div class="layui-input-block">
				<input type="text" name="format" id="format" class="layui-input"
					placeholder="请输入商品规格">
			</div>

		</div>
		<div class="layui-form-item">
			<div style="float: left;">
				<label class="layui-form-label">商品库存</label>
				<div class="layui-input-block">
					<input type="text" name="stock" id="stock" class="layui-input"
						placeholder="请输入商品库存量" style="width: 150px;">
				</div>
			</div>
			<div style="float: left;">
				<label class="layui-form-label">商品价格</label>
				<div class="layui-input-block">
					<input type="text" name="price" id="price" class="layui-input"
						placeholder="请输入商品价格" style="width: 150px;">
				</div>
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">商品简介</label>
			<div class="layui-input-block">
				<textarea name="introduction" placeholder="请输入商品描述"
					id="introduction" class="layui-textarea linksDesc"></textarea>
			</div>
		</div>

		<div class="layui-upload">
			<button type="button" class="layui-btn" id="test2">图片上传</button>
			<blockquote class="layui-elem-quote layui-quote-nm"
				style="margin-top: 10px;">
				预览图：
				<div class="layui-upload-list" id="demo2"></div>
			</blockquote>
		</div> 


		<div class="layui-form-item">
			<div class="layui-input-block">
				<input type="button" class="layui-btn" id="saveBtn"
					style="margin-left: 30%;" value="提交">
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>
	</form>
	<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/admin/layui/layui.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/layer.js"></script>
	<script>

	$(function(){
		$("#saveBtn").click(function(){
			// 将表单复制到父画面，在父页面的回调函数里提交表单
			var goodform= $(parent.document.body).children("div[id='submitDiv']").append($("#goodform"));
			$("#goodform").submit();
			var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
	                parent.layer.close(index);
	        });
	});  
	
	
	
		$("#test2").click(function(){

		});
		layui.use('upload', function(){
			  var $ = layui.jquery
			  ,upload = layui.upload;

				//多图片上传
				  upload.render({
				    elem: '#test2'
				    ,url: 'addProduct'
				    ,multiple: true
				    ,before: function(obj){
				      //预读本地文件示例，不支持ie8
				      obj.preview(function(index, file, result){
				        $('#demo2').append('<img src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img">')
				      });
				    }
				    ,done: function(res){
				      //上传完毕
				    }
				  });
		});

	</script>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/admin/js/layer.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/admin/js/addProduct.js"></script>

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
		layui
				.use(
						'upload',
						function() {
							var $ = layui.jquery, upload = layui.upload;

							//多图片上传
							upload
									.render({
										elem : '#test2',
										url : 'admin/addProduct',
										multiple : true,
										bindAction : '#test2',
										before : function(obj) {
											//预读本地文件示例，不支持ie8
											obj
													.preview(function(index,
															file, result) {
														$('#demo2')
																.append(
																		'<img src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img">')
													});
										},
										done : function(res) {
											//上传完毕
										}
									});
						});
	</script>
</body>
</html>