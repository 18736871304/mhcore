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
	initDataGrid20($('#activityQualityList'));
	
	$('#qstartdate').datebox('setValue',getMonthOneFormatDate());
	
	disComBox($('#qchannel'),"source",null);
	disComBox($('#qinitSourceLevel'),"hotline_sourcelevle",null);
	
	var tturl = "policy/get02Org.do";
	displayCombox($('#q02org'),null,tturl,"dd_key","dd_value");
}

function aftercodeselect(comboxid)
{
	if(comboxid.attr("id")=="q02org")
	{	
		var tParam = new Object();
		tParam.organcode = comboxid.combobox('getValue');
		
		var tturl1 = "policy/get03Org.do";
		
		displayCombox($('#q03org'),tParam,tturl1,"dd_key","dd_value");
	}
	else if(comboxid.attr("id")=="q03org")
	{
		var tParam = new Object();
		tParam.organcode = comboxid.combobox('getValue');
		
		var tturl1 = "policy/get04Org.do";
		
		displayCombox($('#q04org'),tParam,tturl1,"dd_key","dd_value");
	}
	else
	{
		teamAfterSelect(comboxid);
	}
}

function selectone()
{
}

function pusherquery()
{
	var tturl = "activity/activityQualityReport.do";

	var tParam = new Object();
	
	tParam.queryflag = '02';
	
	tParam.hotlineStartDate = $('#qhotlinestartdate').datebox("getValue");
	tParam.hotlineEndDate = $('#qhotlineenddate').datebox("getValue");
	
	tParam.distributeStartDate = $('#qstartdate').datebox("getValue");
	tParam.distributeEndDate = $('#qenddate').datebox("getValue");
	
	var channel = $('#qchannel').combobox('getValue');
	if (channel.length == 4) {
		tParam.channel = channel;
	} else if (channel.length > 4) {
		tParam.channeldetail = channel;
	}
	//tParam.channel = $('#qchannel').combobox('getValue');
	
	tParam.initSourceLevel = $('#qinitSourceLevel').combobox('getValue');
	
	tParam.accountid = $('#qaccountid').val();
	tParam.planid = $('#qplanid').val();
	
	tParam.q02org = $('#q02org').combobox('getValue');
	tParam.q03org = $('#q03org').combobox('getValue');
	
	var q04org_codes = $('#q04org').combobox('getValues');
    var q04orgStr = "";

	q04orgStr = q04org_codes.join(","); 
    // for(var i=0;i<q04org_codes.length;i++)
    // {
    //     if (q04orgStr != "") 
    //     {
    //     	q04orgStr += "','";
    //     }
    //     q04orgStr += q04org_codes[i];
    // }
	tParam.q04org = q04orgStr;
	
	tParam.teamid = getQTeamId();
	
	displayDataGrid20($('#activityQualityList'), tParam, tturl);
	
	var sumurl = "activity/activityQualitySum.do";
	
	ajaxdeal(sumurl,tParam,displaysumdata,null);
}

