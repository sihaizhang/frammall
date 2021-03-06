<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html style="height: 100%">
   <head>
       <meta charset="utf-8">
   </head>
   <body style="height: 100%; margin: 0">
       <div id="container" style="height: 100%"></div>
       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/echarts.min.js"></script>
       <script src="https://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script>
       <script type="text/javascript">
var myChart = echarts.init(document.getElementById("container"));

myChart.setOption({
    title: {
        text: '保鲜箱湿度与温度'
    },
    tooltip: {
        trigger: 'axis'
    },
    legend: {
        data:['温度','湿度']
    },
    xAxis: {
        type: 'category',
        data: []
    },
    yAxis: {type: 'value'},
    series: [{
        name: '温度',
        type: 'line',
        data: []
    },{
        name: '湿度',
        type: 'line',
        data: []
    }]
});
$.ajax({
		url:"http://10.168.14.77:8080/farmmall/echar.do",
		async:false,
		cache:false,
		success:function(data){
			myChart.setOption({
				xAxis:{data:data.time},
				series: [{name: '温度',data: data.temperature},{name: '湿度',data: data.humidity}]
				});
			},
			error:function(error){
				console.log(error);
				}
		});

       </script>
   </body>
</html>