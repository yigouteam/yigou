<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>
#ts_header{
    margin: 20px auto;
	float: left;
	width: 100%;
	height: 110px;
	
}
.logo{ width:150px;float:left;}			
.search1 {
	float: right;
	width: 40%;
    height: 30%;
	margin-top: 50px;
			
}
/*--start-search--*/
			
.search2 {
	position: relative;
	border:1px solid #EA1010;
	height:100%;
	width: 100%;
	float: right;
	margin: 0px 0px 0px 0em;
}
			
			
.search2 input[type="text"] {
	outline: none;
	color: #777777;
    background: none;
    margin-left: 5px;
    margin-right: 5px;
   	margin-top: 7px;
	font-size: 16px;
	border:none;
    width: 80%;
	height: 100%;
	float: left;
}
			
.search2 input[type="submit"] {
				background: #EA1010;
				width: 20%;
				height: 100%;
				font-size:18px;
				border: none;
				cursor: pointer;
				position: absolute;
				outline: none;
			    margin-left: -9px;
				color:#F8F8F8;
}
</style>
<div id="ts_header">
<div class="logo"><img src="images/logo.jpg" width="150" height="110" /></div>
	<div class="logo"><img src="images/logo2.jpg" width="150" height="110" /></div>		
		<div class="search1">
			<div class="search2">
			 <form action="${pageContext.request.contextPath }/searchResult" method="get">
				 <input type="text" value="请输入关键字" name="keyword" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = '请输入关键字';}"/>
				 <input type="submit" style="text-align:center;" value="搜索"/>
			  </form>
		</div>
 </div>
</div>