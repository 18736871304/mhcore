<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%>

<head>
<title></title>
<link rel="stylesheet" href="../../../../css/inputbox/line6.css">
<script>
var inputList;
var checkList;
var doubleList;

window.onload = function () 
{
	initDataGrid20($('#zhihuReportList'));
	
	inputList = [
			];

			checkList = [
			];
	
	disComBox($('#qarticletype'),"articletype",null);
	$('#qcluestartdate').datebox('setValue', getMonthOneFormatDate());
	
	var tParam = new Object();
	tParam.comboxType = 'sourcedetail_0012';
	var tturl = "activity/getSourceDetail.do";
	displayCombox($('#qappname'),tParam,tturl,"dd_key","dd_value");
}

function aftercodeselect(comboxid) 
{
	
}

function selectone() 
{
	
}

function saveSuss() 
{
}

function clearInputData() 
{
	
}

function articleClueQuery()
{
	var tturl = "articleMan/getZhihuReport.do";

	var tParam = new Object();

	tParam.cluestartdate = $('#qcluestartdate').datebox("getValue");
	tParam.clueenddate = $('#qclueenddate').datebox("getValue");

	tParam.appname = $('#qappname').combobox('getText');
	tParam.articletype = $('#qarticletype').combobox('getValue');	
	
	displayDataGrid20($('#zhihuReportList'), tParam, tturl);
}
	
</script>
</head>
<body>
	<div style="margin-left:0%">
		<table class="common">
			<tr>
				<td class="reprot_title">
					线索产生起期
				</td>
				<td class="report_common">
					<input class="easyui-datebox" style="width: 90%" id="qcluestartdate" name="qcluestartdate">
				</td>
				
				<td class="reprot_title">
					线索产生止期
				</td>
				<td class="report_common">
					<input class="easyui-datebox" style="width: 90%" id="qclueenddate" name="qclueenddate">
				</td>
			
				<td class = "reprot_title">
					资源类型
				</td>
				<td class = "report_common">
					<select class = "easyui-combobox" style="width: 90%" panelHeight="auto" name="qarticletype" id="qarticletype">
					</select>
				</td>
				
				<td class = "reprot_title">
					流量来源
				</td>
				<td class = "report_common">
					<select class = "easyui-combobox" style="width: 90%" panelHeight="auto" name="qappname" id="qappname">
					</select>
				</td>
				
				<td></td><td></td>
				<td></td><td></td>
			</tr>
		</table>
		<br>
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="articleClueQuery" onclick="articleClueQuery()">查询</a>
		<br>
		<br>
		<table id="zhihuReportList" class="easyui-datagrid" title="知乎线索报表" style="width:auto;height:auto"
			data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone">
			<thead>
				<tr>
					<th data-options="field:'channelname',width:60">渠道类型</th>
					<th data-options="field:'articletypename',width:60">资源类型</th>
					<th data-options="field:'appname',width:60">流量来源</th>
					
					<th data-options="field:'callback_orderid',width:60">订单ID</th>
					<th data-options="field:'notfriendcount',width:80">未添加好友数</th>
					<th data-options="field:'friendcount',width:80">已添加好友数</th>
					<th data-options="field:'allcount',width:40">合计</th>
					<th data-options="field:'addrate',width:60">通过率</th>
				</tr>
			</thead>
		</table>
		<br>
	</div>
</body>

</html>