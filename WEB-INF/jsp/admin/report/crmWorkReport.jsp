<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%><head>
	<title></title>
<script>

var inputList;
var checkList;
var doubleList;

window.onload = function()
{
	initDataGrid20($('#crmworklist'));
	
	disComBox($('#qusergrade'),"usergradeP1_7",null);
	
	$('#qstartDate').datebox('setValue',getNowDate());
	$('#qendDate').datebox('setValue',getTomorrowDate());
	
	setRowsHeight(36);
	
	init02Org();
}

function setRowsHeight(height)
{

}

function aftercodeselect(comboxid)
{
	organAfterSelect(comboxid);
}

function selectone()
{
}

function saveSuss()
{
}

function crmworkquery()
{
	if($('#qstartDate').datebox("getValue")==null||$('#qstartDate').datebox("getValue")=="")
	{
		$.messager.alert('操作提示','起始日期不能为空！','info');
		return
	}
	
	if($('#qendDate').datebox("getValue")==null||$('#qendDate').datebox("getValue")=="")
	{
		$.messager.alert('操作提示','终止日期不能为空！','info');
		return
	}
	
	var tturl = "report/getOrganDataList.do";

	var tParam = new Object();
	
	tParam.dataflag = "02";
	tParam.state = "01','02";
	tParam.usertype = '02';
	tParam.querytype = '0000001';
	
	tParam.recorddateStart = $('#qstartDate').datebox("getValue");
	tParam.recorddateEnd = $('#qendDate').datebox("getValue");
	tParam.usergrade = $('#qusergrade').combobox('getValue');
	
	tParam.q02org = $('#q02org').combobox('getValue');
	tParam.q03org = $('#q03org').combobox('getValue');
	tParam.q04org = getOrgan04Code();
	tParam.teamid = getQTeamId();
	tParam.position = '001';
	
	displayDataGrid20($('#crmworklist'), tParam, tturl);
	
	setRowsHeight(36);
	initDataGrid20($('#crmworklist'));
	
	ajaxdeal("report/getAgentSumData.do",tParam,displaysumdata,null);
}

function displaysumdata(data)
{
	$('#hotlinecount').val(data.hotlinecount);
	$('#callcentertime').val(data.callcentertime);
	$('#callcount').val(data.callcount);
	$('#connectcount').val(data.connectcount);
	$('#connectrate').val(data.connectrate);
	$('#cluecallcount').val(data.cluecallcount);
	
	$('#follow01count').val(data.follow01count);
	$('#follow02count').val(data.follow02count);
	$('#follow03count').val(data.follow03count);
	$('#follow04count').val(data.follow04count);
	$('#follow05count').val(data.follow05count);
}

function getNowDate()
{
	var curDate = new Date();
	
    var date = new Date(curDate.getTime() - 0);
    
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
    var currentdate = year + seperator1 + month + seperator1 + strDate;
    return currentdate;
}

function getTomorrowDate()
{
	var curDate = new Date();
	
    var date = new Date(curDate.getTime() + 24*60*60*1000);
    
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
    var currentdate = year + seperator1 + month + seperator1 + strDate;
    return currentdate;
}

</script>

<style>
	table.common {
		width: 100%;
	}

	.common .reprot_title {
		width: 6%;
	}

	.combo .combo-text {
		width: 80% !important;
	}

	.report_common .txt {
		width: 95%;
	}



	tr .report_common {
		width: 10%;
	}

	.combo {
		width: 95% !important;
	}



	/* .common .txt {
		width: 55%;
	} */
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
</style>

