<%@ page contentType="text/html;charset=utf-8"%>

<script>

var returnid;
var returnname;
var reorgancode;
var reorganname;
var reteamgrade;
var refunc;

function dlgTeamInit()
{
	$('#teamdlg').dialog('close');	
	
	initDataGrid20($('#dlgteamlist'));
	//dlgOrganremark.style.display="none";
}

function disuTeamDlg(teamcode,teamname,organcode,organname,teamgrade,bakfunc)
{
	if(teamgrade==null||teamgrade=='')
	{
		$.messager.alert('Debug信息','请选择团队级别！','error');
		return;	
	}
	
	if(teamgrade=='0001')
	{
		$.messager.alert('Debug信息','一级团队不用选择上级团队！','error');
		return;	
	}
	
	returnid = teamcode;
	returnname = teamname;
	reorgancode = organcode;
	reorganname = organname;
	reteamgrade = teamgrade;
	refunc = bakfunc;
	
	$('#dlgteamlist').datagrid('loadData', { total: 0, rows: [] });
	$('#dlgteamname').val("");
	$('#teamdlg').dialog('open');
}

function dlgteamquery()
{
	if(returnid==null)
	{
		$.messager.alert('Debug信息','未进行弹出框初始化！','error');
		return;	
	}
	
	var tturl = "team/getTeamList.do";
	
	var tParam = new Object();
	tParam.teamname = $('#dlgteamname').val();
	tParam.state = '01';
	
	if(reteamgrade=='0004')
	{
		tParam.teamgrade = '0003';	
	}
	else if(reteamgrade=='0003')
	{
		tParam.teamgrade = '0002';	
	}
	else if(reteamgrade=='0002')
	{
		tParam.teamgrade = '0001';	
	}
	
	displayDataGrid20($('#dlgteamlist'),tParam,tturl);
}

function dlgteamreturn()
{
	if(returnid==null)
	{
		$.messager.alert('Debug信息','未进行弹出框初始化！','error');
		return;	
	}
	
	var row = $('#dlgteamlist').datagrid('getSelected');
    
	if(row==null)
	{
		$.messager.alert('操作提示','未选中需要返回的出单业务员信息！','error');
		returnid.val("");
		
		if(returnname!=null)
		{
			returnname.val("");
		}
		
		if(reorgancode!=null)
		{
			reorgancode.val("");
		}
		
		if(reorganname!=null)
		{
			reorganname.val("");
		}
		
		$('#teamdlg').dialog('close');
	}
	else
	{
		returnid.val(row.teamid);
		
		if(returnname!=null)
		{
			returnname.val(row.teamname);
		}
		
		if(reorgancode!=null)
		{
			reorgancode.val(row.organcode);
		}
		
		if(reorganname!=null)
		{
			reorganname.val(row.organname);
		}
		
		if(refunc!=null)
		{
			func = function(){};
			func = eval(refunc);
			func(row);	
		}
		
		$('#teamdlg').dialog('close');	
	}	
}

</script>

<div id="teamdlg" class="easyui-dialog" title="团队查询" 
		style="width:700px;height:500px;padding:10px;top:50px" 
		data-options="iconCls: 'icon-save',">
		
		<table>
			<tr>
	 			<td class = "dlgtitle">
	 				团队名称
	 			</td>
	 			<td class = "common">
	 				<input class = "dlgtxt" name="dlgteamname" id="dlgteamname">
	 			</td>
	 			<td></td><td></td>
			</tr>
		</table>
		<br>
		<button class="smsbutton" id = "dlgteamquery"  onclick = "dlgteamquery()">团队查询</button>
		<button class="smsbutton" id = "dlgteamreturn"  onclick = "dlgteamreturn()">返回</button>
		<br>
		<br>
		<table id="dlgteamlist" class="easyui-datagrid" title="团队信息" style="width:660px;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true" >
			<thead>
				<tr>
				<th data-options="field:'organ02name',width:100">所属省公司</th>
				<th data-options="field:'organ03name',width:100">所属分公司</th>
				<th data-options="field:'organname',width:100">所属营业部</th>
				<th data-options="field:'teamname',width:100">团队名称</th>
				<th data-options="field:'teamgradename',width:100">团队级别</th>
				</tr>
			</thead>
		</table>
		
</div>