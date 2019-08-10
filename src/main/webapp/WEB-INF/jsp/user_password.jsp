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

</head>
<body style="margin: 0px auto; width: 1170px;">
<!--top.jsp-->
<%@include file="top.jsp" %>
<!--search.jsp-->
 <%@include file="search.jsp" %>   
<!--导航 menu.jsp-->





<!--当前位置-->
<div class="now_positionm">
<span>当前位置：</span><a href="index">首页></a><a href="#">个人中心</a>
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
        	<div class="public_m2">账户安全</div>
            <div class="public_m4">
            	<p><em>您当前的安全等级：</em><i style="color:#fa3b4a">高</i></p>
            </div>
            <!--各种设置-->    
            <div class="gezhong_szm">
            	<!--一条开始a-->
                <div class="gezhong_szm_in">
                	<b style=" background:url(images/fourm.png) no-repeat 0 0"></b>
                    <span>登录密码<br><em>已设置</em></span>
                    <p>安全性高的密码，可以使账户更安全。建议您定期更换密码。</p>
                    <button type="button" class="btn btn-default" data-toggle="modal" 
                    data-target="#modify_pwModal">修改密码</button>
                </div>
                <!--一条开始a-->
                <div class="gezhong_szm_in">
                	<b style=" background:url(images/fourm.png) no-repeat 0 -50px"></b>
                    <span>邮箱绑定<br><em>已设置</em></span>
                    <p>进行邮箱验证后，可用于接收敏感操作的身份验证信息，以及订阅更优惠商品的促销邮件。</p>
                   <button type="button" class="btn btn-default" disabled="disabled">绑定邮箱</button>
                </div>
                <!--一条开始a-->
                <div class="gezhong_szm_in">
                	<b style=" background:url(images/fourm.png) no-repeat 0 -100px"></b>
                    <span>手机绑定<br><em>已设置</em></span>
                    <p>进行手机验证后，可用于接收敏感操作的身份验证信息，以及进行积分消费的验证确认，非常有助于保护您的账号和账户财产安全。</p>
                   <button type="button" class="btn btn-default" disabled="disabled">修改手机</button>
             
                </div>
                <!--一条开始a-->
                <div class="gezhong_szm_in">
                	<b style=" background:url(images/fourm.png) no-repeat 0 -150px"></b>
                    <span>支付密码<br><em>已设置</em></span>
                    <p>设置支付密码后，在使用账户中余额时，需输入支付密码。</p>
                    <button type="button" class="btn btn-default" disabled="disabled">修改密码</button>           
                </div>
            </div> 
        </div>
   
   
   
    <!--一条开始-->
    	<div class="public_m1">
        	<div class="public_m2">登录密码修改</div>
            提示信息	
            <div class="tip_notem">
            	<ul>
                	<li>1.请牢记登录密码</li>
                    <li>2.如果丢失密码，可以通过绑定的手机或邮箱找到</li>
                </ul>
            </div>
        </div>  
  
    
                                                   
    </div>
</div>

  <!--modal add-->
<div class="modal" id="modify_pwModal" tabindex="-1" role="dialog" >
	<div class="modal-dialog addModalDiv">
		<div class="modal-content">
			<div class="modal-header">
				<button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
				<h4 class="modal-title">登陆密码修改</h4>
			</div>
			<div class="modal-body">
			 <form class="form-horizontal" role="form" id="passwordForm">
	            <div class="form-group">
		           <label for="old" class="col-lg-4 control-label">原密码</label>
		           <div class="col-lg-6">
			          <input type="password" class="form-control" id="old_pw" name="old_pw"
				           placeholder="请输入原密码">
		           </div>
	             </div>
	            
		          
				  <div class="form-group">
						<label for="new" class="col-lg-4 control-label">新密码</label>
						<div class="col-lg-6">
							<input type="password" class="form-control" id="new_pw1" name="new_pw1"
								   placeholder="请输入新密码">
						</div>
					</div>
                  <div class="form-group">
						<label for="mobile" class="col-lg-4 control-label">确认密码</label>
						<div class="col-lg-6">
							<input type="password" class="form-control" id="new_pw2" name="new_pw2"
								   placeholder="请再次输入新密码">
						</div>
					</div>
				  
				</form>	
			</div>
			
			<div class="modal-footer">
				<button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
				<button class="btn btn-primary modifyButton" id="modify_pw" type="button">确认</button>
			</div>
		</div>
	</div>
</div>
<script>
	$(function(){
		$("#passwordForm").bootstrapValidator({
		live:'enabled',	
		excluded: [':disabled', ':hidden', ':not(:visible)'],//排除无需验证的控件，比如被禁用的或者被隐藏的
        submitButtons: '#modify_pw',//指定提交按钮，如果验证失败则变成disabled
        message: 'This value is not valid',
		feedbackIcons: {//根据验证结果显示的各种图标
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'

                },	
		fields: {
            old_pw: {
               validators: {
				    notEmpty: {//检测非空
                         message: '请输入原密码！'
                           },
				    remote: {//将内容发送至指定页面验证，返回验证结果
                       url: 'passwordCheck',
                       message: 'The password is not correct!',
                       delay:2000
                          }
				   
			   }
			},
			new_pw1:{
				message:'密码无效',
                 validators: {
                     notEmpty: {
                         message: '密码不能为空'
                     },
                     stringLength: {
                         min: 6,
                         max: 20,
                         message: '密码长度必须在6到20之间'
                     },
                     identical: {//相同
                         field: 'new_pw1', 
                         message: '两次密码不一致'
                     },
                     regexp: {
                         regexp: /^[a-zA-Z0-9_\.]+$/,
                         message: '密码由数字字母下划线和.组成'
                     }
				 }            
			},
			new_pw2:{
				 message: '密码无效',
                 validators: {
                     notEmpty: {
                         message: '密码不能为空'
                     },
                     stringLength: {
                         min: 6,
                         max: 20,
                         message: '密码长度必须在6到20之间'
                     },
                     identical: {//相同
                         field: 'new_pw1',
                         message: '两次密码不一致'
                     }
                           
                 }
			}
			
		}
		
		
	})
	$("#modify_pw").click(function(){
			$("#passwordForm").bootstrapValidator('validate');//提交验证
                if ($("#passwordForm").data('bootstrapValidator').isValid()) {//获取验证结果 
                	var pw=$("#new_pw1").val();
                	$("#modify_pwModal").modal('hide');	
						$.post(
			                	"update_pw",
			                	{"pw":pw},
			                	function(result){
			                		if("success"==result){
			                			alert("修改密码成功~");
			                			location.reload();
			                		}
			                	});
					

                }
		});
		
		
	})
	
	
	
	</script>
<!--页脚-->
<%@include file="footer.jsp" %>
</body>
</html>    
            
                    
          
	   	
                
            
            
            			  
    
           
       	
				     
             		
            
           
        
    			 
        	
       
            
            
            
            
    	
                         
       
                                                     
                            
					      
                
        
       	
					     
           
            
             
        	
					
            
            
                
                           
                

        
                
                        
                
                
                    	
               
             
                 
                
                
                
                
                
            
                  
        
    	
    
			

                
    
