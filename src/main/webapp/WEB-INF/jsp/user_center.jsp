<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page import="java.util.Date"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 
<head>
<meta charset="utf-8">
<title>会员中心</title>


<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<script src="js/jquery-1.8.3.min.js"></script>
<script src="js/bootstrap.min.js"></script>

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
    <h1 class="welcom_tm">欢迎您,   <font>${user.username} </font>！您本次访问时间为 
    <fmt:formatDate value="<%=new Date()%>" pattern="yyyy-MM-dd HH:mm:ss"/></h1>
    <!--一条开始-->
    	<div class="public_m1">
        	<div class="public_m2">资料管理</div>
            <!--照片和内容-->	
            <div class="zp_nrm">
            	<!--left-->
                <div class="zp_nrm_l">
                	<img src="images/touxiang.jpg"/>
                    <a href="#">我的头像</a>
                </div>
                <!--right-->
                <div class="zp_nrm_r">
                	<p><em>用户名：</em><i>${user.username}</i></p>
                    <p><em>用户等级：</em><i>会员</i></p>
                    <p><em>用户积分：</em><i>23积分</i></p>
                    <p><em>用户喜好：</em><i>2333</i></p>
                    <p><em>邮箱：</em><i>${user.email}</i></p>
                    <p><em>手机：</em><i>${user.tel}</i></p>
                    <p><em>性别：</em><input type="radio" name="sex" class="sex_m" checked><i>保密</i><input type="radio" name="sex" class="sex_m"><i>男</i><input type="radio" name="sex" class="sex_m"><i>女</i></p>
                    <span class="borth_m">
                    	<em>生日：</em>
                        <select style=" float:left; height:23px; border:1px solid #eaeaea; margin-top:13px; margin-right:3px" id="date-sel-year" rel="2015">  	
                        </select>年
                        <select style=" border:1px solid #eaeaea; margin-top:13px; margin-right:3px" id="date-sel-month" rel="9">
                        </select>月
                        <select style=" border:1px solid #eaeaea; margin-top:13px; margin-right:3px" id="date-sel-day" rel="10">
                        </select>日                    
                    </span>                  
                    <a href="user_center" class="public_m3">保存修改</a>
                </div>
            </div>
        </div>
<script type="text/javascript">
(function($){

	$.extend({

		date_picker: function(options){

	        var defaults = {

	            YearSelector: "#sel_year",

	            MonthSelector: "#sel_month",

	            DaySelector: "#sel_day",

	            FirstText: "--",

	            FirstValue: 0

	        };

	        var opts = $.extend({}, defaults, options);

	        var $YearSelector = $(opts.YearSelector);

	        var $MonthSelector = $(opts.MonthSelector);

	        var $DaySelector = $(opts.DaySelector);

	        var FirstText = opts.FirstText;

	        var FirstValue = opts.FirstValue;

	
	        // 初始化

	        var str = "<option value=\"" + FirstValue + "\">" + FirstText + "</option>";

	        $YearSelector.html(str);

	        $MonthSelector.html(str);

	        $DaySelector.html(str);

	
	        // 年份列表

	        var yearNow = new Date().getFullYear();

			var yearSel = $YearSelector.attr("rel");

	        for (var i = yearNow; i >= 1900; i--) {

				var sed = yearSel==i?"selected":"";

				var yearStr = "<option value=\"" + i + "\" " + sed+">" + i + "</option>";

	            $YearSelector.append(yearStr);

	        }

	
	        // 月份列表

			var monthSel = $MonthSelector.attr("rel");

	        for (var i = 1; i <= 12; i++) {

				var sed = monthSel==i?"selected":"";

	            var monthStr = "<option value=\"" + i + "\" "+sed+">" + i + "</option>";

	            $MonthSelector.append(monthStr);

	        }

	

	        // 日列表(仅当选择了年月)

	        function BuildDay() {

	            if ($YearSelector.val() == 0 || $MonthSelector.val() == 0) {

	                // 未选择年份或者月份

	                $DaySelector.html(str);

	            } else {

	                $DaySelector.html(str);

	                var year = parseInt($YearSelector.val());

	                var month = parseInt($MonthSelector.val());

	                var dayCount = 0;

	                switch (month) {

	                    case 1:

	                    case 3:

	                    case 5:

	                    case 7:

	                    case 8:

	                    case 10:

	                    case 12:

	                        dayCount = 31;

	                        break;

	                    case 4:

	                    case 6:

	                    case 9:

	                    case 11:

	                        dayCount = 30;

	                        break;

	                    case 2:

	                        dayCount = 28;

	                        if ((year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0)) {

	                            dayCount = 29;

	                        }

	                        break;

	                    default:

	                        break;

	                }

					

					var daySel = $DaySelector.attr("rel");

	                for (var i = 1; i <= dayCount; i++) {

						var sed = daySel==i?"selected":"";

						var dayStr = "<option value=\"" + i + "\" "+sed+">" + i + "</option>";

	                    $DaySelector.append(dayStr);

	                }

	            }

	        }

	        $MonthSelector.change(function () {

	            BuildDay();

	        });

	        $YearSelector.change(function () {

	            BuildDay();

	        });

			if($DaySelector.attr("rel")!=""){

				BuildDay();

			}

		}

	});

})(jQuery);
	
          
$.date_picker({

     YearSelector:  "#date-sel-year",

     MonthSelector: "#date-sel-month",

     DaySelector:   "#date-sel-day"

});


</script>
	</div>
</div>   
        
	
   
         
<!--页脚-->
<%@include file="footer.jsp" %>
</body>
</html>    
            
                    
          
	   	
                
            
            
            			  
    
           
       	
				     
             		
            
           
        
    			 
        	
       
            
            
            
            
    	
                         
       
                                                     
                            
					      
                
        
       	
					     
           
            
             
        	
					
            
            
                
                           
                

        
                
                        
                
                
                    	
               
             
                 
                
                
                
                
                
            
                  
        
    	
    
			

                
    
