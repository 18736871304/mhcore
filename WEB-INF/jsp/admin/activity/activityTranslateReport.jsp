<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%><head>
<title></title>
<link rel="stylesheet" href="../../../../css/inputbox/line6.css">
<script>

var inputList;
var checkList;

window.onload = function()
{
	initDataGrid20($('#activityTranslateList'));
	
	$('#qdistributeStartDate').datebox('setValue',getMonthOneFormatDate());
	
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
	var tturl = "activity/activityTranslateReport.do";

	var tParam = new Object();
	
	tParam.queryflag = '02';
	
	tParam.hotlineStartDate = $('#qstartdate').datebox("getValue");
	tParam.hotlineEndDate = $('#qenddate').datebox("getValue");
	
	tParam.distributeStartDate = $('#qdistributeStartDate').datebox("getValue");
	tParam.distributeEndDate = $('#qdistributeEndDate').datebox("getValue");
	tParam.channel = $('#qchannel').combobox('getValue');
	tParam.appname = $('#qappname').combobox('getText');
	
	tParam.q02org = $('#q02org').combobox('getValue');
	tParam.q03org = $('#q03org').combobox('getValue');
	tParam.q04org = getOrgan04Code();
	
	tParam.teamid = getQTeamId();
	
	displayDataGrid20($('#activityTranslateList'), tParam, tturl);
	
	var sumurl = "activity/activityTranslateSum.do";
	
	ajaxdeal(sumurl,tParam,displaysumdata,null);
}

function displaysumdata(data)
{
	if(data==null||data=="")
	{
		$('#hotlinecount').val("");
		$('#qwcount').val("");
		$('#qwrate').val("");
		$('#connectcount').val("");
		$('#connectrate').val("");
		$('#follow07count').val("");
	}
	else
	{
		$('#hotlinecount').val(data.hotlinecount);
		$('#qwcount').val(data.qwcount);
		$('#qwrate').val(data.qwrate);
		$('#connectcount').val(data.connectcount);
		$('#connectrate').val(data.connectrate);
		$('#follow07count').val(data.follow07count);
		
		if((data.hotlinecount-0)==0||data.hotlinecount==""||data.hotlinecount==null)
		{
			$('#follow07rate').val('0');
		}
		else
		{
			followrate = 0;
			followrate = Number(data.follow07count)/Number(data.hotlinecount)*100;
			$('#follow07rate').val(followrate.toFixed(2)+'%');
		}
	}
}

function clearCarData()
{
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
<!-- <style>
	table.common {
		width: 100%;
	}

	td.reprot_title {
		width: 4%;
	}

	td.report_common {
		width: 6%;
	}

	.combo {
		width: 95% !important;
	}

	.combo .combo-text {
		width: 80% !important;
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
</style> -->
</head>
<body>
<table class = "common">
	<tr>
		<td class = "reprot_title">
			线索产生起期
		</td>
		<td class = "report_common">
			<input class="easyui-datebox" style="width: 90%" id="qstartdate" name="qstartdate">
		</td>
		
		<td class = "reprot_title">
			线索产生止期
		</td>
		<td class = "report_common">
			<input class="easyui-datebox" style="width: 90%" id="qenddate" name="qenddate">
		</td>
		
		<td class = "reprot_title">
			线索分配起期
		</td>
		<td class = "report_common">
			<input class="easyui-datebox" style="width: 90%" id="qdistributeStartDate" name="qdistributeStartDate">
		</td>
		
		<td class = "reprot_title">
			线索分配止期
		</td>
		<td class = "report_common">
			<input class="easyui-datebox" style="width: 90%" id="qdistributeEndDate" name="qdistributeEndDate">
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
	<table id="activityTranslateList" class="easyui-datagrid" title="热线转化报表" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<th data-options="field:'makedate',width:85">线索产生时间</th>
				<th data-options="field:'channelname',width:60">渠道类型</th>
				<th data-options="field:'appname',width:60">流量来源</th>
				
				<th data-options="field:'hotlinecount',width:70" sortable="true">热线数量</th>
				<th data-options="field:'connectcount',width:70" sortable="true">接通数量</th>
				<th data-options="field:'connectcountrate',width:70" sortable="true">接通率</th>
				
				<th data-options="field:'qwcount',width:70" sortable="true">企微数量</th>
				<th data-options="field:'qwrate',width:70" sortable="true">通过率</th>
				
				<th data-options="field:'follow07count',width:70" sortable="true">已成交</th>
				<th data-options="field:'follow07rate',width:70" sortable="true">已成交率</th>
			</tr>
		</thead>
	</table>
	<br>
	<table class = "common">
		<tr>
			<td class = "reprot_title">
				热线数量合计
			</td>
			<td class = "report_common">
				<input class = "txt" id="hotlinecount" name="hotlinecount" readonly>
			</td>
		</tr>
		<tr>
			<td class = "reprot_title">
				接通数量合计
			</td>
			<td class = "report_common">
				<input class = "txt" id="connectcount" name="connectcount" readonly>
			</td>
			
			<td class = "reprot_title">
				接通率
			</td>
			<td class = "report_common">
				<input class = "txt" id="connectrate" name="connectrate" readonly>
			</td>
			
			<td class = "reprot_title">
				企微数量合计
			</td>
			<td class = "report_common">
				<input class = "txt" id="qwcount" name="qwcount" readonly>
			</td>
			
			<td class = "reprot_title">
				通过率
			</td>
			<td class = "report_common">
				<input class = "txt" id="qwrate" name="qwrate" readonly>
			</td>
			
			<td class = "reprot_title">
				已成交合计
			</td>
			<td class = "report_common">
				<input class = "txt" id="follow07count" name="follow07count" readonly>
			</td>
			
			<td class = "reprot_title">
				已成交率
			</td>
			<td class = "report_common">
				<input class = "txt" id="follow07rate" name="follow07rate" readonly>
			</td>
		</tr>
	</table>
	<br>
</div>
</body>
</html>