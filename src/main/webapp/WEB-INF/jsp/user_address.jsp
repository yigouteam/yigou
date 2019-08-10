<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>会员中心</title>


<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/bootstrapValidator.css">
<script src="js/jquery-1.8.3.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrapValidator.js"></script>
<link rel="stylesheet" type="text/css" href="css/center.css">
<!--城市联动-->
<link rel="stylesheet" type="text/css" href="city/city.css">
<script src="city/Popt.js"></script>
<script src="city/cityJson.js"></script>
<script src="city/citySet.js"></script>
</head>
<body style="margin: 0px auto; width: 1170px;">
<%@include file="top.jsp" %>
<!--search.jsp-->
 <%@include file="search.jsp" %>   
    
<!--导航 menu.jsp-->



<!--当前位置-->
<div class="now_positionm">
<span>当前位置：</span><a href="#">首页></a><a href="#">个人中心</a>
</div>
<!--centers-->
<div class="centers_m">
	<!--清除浮动-->
    <div class="clear_sm"></div>
	<!--left-->
    <div class="centers_ml">
    	<!--头像-->
        <div class="center_header">
        	<a href="#"><img src="images/touxiang.jpg"/></a>
            <em>您好，<font>${user.username}</font></em>
        </div>
        <!--列表go-->
        <div class="centers_listm">
        	<div class="centers_listm_one">
            	<img src="images/zshy.png"/>
                <em>会员中心</em>
            </div>
            <!--一条开始-->
            <div class="centers_listm_one_in">
                <img src="images/shezhi.png"/>
                <em>资料管理</em>
                <b></b>
            </div>
            <span class="gjszmdm">
                <a href="user_center" class="center_in_self"><font>信息资料</font></a>
                <a href="user_address" class="center_in_self"><font>收货地址</font></a>
            </span>
            <!--一条开始-->
            <div class="centers_listm_one_in">
                <img src="images/ddgl.png"/>
                <em>订单管理</em>
                <b></b>
            </div>
            <span class="gjszmdm">
                <a href="myOrder" class="center_in_self"><font>我的订单</font></a>
                <a href="#" class="center_in_self"><font>评价订单</font></a>
               
            </span>
            <!--一条开始-->
            <div class="centers_listm_one_in">
                <img src="images/suo.png"/>
                <em>账户安全</em>
                <b></b>
            </div>
            <span class="gjszmdm">
                <a href="password" class="center_in_self"><font>账户安全</font></a>
                <a href="password" class="center_in_self"><font>邮箱管理</font></a>
                <a href="password" class="center_in_self"><font>手机管理</font></a>
                <a href="password" class="center_in_self"><font>支付管理</font></a>
               
            </span>    
            <!--一条开始-->
            <div class="centers_listm_one_in">
                <img src="images/wdssc.png"/>
                <em>收藏管理</em>
                <b></b>
            </div>
            <span class="gjszmdm">
            	<a href="cart" class="center_in_self"><font>我的购物车</font></a>
            
            </span>    
            
          
        </div>
        <script type="text/javascript">
		$(function(){//第一步都得写这个
			$(".centers_listm_one_in").click(function(){
			$(this).next(".gjszmdm").slideToggle().siblings("gjszmdm").slideUp()
			});
		})
		</script>
    </div>
    <!--right-->
    <div class="centers_mr">
  
    <!--一条开始-->
    	<div class="public_m1">
        	<div class="public_m2">地址管理</div>
             <!--提示信息-->	
            <div class="tip_notem">
            	<ul>
                	<li>1.请仔细核对地址信息哦</li>
                    <li>2.为了您能收到快递，请尽量填写您的详细地址哦</li>
                </ul>
            </div>
            <div class="public_m4">
            	<p>
            	<button class="open_btn" data-toggle="modal"
							data-target="#addModal">使用新地址</button>
                <i>您已创建的收货地址如下，最多可创建20个</i> 	
               </p>
               
               <c:forEach items="${address}" var="add">
               <div class="AddressFrame" add_id="${add.id }">
                 <p><em style="font-weight: bolder">${add.receiver}</em></p>
			     <div class="addressForm">
					<table width="800" border="0">
						<tbody>
							<tr>
								<td width="63" class="leftTd" align="right">
									收货人：
								</td>
								<td class="rightTd" width="321">
									${add.receiver}
								</td>
							</tr>
							<tr>
								<td class="leftTd" align="right">
									所在地区：
								</td>
								<td class="rightTd">
									${add.province}${add.city}${add.area}
								</td>
							</tr>
							<tr>
								<td class="leftTd" align="right">
									详细地址：
								</td>
								<td class="rightTd">
									${add.detailaddress}
								</td>
							</tr>
							<tr>
								<td class="leftTd" align="right">
									手机：
								</td>
								<td class="rightTd">
									${add.mobile}
								</td>
							</tr>
												
						
						</tbody>
					</table>
				</div>
				<div class="addressOption">
					<a class="addressOption1" add_id="${add.id}" href="#">
						删除
					</a>
					<a class="addressOption2" add_id="${add.id}" add_rec="${add.receiver}"
					 add_mob="${add.mobile}" add_det="${add.detailaddress}" add_pro="${add.province}" add_city="${add.city}" add_area="${add.area}" href="#">
						编辑
					</a>
				</div>
			</div>
           </c:forEach>
           <span>
            	<button class="open_btn" data-toggle="modal"
							data-target="#addModal">使用新地址</button>
                <i>您已创建的收货地址如下，最多可创建20个</i> 	
           </span>
         
        </div>
           
     </div>
	
    	
                                                   
    </div>
