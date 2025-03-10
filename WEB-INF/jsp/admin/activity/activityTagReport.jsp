<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%><head>
<title></title>
<script>

var inputList;
var checkList;

window.onload = function()
{
	initDataGrid20($('#activityTagList'));
	
	$('#qstartdate').datebox('setValue',getMonthOneFormatDate());
	
	disComBox($('#qchannel'),"source",null);
	
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
	var tturl = "activity/activityTagReport.do";

	var tParam = new Object();
	
	tParam.queryflag = '02';
	
	tParam.hotlineStartDate = $('#qhotlinestartdate').datebox("getValue");
	tParam.hotlineEndDate = $('#qhotlineenddate').datebox("getValue");
	
	tParam.distributeStartDate = $('#qstartdate').datebox("getValue");
	tParam.distributeEndDate = $('#qenddate').datebox("getValue");
	
	tParam.channel = $('#qchannel').combobox('getValue');
	
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
	
	displayDataGrid20($('#activityTagList'), tParam, tturl);
	
	var sumurl = "activity/activityTagSum.do";
	
	ajaxdeal(sumurl,tParam,displaysumdata,null);
}

function displaysumdata(data)
{
	if(data==null||data=="")
	{
		$('#hotlinecount').val("");
		$('#tag14count').val("");
		$('#tag14rate').val("");
		$('#tag15count').val("");
		$('#tag15rate').val("");
		$('#tag16count').val("");
		$('#tag16rate').val("");
		$('#tag11count').val("");
		$('#tag11rate').val("");
		$('#tag09count').val("");
		$('#tag09rate').val("");
		$('#tag12count').val("");
		$('#tag12rate').val("");
		$('#tag13count').val("");
		$('#tag13rate').val("");
		$('#idoveragecount').val("");
		$('#idoveragerate').val("");
		$('#ispeercount').val("");
		$('#ispeerrate').val("");
		$('#isvacantnumbercount').val("");
		$('#isvacantnumberrate').val("");
	}
	else
	{
		$('#hotlinecount').val(data.hotlinecount);
		$('#tag14count').val(data.tag14count+'%');
		$('#tag14rate').val(data.tag14rate+'%');
		$('#tag15count').val(data.tag15count+'%');
		$('#tag15rate').val(data.tag15rate+'%');
		$('#tag16count').val(data.tag16count+'%');
		$('#tag16rate').val(data.tag16rate+'%');
		$('#tag11count').val(data.tag11count+'%');
		$('#tag11rate').val(data.tag11rate+'%');
		$('#tag09count').val(data.tag09count+'%');
		$('#tag09rate').val(data.tag09rate+'%');
		$('#tag12count').val(data.tag12count+'%');
		$('#tag12rate').val(data.tag12rate+'%');
		$('#tag13count').val(data.tag13count+'%');
		$('#tag13rate').val(data.tag13rate+'%');
		$('#idoveragecount').val(data.idoveragecount+'%');
		$('#idoveragerate').val(data.idoveragerate+'%');
		$('#ispeercount').val(data.ispeercount+'%');
		$('#ispeerrate').val(data.ispeerrate+'%');
		$('#isvacantnumbercount').val(data.isvacantnumbercount+'%');
		$('#isvacantnumberrate').val(data.isvacantnumberrate+'%');

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

</script>

</head>
<body>
<table class = "common">
	<tr>
		<td class = "title">
			线索产生起期
		</td>
		<td class = "common">
			<input class="easyui-datebox" style="width: 160%" id="qhotlinestartdate" name="qhotlinestartdate">
		</td>
		<td class = "title">
			线索产生止期
		</td>
		<td class = "common">
			<input class="easyui-datebox" style="width: 160%" id="qhotlineenddate" name="qhotlineenddate">
			(算头不算尾)
		</td>
	</tr>
	<tr>
		<td class = "title">
			线索分配起期
		</td>
		<td class = "common">
			<input class="easyui-datebox" style="width: 160%" id="qstartdate" name="qstartdate">
		</td>
		<td class = "title">
			线索分配止期
		</td>
		<td class = "common">
			<input class="easyui-datebox" style="width: 160%" id="qenddate" name="qenddate">
			(算头不算尾)
		</td>
		<td class = "title">
			渠道类型
		</td>
		<td class = "common">
			<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qchannel" id="qchannel">
			</select>
		</td>
	</tr>
	<tr>
		<td class = "title">
			省公司
		</td>
		<td class = "common">
			<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="q02org" id="q02org">
			</select>
		</td>
		<td class = "title">
			分公司
		</td>
		<td class = "common">
			<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="q03org" id="q03org">
			</select>
		</td>
		<td class = "title">
			营业部
		</td>
		<td class = "common">
			<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="q04org" id="q04org" data-options="multiple:true">
			</select>
		</td>
	</tr>
	
	<%@ include file="/WEB-INF/jsp/admin/team/teamQuery.jsp"%>
</table>
<br>
<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "pusherquery" onclick = "pusherquery()">查询</a>
<br>
<br>
<div style="margin-left:0%">
	<table id="activityTagList" class="easyui-datagrid" title="客户标签报表" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<th data-options="field:'accountid',width:120">账户ID</th>
				<th data-options="field:'planid',width:120">计划ID</th>
				<th data-options="field:'planname',width:200">计划名称</th>
				<th data-options="field:'hotlinecount',width:80" sortable="true">热线数量</th>
				
				<th data-options="field:'tag14count',width:80" sortable="true">未接</th>
				<th data-options="field:'tag14rate',width:80,formatter:calPercentage" sortable="true">未接率</th>
				<th data-options="field:'tag15count',width:80" sortable="true">拒接</th>
				<th data-options="field:'tag15rate',width:80,formatter:calPercentage" sortable="true">拒接率</th>
				<th data-options="field:'tag16count',width:80" sortable="true">秒挂</th>
				<th data-options="field:'tag16rate',width:80,formatter:calPercentage" sortable="true">秒挂率</th>
				<th data-options="field:'tag11count',width:80" sortable="true">非本人</th>
				<th data-options="field:'tag11rate',width:80,formatter:calPercentage" sortable="true">非本人率</th>
				<th data-options="field:'tag09count',width:80" sortable="true">>55周岁</th>
				<th data-options="field:'tag09rate',width:80,formatter:calPercentage" sortable="true">>55周岁率</th>
				<th data-options="field:'tag12count',width:80" sortable="true">语言不通</th>
				<th data-options="field:'tag12rate',width:80,formatter:calPercentage" sortable="true">语言不通率</th>
				
				<th data-options="field:'tag13count',width:80" sortable="true">查询社保</th>
				<th data-options="field:'tag13rate',width:80,formatter:calPercentage" sortable="true">查询社保率</th>
				
				<th data-options="field:'idoveragecount',width:80" sortable="true">非标体</th>
				<th data-options="field:'idoveragerate',width:80,formatter:calPercentage" sortable="true">非标体率</th>
				
				<th data-options="field:'ispeercount',width:80" sortable="true">同行</th>
				<th data-options="field:'ispeerrate',width:80,formatter:calPercentage" sortable="true">同行率</th>
				
				<th data-options="field:'isvacantnumbercount',width:80" sortable="true">空号停机</th>
				<th data-options="field:'isvacantnumberrate',width:80,formatter:calPercentage" sortable="true">空号停机率</th>
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
				未接
			</td>
			<td class = "report_common">
				<input class = "txt" id="tag14count" name="tag14count" readonly>
			</td>
			
			<td class = "reprot_title">
				未接率
			</td>
			<td class = "report_common">
				<input class = "txt" id="tag14rate" name="tag14rate" readonly>
			</td>
			
			<td class = "reprot_title">
				拒接
			</td>
			<td class = "report_common">
				<input class = "txt" id="tag15count" name="tag15count" readonly>
			</td>
			
			<td class = "reprot_title">
				拒接率
			</td>
			<td class = "report_common">
				<input class = "txt" id="tag15rate" name="tag15rate" readonly>
			</td>
			
			<td class = "reprot_title">
				秒挂
			</td>
			<td class = "report_common">
				<input class = "txt" id="tag16count" name="tag16count" readonly>
			</td>
			
			<td class = "reprot_title">
				秒挂率
			</td>
			<td class = "report_common">
				<input class = "txt" id="tag16rate" name="tag16rate" readonly>
			</td>
		</tr>
		<tr>
			<td class = "reprot_title">
				非本人
			</td>
			<td class = "report_common">
				<input class = "txt" id="tag11count" name="tag11count" readonly>
			</td>
			
			<td class = "reprot_title">
				非本人率
			</td>
			<td class = "report_common">
				<input class = "txt" id="tag11rate" name="tag11rate" readonly>
			</td>
			
			<td class = "reprot_title">
				>55周岁
			</td>
			<td class = "report_common">
				<input class = "txt" id="tag09count" name="tag09count" readonly>
			</td>
			
			<td class = "reprot_title">
				>55周岁率
			</td>
			<td class = "report_common">
				<input class = "txt" id="tag09rate" name="tag09rate" readonly>
			</td>
			
			<td class = "reprot_title">
				语言不通
			</td>
			<td class = "report_common">
				<input class = "txt" id="tag12count" name="tag12count" readonly>
			</td>
			
			<td class = "reprot_title">
				语言不通率
			</td>
			<td class = "report_common">
				<input class = "txt" id="tag12rate" name="tag12rate" readonly>
			</td>
		</tr>
		
		<tr>
			<td class = "reprot_title">
				查询社保
			</td>
			<td class = "report_common">
				<input class = "txt" id="tag13count" name="tag13count" readonly>
			</td>
			
			<td class = "reprot_title">
				查询社保率
			</td>
			<td class = "report_common">
				<input class = "txt" id="tag13rate" name="tag13rate" readonly>
			</td>
			
			<td class = "reprot_title">
				非标体
			</td>
			<td class = "report_common">
				<input class = "txt" id="idoveragecount" name="idoveragecount" readonly>
			</td>
			
			<td class = "reprot_title">
				非标体率
			</td>
			<td class = "report_common">
				<input class = "txt" id="idoveragerate" name="idoveragerate" readonly>
			</td>
			
			<td class = "reprot_title">
				同行
			</td>
			<td class = "report_common">
				<input class = "txt" id="ispeercount" name="ispeercount" readonly>
			</td>
			
			<td class = "reprot_title">
				同行率
			</td>
			<td class = "report_common">
				<input class = "txt" id="ispeerrate" name="ispeerrate" readonly>
			</td>
		</tr>
		
		<tr>
			<td class = "reprot_title">
				空号停机
			</td>
			<td class = "report_common">
				<input class = "txt" id="isvacantnumbercount" name="isvacantnumbercount" readonly>
			</td>
			
			<td class = "reprot_title">
				空号停机率
			</td>
			<td class = "report_common">
				<input class = "txt" id="isvacantnumberrate" name="isvacantnumberrate" readonly>
			</td>
		</tr>
	</table>
	<br>
</div>
</body>
</html>