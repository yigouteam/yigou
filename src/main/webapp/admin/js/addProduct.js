$(function(){
		$("#goodsid").blur(function(){
			var id = $(this).val();
			if(id.length == 0){
				layer.msg("请输入商品编号");
				return false;
			}
			var id2 = parseInt($(this).val());
			if(id2 < 1000 || id2 >= 10000){
				layer.msg("请输入正确的商品编号");
				return false;
			}
		});
		
		$("#name").blur(function(){
			var name = $(this).val();
			if(name.length == 0){
				layer.msg("请输入商品名称");
				return false;
			}		
		});
		
		$("#format").blur(function(){
			var format = $(this).val();
			if(format.length == 0){
				layer.msg("请输入商品规格");
				return false;
			}		
		});
		
		$("#stock").blur(function(){
			var stock = parseInt($(this).val());
			if(stock.length == 0){
				layer.msg("请输入商品库存量");
				return false;
			}
			if(stock <= 0){
				layer.msg("请输入正确的库存量");
				return false;
			}		
		});
		
		$("#price").blur(function(){
			var price = parseFloat($(this).val());
			if(price.length == 0){
				layer.msg("请输入商品价格");
				return false;
			}
			if(price <= 0){
				layer.msg("请输入正确的商品价格");
				return false;
			}
		});
})