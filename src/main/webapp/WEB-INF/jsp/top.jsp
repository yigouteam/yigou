<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<style>
#site-nav {
    margin: 0 auto;
    background-color: #f2f2f2;
    height: 32px;
    border-bottom: 1px solid #e7e7e7;
}

#site-nav span {
    padding-right: 10px;
    line-height: 32px;
    margin_right:10px;
}
.workArea {
    width: 100%;
    margin: 0 auto;
}
.workArea a{
    padding-left:5px;
}
.workArea a:hover{
    color:red;
    text-decoration: none;
    
}
</style>


<%-- 顶部导航栏 --%>
<nav id="site-nav" role="navigation">
    <div class="workArea">
        
        <span style="color:#C40000;margin:0px" class=" glyphicon glyphicon-home ">
         <a href="${pageContext.request.contextPath}/index">易购首页 </a>
        </span>
         
        <%-- 导航栏左半部分 --%>
        <c:if test="${empty sessionScope.user}">           
            <span><a href="${pageContext.request.contextPath}/login">登录</a></span>
            <span><a href="${pageContext.request.contextPath}/register">注册</a></span>
        </c:if>
        <c:if test="${!empty sessionScope.user}">
            <span><a href="user_center">Hi，${sessionScope.user.username}</a></span>
            <span><a href="${pageContext.request.contextPath}/logout">退出</a></span>
        </c:if>
        
        <%-- 导航栏右半部分：
             使用Bootstrap的pull-right类 --%>
        <span class="pull-right">
            <a href="${pageContext.request.contextPath}/myOrder">我的订单</a>  
                <span style="color:#C40000;margin:0px" class="glyphicon glyphicon-shopping-cart redColor">
                 <a href="${pageContext.request.contextPath}/cart">购物车</a>
                </span>
                <strong id="cartTotalItemNumber">${cartTotalItemNumber}</strong>
           
        </span>
    </div>
</nav>