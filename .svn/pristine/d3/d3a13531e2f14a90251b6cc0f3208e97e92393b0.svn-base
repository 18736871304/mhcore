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
	initDataGrid($('#activitydistributelist'));
	
	inputList = [
				$('#P1'),
				$('#P2_offline'),
				$('#P2_online'),
				$('#P3'),
				$('#P4'),
				$('#P5'),
				$('#P6'),
				$('#P7'),
				$('#P8'),
				$('#P9'),
	 	];

	 checkList = [
				$('#P1'),
				$('#P2_offline'),
				$('#P2_online'),
				$('#P3'),
				$('#P4'),
				$('#P5'),
				$('#P6'),
				$('#P7'),
				$('#P8'),
				$('#P9'),
	 	];
	
	disComBox($('#qorgancode'),"crmsysterm",null);
	
	$('#qorgancode').combobox('setValue','100100101');
}

function aftercodeselect(comboxid)
{
}

function selectone()
{
	var row = $('#activitydistributelist').datagrid('getSelected');
	
	if(row.sourcelevel=='A+'||row.sourcelevel=='A'||row.sourcelevel=='A-')
	{
		alert("A+,A,A-的分配规则，不能修改！");
		return;
	}
	
	$('#P1').val(row.P1);
	$('#P2_offline').val(row.P2_offline);
	$('#P2_online').val(row.P2_online);
	$('#P3').val(row.P3);
	$('#P4').val(row.P4);
	$('#P5').val(row.P5);
	$('#P6').val(row.P6);
	$('#P7').val(row.P7);
	$('#P8').val(row.P8);
	$('#P9').val(row.P9);
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
	var tturl = "activity/getActivityDistributeList.do";

	var tParam = new Object();
	
	tParam.organcode = $('#qorgancode').combobox('getValue');
	
	displayDataGrid($('#activitydistributelist'), tParam, tturl,onLoadSuccess);

	clearData();
}

function onLoadSuccess(data)
{
	$('#activitydistributelist').datagrid('mergeCells',{index: 0,field: 'P2_online',colspan: 8});
	$('#activitydistributelist').datagrid('mergeCells',{index: 1,field: 'P2_online',colspan: 8});
	//$('#activitydistributelist').datagrid('mergeCells',{index: 2,field: 'P2_offline',colspan: 2});
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
	
	if(row.sourcelevel=='A+'||row.sourcelevel=='A'||row.sourcelevel=='A-')
	{
		alert("A+,A,A-的分配规则，不能修改！");
		return;
	}

	var tparam = prepareparam(inputList);
	tparam.ruleid = row.ruleid;

	ajaxdeal("activity/activityDistributeRuleUpdate.do",tparam,null,null,saveSuss);
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
	td.reprot_title{
		width: 6%;
		}
</style>
</head>
<body>
<div style="margin-left:0%">
	<table class = "common">
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
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "activityDistributeQuery" onclick = "activityDistributeQuery()">查询</a>
	<br>
	<br>
	<table id="activitydistributelist" class="easyui-datagrid" title="CRM资源分配" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<th data-options="field:'organname',width:70">CRM系统</th>
				<th data-options="field:'sourcelevel',width:80,formatter:disSourceLevel">初始资源等级</th>
				<th data-options="field:'P1',width:140">P1</th>
				<th data-options="field:'P2_offline',width:90">P2（停线人员）</th>
				<th data-options="field:'P2_online',width:90">P2（接线人员）</th>
				<th data-options="field:'P3',width:90">P3</th>
				<th data-options="field:'P4',width:90">P4</th>
				<th data-options="field:'P5',width:90">P5</th>
				<th data-options="field:'P6',width:90">P6</th>
				<th data-options="field:'P7',width:90">P7</th>
				<th data-options="field:'P8',width:90">P8</th>
				<th data-options="field:'P9',width:90">P9</th>
			</tr>
		</thead>
	</table>
	<br>
	<table class = "common">
		<tr>
			<td class = "reprot_title">
				P1
			</td>
			<td class = "report_common">
				<input class = "txt" name="P1" id="P1" notnull = "P1">
			</td>
			
			<td class = "reprot_title">
				P2（停线人员）
			</td>
			<td class = "report_common">
				<input class = "txt" name="P2_offline" id="P2_offline" notnull = "P2（停线人员）">
			</td>
			
			<td class = "reprot_title">
				P2（接线人员）
			</td>
			<td class = "report_common">
				<input class = "txt" name="P2_online" id="P2_online" notnull = "P2（接线人员）">
			</td>
			
			<td class = "reprot_title">
				P3
			</td>
			<td class = "report_common">
				<input class = "txt" name="P3" id="P3" notnull = "P3">
			</td>
			
			<td class = "reprot_title">
				P4
			</td>
			<td class = "report_common">
				<input class = "txt" name="P4" id="P4" notnull = "P4">
			</td>
			
			<td class = "reprot_title">
				P5
			</td>
			<td class = "report_common">
				<input class = "txt" name="P5" id="P5" notnull = "P5">
			</td>
		</tr>
		
		<tr>
			<td class = "reprot_title">
				P6
			</td>
			<td class = "report_common">
				<input class = "txt" name="P6" id="P6" notnull = "P6">
			</td>
			
			<td class = "reprot_title">
				P7
			</td>
			<td class = "report_common">
				<input class = "txt" name="P7" id="P7" notnull = "P7">
			</td>
			
			<td class = "reprot_title">
				P8
			</td>
			<td class = "report_common">
				<input class = "txt" name="P8" id="P8" notnull = "P8">
			</td>
			
			<td class = "reprot_title">
				P9
			</td>
			<td class = "report_common">
				<input class = "txt" name="P9" id="P9" notnull = "P9">
			</td>
		</tr>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" id = "activityDistributeUpdate" onclick = "activityDistributeUpdate()">修改</a>
</div>
</div>
</body>
</html>