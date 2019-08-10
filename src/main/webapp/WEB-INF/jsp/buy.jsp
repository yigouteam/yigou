<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>购买</title>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/order.css" />
<link
	href="${pageContext.request.contextPath}/css/bootstrap/3.3.6/bootstrap.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/bootstrapValidator.css">	
<script
	src="${pageContext.request.contextPath}/js/jquery/2.0.0/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/bootstrap/3.3.6/bootstrap.min.js"></script>
<script src="js/bootstrapValidator.js"></script>


<style>
div.buyPageDiv {
	margin: 20px auto;
}

div.buyPageDiv button {
	display: inline-block;
	margin: 0px 10px;
	width: 180px;
	height: 40px;
}

div.buyDiv button {
	display: inline-block;
	margin: 0px 10px;
	width: 180px;
	height: 40px;
}

div.address {
	margin: 20px 5px;
	text-align: left;
}
div.productList{
  float:left;
  width:100%;
  margin-top:20px;
}
div.addressTip, div.productListTip {
	float:left;
	color: #333333;
	font-size: 16px;
	font-weight: bold;
	text-align: left;
	margin-bottom: 30px;
}

table.addressTable {
	margin: 20px 20px;
	width: 600px;
}

table.addressTable td.firstColumn {
	width: 100px;
}

table.addressTable td {
	color: #333333;
	text-align: right;
	vertical-align: top;
	padding-right: 5px;
	text-align: left;
	height: 30px;
	font-size: 12px;
}

span.redStar {
	color: red;
	font-size: 8px;
}

table.addressTable td input {
	border: 1px solid #AFAFAF;
	width: 200px;
}

table.addressTable td textarea {
	border: 1px solid #AFAFAF;
	margin-bottom: 10px;
	width: 400px;
}

img.tmallbuy {
	width: 15px;
}

a.marketLink {
	color: black;
	font-size: 12px;
	font-weight: normal;
}

a.marketLink:hover {
	color: black;
	font-size: 12px;
	text-decoration: underline;
	font-weight: normal;
}

table.productListTable {
	width: 100%;
	border-collapse: separate;
}

table.productListTable th {
	color: #999999;
	font-weight: normal;
	font-size: 12px;
	text-align: center;
	padding-bottom: 5px;
}

th.productListTableFirstColumn {
	text-align: left !important;
}

table.productListTable tr.rowborder td {
	background-color: #b2d1ff;
	border-right: 2px solid #fff;
	height: 3px;
}

img.orderItemImg {
	width: 50px;
	height: 50px;
	border: 1px solid #E9E9E9;
}

tr.orderItemTR td {
	padding: 10px 0px;
}

a.orderItemProductLink {
	color: #666666;
	display: block;
}

a.orderItemProductLink:hover {
	color: #666666;
	text-decoration: underline;
}

td.orderItemProductInfo {
	text-align: left;
}

td.orderItemProductInfo img {
	height: 16px;
}

span.orderItemProductNumber {
	color: #000000;
}

tr.orderItemTR td {
	border-bottom: 1px solid #E5E5E5;
}

tbody.productListTableTbody td {
	text-align: center;
	font-size: 12px;
}

tbody.productListTableTbody td.orderItemFirstTD {
	text-align: left;
}

tbody.productListTableTbody td.orderItemProductInfo {
	text-align: left;
}

td.orderItemFirstTD, td.orderItemLastTD {
	border-bottom: 0px solid black !important;
}

label.orderItemDeliveryLabel {
	color: #666666;
	font-size: 12px;
	font-weight: normal;
}

div.orderItemSumDiv span {
	color: #999999;
}

div.orderItemSumDiv {
	padding: 20px;
	border-top: 2px solid #B4D0FF;
	background-color: #F2F6FF;
	height: 50px;
}

textarea.leaveMessageTextarea {
	border: 1px solid #FFAD35;
	width: 250px;
	height: 60px;
	resize: none;
}

span.leaveMessageText {
	display: inilne-block;
	margin-right: 10px;
	float: left;
}

span.leaveMessageTextareaSpan {
	display: inilne-block;
}

div.orderItemTotalSumDiv {
	float:left;
	width:100%;
	margin: 20px  0 ;
	padding-right:20px;
	height: 40px;
}

div.orderItemTotalSumDiv span {
	color: #999999;
}

span.orderItemTotalSumSpan {
	color: #C40000 !important;
	font-size: 22px;
	font-weight: bold;
	border-bottom: 1px dotted #F2F6FF;
}

div.submitOrderDiv {
	height: 40px;
	margin: 20px 0px;
}

button.submitOrderButton {
	border: 1px solid #C40000;
	background-color: #C40000;
	text-align: center;
	line-height: 40px;
	font-size: 14px;
	font-weight: 700;
	color: white;
	float: right;
}

