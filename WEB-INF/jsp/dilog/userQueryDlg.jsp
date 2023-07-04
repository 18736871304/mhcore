<%@ page contentType="text/html;charset=utf-8"%>

<script>

var returnid;

var singleflag = "00";

function initUserQueryDlg()
{
	$('#useQueryDlg').dialog('close');
	
	initDataGrid($('#uqduserlist'));
}

function disUserQueryDlg(userid,issingle)
{
	$('#uqduserlist').datagrid('loadData', { total: 0, rows: [] });
	$('#uqdusercode').val("");
	$('#uqdusername').val("");
	$('#useQueryDlg').dialog('open');
	
	returnid = userid;
	
	if(issingle=="01")
	{
		$('#uqduserlist').datagrid({
			singleSelect:false
		});
		
		initDataGrid($('#uqduserlist'));
		
		singleflag = "01";
	}
	else
	{
		$('#uqduserlist').datagrid({
			singleSelect:true
		});
		
		initDataGrid($('#uqduserlist'));
		
		singleflag = "00";
	}	
}

function uqduserquery()
{
	if(returnid==null)
	{
		$.messager.alert('Debug信息','未进行弹出框初始化！','error');
		return;	
	}
	
	var tturl = "authority/getUserList.do";
	
	var userParam = new Object();
	userParam.userCode = $('#uqdusercode').val();
	userParam.userName = $('#uqdusername').val();
	
	displayDataGrid($('#uqduserlist'),userParam,tturl);
}

function uqduserreturn()
{
	if(returnid==null)
	{
		$.messager.alert('Debug信息','未进行弹出框初始化！','error');
		return;	
	}
	
	var row = $('#uqduserlist').datagrid('getSelected');
    
	if(row==null)
	{
		$.messager.alert('提示信息','未选中用户信息！','error');
		
		if(singleflag=="01")
		{
			//对于返回多个的情况，则什么也不做	
		}
		else
		{
			returnid.val("");	
		}
		
		$('#useQueryDlg').dialog('close');
	}
	else
	{
		if(singleflag=="01")
		{
			var rows = $('#uqduserlist').datagrid('getSelections');
			
			var reUserCodes = "";
			
			for(var i = 0;i<rows.length;i++)
			{
				reUserCodes = reUserCodes + rows[i].userCode+";";
			}
			
			returnid.val(returnid.val()+reUserCodes);
		}
		else
		{
			returnid.val(row.userCode);
		}
		
		$('#useQueryDlg').dialog('close');
	}	
}

</script>

<div id="useQueryDlg" class="easyui-dialog" title="机构查询" 
		style="width:520px;height:500px;padding:10px" 
		data-options="iconCls: 'icon-save',">

	<table>
		<tr>
 			<td class = "dlgtitle">
 				用户编码
 			</td>
 			<td class = "common">
 				<input class = "dlgtxt" name="uqdusercode" id="uqdusercode">
 			</td> 			
			<td class = "dlgtitle">
				用户姓名
			</td>
			<td class = "common">
				<input class = "dlgtxt" name="uqdusername" id="uqdusername">
			</td>
		</tr>
	</table>
	<br>
	<button id = "uqduserquery" class="smsbutton" onclick = "uqduserquery()">用户查询</button>
	<button id = "uqduserreturn" class="smsbutton" onclick = "uqduserreturn()">返回</button>
	<br>
	<br>
	<table id="uqduserlist" class="easyui-datagrid" title="用户信息" style="width:480px;height:auto"
	data-options="rownumbers:true,singleSelect:true,pagination:true" >
		<thead>
			<tr>
				<th data-options="field:'userCode',width:100">用户编码</th>
				<th data-options="field:'userName',width:120">用户姓名</th>
				<th data-options="field:'organCodeName',width:200">管理机构</th>
			</tr>
		</thead>
	</table>
		
</div>