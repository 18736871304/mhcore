<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%><head>
<title></title>
<link rel="stylesheet" href="../../../../css/inputbox/line6.css">
<script>

window.onload = function()
{
	initDataGrid20($('#renewList'));
	
	initRenewRateQuery()
}

function aftercodeselect(comboxid)
{
	qRenewAftercodeselect(comboxid)
}

function selectone()
{

}

function displaysumdata(data)
{
	if(data==null||data=="")
	{
		$('#sumrenewrate').val("");
	}
	else
	{
		var renewrate = Number(data.sumrepayprem)/Number(data.sumreprem)*100;
		$('#sumrenewrate').val(renewrate.toFixed(2)+'%');
	}
}

function renewratedownload() {
	var tturl = "policy/getReRateReportDown.do";
	var tParam = getRenewQueryParam();

	ajaxdeal(tturl, tParam, listdownloadreturn, null);
}

function listdownloadreturn(data) {
	if (data.flag == "0") {
		if (data.message == null || data.message == "") {
			$.messager.alert('执行失败', '没有生成下载文件', 'error');
		} else {
			$.messager.alert('执行成功', "执行成功，请点击下载", 'info');
			//判断id存在的代码
			if ($("#xiazai").length > 0) {
				$("#xiazai").remove();
				$('#policyquerydownload').after("&nbsp&nbsp<a id = 'xiazai' href = 'download.do?filename=" + data
					.message + "'>点击下载</a>");
			} else {
				$('#policyquerydownload').after("&nbsp&nbsp<a id = 'xiazai' href = 'download.do?filename=" + data
					.message + "'>点击下载</a>");
			}
		}
	} else {
		if (data.message == null || data.message == "") {
			$.messager.alert('执行失败', '操作失败', 'error');
		} else {
			$.messager.alert('执行失败', data.message, 'error');
		}
	}
}

</script>

</head>
<body>
<div style="margin-left:0%">
	<%@ include file="/WEB-INF/common/query/renew/renewRateQuery.jsp"%>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "articlequery" onclick = "renewratequery()">查询</a>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="policyquerydownload" onclick="renewratedownload()">下载</a>
	<br>
	<br>
	<table id="renewList" class="easyui-datagrid" title="继续率报表" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<%@ include file="/WEB-INF/common/column/renew/renewRateList.jsp"%>
			</tr>
		</thead>
	</table>
	<br>
	<table class="common">
		<tr>
			<td class="reprot_title_4">
				当前继续率
			</td>
			<td class="report_common_4">
				<input class="txt" id="sumrenewrate" name="sumrenewrate" readonly>
			</td>
			<td style="width:9%"></td><td style="width:15%"></td>
			<td style="width:9%"></td><td style="width:15%"></td>
			<td style="width:9%"></td><td style="width:15%"></td>
		</tr>
	</table>
</div>
</body>
</html>