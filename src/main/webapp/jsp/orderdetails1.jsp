<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
	<%
		pageContext.setAttribute("APP_PATH", request.getContextPath());
	%>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,maxium-scale=1,user-scalable=no">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
	<link  rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/base.css">
	<link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/orderdetails1.css">
	<link rel="stylesheet" href="${APP_PATH}/static/bootstrap3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://a.amap.com/jsapi_demos/static/demo-center/css/demo-center.css" />
	<script src="https://webapi.amap.com/maps?v=1.4.15&key=您申请的key值&plugin=AMap.PolyEditor"></script>
	<script src="https://a.amap.com/jsapi_demos/static/demo-center/js/demoutils.js"></script>
	<script type="text/javascript" src="${APP_PATH}/static/js/jquery3.4.1.min.js"></script>
	<script type="text/javascript" src="${APP_PATH}/static/bootstrap3.3.7/js/bootstrap.min.js"></script>
	<title>订单详情</title>
</head>
<body>
<div>
	<ul class="nav nav-tabs">
		<li style="padding-left: 100px"><a href="${APP_PATH}/jsp/login.jsp">亲，请登录</a></li>
		<li><a href="${APP_PATH}/jsp/register.jsp">免费注册</a></li>
		<li  style="padding-left: 250px" >
			<a href="${APP_PATH}/jsp/firstpage.jsp"><span class="glyphicon glyphicon-home"></span>首页</a>
		</li>
		<li class="dropdown active"><a href="###" class="dropdown" data-toggle="dropdown"> <span class="glyphicon glyphicon-th-list"></span>我的订单 <span class="caret"></span> </a>
			<ul class="dropdown-menu">
				<li><a href="${APP_PATH}/jsp/myorders.jsp">全部订单</a></li>
				<li class="active"><a href="${APP_PATH}/jsp/goods_received.jsp">待收货</a></li>
			</ul>
		</li>
		<li><a href="${APP_PATH}/jsp/shoppingcart.jsp"><span class="glyphicon glyphicon-shopping-cart"></span>购物车</a></li>
		<li class="dropdown"><a href="###" class="dropdown" data-toggle="dropdown"> <span class="glyphicon glyphicon-star"></span>收藏夹 <span class="caret"></span> </a>
			<ul class="dropdown-menu">
				<li><a href="${APP_PATH}/jsp/myfavoritebaby.jsp">收藏的宝贝</a></li>
				<li><a href="${APP_PATH}/jsp/myfavoritestore.jsp">收藏的店铺</a></li>
			</ul>
		</li>
		<li class="dropdown"><a href="###" class="dropdown" data-toggle="dropdown">卖家中心 <span class="caret"></span> </a>
			<ul class="dropdown-menu">
				<li><a href="${APP_PATH}/jsp/free_opening.jsp">免费开店</a></li>
				<li><a href="${APP_PATH}/jsp/selledbaby.jsp">已卖出的宝贝</a></li>
				<li><a href="${APP_PATH}/jsp/sellingbaby.jsp">出售中的宝贝</a></li>
				<li><a href="${APP_PATH}/jsp/baby_on.jsp">发布宝贝</a></li>
				<li><a href="${APP_PATH}/jsp/baby_off.jsp">下架宝贝</a></li>
			</ul>
		</li>
		<li class="dropdown">
			<a href="###" class="dropdown" data-toggle="dropdown">
				<span class="glyphicon glyphicon-user"></span>个人中心
				<span class="caret"></span>
			</a>
			<ul class="dropdown-menu">
				<li><a href="${APP_PATH}/jsp/personcenter.jsp">地址管理</a></li>
				<li class="active"><a href="${APP_PATH}/jsp/modifypsw.jsp">修改密码</a></li>
			</ul>
		</li>
	</ul>
</div>
<div class="box">
	<h4>您的位置：我的订单&gt;待收货&gt;订单详情</h4>
	<table class="table table-striped">
		<tbody>
		<tr>
			<td><h3><strong>订单信息：</strong></h3></td>
		</tr>
		<tr>
			<td><p>收货地址：</p></td>
		</tr>
		<tr>
			<td><p>订单编号：</p></td>
		</tr>
		<tr>
			<td><p>商家：</p></td>
		</tr>
		</tbody>
	</table>
	<table class="table table-striped">
		<tbody>
		<tr>
			<td><h3><strong>商品信息：</strong></h3></td>
		</tr>
		</tbody>
	</table>
	<table class="table table-striped table-bordered goods">
		<thead>
		<tr>
			<th>商品</th>
			<th>单价</th>
			<th>数量</th>
		</tr>
		</thead>
		<tbody>
		<tr>
			<td style="width: 500px;"><img src="${APP_PATH}/static/images/first-page/1 figure.jpg" alt=""><a href="#" style="width: 50px;margin-left: 20px;">股份给回复广泛U盾是否合格的国家该胡规划的覅回归佛号符</a></td>
			<td>45.90</td>
			<td>1</td>
		</tr>
		</tbody>
	</table>
	<h3><strong>冷链保鲜箱信息：</strong></h3>
	<div class="freshbox">
		<div class="row" style="margin-bottom: 10px;">
			<div class="col-md-5">
				<button class="btn btn-danger" type="button" id="showEchar">刷新温度折线图</button>
			</div>
			<div class="col-md-2"></div>
			<div class="col-md-5">
				<button class="btn btn-danger" type="button">刷新湿度折线图</button>
			</div>
		</div>
		<div class="row">
			<div class="col-md-5" style="border: 1px solid rgba(167,167,167,0.6);height: 400px;"  id="temperature"></div>
			<div class="col-md-2"></div>
			<div class="col-md-5" style="border: 1px solid rgba(167,167,167,0.6);height: 400px;" id="humidity"></div>
		</div>
	</div>
	<h3><strong>物流信息：</strong></h3>
	<table class="table table-striped">
		<tbody>
		<tr>
			<td><p>物流：</p></td>
		</tr>
		<tr>
			<td><p>物流单号：</p></td>
		</tr>
		<tr>
			<td><p>物流跟踪：</p>
				<div id="map"></div></td>
		</tr>
		</tbody>
	</table>
