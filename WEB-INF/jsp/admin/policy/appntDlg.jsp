<%@ page contentType="text/html;charset=utf-8"%>

<script>

var reappidno;
var reappname;

function dlgAppntInit()
{
	$('#appntdlg').dialog('close');	
	
	initDataGrid($('#dlgappntlist'));
	//dlgOrganremark.style.display="none";
}

function disuappntdlg(appidno,appname)
{
	reappidno = appidno;
	reappname = appname;
	
	$('#dlgappntlist').datagrid('loadData', { total: 0, rows: [] });
	$('#dlgappntidno').val("");
	$('#dlgappntname').val("");
	$('#appntdlg').dialog('open');
}

function appntquery()
{
	if(reappidno==null)
	{
		$.messager.alert('Debug信息','未进行弹出框初始化！','error');
		return;	
	}
	
	var tturl = "policy/getAppntList.do";
	
	var appntParam = new Object();
	appntParam.idno = $('#dlgappntidno').val();
	appntParam.name = $('#dlgappntname').val();
	
	displayDataGrid($('#dlgappntlist'),appntParam,tturl);
}

function appntreturn()
{
	if(reappidno==null)
	{
		$.messager.alert('Debug信息','未进行弹出框初始化！','error');
		return;	
	}
	
	var row = $('#dlgappntlist').datagrid('getSelected');
    
	if(row==null)
	{
		$.messager.alert('操作提示','未选中需要返回的投保人信息！','error');
		reappidno.val("");
		
		if(reappname!=null)
		{
			reappname.val("");
		}
		
		
		$('#appntdlg').dialog('close');
	}
	else
	{
		reappidno.val(row.idno);
		
		if(reappname!=null)
		{
			reappname.val(row.name);
		}
		
		$('#appntdlg').dialog('close');	
	}	
}

</script>

<div id="appntdlg" class="easyui-dialog" title="投保人查询" 
		style="width:700px;height:500px;padding:10px;top:50px" 
		data-options="iconCls: 'icon-save',">
		
		<table>
			<tr>
				<td class = "dlgtitle">
					投保人姓名
				</td>
				<td class = "common">
					<input class = "dlgtxt" name="dlgappntname" id="dlgappntname">
				</td>
				
	 			<td class = "dlgtitle">
	 				投保人身份证
	 			</td>
	 			<td class = "common">
	 				<input class = "dlgtxt" name="dlgappntidno" id="dlgappntidno">
	 			</td> 			
			</tr>
		</table>
		<br>
		<button id = "appntquery" class="smsbutton" onclick = "appntquery()">投保人查询</button>
		<button id = "appntreturn" class="smsbutton" onclick = "appntreturn()">返回</button>
		<br>
		<br>
		<table id="dlgappntlist" class="easyui-datagrid" title="投保人信息" style="width:660px;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true" >
			<thead>
				<tr>
				<th data-options="field:'name',width:200">投保人姓名</th>
				<th data-options="field:'disidno',width:200">投保人身份证</th>
				</tr>
			</thead>
		</table>
</div>