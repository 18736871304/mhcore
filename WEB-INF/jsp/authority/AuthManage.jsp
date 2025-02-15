<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%>
<head>    
   <title>权限组管理</title>  
<link rel="stylesheet" href="../../../css/inputbox/line3.css?v_2022_05_16">
<script>

window.onload = function()
{
	//remark.style.display="none";
	menugrpcode_id.style.display="none";
	
	$('#menugrplist').datagrid({ onClickRow:
        function () {
            //单击行的时候，将单选按钮设置为选中
			var row = $('#menugrplist').datagrid('getSelected');
            
			$('#menugrpcode').val(row.menuGroupCode);
			$('#menugrpname').val(row.menuGroupName);
			$('#orderbyid').val(row.orderbyid);
			treeinit();
        }
    });
	
	disComBox($('#menutype'),"menutype",null);
	$('#menutype').combobox('setValue','core');
	initDataGrid($('#menugrplist'));
}

function aftercodeselect(comboxid)
{
	if(comboxid.attr("id")=="menutype")
	{
		var row = $('#menugrplist').datagrid('getSelected');
		
		if(row!=null)
		{
			treeinit();
		}
	}
}

function treeinit()
{
	$("#authtree").tree(
	{
		url:"authority/getMenuList.do?menuGroupCode="+$("#menugrpcode").val()+"&menutype="+$("#menutype").combobox("getValue")
	})
}

function menugrpadd()
{
	/*
	if($('#menugrpcode').val()==null||$('#menugrpcode').val()=="")
	{
		$.messager.alert('执行失败','请录入菜单组编码！','error');
		return;
	}
	*/
	
	if($('#menugrpname').val()==null||$('#menugrpname').val()=="")
	{
		$.messager.alert('执行失败','请录入菜单组名称！','error');
		return;
	}
	
	var tturl = "authority/MenuGrpInsert.do";
	
	var menuGrpParam = new Object();
	menuGrpParam.menuGroupCode = $('#menugrpcode').val();
	menuGrpParam.menuGroupName = $('#menugrpname').val();
	menuGrpParam.orderbyid = $('#orderbyid').val();
	
	ajaxdeal(tturl,menuGrpParam,null,null);
	
	$('#menugrplist').datagrid('loadData', { total: 0, rows: [] });
	
	$("#authtree").tree('loadData', {});
}

function menugrpquery()
{
	var tturl = "authority/getMenuGrpList.do";
	
	var tParam = new Object();
	tParam.menuGroupCode = $('#menugrpcode').val();
	tParam.menuGroupName = $('#menugrpname').val();
	
	displayDataGrid($('#menugrplist'),tParam,tturl);	
	
	$("#authtree").tree('loadData', {});
}

function menugrpmodify()
{
	/*
	if($('#menugrpcode').val()==null||$('#menugrpcode').val()=="")
	{
		$.messager.alert('执行失败','请录入菜单组编码！','error');
		return;
	}
	*/
	
	if($('#menugrpname').val()==null||$('#menugrpname').val()=="")
	{
		$.messager.alert('执行失败','请录入菜单组名称！','error');
		return;
	}
	
	var tturl = "authority/MenuGrpUpdate.do";
	
	var tParam = new Object();
	tParam.menuGroupCode = $('#menugrpcode').val();
	tParam.menuGroupName = $('#menugrpname').val();
	tParam.orderbyid = $('#orderbyid').val();
	
	ajaxdeal(tturl,tParam,null,null);
	
	$('#menugrplist').datagrid('loadData', { total: 0, rows: [] });
	
	$("#authtree").tree('loadData', {});
}

function menugrpdelete()
{
	if($('#menugrpcode').val()==null||$('#menugrpcode').val()=="")
	{
		$.messager.alert('执行失败','请录入菜单组编码！','error');
		return;
	}
	
	var tturl = "authority/MenuGrpDelete.do";
	
	var tParam = new Object();
	tParam.menuGroupCode = $('#menugrpcode').val();
	
	ajaxdeal(tturl,tParam,null,null);
	
	$('#menugrplist').datagrid('loadData', { total: 0, rows: [] });
	
	$("#authtree").tree('loadData', {});
}

function menurelation()
{
	//获取所有选中的node,删选，只获取叶子节点的node
	var nodes = $('#authtree').tree('getChecked');
    var s = '';
    for (var i = 0; i < nodes.length; i++) 
    {
    	if (s != '') 
        	s += ',';
		s += nodes[i].id;
    }
    
    if(s=="")
    {
		$.messager.alert('执行失败','未选中菜单！','error');
		return;
    }
    
	var tturl = "authority/menuRelation.do";
	
	var menuGrpParam = new Object();
	menuGrpParam.menuList = s;
	menuGrpParam.menuGroupCode = $('#menugrpcode').val();
	menuGrpParam.menutype = $("#menutype").combobox("getValue");
	
	ajaxdeal(tturl,menuGrpParam,null,null,saveSuss);
    
}

function saveSuss()
{
	$('#menugrplist').datagrid('reload');
}

function modify_menugrpcode()
{
	$('#menugrpcode').val($('#menugrpname').val())
}

</script>

</head>
<body>

	<table style="width: 32.8%;">
		<tr id = "menugrpcode_id">
			<td class = "title">
 				菜单组编码
 			</td>
 			<td class = "common">
 				<input class = "txt" name="menugrpcode" id="menugrpcode">
 			</td>
		</tr>
		<tr> 			
			<td class = "title">
				菜单组名称
			</td>
			<td class = "common">
				<input class = "txt" name="menugrpname" id="menugrpname" onchange = "modify_menugrpcode()">
			</td>
			
			<td class = "title">
				顺序
			</td>
			<td class = "common">
				<input class = "txt" name="orderbyid" id="orderbyid">
			</td>
 		</tr>
 		
 	</table>
 	<br>
 	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "menugrpquery" onclick = "menugrpquery()">菜单组查询</a>
 	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" id = "menugrpadd" onclick = "menugrpadd()">菜单组新增</a>
 	<!-- <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" id = "menugrpmodify" onclick = "menugrpmodify()">菜单组修改</a> -->
 	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove'" id = "menugrpdelete" onclick = "menugrpdelete()">菜单组删除</a>
 	<br>
 	<br>
 	
 	<table id="menugrplist" class="easyui-datagrid" title="用户信息" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true" >
		<thead>
			<tr>
				<th data-options="field:'menuGroupName',width:105">菜单组名称</th>
				<th data-options="field:'data_auth',width:105">数据权限</th>
				<th data-options="field:'orderbyid',width:40">顺序</th>
				<th data-options="field:'operator',width:50">创建人</th>
				<th data-options="field:'modifyDate',width:130">最后一次操作时间</th>
			</tr>
		</thead>
	</table>
	<br>
	<table class = "common"  style="width: 24.5%;">
		<tr>
			<td class = "title">
				菜单类型
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="menutype" id="menutype">
				</select>
			</td>
		
		</tr>
	</table>
	<br>
	<table>
		<tr>
			<td style="vertical-align:top;">
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" id = "menurelation" onclick = "menurelation()">关联菜单</a>
			</td>
			<td style="width: 110px;">
			</td>
			<td>
				<div style="margin-left:0%">
					<ul id="authtree" class="easyui-tree" data-options="animate:true,lines:true,checkbox:true"></ul>
				</div>
			</td>
		</tr>
	</table>
</body>
</html>