function displaysumdata(data)
{
	if(data==null||data=="")
	{
		$('#hotlinecount').val("");
		$('#hotlineconnectcount').val("");
		$('#hotlineconnectrate').val("");
		$('#otherstore01').val("");
		$('#otherstore02').val("");
		$('#otherstore03').val("");
		$('#otherstore04').val("");
		
		$('#otherstore01rate').val("");
		$('#otherstore02rate').val("");
		$('#otherstore03rate').val("");
		$('#otherstore04rate').val("");
	}
	else
	{
		$('#hotlinecount').val(data.hotlinecount);
		$('#hotlineconnectcount').val(data.hotlineconnectcount);
		$('#hotlineconnectrate').val(data.hotlineconnectrate);
		$('#otherstore01').val(data.otherstore01);
		$('#otherstore02').val(data.otherstore02);
		$('#otherstore03').val(data.otherstore03);
		$('#otherstore04').val(data.otherstore04);
		
		$('#otherstore01rate').val(data.otherstore01rate);
		$('#otherstore02rate').val(data.otherstore02rate);
		$('#otherstore03rate').val(data.otherstore03rate);
		$('#otherstore04rate').val(data.otherstore04rate);
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


	td.reprot_title {
		width: 6%;
	}


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
			初始资源等级
		</td>
		<td class = "report_common">
		<select class = "easyui-combobox" style="width:90%" panelHeight="auto" name="qinitSourceLevel" id="qinitSourceLevel">
			</select>
		</td>
	</tr>
	
	<tr>
		<td class = "reprot_title">
			账户ID
		</td>
		<td class = "report_common">
			<input class = "txt" name="qaccountid" id="qaccountid">
		</td>
	
		<td class = "reprot_title">
			广告计划ID
		</td>
		<td class = "report_common">
			<input class = "txt" name="qplanid" id="qplanid">
		</td>
	</tr>
	
	<%@ include file="/WEB-INF/jsp/admin/team/organAndTeamQuery.jsp"%>
</table>
<br>
<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "pusherquery" onclick = "pusherquery()">查询</a>
<br>
<br>
<div style="margin-left:0%">
	<table id="activityQualityList" class="easyui-datagrid" title="热线质量报表" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<th data-options="field:'accountid',width:115">账户ID</th>
				<th data-options="field:'planid',width:115">广告计划ID</th>
				<th data-options="field:'planname',width:200">广告计划名称</th>
				<th data-options="field:'initsourcelevel',width:80,formatter:disSourceLevel">初始资源等级</th>
				
				<th data-options="field:'hotlinecount',width:70" sortable="true">热线新增量</th>
				<th data-options="field:'hotlineconnectcount',width:70" sortable="true">热线接通量</th>
				<th data-options="field:'hotlineconnectrate',width:70" sortable="true">热线接通率</th>
				
				<th data-options="field:'otherstore01',width:70" sortable="true">非标体客户</th>
				<th data-options="field:'otherstore01rate',width:70" sortable="true">非标体客户率</th>
				<th data-options="field:'otherstore02',width:70" sortable="true">高龄客户</th>
				<th data-options="field:'otherstore02rate',width:70" sortable="true">高龄客户率</th>
				<th data-options="field:'otherstore03',width:70" sortable="true">同行资源</th>
				<th data-options="field:'otherstore03rate',width:70" sortable="true">同行资源率</th>
				<th data-options="field:'otherstore04',width:70" sortable="true">空号停机</th>
				<th data-options="field:'otherstore04rate',width:70" sortable="true">空号停机率</th>
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
				非标体客户
			</td>
			<td class = "report_common">
				<input class = "txt" id="otherstore01" name="otherstore01" readonly>
			</td>
			<td class = "reprot_title">
				非标体客户率
			</td>
			<td class = "report_common">
				<input class = "txt" id="otherstore01rate" name="otherstore01rate" readonly>
			</td>
			
			<td class = "reprot_title">
				高龄客户
			</td>
			<td class = "report_common">
				<input class = "txt" id="otherstore02" name="otherstore02" readonly>
			</td>
			
			<td class = "reprot_title">
				高龄客户率
			</td>
			<td class = "report_common">
				<input class = "txt" id="otherstore02rate" name="otherstore02rate" readonly>
			</td>
			
			<td class = "reprot_title">
				同行资源
			</td>
			<td class = "report_common">
				<input class = "txt" id="otherstore03" name="otherstore03" readonly>
			</td>
			<td class = "reprot_title">
				同行资源率
			</td>
			<td class = "report_common">
				<input class = "txt" id="otherstore03rate" name="otherstore03rate" readonly>
			</td>
		</tr>
		<tr>
			<td class = "reprot_title">
				空号停机
			</td>
			<td class = "report_common">
				<input class = "txt" id="otherstore04" name="otherstore04" readonly>
			</td>
			<td class = "reprot_title">
				空号停机率
			</td>
			<td class = "report_common">
				<input class = "txt" id="otherstore04rate" name="otherstore04rate" readonly>
			</td>
		</tr>
	</table>
	<br>
</div>
</body>
</html>