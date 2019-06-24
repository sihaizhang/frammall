<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
        <%
                pageContext.setAttribute("APP_PATH", request.getContextPath());
        %>
        <title>上传图片测试</title>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <script type="text/javascript" src="${APP_PATH}/static/js/jquery3.4.1.min.js"></script>
        <script src="${APP_PATH}/static/js/uploadImg.js" type="text/javascript" charset="utf-8"></script>

</head>
<body>
<div class="file-box">
        <div >

                <label >点击图片即可修改</label><br>

                <img id="headPic" src="/market/images/image.png"  width="150px" height="150px" style="padding: 5px">
                <input id="upload" name="file" accept="image/*" type="file" style="display: none"/>

                <button id="submit_btn" type="submit">确定修改</button>
        </div>
</div>
        <script type="text/javascript">
            $("#headPic").click(function () {
                $("#upload").click(); //隐藏了input:file样式后，点击头像就可以本地上传
                $("#upload").on("change",function(){
                    var objUrl = getObjectURL(this.files[0]) ; //获取图片的路径，该路径不是图片在本地的路径
                    if (objUrl) {
                        $("#headPic").attr("src", objUrl) ; //将图片路径存入src中，显示出图片
                    }
                });
            });

            //图片上传
            $("#submit_btn").click(function () {

                var imgurl = document.getElementById("upload").value;

                $.ajax({
                    url:"uploadHeadPic",
                    data: "upload", //文件上传域的ID，这里是input的ID，而不是img的
                    dataType: 'json', //返回值类型 一般设置为json
                    success: function (data) {
                        console(data);
                    }
                });
            });

            //建立一個可存取到該file的url
            function getObjectURL(file) {
                var url = null ;
                if (window.createObjectURL!=undefined) { // basic
                    url = window.createObjectURL(file) ;
                } else if (window.URL!=undefined) { // mozilla(firefox)
                    url = window.URL.createObjectURL(file) ;
                } else if (window.webkitURL!=undefined) { // webkit or chrome
                    url = window.webkitURL.createObjectURL(file) ;
                }
                return url ;
            }
        </script>
</body>
</html>