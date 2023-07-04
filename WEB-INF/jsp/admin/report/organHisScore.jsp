<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%><head>
<title></title>
<script>

window.onload = function()
{
	initDataGrid($('#organReportList'));
	init02Org();
}

function aftercodeselect(comboxid)
{
	organAfterSelect(comboxid);
}

function selectone()
{
}

function finceReportQuery()
{
	var tturl = "policy/getOrganHisList.do";

	var tParam = new Object();

	tParam.teamid = getQTeamId();
	
	if(tParam.teamid==null||tParam.teamid=='')
	{
		tParam.organcode = getOrgan04Code();
		
		if(tParam.organcode==null||tParam.organcode=='')
		{
			tParam.organcode = $('#q03org').combobox('getValue');
		}
		if(tParam.organcode==null||tParam.organcode=='')
		{
			tParam.organcode = $('#q02org').combobox('getValue');
		}
		if(tParam.organcode==null||tParam.organcode=='')
		{
			tParam.organcode = '100000000';	
		}
	}
	
	tParam.acceptStartDate = $('#qacceptStartDate').datebox("getValue");
	tParam.acceptEndDate = $('#qacceptEndDate').datebox("getValue");
	
	displayDataGrid($('#organReportList'), tParam, tturl);
}

</script>
<style>
	table.common {
		width: 100%;
	}
	td.reprot_title {
		width: 7%;
	}
	td.report_common {
		width: 10%;
	}

	.combo {
		width: 95% !important;
	}
	.combo .combo-text {
		width: 75% !important;
	}

	input.txt {
		width: 95%;
	}

	.combo-p {
		width: 13% !important;
	}

	.combo-panel {
		width: 90% !important;
		height: auto !important;
	}

	.combo-arrow {
		float: right;
	}


	td.four_title {
		width: 14%;
	}
</style>
</head>
<body>
<div style="margin-left:0%">
	<table class = "common">
		<tr>
			<td class = "reprot_title">
				出单起期
			</td>
			<td class = "report_common">
				<input class="easyui-datebox" style="width: 160%" id="qacceptStartDate" name="qacceptStartDate" notnull = "出单起期">
			</td>
			<td class = "reprot_title">
				出单止期
			</td>
			<td class = "report_common">
				<input class="easyui-datebox" style="width: 160%" id="qacceptEndDate" name="qacceptEndDate" notnull = "出单止期">
			</td>
		</tr>
		<%@ include file="/WEB-INF/jsp/admin/team/organAndTeamQuery.jsp"%>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "finceReportQuery" onclick = "finceReportQuery()">查询</a>
	<br>
	<br>
	<table id="organReportList" class="easyui-datagrid" title="历史业绩" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<th data-options="field:'yearmonth',width:60">出单月</th>
				
				<th data-options="field:'policycount',width:60">单数</th>
				<th data-options="field:'sumprem',width:80">保费</th>
				<th data-options="field:'sumfyp20',width:80">标保</th>
				<th data-options="field:'usercount',width:60">人数</th>
				
				<th data-options="field:'avg_policycount',width:60">人均单数</th>
				<th data-options="field:'avg_sumprem',width:60">人均保费</th>
				<th data-options="field:'avg_sumfyp20',width:60">人均标保</th>
			</tr>
		</thead>
	</table>
	<br>
 	<font color="red">1. 单数/保费/标保计算公式=所有金额-犹豫期退保金额-冲正金额，且金额定格在下月25日24:00
	<br>2. 人数为当月1号14:00在职员工（P1-P7）</font>
</div>
</body>
</html>