</div>
<!--modal delete-->
<div class="modal" id="deleteConfirmModal" tabindex="-1" role="dialog" >
	<div class="modal-dialog deleteConfirmModalDiv">
		<div class="modal-content">
			<div class="modal-header">
				<button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
				<h4 class="modal-title">确认删除？</h4>
			</div>
			<div class="modal-footer">
				<button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
				<button class="btn btn-primary deleteConfirmButton" id="submit" type="button">确认</button>
			</div>
		</div>
	</div>
</div>

<!--modal edit-->
<div class="modal" id="editModal" tabindex="-1" role="dialog" >
	<div class="modal-dialog editModalDiv">
		<div class="modal-content">
			<div class="modal-header">
				<button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
				<h4 class="modal-title">编辑地址</h4>
			</div>
			<div class="modal-body">
			 <form class="form-horizontal" role="form" id="editAddressForm">
	            <div class="form-group">
		           <label for="area" class="col-sm-4 control-label">地区选择</label>
		           <div class="col-sm-6">
			          <input type="text" class="form-control" id="city" name="city"
				           placeholder="请输入地址范围...">
		           </div>
	             </div>
	              <script type="text/javascript">
			          $("#city").click(function (e) {
				          SelCity(this,e);
			           });
		          </script>
		          
				  <div class="form-group">
						<label for="detailaddress" class="col-sm-4 control-label">详细地址</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="detailaddress" name="detailaddress"  placeholder="请输入详细地址">
						</div>
					</div>
                  <div class="form-group">
						<label for="mobile" class="col-sm-4 control-label">手机</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="mobile" name="mobile"
								   placeholder="请输入手机号码">
						</div>
					</div>
				   <div class="form-group">
						<label for="receiver" class="col-sm-4 control-label">姓名</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="receiver" name="receiver" 
								   placeholder="请输入您的姓名">
						</div>
					</div>	
				</form>	
			</div>
			
			<div class="modal-footer">
				<button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
				<button class="btn btn-primary editButton" id="confirm" type="button">确认</button>
			</div>
		</div>
	</div>
</div>

<!--modal add-->
<div class="modal" id="addModal" tabindex="-1" role="dialog" >
	<div class="modal-dialog addModalDiv">
		<div class="modal-content">
			<div class="modal-header">
				<button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
				<h4 class="modal-title">新增地址</h4>
			</div>
			<div class="modal-body">
			 <form class="form-horizontal" role="form" id="addAddressForm">
	            <div class="form-group">
		           <label for="area" class="col-sm-4 control-label">地区选择</label>
		           <div class="col-sm-6">
			          <input type="text" class="form-control" id="_city" name="city"
				           placeholder="请输入地址范围...">
		           </div>
	             </div>
	              <script type="text/javascript">
			          $("#_city").click(function (e) {
				          SelCity(this,e);
			           });
		          </script>
		          
				  <div class="form-group">
						<label for="detailaddress" class="col-sm-4 control-label">详细地址</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="_detailaddress" 
							  name="detailaddress"	 placeholder="请输入详细地址">
						</div>
					</div>
                  <div class="form-group">
						<label for="mobile" class="col-sm-4 control-label">手机</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="_mobile" name="mobile"
								   placeholder="请输入手机号码">
						</div>
					</div>
				   <div class="form-group">
						<label for="receiver" class="col-sm-4 control-label">姓名</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="_receiver" name="receiver"
								   placeholder="请输入您的姓名">
						</div>
					</div>	
				</form>	
			</div>
			
			<div class="modal-footer">
				<button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
				<button class="btn btn-primary addButton" id="confirm" type="button">确认</button>
			</div>
		</div>
	</div>
