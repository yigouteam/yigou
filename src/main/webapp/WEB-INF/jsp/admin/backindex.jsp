<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
	<title>易购后台管理系统</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta http-equiv="Access-Control-Allow-Origin" content="*">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="icon" href="favicon.ico">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/admin/layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/font_eolqem241z66flxr.css" media="all" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/main.css" media="all" />
	<title>后台主页</title>
	<script type="text/javascript">
		var index = layer.open({
		  type: 2,
		  content: 'http://layim.layui.com',
		  area: ['320px', '195px'],
		  maxmin: true
		});
	</script>
</head>
<body class="main_body">
	<div class="layui-layout layui-layout-admin">
		<!-- 顶部 -->
		<div class="layui-header header">
			<div class="layui-main">
				<a href="#" class="logo">易购后台管理系统</a>
				<!-- 搜索 -->
				<div class="layui-form component">
			        <select name="modules" lay-verify="required" lay-search="">
						<option value="">直接选择或搜索选择</option>
						<option value="1">新鲜水果</option>
						<option value="2">方便速食</option>
						<option value="3">牛奶饮品</option>
						<option value="4">酒水畅销</option>
						<option value="5">精选茗茶</option>
						<option value="6">肉干熟食</option>
						<option value="7">饼干蛋糕</option>
						<option value="8">坚果炒货</option>
						<option value="9">休闲零食</option>
			        </select>
			        <i class="layui-icon">&#xe615;</i>
			    </div>
			   
			    <!-- 顶部右侧菜单 -->
			    <ul class="layui-nav top_menu">
			    	<li class="layui-nav-item showNotice" id="showNotice" pc>
						<a href="javascript:;"><i class="iconfont icon-gonggao"></i><cite>系统公告</cite></a>
					</li>
			    	<li class="layui-nav-item" mobile>
			    		<a href="javascript:;" data-url="page/user/changePwd.html"><i class="iconfont icon-shezhi1" data-icon="icon-shezhi1"></i><cite>设置</cite></a>
			    	</li>
			    	<li class="layui-nav-item" mobile>
			    		<a href="adminLogout"><i class="iconfont icon-loginout"></i> 退出</a>
			    	</li>
					<li class="layui-nav-item lockcms" pc>
						<a href="javascript:;"><i class="iconfont icon-lock1"></i><cite>锁屏</cite></a>
					</li>
					<li class="layui-nav-item" pc>
						<a href="javascript:;">
							<img src="images/face.jpg" class="layui-circle" width="35" height="35">
							<cite>${sessionScope.admin.name}</cite>
						</a>
						<dl class="layui-nav-child">
							<dd><a href="javascript:;" data-url="${pageContext.request.contextPath}/admin/userInfo"><i class="iconfont icon-zhanghu" data-icon="icon-zhanghu"></i><cite>个人资料</cite></a></dd>
							<dd><a href="javascript:;" data-url="${pageContext.request.contextPath}/admin/changePwd"><i class="iconfont icon-shezhi1" data-icon="icon-shezhi1"></i><cite>修改密码</cite></a></dd>
							<dd><a href="adminLogout"><i class="iconfont icon-loginout"></i><cite>退出</cite></a></dd>
						</dl>
					</li>
				</ul>
			</div>
		</div>
		<!-- 左侧导航 -->
		<div class="layui-side layui-bg-black">
			<div class="user-photo">
				<a class="img" title="我的头像" ><img src="${pageContext.request.contextPath}/admin/images/face.jpg"></a>
				<p>你好！<span class="userName">${sessionScope.admin.name}</span>, 欢迎登录</p>
			</div>
			<div class="navBar layui-side-scroll"></div>
		</div>
		
		<!-- 右侧内容 -->
		<div class="layui-body layui-form">
			<div class="layui-tab marg0" lay-filter="bodyTab">
				<ul class="layui-tab-title top_tab">
					<li class="layui-this" lay-id=""><i class="iconfont icon-computer"></i> <cite>后台首页</cite></li>
				</ul>
				<div class="layui-tab-content clildFrame">
					<div class="layui-tab-item layui-show">
						<iframe src="${pageContext.request.contextPath}/admin/main"></iframe>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 移动导航 -->
	<div class="site-tree-mobile layui-hide"><i class="layui-icon">&#xe602;</i></div>
	<div class="site-mobile-shade"></div>

	<script type="text/javascript" src="${pageContext.request.contextPath}/admin/layui/layui.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/nav.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/leftNav.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/index.js"></script>
</body>
</html>