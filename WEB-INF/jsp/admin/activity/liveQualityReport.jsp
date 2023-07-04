<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%><head>
<title></title>
<link rel="stylesheet" href="../../../../css/inputbox/line7.css">
<script>

var inputList;
var checkList;

window.onload = function()
{
	initDataGrid20($('#liveQualityList'));
	
	$('#qhotlinestartdate').datebox('setValue',getMonthOneFormatDate());
	
	disComBox($('#qchannel'),"source",null);
	init02Org();
}

function aftercodeselect(comboxid)
{
	if(comboxid.attr("id")=="qchannel")
	{
		var tParam = new Object();
		tParam.comboxType = 'sourcedetail_'+comboxid.combobox('getValue');
		
		var tturl = "activity/getSourceDetail.do";
		displayCombox($('#qappname'),tParam,tturl,"dd_key","dd_value");
	}
	else
	{
		organAfterSelect(comboxid);	
	}
}

function selectone()
{
}

function pusherquery()
{
	var tturl = "activity/liveQualityReport.do";

	var tParam = new Object();
	
	tParam.queryflag = '02';
	
	tParam.hotlineStartDate = $('#qhotlinestartdate').datebox("getValue");
	tParam.hotlineEndDate = $('#qhotlineenddate').datebox("getValue");
	tParam.distributeStartDate = $('#qstartdate').datebox("getValue");
	tParam.distributeEndDate = $('#qenddate').datebox("getValue");
	tParam.channel = $('#qchannel').combobox('getValue');
	tParam.appname = $('#qappname').combobox('getText');
	
	tParam.q02org = $('#q02org').combobox('getValue');
	tParam.q03org = $('#q03org').combobox('getValue');
	tParam.q04org = getOrgan04Code();
	tParam.teamid = getQTeamId();
	
	displayDataGrid20($('#liveQualityList'), tParam, tturl);
	
	var sumurl = "activity/liveQualitySum.do";
	
	ajaxdeal(sumurl,tParam,displaysumdata,null);
}

function displaysumdata(data)
{
	if(data==null||data=="")
	{
		$('#hotlinecount').val("");
		$('#hotlineconnectcount').val("");
		$('#hotlineconnectrate').val("");
		
		$('#tag01count').val("");
		$('#tag02count').val("");
		$('#tag03count').val("");
		$('#tag04count').val("");
		$('#tag05count').val("");
		$('#tag06count').val("");
		
		$('#tag01rate').val("");
		$('#tag02rate').val("");
		$('#tag03rate').val("");
		$('#tag04rate').val("");
		$('#tag05rate').val("");
		$('#tag06rate').val("");
	}
	else
	{
		$('#hotlinecount').val(data.hotlinecount);
		$('#hotlineconnectcount').val(data.hotlineconnectcount);
		$('#hotlineconnectrate').val(data.hotlineconnectrate);
		
		$('#tag01count').val(data.tag01count);
		$('#tag02count').val(data.tag02count);
		$('#tag03count').val(data.tag03count);
		$('#tag04count').val(data.tag04count);
		$('#tag05count').val(data.tag05count);
		$('#tag06count').val(data.tag06count);
		
		$('#tag01rate').val(data.tag01rate);
		$('#tag02rate').val(data.tag02rate);
		$('#tag03rate').val(data.tag03rate);
		$('#tag04rate').val(data.tag04rate);
		$('#tag05rate').val(data.tag05rate);
		$('#tag06rate').val(data.tag06rate);
	}
}

function clearCarData()
{
}

function calPercentage(val,row,index)
{
	return val+"%";
}

function disSourceLevel(val,row,index)
{
	if(val=='A+')
	{
		return 'A理财';	
	}
	else if(val=='A')
	{
		return 'A重疾';	
	}
	else
	{
		return val;
	}
}

</script>
<style>
</style>
</head>
<body>
<table class = "common">
	<tr>
		<td class = "reprot_title">
			线索产生起期
		</td>
		<td class = "report_common">
			<input class="easyui-datebox" style="width: 90%" id="qhotlinestartdate" name="qhotlinestartdate">
		</td>
		
		<td class = "reprot_title">
			线索产生止期
		</td>
		<td class = "report_common">
			<input class="easyui-datebox" style="width: 90%" id="qhotlineenddate" name="qhotlineenddate">
		</td>
		
		<td class = "reprot_title">
			线索分配起期
		</td>
		<td class = "report_common">
			<input class="easyui-datebox" style="width: 90%" id="qstartdate" name="qstartdate">
		</td>
		
		<td class = "reprot_title">
			线索分配止期
		</td>
		<td class = "report_common">
			<input class="easyui-datebox" style="width: 90%" id="qenddate" name="qenddate">
		</td>
		
		<td class = "reprot_title">
			渠道类型
		</td>
		<td class = "report_common">
			<select class = "easyui-combobox" style="width:90%" panelHeight="auto" name="qchannel" id="qchannel">
			</select>
		</td>
	
		<td class = "reprot_title">
			流量来源
		</td>
		<td class = "report_common">
			<select class = "easyui-combobox" style="width: 90%" panelHeight="auto" name="qappname" id="qappname">
			</select>
		</td>
	</tr>
	<%@ include file="/WEB-INF/jsp/admin/team/organAndTeamQuery.jsp"%>
