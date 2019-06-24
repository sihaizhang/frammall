<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
        <%
                pageContext.setAttribute("APP_PATH", request.getContextPath());
        %>
        <meta charset="utf-8">
        <title>农场品在线商城</title>
        <meta name="viewport" content="width=device-width,initial-scale=1,maxium-scale=1,user-scalable=no">
        <link  rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/base.css">
        <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/myfavoritebaby.css">
        <link rel="stylesheet" href="${APP_PATH}/static/bootstrap3.3.7/css/bootstrap.min.css">
        <script type="text/javascript" src="${APP_PATH}/static/js/jquery3.4.1.min.js"></script>
        <script type="text/javascript" src="${APP_PATH}/static/bootstrap3.3.7/js/bootstrap.min.js"></script>
        <title>收藏的宝贝</title>
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
                <li class="dropdown"><a href="###" class="dropdown" data-toggle="dropdown">
                        <span class="glyphicon glyphicon-th-list"></span>我的订单
                        <span class="caret"></span>
                </a>
                        <ul class="dropdown-menu">
                                <li><a href="${APP_PATH}/jsp/myorders.jsp">全部订单</a></li>
                                <li><a href="${APP_PATH}/jsp/goods_received.jsp">待收货</a></li>
                        </ul>
                </li>
                <li><a href="${APP_PATH}/jsp/shoppingcart.jsp"><span class="glyphicon glyphicon-shopping-cart"></span>购物车</a></li>
                <li class="dropdown active"><a href="###" class="dropdown" data-toggle="dropdown">
                        <span class="glyphicon glyphicon-star"></span>收藏夹
                        <span class="caret"></span>
                </a>
                        <ul class="dropdown-menu">
                                <li class="active"><a href="${APP_PATH}/jsp/myfavoritebaby.jsp">收藏的宝贝</a></li>
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
<div class="head">
        <ul>
                <li><h3>收藏夹</h3></li>
                <li><div style="margin-left: 100px; background-color: rgba(0,0,0,0.1); "><a href="${APP_PATH}/jsp/myfavoritebaby.jsp">宝贝收藏</a></div></li>
                <li><div style="margin-left: 50px;"><a href="${APP_PATH}/jsp/myfavoritestore.jsp">店铺收藏</a></div></li>
        </ul>
</div>
<div class="box">
        <div class="container">
                <div class="row" style="height: 30px;">
                        <div class="col-md-1"></div>
                        <div class="col-md-6"><h5>全部宝贝</h5></div>
                        <div class="col-md-4">
                                <div class="input-group" id="two" style="width: 400px;height: 30px; ">
                                        <input type="text" name="search" class="form-control" style=" border: 2px solid rgba(244,128,50,1.00)">
                                        <div class="input-group-btn">
                                                <button class="btn btn-danger">搜索</button>
                                        </div>
                                </div>
                        </div>
                        <div class="col-md-1"></div>
                </div>
                <hr size="1px">
                <div clas="row" style="height: 180px; ">
                        <div class="col-md-3"><a href="#"><img src="${APP_PATH}/static/images/first-page/1 figure.jpg" alt="" class="img-thumbnail"></a>
                                <div><a href="#" style="margin-right: 90px;">进入店铺</a><button class="btn btn-default">删除宝贝</button></div>
                                <div><a href="#">加工费单价付款就回家看到过赶紧付款就给你发国家开发</a></div>
                                <div><strong>￥40.00</strong></div>
                        </div>
                        <div class="col-md-3"><img src="${APP_PATH}/static/images/first-page/2 figure.jpg" alt="" class="img-thumbnail">
                                <div><a href="#" style="margin-right: 90px;">进入店铺</a><button class="btn btn-default">删除宝贝</button></div>
                                <div><a href="#">加工费单价付款就回家看到过赶紧付款就给你发国家开发</a></div>
                                <div><strong>￥40.00</strong></div>
                        </div>
                        <div class="col-md-3"><img src="${APP_PATH}/static/images/first-page/3 figure.jpg" alt="" class="img-thumbnail">
                                <div><a href="#" style="margin-right: 90px;">进入店铺</a><button class="btn btn-default">删除宝贝</button></div>
                                <div><a href="#">加工费单价付款就回家看到过赶紧付款就给你发国家开发</a></div>
                                <div><strong>￥40.00</strong></div>
                        </div>
                        <div class="col-md-3"><img src="${APP_PATH}/static/images/first-page/4 figure.jpg" alt="" class="img-thumbnail">
                                <div><a href="#" style="margin-right: 90px;">进入店铺</a><button class="btn btn-default">删除宝贝</button></div>
                                <div><a href="#">加工费单价付款就回家看到过赶紧付款就给你发国家开发</a></div>
                                <div><strong>￥40.00</strong></div>
                        </div>
                </div>
                <div clas="row" style="height: 180px;">
                        <div class="col-md-3"><a href="#"><img src="${APP_PATH}/static/images/first-page/1 figure.jpg" alt="" class="img-thumbnail"></a>
                                <div><a href="#" style="margin-right: 90px;">进入店铺</a><button class="btn btn-default">删除宝贝</button></div>
                                <div><a href="#">加工费单价付款就回家看到过赶紧付款就给你发国家开发</a></div>
                                <div><strong>￥40.00</strong></div>
                        </div>
                        <div class="col-md-3"><img src="${APP_PATH}/static/images/first-page/2 figure.jpg" alt="" class="img-thumbnail">
                                <div><a href="#" style="margin-right: 90px;">进入店铺</a><button class="btn btn-default">删除宝贝</button></div>
                                <div><a href="#">加工费单价付款就回家看到过赶紧付款就给你发国家开发</a></div>
                                <div><strong>￥40.00</strong></div>
                        </div>
                        <div class="col-md-3"><img src="${APP_PATH}/static/images/first-page/3 figure.jpg" alt="" class="img-thumbnail">
                                <div><a href="#" style="margin-right: 90px;">进入店铺</a><button class="btn btn-default">删除宝贝</button></div>
                                <div><a href="#">加工费单价付款就回家看到过赶紧付款就给你发国家开发</a></div>
                                <div><strong>￥40.00</strong></div>
                        </div>
                        <div class="col-md-3"><img src="${APP_PATH}/static/images/first-page/4 figure.jpg" alt="" class="img-thumbnail">
                                <div><a href="#" style="margin-right: 90px;">进入店铺</a><button class="btn btn-default">删除宝贝</button></div>
                                <div><a href="#">加工费单价付款就回家看到过赶紧付款就给你发国家开发</a></div>
                                <div><strong>￥40.00</strong></div>
                        </div>
                </div>
        </div>
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
