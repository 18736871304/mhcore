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
	initDataGrid($('#activityPlanlist'));

	inputList = [
			$('#channel'),
			$('#pagetype'),
			$('#planname'),
			$('#transferid'),
	];

	checkList = [
			$('#transferid'),
	];
	
	disComBox($('#qchannel'),"source",null);
	disComBox($('#channel'),"source",null);
}

function aftercodeselect(comboxid)
{
	if(comboxid.attr("id")=="qchannel")
	{
		var tParam = new Object();
		tParam.channelCode = comboxid.combobox('getValue');
		
		var turl = "activity/getpagetype.do";
		
		displayCombox($('#qpagetype'),tParam,turl,"dd_key","dd_value");
	}
	else if(comboxid.attr("id")=="channel")
	{
		disPageType();
	}
}

function disPageType()
{
	var tParam = new Object();
	tParam.channelCode = $('#channel').combobox('getValue');
	
	var turl = "activity/getpagetype.do";
	
	displayCombox($('#pagetype'),tParam,turl,"dd_key","dd_value");
}

function selectone()
{
	var row = $('#activityPlanlist').datagrid('getSelected');

	$('#channel').combobox('setValue',row.channel);
	
	disPageType();
	
	$('#pagetype').combobox('setValue',row.pagetype);
	$('#planname').val(row.planname);
	$('#transferid').val(row.transferid);
}

function saveSuss()
{
	clearCarData();
	$('#activityPlanlist').datagrid('reload');
}

function clearCarData() 
{
	cleardata(inputList);
}

function activityPlanInsert()
{
	if(!checknotnull(checkList))
	{
		return;
	}

	var tparam = prepareparam(inputList);

	ajaxdeal("activity/activityPlanInsert.do",tparam,null,null,saveSuss);
}

function activityPlanUpdate()
{
	var row = $('#activityPlanlist').datagrid('getSelected');
	if(row==null)
	{
		$.messager.alert('操作提示','请选中要修改的数据！','error');
		return;
	}
	
	if(!checknotnull(checkList))
	{
		return;
	}

	var tparam = prepareparam(inputList);
	tparam.planserialno = row.planserialno;
	tparam.oldchannel = row.channel;
	tparam.oldpagetype = row.pagetype;
	tparam.oldplanname = row.planname;

	ajaxdeal("activity/activityPlanUpdate.do",tparam,null,null,saveSuss);
}

function activityPlanDelete()
{
	var row = $('#activityPlanlist').datagrid('getSelected');
	if(row==null)
	{
		$.messager.alert('操作提示','请选中要删除的数据！','error');
		return;
	}
	
	var tparam = new Object();
	tparam.planserialno = row.planserialno;

	ajaxdeal("activity/activityPlanDelete.do",tparam,null,null,saveSuss);
}

function activityPlanquery()
{
	var tturl = "activity/getActivityPlanList.do";

	var tParam = new Object();

	tParam.channel = $('#qchannel').combobox('getValue');;
	//tParam.pagetype = $('#qpagetype').combobox('getValue');;
	//tParam.planname = $('#qplanname').val();
	
	tParam.startdate = $('#qstartdate').datebox("getValue");
	tParam.enddate = $('#qenddate').datebox("getValue");

	displayDataGrid($('#activityPlanlist'), tParam, tturl);

	clearCarData();
}

function dispageurl(val,row,index)
{
	return '<a href="#" onclick="openpageurl(\''+row.planurl+'\')">'+row.planurl+'</a>';
}

function openpageurl(pagurl)
{
	window.open(pagurl,'_blank','width=400px,height=550px,left=400px,top=100px,menubar=no,toolbar=no,scrollbars=yes,location=no');
}

</script>

</head>
<body>
<div style="margin-left:0%">
	<table class = "common">
		<tr>
			<td class = "title">
				渠道类型
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qchannel" id="qchannel">
				</select>
			</td>
			<td></td><td></td>
			<td></td><td></td>
		</tr>
		<tr>
			<td class = "title">
				时间起期
			</td>
			<td class = "common">
				<input class="easyui-datebox" style="width: 160%" id="qstartdate" name="qstartdate">
			</td>
			<td class = "title">
				时间止期
			</td>
			<td class = "common">
				<input class="easyui-datebox" style="width: 160%" id="qenddate" name="qenddate">
				(算头不算尾)
			</td>
		</tr>
		<tr hidden = "">
			<td class = "title">
				页面类型
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qpagetype" id="qpagetype">
				</select>
			</td>
		</tr>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "activityPlanquery" onclick = "activityPlanquery()">推广页面查询</a>
	<br>
	<br>
	<table id="activityPlanlist" class="easyui-datagrid" title="推广页面信息" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<th data-options="field:'makedate',width:140">日期</th>
				<th data-options="field:'channelname',width:100">渠道类型</th>
				<th data-options="field:'pagename',width:350">推广页面</th>
				<th data-options="field:'transferid',width:130">转化ID</th>
				<th data-options="field:'planurl',width:1000,formatter:dispageurl">推广链接</th>
				
			</tr>
		</thead>
	</table>
	<br>
	<table class = "common" hidden = "">
		<tr>
			<td class = "title">
				渠道类型
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="channel" id="channel" notnull = "渠道类型">
				</select>
			</td>
			
			<td class = "title">
				推广页面
			</td>
			<td colspan="3" style="width:52%">
				<select class = "easyui-combobox" style="width:500%" panelHeight="auto" name="pagetype" id="pagetype" notnull = "推广页面">
				</select>
			</td>
		</tr>
	</table>
	<table class = "common" hidden = "">
		<tr>
			<td class = "title">
				计划名称
			</td>
			<td class = "common">
				<input class = "txt" name="planname" id="planname" notnull = "计划名称">
			</td>
			
			<td style="width:12%"></td><td style="width:20%"></td>
		</tr>
	</table>
	<table  class = "common">
		<tr>
			<td class = "title">
				转化ID
			</td>
			<td class = "common">
				<input class = "txt" name="transferid" id="transferid" notnull = "转化ID">
			</td>
			<td></td><td></td>
			<td></td><td></td>
		</tr>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" id = "activityPlanUpdate" onclick = "activityPlanUpdate()">转化ID修改</a>
</div>
</body>
</html>
