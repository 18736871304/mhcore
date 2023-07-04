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
	initDataGrid20($('#calldatalist'));
	
	disComBox($('#qusergrade'),"usergradeP1_7",null);
	
	init02Org();
	
	$('#qstartDate').datebox('setValue',getNowDate());
	$('#qendDate').datebox('setValue',getTomorrowDate());
	//$('#q02org').combobox('setValue','100100000');
	
	setRowsHeight(36);
}

function setRowsHeight(height)
{	
	var aa = $("td[field=callcentertime] div:first");
    if(aa!=null)
    {
    	aa.css("height",height);	
    }
}

function aftercodeselect(comboxid)
{
	organAfterSelect(comboxid);
	teamAfterSelect(comboxid);
}

function selectone()
{
}

function saveSuss()
{
}

function daydataquery()
{
	if($('#qstartDate').datebox("getValue")==null||$('#qstartDate').datebox("getValue")=="")
	{
		$.messager.alert('操作提示','起始日期不能为空！','info');
		return
	}
	
	if($('#qendDate').datebox("getValue")==null||$('#qendDate').datebox("getValue")=="")
	{
		$.messager.alert('操作提示','起始日期不能为空！','info');
		return
	}
	
	var tturl = "report/getOrganDataList.do";

	var tParam = new Object();
	
	tParam.dataflag = "02";
	tParam.state = "01','02";
	tParam.usertype = '02';
		
	tParam.recorddateStart = $('#qstartDate').datebox("getValue");
	tParam.recorddateEnd = $('#qendDate').datebox("getValue");
	tParam.usergrade = $('#qusergrade').combobox('getValue');
	
	tParam.q02org = $('#q02org').combobox('getValue');
	tParam.q03org = $('#q03org').combobox('getValue');
	tParam.q04org = getOrgan04Code();
	
	tParam.teamid = getQTeamId();
	
	displayDataGrid20($('#calldatalist'), tParam, tturl);
	
	setRowsHeight(36);
	initDataGrid20($('#calldatalist'));
	
	ajaxdeal("report/getAgentSumData.do",tParam,displaysumdata,null);
}

function displaysumdata(data)
{
	$('#callcentertime').val(data.callcentertime);
	$('#callcount').val(data.callcount);
	$('#connectcount').val(data.connectcount);
	$('#connectrate').val(data.connectrate);
	$('#cluecallcount').val(data.cluecallcount);
	$('#clueconnectcount').val(data.clueconnectcount);
	$('#clueconnectrate').val(data.clueconnectrate);
	$('#hotlinecount').val(data.hotlinecount);
	$('#hotlinecallcount').val(data.hotlinecallcount);
	$('#hotlineconnectcount').val(data.hotlineconnectcount);
	$('#hotlineconnectrate').val(data.hotlineconnectrate);
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

</head>
<body>
<div style="margin-left:0%">
	<table class = "common">
		<tr>
			<td class = "title">
				数据起期
			</td>
			<td class = "common">
				<input class="easyui-datebox" style="width:160%" name="qstartDate" id="qstartDate">
			</td>
			<td class = "title">
				数据止期
			</td>
			<td class = "common">
				<input class="easyui-datebox" style="width:160%" name="qendDate" id="qendDate">
				(算头不算尾)
			</td>
			
			<td class = "title">
				职能级别
			</td>
			<td class = "common">
				<select class = "easyui-combobox" panelHeight="auto" style="width:160%" name="qusergrade" id="qusergrade">
				</select>
			</td>
		</tr>
		
		<%@ include file="/WEB-INF/jsp/admin/organ/organQuery.jsp"%>
		<%@ include file="/WEB-INF/jsp/admin/team/teamQuery.jsp"%>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "daydataquery" onclick = "daydataquery()">CRM呼量报表查询</a>
	<br>
	<br>
	<table id="calldatalist" class="easyui-datagrid" title="CRM呼量报表" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<th data-options="field:'organ02name',width:90">所属省公司</th>
				<th data-options="field:'organname',width:90">所属分公司</th>
				<th data-options="field:'agentcom',width:90">所属营业部</th>
				<th data-options="field:'teamname',width:120">所属团队</th>
				<th data-options="field:'username',width:80">业务员姓名</th>
				
				<th data-options="field:'callcentertime',width:80" sortable="true">话务时长<br/>（分钟）</th>
				<th data-options="field:'callcount',width:80" sortable="true">电话外拨量</th>
				<th data-options="field:'connectcount',width:80" sortable="true">电话接通量</th>
				<th data-options="field:'connectrate',width:80" sortable="true">电话接通率 </th>
				
				<th data-options="field:'cluecallcount',width:80" sortable="true">线索拨打量</th>
				<th data-options="field:'clueconnectcount',width:80" sortable="true">线索接通量</th>
				<th data-options="field:'clueconnectrate',width:80" sortable="true">线索接通率</th>
				
				<th data-options="field:'hotlinecount',width:80" sortable="true">热线新增量 </th>
				<th data-options="field:'hotlinecallcount',width:80" sortable="true">热线拨打量</th>
				<th data-options="field:'hotlineconnectcount',width:80" sortable="true">热线接通量</th>
				<th data-options="field:'hotlineconnectrate',width:80" sortable="true">热线接通率</th>
			</tr>
		</thead>
	</table>
	<br>
	<table>
		<tr>
			<td class = "reprot_title">
				话务时长（分钟）
			</td>
			<td class = "report_common">
				<input class = "txt" name="callcentertime" id="callcentertime" readonly>
			</td>
		</tr>
		<tr>
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
				线索接通量
			</td>
			<td class = "report_common">
				<input class = "txt" name="clueconnectcount" id="clueconnectcount" readonly>
			</td>
			
			<td class = "reprot_title">
				线索接通率
			</td>
			<td class = "report_common">
				<input class = "txt" name="clueconnectrate" id="clueconnectrate" readonly>
			</td>
		</tr>
		
		<tr>
			<td class = "reprot_title">
				热线新增量
			</td>
			<td class = "report_common">
				<input class = "txt" name="hotlinecount" id="hotlinecount" readonly>
			</td>
			
			<td class = "reprot_title">
				热线拨打量
			</td>
			<td class = "report_common">
				<input class = "txt" name="hotlinecallcount" id="hotlinecallcount" readonly>
			</td>
			
			<td class = "reprot_title">
				热线接通量
			</td>
			<td class = "report_common">
				<input class = "txt" name="hotlineconnectcount" id="hotlineconnectcount" readonly>
			</td>
			
			<td class = "reprot_title">
				热线接通率
			</td>
			<td class = "report_common">
				<input class = "txt" name="hotlineconnectrate" id="hotlineconnectrate" readonly>
			</td>
		</tr>
	
	</table>
	<br>
	<font color="red">此报表一小时更新一次</font>
</div>
</body>
</html>
