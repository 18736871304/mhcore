<%@ page contentType="text/html;charset=utf-8"%>

<script>

function initsalaryDetailDlg()
{
	$('#salaryDetailDlg').dialog('close');
	
	initDataGrid($('#salaryDetaillist'));
}

function dissalaryDetailDlg(agentcode,commmonth)
{
	$('#salaryDetailDlg').dialog('open');
	
	var tturl = "salary/getSalaryDetail.do";

	var tParam = new Object();

	tParam.commmonth = commmonth;
	tParam.agentcode = agentcode;
	
	displayDataGrid($('#salaryDetaillist'), tParam, tturl);
	
	var sumurl = "salary/getAgentcommSum.do";
	
	ajaxdeal(sumurl,tParam,displaysumdata,null);
}

function displaysumdata(data)
{
	$('#sumprem').val(data.sumprem);
	$('#policycount').val(data.policycount);
	$('#sumfyp').val(data.sumfyp);
	
	$('#sumfyc').val(data.sumfyc);
}


</script>
<div id="salaryDetailDlg" class="easyui-dialog" title="保单明细查询" 
		style="width:1050px;height:450px;padding:10px" 
		data-options="iconCls: 'icon-save',">
		
	<table id="salaryDetaillist" class="easyui-datagrid" style="width:1000px;height:320px"
	data-options="rownumbers:true,singleSelect:true,pagination:true" >
		<thead>
			<tr>
				<th data-options="field:'agentcode',width:70">员工工号</th>
				<th data-options="field:'agentname',width:70">员工姓名</th>
				<th data-options="field:'policyno',width:140">保单号码</th>
				<th data-options="field:'riskname',width:190">险种名称</th>
				<th data-options="field:'prem',width:60">保费</th>
				<th data-options="field:'agentrate',width:60">费率</th>
				<th data-options="field:'agentfee',width:60">FYC</th>
				<th data-options="field:'fyp',width:60">FYP</th>
				
				<th data-options="field:'payendyear',width:60">缴费年期</th>
				<th data-options="field:'payendyearflag',width:80">缴费年期单位</th>
				<th data-options="field:'accepttime',width:140">出单日期</th>
				<th data-options="field:'caldate',width:140">核算日期</th>
				<th data-options="field:'amnt',width:60">保额</th>
			</tr>
		</thead>
	</table>
	<br>
	<table class = "common">
		<tr>
			<td class = "title">
				保单合计：
			</td>
			<td class = "common">
				<input class = "txt" id="policycount" name="policycount" readonly>
			</td>
			<td class = "title">
				保费合计：
			</td>
			<td class = "common">
				<input class = "txt" id="sumprem" name="sumprem" readonly>
			</td>
			<td class = "title">
				FYP合计：
			</td>
			<td class = "common">
				<input class = "txt" id="sumfyp" name="sumfyp" readonly>
			</td>
		</tr>
		<tr>
			<td class = "title">
				FYC合计：
			</td>
			<td class = "common">
				<input class = "txt" id="sumfyc" name="sumfyc" readonly>
			</td>
		</tr>
	</table>
		
</div>