.col-xs-12 {
	margin-bottom: 20px;
	padding: 0 75px;
}

.input_style {
	height: 35px;
	border-radius: 5px;
	width: 340px;
	outline: 0px;
	border: 1px solid #CCCCCC;
}
</style>



</head>
<body style="margin: 0px auto; width: 1170px;">

	<%@include file="top.jsp"%>
	<div class="buyPageDiv">

		<div class="buyFlow">
			<img class="pull-left" src=""> 
			<img class="pull-right" src="">
			<div style="clear: both"></div>
		</div>
		<div class="address">


			<div class="Caddress">
				<div class="open_new">
					<div class="pull-left">
						<span
							style="color: #333333; font-size: 16px; font-weight: bold; text-align: left; line-height: 40px;">选择收货地址</span>
					</div>
					<div class="pull-right">
						<button class="open_btn" data-toggle="modal"
							data-target="#myModal">使用新地址</button>
					</div>
				</div>
				<c:if test="${empty requestScope.address }">
				       <span>你还没有收货地址哦~</span>
				</c:if>
				<div class="add_all" style="width:100%;">
				<c:forEach items="${address}" var="add" varStatus="st">
					<div class="add_mi">
						<input type="hidden" name="add_id"  data-id="${add.id }"
							value="<c:out value="${add.id}"/> " />
						<p style="border-bottom: 1px dashed #ccc; line-height: 28px;">${add.receiver}(收)</p>
						<p>${add.province}${add.city}${add.area}${add.detailaddress}</p>
						<p>${add.mobile}</p>
					</div>
				</c:forEach>
				<br style='clear:both'/>
			</div>
			
			</div>
		</div>

		<form action="createOrder" method="post">
			<div class="productList">
				<div class="productListTip">确认订单信息</div>

				<table class="productListTable">
					<thead>
						<tr>
							<th colspan="2" class="productListTableFirstColumn"><a
								class="marketLink" href="#nowhere">易购商城</a></th>
							<th>单价</th>
							<th>数量</th>
							<th>小计</th>
							<th>配送方式</th>
						</tr>
						<tr class="rowborder">
							<td colspan="2"></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</thead>
					<tbody class="productListTableTbody">
						<c:forEach items="${carts}" var="oi" varStatus="st">
							<tr class="orderItemTR">
								<td class="orderItemFirstTD"><img class="orderItemImg"
									src="${pageContext.request.contextPath}/images/products/${oi.product.id}/1.jpg">
								</td>
								<td class="orderItemProductInfo"><a
									href="showProduct?good_id=${oi.product.id}"
									class="orderItemProductLink"> ${oi.product.goodsname} </a></td>
								<td><span>${oi.product.price}</span></td>
								<td><span class="orderItemProductNumber">${oi.number}</span>
								</td>
								<td><span>${oi.product.price*oi.number}</span></td>
								<c:if test="${st.count==1}">
									<td rowspan="5" class="orderItemLastTD"><select
										class="orderItemDeliverySelect" class="form-control">
											<option>顺丰包邮</option>
											<option>货到付款</option>
									</select></td>
								</c:if>

							</tr>
						</c:forEach>

					</tbody>

				</table>
				<div class="orderItemSumDiv">
					<div class="pull-left">
						<span class="leaveMessageText">给我们留言:</span> <span> <img
							class="leaveMessageImg" src="${pageContext.request.contextPath}/images/leaveMessage.png">
						</span> <span class="leaveMessageTextareaSpan"> <textarea
								name="user_message" class="leaveMessageTextarea"></textarea> <span>还可以输入200个字符</span>
						</span>
					</div>

					<span class="pull-right">商品合计(含运费): ￥${total}</span>
				</div>


			</div>

			<div class="orderItemTotalSumDiv">
				<div class="pull-right">
					<span>实付款：</span> <span class="orderItemTotalSumSpan">￥${total}</span>
				</div>
			</div>

			<div class="submitOrderDiv">
				<input type="hidden" id="add_" name="address_id" />	 				
				<button type="submit" class="submitOrderButton">提交订单</button>
			</div>
          
		</form>
	</div>
	<div class="modal" id="myModal" tabindex="-1" role="dialog">
		<div class="modal-dialog ">
			<div class="modal-content">
				
					<div class="modal-header">
						<button data-dismiss="modal" class="close" type="button">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title">新增收货地址</h4>
					</div>
					<div class="modal-body">
 
						<form class="form-horizontal" role="form" id="addAddress">
							<div id="distpicker4">
								<div class="form-group">
									<label class="col-xs-4 control-label" for="province9">Province</label> 
								  <div class="col-xs-6">
									<select	name="province" class="form-control" id="province9">
									    <option	value="北京市" data-code="110000" selected="">北京市</option>
										<option value="天津市" data-code="120000">天津市</option>
										<option value="河北省" data-code="130000">河北省</option>
										<option value="山西省" data-code="140000">山西省</option>
										<option value="内蒙古自治区" data-code="150000">内蒙古自治区</option>
										<option value="辽宁省" data-code="210000">辽宁省</option>
										<option value="吉林省" data-code="220000">吉林省</option>
										<option value="黑龙江省" data-code="230000">黑龙江省</option>
										<option value="上海市" data-code="310000">上海市</option>
										<option value="江苏省" data-code="320000">江苏省</option>
										<option value="浙江省" data-code="330000">浙江省</option>
										<option value="安徽省" data-code="340000">安徽省</option>
										<option value="福建省" data-code="350000">福建省</option>
										<option value="江西省" data-code="360000">江西省</option>
										<option value="山东省" data-code="370000">山东省</option>
										<option value="河南省" data-code="410000">河南省</option>
										<option value="湖北省" data-code="420000">湖北省</option>
										<option value="湖南省" data-code="430000">湖南省</option>
										<option value="广东省" data-code="440000">广东省</option>
										<option value="广西壮族自治区" data-code="450000">广西壮族自治区</option>
										<option value="海南省" data-code="460000">海南省</option>
										<option value="重庆市" data-code="500000">重庆市</option>
										<option value="四川省" data-code="510000">四川省</option>
										<option value="贵州省" data-code="520000">贵州省</option>
										<option value="云南省" data-code="530000">云南省</option>
										<option value="西藏自治区" data-code="540000">西藏自治区</option>
										<option value="陕西省" data-code="610000">陕西省</option>
										<option value="甘肃省" data-code="620000">甘肃省</option>
										<option value="青海省" data-code="630000">青海省</option>
										<option value="宁夏回族自治区" data-code="640000">宁夏回族自治区</option>
										<option value="新疆维吾尔自治区" data-code="650000">新疆维吾尔自治区</option>
										<option value="台湾省" data-code="710000">台湾省</option>
										<option value="香港特别行政区" data-code="810000">香港特别行政区</option>
										<option value="澳门特别行政区" data-code="820000">澳门特别行政区</option></select>
									</div>	
								</div>
								<div class="form-group">
									<label class="col-xs-4 control-label" for="city9">City</label> 
									<div class="col-xs-6">
									<select	name="city" class="form-control" id="city9">
									<option	value="北京市市辖区" data-code="110100" selected="">北京市市辖区</option></select>
								    </div>
								</div>
								
								<div class="form-group">
									<label class="col-xs-4 control-label" for="district9">District</label> 
								    <div class="col-xs-6">
									<select	name="area" class="form-control" id="area9">
									<option	value="东城区" data-code="110101" selected="">东城区</option>
										<option value="西城区" data-code="110102">西城区</option>
										<option value="朝阳区" data-code="110105">朝阳区</option>
										<option value="丰台区" data-code="110106">丰台区</option>
										<option value="石景山区" data-code="110107">石景山区</option>
										<option value="海淀区" data-code="110108">海淀区</option>
										<option value="门头沟区" data-code="110109">门头沟区</option>
										<option value="房山区" data-code="110111">房山区</option>
										<option value="通州区" data-code="110112">通州区</option>
										<option value="顺义区" data-code="110113">顺义区</option>
										<option value="昌平区" data-code="110114">昌平区</option>
										<option value="大兴区" data-code="110115">大兴区</option>
										<option value="怀柔区" data-code="110116">怀柔区</option>
										<option value="平谷区" data-code="110117">平谷区</option>
										<option value="密云区" data-code="110118">密云区</option>
										<option value="延庆区" data-code="110119">延庆区</option></select>
								</div>
								</div>
						</div>



				     <div class="form-group">
						<label for="detailaddress" class="col-xs-4 control-label">详细地址</label>
						<div class="col-xs-6">
							<input type="text" class="form-control" id="detailaddress" 
							  name="detailaddress"	 placeholder="请输入详细地址">
						</div>
					</div>
                    <div class="form-group">
						<label for="mobile" class="col-xs-4 control-label">手机</label>
						<div class="col-xs-6">
							<input type="text" class="form-control" id="mobile" name="mobile"
								   placeholder="请输入手机号码">
						</div>
					</div>
				   <div class="form-group">
						<label for="receiver" class="col-xs-4 control-label">姓名</label>
						<div class="col-xs-6">
							<input type="text" class="form-control" id="receiver" name="receiver"
								   placeholder="请输入您的姓名">
						</div>
					</div>	
                        </form>
					</div>
                    
					<div class="modal-footer">
						<button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
						<button class="btn btn-primary add_addressButton" id="sub_setID"
							type="button">确认</button>
					</div>
				
			</div>
		</div>
	</div>
    
	<%@include file="footer.jsp"%>
	<script src="${pageContext.request.contextPath}/js/distpicker.data.js"></script>
	<script src="${pageContext.request.contextPath}/js/distpicker.js"></script>
	<script src="${pageContext.request.contextPath}/js/main.js"></script>
	<script>
    $(function () {
         
        $("span.leaveMessageTextareaSpan").hide();
        $("img.leaveMessageImg").click(function () {

            $(this).hide();
            $("span.leaveMessageTextareaSpan").show();
            $("div.orderItemSumDiv").css("height", "100px");
        });
        
    	
		var flag=false;
		var address =0;
        var name = 0;
        var phone = 0;
        var province=0;
        var city=0;
        var area=0;
        
        $("#addAddress").bootstrapValidator({
				live:'enabled',	
		         excluded: [':disabled', ':hidden', ':not(:visible)'],//排除无需验证的控件
                 submitButtons: '#confirm',//指定提交按钮，如果验证失败则变成disabled
                 message: 'This value is not valid',
		         feedbackIcons: {//根据验证结果显示的各种图标
                 valid: 'glyphicon glyphicon-ok',
                 invalid: 'glyphicon glyphicon-remove',
                 validating: 'glyphicon glyphicon-refresh'
                 },	
				  fields: {		 
					  detailaddress:{
						  validators: {
			                     notEmpty: {//非空验证：提示消息
			                         message: '详细地址不能为空'
			                     },
			                     stringLength: {
			                         min: 5,
			                         max: 50,
			                         message: '请输入详细地址~'
			                     },
			                     regexp: {
			                         regexp:  /^[\u4E00-\u9FA5A-Za-z0-9]+$/,
			                         message: '请输入详细地址~'
			                     }
			                 }
					  },
					  mobile:{
						  message: '手机号输入有误哦~',
			                 validators: {
			                     notEmpty: {
			                         message: '手机号码不能为空'
			                     },
			                     stringLength: {
			                         min: 11,
			                         max: 11,
			                         message: '请输入11位手机号码'
			                     },
			                     regexp: {
			                         regexp: /^(13[0-9]|14[0-9]|15[0-9]|166|17[0-9]|18[0-9]|19[8|9])\d{8}$/,
			                         message: '请输入正确的手机号码'
			                     }
			                 }
					  },
					  receiver:{
						  message: '用户名不正确哦~',	                
			                 validators: {
			                     notEmpty: {//非空验证：提示消息
			                         message: '用户名不能为空'
			                     },
			                    
			                     regexp: {
			                         regexp:  /^[\u4E00-\u9FA5]{1,5}$/,
			                         message: '只能填写长度1-5中文字符哦~'
			                     }
			                 }
					  }
				  }
					
				});   
        
        
		$("#sub_setID").click(function(){  	
			$("#addAddress").bootstrapValidator('validate');//提交验证
            if ($("#addAddress").data('bootstrapValidator').isValid()) {//获取验证结果
			       flag = true;	
			       address = $("#detailaddress").val();
			       name = $("#receiver").val();  
			       phone = $("#mobile").val();
			       province=$("#province9").find("option:selected").text();
			       city=$("#city9").find("option:selected").text(); 
			       area=$("#area9").find("option:selected").text();
			       $("#myModal").modal('hide');	  
            }    
	    });
			
		$('#myModal').on('hidden.bs.modal', function () {
			if(flag){					
		        $.post(
						"addAddress",
						{"province":province,"city":city,"area":area,"detailaddress":address,"receiver":name,"mobile":phone},
						function(result){
							if(result!="success"){
								alert("添加地址失败~");
						   }
							else{
								alert("添加地址成功！");
								window.location.reload();
							}
								
						}
					);  
				  
		  }	
		});
		
		
	
		var n=0;
	    $('.Caddress .add_mi').on("click",function(){
			$(this).css('background', 'url("images/mail_1.jpg") no-repeat').siblings('.add_mi').css('background', 'url("images/mail.jpg") no-repeat');
			n++;
			var add_id =$(this).children().first().data("id");    
			var page="changeAddress";
			$.post(
				page,
				{"address_id":add_id},
				function(result){
					if(result!="success")
					  alert("选取地址失败！");
					else{
						document.getElementById("add_").value=add_id;
					}
				}
			);
	
		});
		
	   $(".submitOrderButton").click(function(){	
		if(n==0){
			alert("你还没有选择收货地址哦~");
			return false;
		}
	}); 
        
    });
  
   

</script>
</body>
</html>
