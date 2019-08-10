layui
.config({
	base : "js/"
}).use([ 'form', 'layer', 'jquery', 'laypage' ],function() {
		var form = layui.form, 
		layer = parent.layer === undefined ? layui.layer: parent.layer, 
		laypage = layui.laypage, 
		$ = layui.jquery;

		// 加载页面数据
		var linksData = '';

		// 添加商品界面
		$(".batchDel2").click(function() {
			layer.open({
				type : 2,
				title : '添加商品',
				content : 'addProduct',
				anim : 2,
				area : [ '800px', '600px' ],
			    end: function(){
				// 如果是通过单击关闭按钮关闭弹出层，父画面没有此表单
			   
				if($("#goodform").length === 1){
					$("#goodform").submit();
				}
			}

			});
		})

		// 编辑图片界面
		$(".editimg").click(function() {

			var good_id = $(this).attr("good_id");

			layer.open({
				type : 2,
				title : '图片管理',
				content : 'productImg?good_id=' + good_id,
				anim : 2,
				area : [ '1200px', '800px' ]
			});
		})

		// 编辑商品界面
		$(".edit").click(function() {

			var good_id = $(this).attr("good_id");

			layer.open({
				type : 2,
				title : '编辑商品',
				content : 'editProduct?good_id=' + good_id,
				anim : 2,
				area : [ '800px', '600px' ]
			});
		})

		// 批量删除
		$(".countdel").click(function() {
			var delarray = new Array();

			var allbox = $(
					'input :checkbox[name=checkdel]:checked')
					.each(
							function(k) {
								if (k == 0) {
									layer
											.msg("请选中商品");
								} else {
									delarray
											.push($(
													this)
													.val());
								}
							})
		})
		

		$(".orderbtn").click(function() {
			var order_id = $(this).attr("order_id");
			layer.open({
				type : 2,
				title : '订单详情',
				content : 'order_items?order_id=' + order_id,
				anim : 2,
				area : [ '1200px', '600px' ]
			});
		});
		

	});

/*
 * //批量删除 $(".batchDel").click(function(){ var $checkbox = $('.links_list tbody
 * input[type="checkbox"][name="checked"]'); var $checked = $('.links_list tbody
 * input[type="checkbox"][name="checked"]:checked');
 * if($checkbox.is(":checked")){ layer.confirm('确定删除选中的信息？',{icon:3,
 * title:'提示信息'},function(index){ var index = layer.msg('删除中，请稍候',{icon:
 * 16,time:false,shade:0.8}); setTimeout(function(){ //删除数据 for(var j=0;j<$checked.length;j++){
 * for(var i=0;i<linksData.length;i++){ if(linksData[i].linksId ==
 * $checked.eq(j).parents("tr").find(".links_del").attr("data-id")){
 * linksData.splice(i,1); linksList(linksData); } } } $('.links_list thead
 * input[type="checkbox"]').prop("checked",false); form.render();
 * layer.close(index); layer.msg("删除成功"); },2000); }) }else{
 * layer.msg("请选择需要删除的商品"); } })
 */

/*
 * // 全选 form.on( 'checkbox(allChoose)', function(data) { var child =
 * $(data.elem).parents('table').find( 'tbody
 * input[type="checkbox"]:not([name="show"])'); child.each(function(index, item) {
 * item.checked = data.elem.checked; }); form.render('checkbox'); });
 */
