<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%><head>
	<title></title>
	<link rel="stylesheet" href="../../../../css/inputbox/line6.css">
<script>

var inputList;
var checkList;
var doubleList;

window.onload = function()
{
	initDataGrid($('#activitydistributelist'));
	
	inputList = [
				$('#sunday'),
				$('#monday'),
				$('#tuesday'),
				$('#wednesday'),
				$('#thursday'),
				$('#friday'),
				$('#saturday'),
	 	];

	 checkList = [
				$('#sunday'),
				$('#monday'),
				$('#tuesday'),
				$('#wednesday'),
				$('#thursday'),
				$('#friday'),
				$('#saturday'),
	 	];
	
	disComBox($('#qorgancode'),"crmsysterm",null);
	//$('#qorgancode').combobox('setValue','100100101');
	
	disComBox($('#sunday'),"yesno",null);
	disComBox($('#monday'),"yesno",null);
	disComBox($('#tuesday'),"yesno",null);
	disComBox($('#wednesday'),"yesno",null);
	disComBox($('#thursday'),"yesno",null);
	disComBox($('#friday'),"yesno",null);
	disComBox($('#saturday'),"yesno",null);
	
	activityDistributeQuery();
}

function aftercodeselect(comboxid)
{
}

function selectone()
{
	var row = $('#activitydistributelist').datagrid('getSelected');
	
	//.combobox('setValue',row.insorgancode);
	$('#sunday').combobox('setValue',row.sunday);
	$('#monday').combobox('setValue',row.monday);
	$('#tuesday').combobox('setValue',row.tuesday);
	$('#wednesday').combobox('setValue',row.wednesday);
	$('#thursday').combobox('setValue',row.thursday);
	$('#friday').combobox('setValue',row.friday);
	$('#saturday').combobox('setValue',row.saturday);
}

function saveSuss()
{
	clearData();
	$('#activitydistributelist').datagrid('reload');
}

function clearData() 
{
	cleardata(inputList);
}

function activityDistributeQuery()
{
	var tturl = "activity/getActivityDistributeOrganList.do";

	var tParam = new Object();
	
	tParam.organcode = $('#qorgancode').combobox('getValue');
	
	displayDataGrid($('#activitydistributelist'), tParam, tturl,null);

	clearData();
}

function activityDistributeUpdate()
{
	var row = $('#activitydistributelist').datagrid('getSelected');
	if(row==null)
	{
		$.messager.alert('操作提示','请选中要操作的数据！','error');
		return;
	}
	
	if(!checknotnull(checkList))
	{
		return;
	}

	var tparam = prepareparam(inputList);
	tparam.distributeid = row.distributeid;

	ajaxdeal("activity/activityDistributeOrganUpdate.do",tparam,null,null,saveSuss);
}

</script>
<!-- <style>
	table.common {
		width: 100%;
	}
	.common .reprot_title {
		width: 6%;
	}
	.combo .combo-text {
		width: 84% !important;
	}
	.report_common .txt {
		width: 100%;
	}
	tr .report_common {
		width: 10%;
	}
	.combo {
		width: 100% !important;
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
</style> -->
</head>
<body>
<div style="margin-left:0%">
	<table class = "common" hidden>
		<tr>
			<td class = "title">
				CRM系统
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qorgancode" id="qorgancode">
				</select>
			</td>
			<td></td><td></td>
			<td></td><td></td>
		</tr>
	</table>
	<br>
	<table id="activitydistributelist" class="easyui-datagrid" title="营业部热线分配" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<th data-options="field:'organname',width:100">CRM系统</th>
				<th data-options="field:'sundayname',width:70">星期日</th>
				<th data-options="field:'mondayname',width:70">星期一</th>
				<th data-options="field:'tuesdayname',width:70">星期二</th>
				<th data-options="field:'wednesdayname',width:70">星期三</th>
				<th data-options="field:'thursdayname',width:70">星期四</th>
				<th data-options="field:'fridayname',width:70">星期五</th>
				<th data-options="field:'saturdayname',width:70">星期六</th>
			</tr>
		</thead>
	</table>
	<br>
	<table class = "common">
		<tr>
			<td class = "four_title">
				星期日
			</td>
			<td class = "four_common">
				<select  editable="false" class = "easyui-combobox" style="width:70%" panelHeight="auto" name="sunday" id="sunday" notnull = "星期日">
				</select>
			</td>
			
			<td class = "four_title">
				星期一
			</td>
			<td class = "four_common">
				<select  editable="false" class = "easyui-combobox" style="width:70%" panelHeight="auto" name="monday" id="monday" notnull = "星期一">
				</select>
			</td>
			
			<td class = "four_title">
				星期二
			</td>
			<td class = "four_common">
				<select  editable="false" class = "easyui-combobox" style="width:70%" panelHeight="auto" name="tuesday" id="tuesday" notnull = "星期二">
				</select>
			</td>
			
			<td class = "four_title">
				星期三
			</td>
			<td class = "four_common">
				<select  editable="false" class = "easyui-combobox" style="width:70%" panelHeight="auto" name="wednesday" id="wednesday" notnull = "星期三">
				</select>
			</td>
			
		</tr>
		
		<tr>
			<td class = "four_title">
				星期四
			</td>
			<td class = "four_common">
				<select  editable="false" class = "easyui-combobox" style="width:70%" panelHeight="auto" name="thursday" id="thursday" notnull = "星期四">
				</select>
			</td>
			
			<td class = "four_title">
				星期五
			</td>
			<td class = "four_common">
				<select  editable="false" class = "easyui-combobox" style="width:70%" panelHeight="auto" name="friday" id="friday" notnull = "星期五">
				</select>
			</td>
			
			<td class = "four_title">
				星期六
			</td>
			<td class = "four_common">
				<select  editable="false" class = "easyui-combobox" style="width:70%" panelHeight="auto" name="saturday" id="saturday" notnull = "星期六">
				</select>
			</td>
		</tr>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "activityDistributeQuery" onclick = "activityDistributeQuery()">查询</a>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" id = "activityDistributeUpdate" onclick = "activityDistributeUpdate()">修改</a>
</div>
</div>
</body>
</html>