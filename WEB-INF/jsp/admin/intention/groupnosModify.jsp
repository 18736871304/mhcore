<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%><head>
<title></title>
<script>

var inputList;
var checkList;

window.onload = function()
{
	dlgUserInit();
	initDataGrid($('#groupnoList'));
	
	inputList = [
	 			$('#groupno'),
	 			$('#oldgroupno')
	 	];
	 checkList = [
	 			$('#groupno')
	 			
	 	];
	 groupnosquery();
}

function aftercodeselect(comboxid)
{
}

function selectone()
{
	var row = $('#groupnoList').datagrid('getSelected');
	$('#groupno').val(row.dd_key);
	$('#oldgroupno').val(row.dd_key);
}

function groupnosquery()
{
	var tturl = "policy/getgroupnos.do";

	var tParam = new Object();

	displayDataGrid($('#groupnoList'), tParam, tturl);

	clearCarData();
}

function saveSuss()
{
	clearCarData();
	$('#groupnoList').datagrid('reload');
}

function clearCarData() 
{
	cleardata(inputList);
}

function groupnoEdit()
{
	var row = $('#groupnoList').datagrid('getSelected');
	
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
	ajaxdeal("policy/groupnoUpdate.do",tparam,null,null,saveSuss);
}

function groupnoInsert()
{
	if(!checknotnull(checkList))
	{
		return;
	}
	var tparam = prepareparam(inputList);

	ajaxdeal("policy/groupnoInsert.do",tparam,null,null,saveSuss);
}

function groupnoDelete()
{
	var row = $('#groupnoList').datagrid('getSelected');
	
	if(row==null)
	{
		$.messager.alert('操作提示','请选中要修改的数据！','error');
		return;
	}

	var tparam = prepareparam(inputList);
	
  $.messager.alert('操作提示','确认要删除吗？','question',function(){
	ajaxdeal("policy/groupnoDelete.do",tparam,null,null,saveSuss);
	  
  }); 
}

function dealorgan(organcode)
{
}

</script>

</head>
<%@ include file="/WEB-INF/jsp/admin/policy/userDlg.jsp"%>
<body>
<div style="margin-left:0%">
	<table id="groupnoList" class="easyui-datagrid" title="群编号信息" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<th data-options="field:'dd_value',width:100">群编号</th>
			</tr>
		</thead>
	</table>
	<br>
	<table class = "common">
		<tr>
		<input class = "txt" name="oldusercode" hidden="hidden" readonly="readonly" id="oldgroupno">
			<td class = "title">
				群编号
			</td>
			<td class = "common">
				<input class = "txt" name="ordernum"  maxlength="40" id="groupno" notnull = "群编号">
			</td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" id = "pusherInsert" onclick = "groupnoInsert()">新增</a>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" id = "pusherEdit" onclick = "groupnoEdit()">修改</a>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove'" id = "pusherDelete" onclick = "groupnoDelete()">删除</a>
</div>
</body>
</html>