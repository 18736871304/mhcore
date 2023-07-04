<%@ page contentType="text/html;charset=utf-8"%>

<script>

var returnid;

function OrganInit()
{
	$('#organdlg').dialog('close');	
	
	disComBox($('#dlgorgangrade'),"organgrade",null);
	initDataGrid($('#dlgorganlist'));
	dlgOrganremark.style.display="none";
}

function disorgan(returndata)
{
	returnid = returndata;
	
	$('#dlgorganlist').datagrid('loadData', { total: 0, rows: [] });
	$('#dlginsorgancode').val("");
	$('#dlginsorganname').val("");
	$('#organdlg').dialog('open');
}

function dlgorganquery()
{
	if(returnid==null)
	{
		$.messager.alert('Debug信息','未进行弹出框初始化！','error');
		return;	
	}
	
	var tturl = "organ/organquery.do";
	
	var tParam = new Object();
	
	tParam.isstop = "01";
	tParam.organCode = $('#dlgorgancode').val();
	tParam.organName = $('#dlgorganname').val();	
	tParam.organGrade = $('#dlgorgangrade').combobox('getText');
	
	displayDataGrid($('#dlgorganlist'),tParam,tturl);
}

function dlgorganreturn()
{
	if(returnid==null)
	{
		$.messager.alert('Debug信息','未进行弹出框初始化！','error');
		return;	
	}
	
	var row = $('#dlgorganlist').datagrid('getSelected');
    
	if(row==null)
	{
		$.messager.alert('操作提示','未选中需要返回的机构信息！','error');
		returnid.val("");
		$('#organdlg').dialog('close');
	}
	else
	{
		returnid.val(row.organCode);
		$('#organdlg').dialog('close');	
	}	
}

</script>

<div id="organdlg" class="easyui-dialog" title="机构查询" 
		style="width:520px;height:500px;padding:10px;top:90px" 
		data-options="iconCls: 'icon-save',">
		
		<table>
			<tr>
				<td class = "dstitle">
		        	<img src="images/butCollapse.gif" onclick= "showPage(this,dlgOrganremark);">
		        	操作帮助
		        </td>
			</tr>
		</table>
		<div id="dlgOrganremark" style="display:'none'">
			<table style="display:'none'">
				<tr>
					<td class = "dscontent">					
					1、机构名称支持模糊查询
					</td>
				</tr>
			</table>
		</div>
		
		<table>
			<tr>
	 			<td class = "dlgtitle">
	 				机构级别：
	 			</td>
	 			<td class = "common">
	 				<input class = "easyui-combobox" style="width:160%" panelHeight="auto" name="dlgorgangrade" id="dlgorgangrade">
	 			</td>
			</tr>
			<tr>
	 			<td class = "dlgtitle">
	 				机构编码：
	 			</td>
	 			<td class = "common">
	 				<input class = "dlgtxt" name="dlgorgancode" id="dlgorgancode">
	 			</td>
				<td class = "dlgtitle">
					机构名称：
				</td>
				<td class = "common">
					<input class = "dlgtxt" name="dlgorganname" id="dlgorganname">
				</td>
			</tr>
		</table>
		<button id = "dlgorganquery" class="smsbutton" onclick = "dlgorganquery()">机构查询</button>
		<button id = "dlgorganreturn" class="smsbutton" onclick = "dlgorganreturn()">返回</button>
		<br>
		<table id="dlgorganlist" class="easyui-datagrid" title="机构信息" style="width:480px;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true" >
			<thead>
				<tr>
				<th data-options="field:'organCode',width:100">机构编码</th>
				<th data-options="field:'organShortName',width:120">机构简称</th>
				<th data-options="field:'organName',width:200">机构名称</th>
				</tr>
			</thead>
		</table>
		
</div>