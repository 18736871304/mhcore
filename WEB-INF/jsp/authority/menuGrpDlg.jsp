<%@ page contentType="text/html;charset=utf-8"%>

<script>

var reMenuGrpCode;
var reMenuGrpName;

function dlgmenuGrpInit()
{
	$('#menugrpdlg').dialog('close');
	
	initDataGrid($('#mglist'));
}

function displayMg(menugroupcode,menugroupname)
{
	if(menugroupcode==null||menugroupcode=='')
	{
		$.messager.alert('操作提示','请传入返回id！','error');
		return;
	}
	
	$('#mglist').datagrid('loadData', { total: 0, rows: [] });
	$('#dlmenugrpcode').val("");
	$('#dlmenugrpname').val("");
	$('#menugrpdlg').dialog('open');
	
	reMenuGrpCode = menugroupcode;
	reMenuGrpName = menugroupname;
}

function mgquery()
{
	var tturl = "authority/getMenuGrpList.do";
	
	var tParam = new Object();
	tParam.menuGroupName = $('#dlmenugrpname').val();
	
	displayDataGrid($('#mglist'),tParam,tturl);	
}

function mgreturn()
{
	var row = $('#mglist').datagrid('getSelected');
    
	if(row==null)
	{
		$.messager.alert('操作提示','未选中需要返回的出单业务员信息！','error');
		
		if(reMenuGrpCode!=null)
		{
			reMenuGrpCode.val("");
		}
		
		if(reMenuGrpName!=null)
		{
			reMenuGrpName.val("");
		}
	}
	else
	{
		if(reMenuGrpCode!=null)
		{
			reMenuGrpCode.val(row.menuGroupCode);
		}
		
		if(reMenuGrpName!=null)
		{
			reMenuGrpName.val(row.menuGroupName);
		}
	}
	
	$('#menugrpdlg').dialog('close');
}
</script>
<div id="menugrpdlg" class="easyui-dialog" title="菜单组查询" 
		style="width:520px;height:500px;padding:10px" 
		data-options="iconCls: 'icon-save'">
		
		<table>
			<tr>
				<td class = "dlgtitle">
					菜单组名称
				</td>
				<td class = "common">
					<input class = "dlgtxt" name="dlmenugrpname" id="dlmenugrpname">
				</td>
				<td></td>
	 			<td></td>
			</tr>
		</table>
		<br>
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "mgquery" onclick = "mgquery()">查询</a>
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-undo'" id = "mgreturn" onclick = "mgreturn()">返回</a>
		<br>
		<br>
		<table id="mglist" class="easyui-datagrid" title="菜单组信息" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true" >
			<thead>
				<tr>
					<th data-options="field:'menuGroupName',width:120">菜单组名称</th>
				</tr>
			</thead>
		</table>
</div>