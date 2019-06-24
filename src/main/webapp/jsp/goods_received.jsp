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
	<link  rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/base.css">
	<link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/myorders.css">
	<link rel="stylesheet" href="${APP_PATH}/static/bootstrap3.3.7/css/bootstrap.min.css">
	<script type="text/javascript" src="${APP_PATH}/static/js/jquery3.4.1.min.js"></script>
	<script type="text/javascript" src="${APP_PATH}/static/bootstrap3.3.7/js/bootstrap.min.js"></script>
	<title>待收货</title>
</head>
<body>
	<div>
		<ul class="nav nav-tabs">
			<c:if test="${sessionScope.currentUser == null}">
				<li style="padding-left: 100px"><a href="${APP_PATH}/jsp/login.jsp">亲，请登录</a></li>
				<li><a href="${APP_PATH}/jsp/register.jsp">免费注册</a></li>
			</c:if>
			<c:if test="${sessionScope.currentUser != null}">
				<li style="padding-left: 100px">欢迎:${sessionScope.currentUser.username}</li>
			</c:if>
			<li  style="padding-left: 250px" ><a href="${APP_PATH}/index.jsp"><span class="glyphicon glyphicon-home"></span>首页</a></li>
			<li class="dropdown active"><a href="###" class="dropdown" data-toggle="dropdown">
				<span class="glyphicon glyphicon-th-list"></span>我的订单
				<span class="caret"></span>
				</a>
				<ul class="dropdown-menu">
					<li><a href="${APP_PATH}/jsp/myorders.jsp">全部订单</a></li>
					<li class="active"><a href="${APP_PATH}/jsp/goods_received.jsp">待收货</a></li>
				</ul>
			</li>
			<li><a href="${APP_PATH}/jsp/shoppingcart.jsp"><span class="glyphicon glyphicon-shopping-cart"></span>购物车</a></li>
			<li class="dropdown"><a href="###" class="dropdown" data-toggle="dropdown">
				<span class="glyphicon glyphicon-star"></span>收藏夹
				<span class="caret"></span>
				</a>
				<ul class="dropdown-menu">
					<li><a href="#">收藏的宝贝</a></li>
					<li><a href="#">收藏的店铺</a></li>	
				</ul>
			</li>
			<li class="dropdown"><a href="###" class="dropdown" data-toggle="dropdown">卖家中心
				<span class="caret"></span>
				</a>
				<ul class="dropdown-menu">
					<li><a href="${APP_PATH}/jsp/free_opening.jsp">免费开店</a></li>
					<li><a href="${APP_PATH}/jsp/selledbaby.jsp">已卖出的宝贝</a></li>
					<li><a href="${APP_PATH}/jsp/sellingbaby.jsp">出售中的宝贝</a></li>
					<li><a href="${APP_PATH}/jsp/baby_on.jsp">发布宝贝</a></li>
					<li><a href="">下架宝贝</a></li>
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
	<div class="input-group" id="two" style="width: 400px;height: 30px; padding-right: 80px; padding-top: 20px; padding-bottom: 10px; float: right">
		   <input type="text" name="search" class="form-control" style=" border: 2px solid rgba(244,128,50,1.00)">
			<div class="input-group-btn">
			    <button class="btn btn-danger">搜索</button>
			</div>		
	</div>
	<hr size="2px">
	<div class="box">
		  <table class="table table-bordered text-center">
			  <thead>
				<tr>
					<th>商品图片</th>
					<th>商品链接</th>
					<th>数量</th>
					<th>单价(/kg)</th>
					<th>小计</th>
					<th>操作</th>
				</tr>
			</thead>
			  <tbody style="height: 100px;line-height: 100px;">
				  <tr>
					  <td><div><img src="${APP_PATH}/static/images/myorders/figure1.png" alt="" class="img-thumbnail"></div></td>
			          <td><div><a href="#">就给个合计合计将黑寡妇黑寡妇感觉好工费合计高呼口</a></div></td>
			          <td>数量：1</td>
					  <td>单价：45.50</td>
				      <td>小计：45.50</td>
					  <td><a href="${APP_PATH}/jsp/orderdetails1.jsp"><button class="btn btn-danger">订单详情</button></a></td>
				  </tr>
				  <tr>
					  <td><div><img src="${APP_PATH}/static/images/myorders/figure2.png" alt="" class="img-thumbnail"></div></td>
			          <td><div><a href="#">就给个合计合计将黑寡妇黑寡妇感觉好工费合计高呼口</a></div></td>
					  <td>数量：1</td>
					  <td>单价：45.50</td>
				      <td>小计：45.50</td>
					  <td><a href="#"><button class="btn btn-danger">订单详情</button></a></td>
				  </tr>
				  <tr>
					  <td><div><img src="${APP_PATH}/static/images/myorders/figure3.png" alt="" class="img-thumbnail"></div></td>
			          <td><div><a href="#">就给个合计合计将黑寡妇黑寡妇感觉好工费</a></div></td>
			          <td>数量：1</td>
					  <td>单价：45.50</td>
				      <td>小计：45.50</td>
					  <td><a href="#"><button class="btn btn-danger">订单详情</button></a></td>
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
</html>
