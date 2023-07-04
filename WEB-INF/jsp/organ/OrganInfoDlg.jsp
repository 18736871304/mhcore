<%@ page contentType="text/html;charset=utf-8"%>

<script>

var returnid;
var organgrade;
var returnname;

var refunc;

function OrganInit()
{
	$('#organdlg').dialog('close');	
	
	initDataGrid($('#dlgorganlist'));
}

function disorgan(returndata,inorgangrade,returnvalue,bakfunc)
{
	if(inorgangrade!=null&&inorgangrade!="")
	{
		returnid = returndata;
		
		if(inorgangrade=="none")
		{
			organgrade = "";
		}
		else
		{
			organgrade = inorgangrade;	
		}
		
		returnname = returnvalue;
		
		refunc = bakfunc;
	}
	else
	{
		$.messager.alert('提示信息','请先选择机构级别！','error');
		return;	
	}
	
	$('#dlgorganlist').datagrid('loadData', { total: 0, rows: [] });
	$('#dlginsorgancode').val("");
	$('#dlginsorganname').val("");
	$('#organdlg').dialog('open');
}

function Organquery()
{
	if(returnid==null)
	{
		$.messager.alert('Debug信息','未进行弹出框初始化！','error');
		return;	
	}
	
	var tturl = "organ/organdlgquery.do";
	
	var tParam = new Object();
	
	tParam.isstop = "01";
	
	tParam.organCode = $('#dlginsorgancode').val();
	tParam.organName = $('#dlinsgorganname').val();
	tParam.organGrade = organgrade;
	
	displayDataGrid($('#dlgorganlist'),tParam,tturl);
}

function Organreturn()
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
		
		//返回执行的函数
		
		if(refunc!=null)
		{
			func = function(){};
			func = eval(refunc);
			func("");	
		}
		
		if(returnname!=null)
		{
			returnname.val("");
		}
		$('#organdlg').dialog('close');
	}
	else
	{
		returnid.val(row.organCode);
		
		//返回执行的函数
		if(refunc!=null)
		{
			func = function(){};
			func = eval(refunc);
			func(row.organCode);	
		}
		
		if(returnname!=null)
		{
			returnname.val(row.organName);
		}
		
		$('#organdlg').dialog('close');	
	}	
}

</script>

<div id="organdlg" class="easyui-dialog" title="机构查询" 
		style="width:520px;height:500px;padding:10px;top:50px" 
		data-options="iconCls: 'icon-save',">
		
		<table>
			<tr>
	 			<td class = "dlgtitle">
	 				机构编码：
	 			</td>
	 			<td class = "common">
	 				<input class = "dlgtxt" name="dlginsorgancode" id="dlginsorgancode">
	 			</td> 			
				<td class = "dlgtitle">
					机构名称：
				</td>
				<td class = "common">
					<input class = "dlgtxt" name="dlginsorganname" id="dlinsgorganname">
				</td>
			</tr>
		</table>
		<br>
		<button id = "dlgquery" class="smsbutton" onclick = "Organquery()">机构查询</button>
		<button id = "dlgreturn" class="smsbutton" onclick = "Organreturn()">返回</button>
		<br>
		<br>
		<table id="dlgorganlist" class="easyui-datagrid" title="机构信息" style="width:480px;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true" >
			<thead>
				<tr>
				<th data-options="field:'organCode',width:100">机构编码</th>
				<th data-options="field:'organName',width:200">机构名称</th>
				</tr>
			</thead>
		</table>
		
</div>