</div>
<footer id="footer">
	<div class="top">
		<div class="block left">
			<h2>购物指南</h2>
			<hr>
			<ul>
				<li>上门自提</li>
				<li>在线支付</li>
				<li>退款说明</li>
				<li>联系客服</li>
			</ul>
		</div>
		<div class="block center">
			<h2>配送方式</h2>
			<hr>
			<ul>
				<li>货到付款</li>
				<li>价格保护</li>
				<li>延保服务</li>
			</ul>
		</div>
		<div class="block right">
			<h2>特色服务</h2>
			<hr>
			<ul>
				<li>会员介绍</li>
				<li>配送服务查询</li>
				<li>取消订单</li>
			</ul>
		</div>
	</div>
	<div class="bottom">Copyright ©  版权所有</div>
</footer>
</body>
<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/echarts.min.js"></script>
<script type="text/javascript">
	var dom = document.getElementById("temperature");
	var myChart = echarts.init(dom);
	var app = {};
	option = null;
	option = {
		grid: {show:'true',borderWidth:'0',height:"60%",width:"80%",y:"20%",x:"12%"},
		calculable : true,
		title: {
			text: '冷链保险箱温度'
		},
		legend: {
			data:['温度']
		},
		xAxis: {
			type: 'category',
			data: ['2019/6/24/10:35', '2019/6/24/10:35', '2019/6/24/10:35', '2019/6/24/10:35', '2019/6/24/10:35', '2019/6/24/10:35', '2019/6/24/10:35']
		},
		yAxis: {
			type: 'value'
		},
		series: [{
			name: '温度',
			data: [820, 932, 901, 934, 1290, 1330, 1320],
			type: 'line'
		}]
	};
	;
	if (option && typeof option === "object") {
		myChart.setOption(option, true);
	}
</script>
<script type="text/javascript">
	var dom = document.getElementById("humidity");
	var myChart = echarts.init(dom);
	var app = {};
	option = null;
	option = {
		title: {
			text: '冷链保险箱湿度'
		},
		legend: {
			data:['湿度']
		},
		xAxis: {
			type: 'category',
			data: ['2019/6/24/10:35', '2019/6/24/10:35', '2019/6/24/10:35', '2019/6/24/10:35', '2019/6/24/10:35', '2019/6/24/10:35', '2019/6/24/10:35']
		},
		yAxis: {
			type: 'value'
		},
		series: [{
			name: '湿度',
			data: [820, 932, 901, 934, 1290, 1330, 1320],
			type: 'line'
		}]
	};
	;
	if (option && typeof option === "object") {
		myChart.setOption(option, true);
	}
</script>
<script type="text/javascript">
	var map = new AMap.Map("map", {
		center: [ 116.397637, 39.900001 ],
		zoom: 14
	});

	var path = [//每个弧线段有两种描述方式
		[116.39, 39.91, 116.37, 39.91],//起点
		//第一段弧线
		[116.380298, 39.907771, 116.38, 39.90],//控制点，途经点
		//第二段弧线
		[116.385298, 39.907771, 116.40, 39.90],//控制点，途经点//弧线段有两种描述方式1
		//第三段弧线
		[//弧线段有两种描述方式2
			[116.392872, 39.887391],//控制点
			[116.40772, 39.909252],//控制点
			[116.41, 39.89]//途经点
		],
		//第四段弧线
		[116.423857, 39.889498, 116.422312, 39.899639, 116.425273, 39.902273]
		//控制点，控制点，途经点，每段最多两个控制点
	];

	var bezierCurve = new AMap.BezierCurve({
		path: path,
		isOutline: true,
		outlineColor: '#ffeeff',
		borderWeight: 3,
		strokeColor: "#3366FF",
		strokeOpacity: 1,
		strokeWeight: 6,
		// 线样式还支持 'dashed'
		strokeStyle: "solid",
		// strokeStyle是dashed时有效
		strokeDasharray: [10, 10],
		lineJoin: 'round',
		lineCap: 'round',
		zIndex: 50,
	})

	bezierCurve.setMap(map)
	// 缩放地图到合适的视野级别
	map.setFitView([ bezierCurve ])

	var bezierCurveEditor = new AMap.BezierCurveEditor(map, bezierCurve)

	bezierCurveEditor.on('addnode', function(event) {
		log.info('触发事件：addnode')
	})

	bezierCurveEditor.on('adjust', function(event) {
		log.info('触发事件：adjust')
	})

	bezierCurveEditor.on('removenode', function(event) {
		log.info('触发事件：removenode')
	})

	bezierCurveEditor.on('end', function(event) {
		log.info('触发事件： end')
		// event.target 即编辑后的曲线对象
	})
</script>
</html>
