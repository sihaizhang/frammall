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
        <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/personcenter.css">
        <link rel="stylesheet" href="${APP_PATH}/static/bootstrap3.3.7/css/bootstrap.min.css">
        <script type="text/javascript" src="${APP_PATH}/static/js/jquery3.4.1.min.js"></script>
        <script type="text/javascript" src="${APP_PATH}/static/bootstrap3.3.7/js/bootstrap.min.js"></script>
        <title>个人中心</title>
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
                <li  style="padding-left: 250px" ><a href="${APP_PATH}/index.jsp">
                        <span class="glyphicon glyphicon-home"></span>首页</a></li>
                <li class="dropdown"><a href="###" class="dropdown" data-toggle="dropdown">
                        <span class="glyphicon glyphicon-th-list"></span>我的订单
                        <span class="caret"></span>
                </a>
                        <ul class="dropdown-menu">
                                <li class="active"><a href="${APP_PATH}/jsp/myorders.jsp">全部订单</a></li>
                                <li><a href="${APP_PATH}/jsp/goods_received.jsp">待收货</a></li>
                        </ul>
                </li>
                <li><a href="${APP_PATH}/jsp/shoppingcart.jsp"><span class="glyphicon glyphicon-shopping-cart"></span>购物车</a></li>
                <li class="dropdown"><a href="###" class="dropdown" data-toggle="dropdown">
                        <span class="glyphicon glyphicon-star"></span>收藏夹
                        <span class="caret"></span>
                </a>
                        <ul class="dropdown-menu">
                                <li><a href="${APP_PATH}/jsp/myfavoritebaby.jsp">收藏的宝贝</a></li>
                                <li><a href="${APP_PATH}/jsp/myfavoritestore.jsp">收藏的店铺</a></li>
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
                <li class="dropdown active">
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
<div class="head">
        <ul>
                <li>
                        <h3>个人中心</h3>
                </li>
                <li>
                        <div style="margin-left: 100px; background-color: rgba(0,0,0,0.1); ">
                                <a href="${APP_PATH}/jsp/personcenter.jsp">收货地址</a>
                        </div>
                </li>
                <li>
                        <div style="margin-left: 50px;">
                                <a href="${APP_PATH}/jsp/modifypsw.jsp">修改密码</a>
                        </div>
                </li>
        </ul>
</div>
<div class="box">
        <h4>个人中心&gt;地址管理&gt;收货地址</h4>
        <div class="information">
                <div class="row">
                        <h4 style="padding-left: 20px;">收货人信息填写：</h4>
                        <form class="form-horizontal">
                                <div class="row">
                                        <div class="col-md-2"></div>
                                        <div class="col-md-8 form-group">
                                                <label class="col-md-4 control-label">收货人姓名：</label>
                                                <div class="col-md-8"><input class="form-control" type="text"></div>
                                        </div>
                                </div>
                                <div class="row">
                                        <div class="col-md-2"></div>
                                        <div class="col-md-8 form-group">
                                                <label class="col-md-4 control-label">收货人固定电话：</label>
                                                <div class="col-md-8"><input class="form-control" type="text"></div>
                                        </div>
                                </div>
                                <h4 style="padding-left: 20px;">收货地址信息填写：</h4>
                                <div class="row">
                                        <div class="col-md-2"></div>
                                        <div class="col-md-8 form-group">
                                                <label class="col-md-4 control-label">省份：</label>
                                                <div class="col-md-8"><input class="form-control" type="text"></div>
                                        </div>
                                </div>
                                <div class="row">
                                        <div class="col-md-2"></div>
                                        <div class="col-md-8 form-group">
                                                <label class="col-md-4 control-label">城市（市）：</label>
                                                <div class="col-md-8"><input class="form-control" type="text"></div>
                                        </div>
                                </div>
                                <div class="row">
                                        <div class="col-md-2"></div>
                                        <div class="col-md-8 form-group">
                                                <label class="col-md-4 control-label">区/县：</label>
                                                <div class="col-md-8"><input class="form-control" type="text"></div>
                                        </div>
                                </div>
                                <div class="row">
                                        <div class="col-md-2"></div>
                                        <div class="col-md-8 form-group">
                                                <label class="col-md-4 control-label">详细地址：</label>
                                                <div class="col-md-8"><input class="form-control" type="text"></div>
                                        </div>
                                </div>
                                <div class="row">
                                        <div class="col-md-2"></div>
                                        <div class="col-md-8 form-group">
                                                <label class="col-md-4 control-label">邮编：</label>
                                                <div class="col-md-8"><input class="form-control" type="text"></div>
                                        </div>
                                </div>
                                <div class="row">
                                        <div class="col-md-2"></div>
                                        <div class="col-md-8 form-group">
                                                <label class="col-md-4 control-label">邮编：</label>
                                                <div class="col-md-8"><input class="form-control" type="text"></div>
                                        </div>
                                </div>
                                <div class="row" style="padding-top: 10px;">
                                        <div class="col-md-2"></div>
                                        <div class="col-md-8">
                                                <button type="button" class="btn btn-default" style="margin-left:170px;background-color: #95BDFF;">添加</button><button class="btn btn-default" style="margin-left:180px; ">放弃添加</button>
                                        </div>
                                </div>
                        </form>
                </div>
        </div>
</div>
<footer id="footer" style="margin-top: 10px;">
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