</table>
<br>
<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "pusherquery" onclick = "pusherquery()">查询</a>
<br>
<br>
<div style="margin-left:0%">
	<table id="liveQualityList" class="easyui-datagrid" title="直播质量报表" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<th data-options="field:'makedate',width:85">线索产生时间</th>
				<th data-options="field:'channelname',width:60">渠道类型</th>
				<th data-options="field:'appname',width:60">流量来源</th>
				
				<th data-options="field:'hotlinecount',width:70" sortable="true">热线新增量</th>
				<th data-options="field:'hotlineconnectcount',width:90" sortable="true">热线接通量</th>
				<th data-options="field:'hotlineconnectrate',width:100" sortable="true">热线接通率</th>
				
				<th data-options="field:'tag01count',width:90" sortable="true">高意向保障</th>
				<th data-options="field:'tag01rate',width:100" sortable="true">高意向保障率</th>
				
				<th data-options="field:'tag02count',width:90" sortable="true">高意向理财</th>
				<th data-options="field:'tag02rate',width:100" sortable="true">高意向理财率</th>
				
				<th data-options="field:'tag03count',width:90" sortable="true">保单置换规划</th>
				<th data-options="field:'tag03rate',width:100" sortable="true">保单置换规划率</th>
				
				<th data-options="field:'tag04count',width:90" sortable="true">仅意外医疗</th>
				<th data-options="field:'tag04rate',width:100" sortable="true">仅意外医疗率</th>
				
				<th data-options="field:'tag05count',width:90" sortable="true">其它需求</th>
				<th data-options="field:'tag05rate',width:100" sortable="true">其它需求率</th>
				
				<th data-options="field:'tag06count',width:90" sortable="true">未取得有效沟通</th>
				<th data-options="field:'tag06rate',width:100" sortable="true">未取得有效沟通率</th>
			</tr>
		</thead>
	</table>
	<br>
	<table class = "common">
		<tr>
			<td class = "reprot_title">
				热线新增量合计
			</td>
			<td class = "report_common">
				<input class = "txt" id="hotlinecount" name="hotlinecount" readonly>
			</td>
			<td class = "reprot_title">
				热线接通量合计
			</td>
			<td class = "report_common">
				<input class = "txt" id="hotlineconnectcount" name="hotlineconnectcount" readonly>
			</td>
			
			<td class = "reprot_title">
				热线接通率
			</td>
			<td class = "report_common">
				<input class = "txt" id="hotlineconnectrate" name="hotlineconnectrate" readonly>
			</td>
		</tr>
		<tr>
			<td class = "reprot_title">
				高意向保障
			</td>
			<td class = "report_common">
				<input class = "txt" id="tag01count" name="tag01count" readonly>
			</td>
			<td class = "reprot_title">
				高意向保障率
			</td>
			<td class = "report_common">
				<input class = "txt" id="tag01rate" name="tag01rate" readonly>
			</td>
			
			<td class = "reprot_title">
				高意向理财
			</td>
			<td class = "report_common">
				<input class = "txt" id="tag02count" name="tag02count" readonly>
			</td>
			
			<td class = "reprot_title">
				高意向理财率
			</td>
			<td class = "report_common">
				<input class = "txt" id="tag02rate" name="tag02rate" readonly>
			</td>
			
			<td class = "reprot_title">
				保单置换规划
			</td>
			<td class = "report_common">
				<input class = "txt" id="tag03count" name="tag03count" readonly>
			</td>
			<td class = "reprot_title">
				保单置换规划率
			</td>
			<td class = "report_common">
				<input class = "txt" id="tag03rate" name="tag03rate" readonly>
			</td>
		</tr>
		<tr>
			<td class = "reprot_title">
				仅意外医疗
			</td>
			<td class = "report_common">
				<input class = "txt" id="tag04count" name="tag04count" readonly>
			</td>
			<td class = "reprot_title">
				仅意外医疗率
			</td>
			<td class = "report_common">
				<input class = "txt" id="tag04rate" name="tag04rate" readonly>
			</td>
			
			<td class = "reprot_title">
				其它需求
			</td>
			<td class = "report_common">
				<input class = "txt" id="tag05count" name="tag05count" readonly>
			</td>
			<td class = "reprot_title">
				其它需求率
			</td>
			<td class = "report_common">
				<input class = "txt" id="tag05rate" name="tag05rate" readonly>
			</td>
			
			<td class = "reprot_title">
				未取得有效沟通
			</td>
			<td class = "report_common">
				<input class = "txt" id="tag06count" name="tag06count" readonly>
			</td>
			<td class = "reprot_title">
				未取得有效沟通率
			</td>
			<td class = "report_common">
				<input class = "txt" id="tag06rate" name="tag06rate" readonly>
			</td>
		</tr>
	</table>
	<br>
</div>
</body>
</html>