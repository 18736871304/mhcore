<%@ page contentType="text/html;charset=utf-8"%>

<script>

var returnid;
var returnkey;
var returnname;
var reusertype;

function dlgUserInit()
{
	$('#userdlg').dialog('close');	
	
	initDataGrid($('#dlguserlist'));
	//dlgOrganremark.style.display="none";
}

function disuUserDlg(returndata,userkey,username,usertype)
{
	returnid = returndata;
	returnkey = userkey;
	returnname = username;
	reusertype = usertype;
	
	$('#dlguserlist').datagrid('loadData', { total: 0, rows: [] });
	$('#dlgusercode').val("");
	$('#dlgusername').val("");
	$('#userdlg').dialog('open');
}

function userquery()
{
	if(returnid==null)
	{
		$.messager.alert('Debug信息','未进行弹出框初始化！','error');
		return;	
	}
	
	var tturl = "authority/getUserList.do";
	
	var userParam = new Object();
	userParam.userCode = $('#dlgusercode').val();
	userParam.userName = $('#dlgusername').val();
	
	if(reusertype==null||reusertype=='')
	{
		userParam.usertype = "02','04";
	}
	else
	{
		userParam.usertype = reusertype;
	}
	
	displayDataGrid($('#dlguserlist'),userParam,tturl);
}

function userreturn()
{
	if(returnid==null)
	{
		$.messager.alert('Debug信息','未进行弹出框初始化！','error');
		return;	
	}
	
	var row = $('#dlguserlist').datagrid('getSelected');
    
	if(row==null)
	{
		$.messager.alert('操作提示','未选中需要返回的出单业务员信息！','error');
		returnid.val("");
		
		if(returnkey!=null)
		{
			returnkey.val("");
		}
		
		if(returnname!=null)
		{
			returnname.val("");	
		}
		
		$('#userdlg').dialog('close');
	}
	else
	{
		returnid.val(row.userCode);
		
		if(returnkey!=null)
		{
			returnkey.val(row.userid);
		}
		
		if(returnname!=null)
		{
			returnname.val(row.userName);	
		}
		
		$('#userdlg').dialog('close');	
	}	
}

</script>

<div id="userdlg" class="easyui-dialog" title="出单业务员查询" 
		style="width:700px;height:500px;padding:10px;top:50px" 
		data-options="iconCls: 'icon-save',">
		
		<table>
			<tr>
	 			<td class = "dlgtitle">
	 				出单业务员编码：
	 			</td>
	 			<td class = "common">
	 				<input class = "dlgtxt" name="dlgusercode" id="dlgusercode">
	 			</td> 			
				<td class = "dlgtitle">
					出单业务员姓名：
				</td>
				<td class = "common">
					<input class = "dlgtxt" name="dlgusername" id="dlgusername">
				</td>
			</tr>
		</table>
		<br>
		<button id = "userquery" class="smsbutton" onclick = "userquery()">出单业务员查询</button>
		<button id = "userreturn" class="smsbutton" onclick = "userreturn()">返回</button>
		<br>
		<br>
		<table id="dlguserlist" class="easyui-datagrid" title="出单业务员信息" style="width:660px;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true" >
			<thead>
				<tr>
				<th data-options="field:'userCode',width:150">出单业务员编码</th>
				<th data-options="field:'userName',width:150">出单业务员姓名</th>
				<th data-options="field:'organCodeName',width:250">所属机构</th>
				</tr>
			</thead>
		</table>
		
</div>