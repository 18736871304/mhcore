<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%><head>
<script type="text/javascript" src="/js/echarts/echarts.min.js"></script>
<title></title>
<script>

window.onload = function()
{
	// 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));
    // 指定图表的配置项和数据
    myChart.setOption(
    {
        title: {
			text: '近七日收益'
		},
		tooltip: {
			trigger: 'axis'
		},
		legend: {
			data:['近七日收益']
		},
		grid: {
			left: '3%',
			right: '4%',
			bottom: '3%',
			containLabel: true
		},
		toolbox: {
			feature: {
			  saveAsImage: {}
			}
		},
		xAxis: {
			type: 'category',
			boundaryGap: false,
			data: ["1","2","3","4","5"]
		},
		yAxis: {
			type: 'value'
		},
		series: [
		{
		  name:'近七日收益',
		  type:'line',
		  stack: '总量',
		  data:["1","2","5","4","5"]
		}
		]
    });
}

function aftercodeselect(comboxid)
{
}

function selectone()
{
}

</script>

</head>
<body>
<div id="main" style="width: 600px;height:400px;"></div>
</body>
</html>