</head>
<body>
<div style="margin-left:0%">
	<table class = "common">
		<tr>
			<td class = "reprot_title">
				数据起期
			</td>
			<td class = "report_common">
				<input class="easyui-datebox" style="width:160%" name="qstartDate" id="qstartDate">
			</td>
			<td class = "reprot_title">
				数据止期
			</td>
			<td class = "report_common">
				<input class="easyui-datebox" style="width:160%" name="qendDate" id="qendDate">
			</td>
			
			<td class = "reprot_title">
				职能级别
			</td>
			<td class = "report_common">
				<select class = "easyui-combobox" panelHeight="auto" style="width:160%" name="qusergrade" id="qusergrade">
				</select>
			</td>
		</tr>
		
		<%@ include file="/WEB-INF/jsp/admin/team/organAndTeamQuery.jsp"%>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "crmworkquery" onclick = "crmworkquery()">查询</a>
	<br>
	<br>
	<table id="crmworklist" class="easyui-datagrid" title="CRM工作报表" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<th data-options="field:'agentcom',width:70">所属营业部</th>
				<th data-options="field:'teamname',width:100">所属团队</th>
				<th data-options="field:'username',width:70">业务员姓名</th>
				<th data-options="field:'usergradename',width:80">职能级别</th>
				<th data-options="field:'hotlinecount',width:80" sortable="true">热线新增量 </th>
				
				<th data-options="field:'callcount',width:80" sortable="true">电话外拨量</th>
				<th data-options="field:'connectcount',width:80" sortable="true">电话接通量</th>
				<th data-options="field:'connectrate',width:80" sortable="true">电话接通率 </th>
				
				<th data-options="field:'cluecallcount',width:80" sortable="true">线索拨打量</th>
				<th data-options="field:'callcentertime',width:80" sortable="true">话务时长</th>
				
				<th data-options="field:'follow01count',width:80" sortable="true">微信</th>
				<th data-options="field:'follow02count',width:80" sortable="true">配置方案</th>
				<th data-options="field:'follow03count',width:80" sortable="true">认清市场</th>
				<th data-options="field:'follow04count',width:80" sortable="true">渠道服务</th>
				<th data-options="field:'follow05count',width:80" sortable="true">促销T单</th>
			</tr>
		</thead>
	</table>
	<br>
	<table class = "common">
		<tr>
			<td class = "reprot_title">
				热线新增量
			</td>
			<td class = "report_common">
				<input class = "txt" name="hotlinecount" id="hotlinecount" readonly>
			</td>
			
			<td class = "reprot_title">
				电话外拨量
			</td>
			<td class = "report_common">
				<input class = "txt" name="callcount" id="callcount" readonly>
			</td>
			<td class = "reprot_title">
				电话接通量
			</td>
			<td class = "report_common">
				<input class = "txt" name="connectcount" id="connectcount" readonly>
			</td>
			
			<td class = "reprot_title">
				电话接通率
			</td>
			<td class = "report_common">
				<input class = "txt" name="connectrate" id="connectrate" readonly>
			</td>
			
			<td class = "reprot_title">
				线索拨打量
			</td>
			<td class = "report_common">
				<input class = "txt" name="cluecallcount" id="cluecallcount" readonly>
			</td>
			
			<td class = "reprot_title">
				话务时长
			</td>
			<td class = "report_common">
				<input class = "txt" name="callcentertime" id="callcentertime" readonly>
			</td>
		</tr>
		<tr>
			<td class = "reprot_title">
				微信
			</td>
			<td class = "report_common">
				<input class = "txt" name="follow01count" id="follow01count" readonly>
			</td>
			
			<td class = "reprot_title">
				配置方案
			</td>
			<td class = "report_common">
				<input class = "txt" name="follow02count" id="follow02count" readonly>
			</td>
			
			<td class = "reprot_title">
				认清市场
			</td>
			<td class = "report_common">
				<input class = "txt" name="follow03count" id="follow03count" readonly>
			</td>
			
			<td class = "reprot_title">
				渠道服务
			</td>
			<td class = "report_common">
				<input class = "txt" name="follow04count" id="follow04count" readonly>
			</td>
			
			<td class = "reprot_title">
				促销T单
			</td>
			<td class = "report_common">
				<input class = "txt" name="follow05count" id="follow05count" readonly>
			</td>
		</tr>
	</table>
	<br>
	<font color="red">热线新增量、电话外拨量、电话接通量、电话接通率、线索拨打量、话务时长：数据一小时更新一次
	<br>微信、配置方案、认清市场、渠道服务、促销T单：数据实时同步CRM</font>
</div>
</body>
</html>
