<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%><head>
<title></title>

<script>

window.onload = function()
{
	initDataGrid20($('#policyList'));
	
	init02Org();
	
	disComBox($('#qusergrade'),"usergrade",null);
	$('#qacceptStartDate').datebox('setValue',getMonthOneFormatDate());
	displayCombox($('#qriskType'),null,"/jsondata/policy/risktypestr.json","dd_key","dd_value");
}

function aftercodeselect(comboxid)
{
	organAfterSelect(comboxid);
}

function selectone()
{

}

function fypquery(orderbystr)
{
	if($('#qacceptStartDate').datebox("getValue")==null||$('#qacceptStartDate').datebox("getValue")=="")
	{
		$.messager.alert('操作提示','起始日期不能为空！','info');
		return
	}
	
	var tturl = "policy/getAgentFypList.do";

	var tParam = new Object();

	tParam.state = '40';
	tParam.agentflag = '02';
	
	tParam.q02org = $('#q02org').combobox('getValue');
	tParam.q03org = $('#q03org').combobox('getValue');
	tParam.q04org = getOrgan04Code();
	
	tParam.teamid = getQTeamId();
	
	tParam.acceptStartDate = $('#qacceptStartDate').datebox("getValue");
	tParam.acceptEndDate = $('#qacceptEndDate').datebox("getValue");
	
	tParam.orderby = orderbystr + " desc ";
	tParam.riskTypeStr = $('#qriskType').combobox('getValue');
	tParam.usergrade = $('#qusergrade').combobox('getValue');
	
	displayDataGrid20($('#policyList'), tParam, tturl);

	var sumurl = "policy/getPolicySum.do";
	
	ajaxdeal(sumurl,tParam,displaysumdata,null);
}

function displaysumdata(data)
{
	if(data==null||data=="")
	{
		$('#sumprem').val("");
		$('#policycount').val("");
		$('#sumfyp').val("");
		$('#sumfyp20').val("");
	}
	else
	{
		$('#sumprem').val(data.sumprem);
		$('#policycount').val(data.policycount);
		$('#sumfyp').val(data.sumfyp);
		$('#sumfyp20').val(data.sumfyp20);
	}
}

function getMonthOneFormatDate()
{
	var date = new Date();
    
    var seperator1 = "-";
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = year + seperator1 + month + seperator1 + "01";
    return currentdate;
}

</script>
<link rel="stylesheet" href="../../../css/inputbox/line3.css?v_2022_05_16">
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
			
			<td class = "reprot_title">
				险种类型
			</td>
			<td class = "report_common">
				<select class = "easyui-combobox" style="width: 90%" panelHeight="auto" name="qriskType" id="qriskType">
				</select>
			</td>
			
			<td class = "reprot_title">
				职能级别
			</td>
			<td class = "report_common">
				<select class = "easyui-combobox" panelHeight="auto" style="width:160%" name="qusergrade" id="qusergrade">
				</select>
			</td>
			
			<td></td><td></td>
			<td></td><td></td>
		</tr>
		<%@ include file="/WEB-INF/jsp/admin/team/organAndTeamQuery.jsp"%>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "fypquery" onclick = "fypquery('policycount')">按单数排名</a>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "fypquery" onclick = "fypquery('sumfyp20order')">按标保排名</a>
	<br>
	<br>
	<table id="policyList" class="easyui-datagrid" title="个人排名" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<th data-options="field:'agentcom',width:70">所属营业部 </th>
				<th data-options="field:'teamname',width:100">所属团队</th>
				
				<th data-options="field:'usergradename',width:80">职能级别</th>
				<th data-options="field:'reusername',width:70">出单业务员</th>
				
				<th data-options="field:'policycount',width:60">单数</th>
				<th data-options="field:'sumprem',width:80">保费</th>
				<th data-options="field:'sumfyp20',width:80">标保</th> 
				<th data-options="field:'sumnianfyp20',width:80">年缴标保</th>
				<th data-options="field:'sumyuefyp20',width:80">月缴标保</th>
				<th data-options="field:'workyears',width:70">司龄（月）</th>
			</tr>
		</thead>
	</table>
	<br>
	<table class = "common" style="width: 73.5%;">
		<tr>
			<td class = "reprot_title">
				单数合计
			</td>
			<td class = "report_common">
				<input class = "txt" id="policycount" name="policycount" readonly>
			</td>
			<td class = "reprot_title">
				保费合计
			</td>
			<td class = "report_common">
				<input class = "txt" id="sumprem" name="sumprem" readonly>
			</td>
			<td class = "reprot_title">
				标保合计
			</td>
			<td class = "report_common">
				<input class = "txt" id="sumfyp20" name="sumfyp20" readonly>
			</td>
		
		</tr>
		<tr hidden = "">
			<td class = "reprot_title">
				FYP合计
			</td>
			<td class = "report_common">
				<input class = "txt" id="sumfyp" name="sumfyp" readonly>
			</td>
		</tr>
	</table>
</div>
</body>
</html>