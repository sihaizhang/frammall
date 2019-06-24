<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html>
<head>
        <%
                pageContext.setAttribute("APP_PATH", request.getContextPath());
        %>
        <meta charset="utf-8">
        <title>农场品在线商城</title>
        <meta name="viewport" content="width=device-width,initial-scale=1,maxium-scale=1,user-scalable=no">
        <link  rel="stylesheet" type="text/css" href="${APP_PATH}/static/css/login.css">
        <link rel="stylesheet" href="${APP_PATH}/static/bootstrap3.3.7/css/bootstrap.min.css">
        <script type="text/javascript" src="${APP_PATH}/static/js/jquery3.4.1.min.js"></script>
        <script type="text/javascript" src="${APP_PATH}/static/bootstrap3.3.7/js/bootstrap.min.js"></script>
        <title>登录页面</title>
</head>

<body>
<div class="box">
        <div class="box1">LOGIN</div>
        <div class="row" style="padding-top: 20px;">
                <div class="col-md-2"></div>
                <div class="col-md-10">用户名：</div>
        </div>
        <div class="row" style="padding-top: 10px;">
                <div class="col-md-2"></div>
                <div class="col-md-10">
                        <span class="glyphicon glyphicon-user"></span>&nbsp;
                        &nbsp;<input type="text" style="width:  220px;height: 35px;" id="username">
                </div>
        </div>
        <div class="row" style="padding-top: 20px;">
                <div class="col-md-2"></div>
                <div class="col-md-10">密 码：</div>
        </div>
        <div class="row" style="padding-top: 10px;">
                <div class="col-md-2"></div>
                <div class="col-md-10">
                        <span class="glyphicon glyphicon-lock"></span>&nbsp;
                        &nbsp;<input type="password" style="width: 220px;height: 35px;" id="password">
                </div>
        </div>
        <div style="padding-left: 230px;padding-top: 30px;">
                <button class="btn btn-danger" style="width: 80px;" id="loginBtn">登录</button>
        </div>
        <div class="bt">
                <button type="button" class="btn btn-info" id="register_btn">注册用户</button>
                <button type="button" class="btn btn-info" id="forget_btn" style="display: inline-block;">忘记密码？</button>
        </div>
</div>
<script type="text/javascript">
        $("#register_btn").click(function () {
           window.location.href = "${APP_PATH}/jsp/register.jsp";
        });

        $("#forget_btn").click(function () {
           window.location.href = "${APP_PATH}/jsp/forget.jsp";
        });

        $("#loginBtn").click(function () {
            var username = $("#username").val();
            var password = $("#password").val();
                $.ajax({
                    type:"post",
                    url:"${APP_PATH}/user/login.do",
                    data:"username="+username+"&password="+password,
                    success:function(result){
                        judgeMsg(result);
                    }
                })
        });

        function judgeMsg(result){
            if(result.status == 1){
                alert(result.msg);
            }else if(result.status == 0){
                window.location.href = "${APP_PATH}/index.jsp";
            }
        }

</script>
</body>
</html>