</div>
<!--页脚-->
<%@include file="footer.jsp" %>

     <script>
			    var flag=false;
			    var address_id=0;
			    var address_province=0;
			    var address_city=0;
			    var address_area=0;
			    var address_detailaddress=0;
			    var address_mobile=0;
			    var address_receiver=0;
				$(function(){
					$("a.addressOption1").click(function(){
						flag=false;
						address_id=$(this).attr("add_id");
						$("#deleteConfirmModal").modal('show');
					});
					$("button.deleteConfirmButton").click(function(){
		                flag = true;
		              $("#deleteConfirmModal").modal('hide');
	                });
	
	               $('#deleteConfirmModal').on('hidden.bs.modal', function (e) {
		            if(flag){			
						$.post(
							"deleteAddress",
							{"address_id":address_id},
							function(result){
								if("success"==result){
									$(".AddressFrame[add_id="+address_id+"]").hide();
										window.location.reload();
									}
									else{
										location.href="login";
									}
								});
					}
				});
	               
	           $("#addAddressForm").bootstrapValidator({
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
	           
	           $("#editAddressForm").bootstrapValidator({
					live:'disabled',	
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
	           
				   
			     $("a.addressOption2").click(function(){
						 flag=false;
						 address_id=$(this).attr("add_id"); 
					     address_receiver=$(this).attr("add_rec");
					     address_province=$(this).attr("add_pro");
			             address_city=$(this).attr("add_city");
			             address_area=$(this).attr("add_area");
			             address_detailaddress=$(this).attr("add_det");
			             address_mobile=$(this).attr("add_mob");
						$("#editModal").modal('show');
					});	 
				$('#editModal').on('shown.bs.modal',function(e){
						$("#receiver").val(address_receiver);
					    $("#mobile").val(address_mobile);
					    $("#detailaddress").val(address_detailaddress);
					    $("#city").val(address_province+"-"+address_city+"-"+address_area);
					});	
				$("button.editButton").click(function(){
					 $("#editAddressForm").bootstrapValidator('validate');//提交验证
		                if ($("#editAddressForm").data('bootstrapValidator').isValid()) {//获取验证结果 
		                flag = true;
					    address_province=$("#hcity").val();
					    address_city=$("#hproper").val();
					    address_area=$("#harea").val();
					    address_detailaddress=$("#detailaddress").val();
					    address_mobile=$("#mobile").val();
					    address_receiver=$("#receiver").val();
		              $("#editModal").modal('hide');
		               }
	               });	
				$('#editModal').on('hidden.bs.modal',function(e){
					if(flag){
						$.post(
						"editAddress",
						{"id":address_id,"province":address_province,"city":address_city,
						 "area":address_area,"detailaddress":address_detailaddress,
						  "receiver":address_receiver,"mobile":address_mobile},
						function(result){
							if("success"==result){
								alert("修改地址成功~");
								window.location.reload();
							}
						});
					}
				});
					
			   $('#addModal').on('shown.bs.modal',function(e){
						flag=false;
					});	
			   $("button.addButton").click(function(){
				   $("#addAddressForm").bootstrapValidator('validate');//提交验证
	                if ($("#addAddressForm").data('bootstrapValidator').isValid()) {//获取验证结果 
		                flag = true;
					    address_province=$("#hcity").val();
					    address_city=$("#hproper").val();
					    address_area=$("#harea").val();
					    address_detailaddress=$("#_detailaddress").val();
					    address_mobile=$("#_mobile").val();
					    address_receiver=$("#_receiver").val();
		              $("#addModal").modal('hide');
	                }
	              });
			   
			  $('#addModal').on('hidden.bs.modal',function(e){
					if(flag){
						$.post(
						"addAddress",
						{"province":address_province,"city":address_city,
						 "area":address_area,"detailaddress":address_detailaddress,
						  "receiver":address_receiver,"mobile":address_mobile},
						function(result){
							if("success"==result){
								alert("添加地址成功~");
								window.location.reload();
							}
						});
					}
				});		
				
				
	   		
				});
		
	 </script>   
</body>
</html>    
            
                    
          
	   	
                
            
            
            			  
    
           
       	
				     
             		
            
           
        
    			 
        	
       
            
            
            
            
    	
                         
       
                                                     
                            
					      
                
        
       	
					     
           
            
             
        	
					
            
            
                
                           
                

        
                
                        
                
                
                    	
               
             
                 
                
                
                
                
                
            
                  
        
    	
    
			

                
    
