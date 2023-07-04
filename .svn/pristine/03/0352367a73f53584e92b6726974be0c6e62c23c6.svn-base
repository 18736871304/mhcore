<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%>
<head>    
   <title>用户管理</title>  

<script>

window.onload = function()
{
	initDataGrid($('#organlist'));
	$('#organdlg').dialog('close');
	remark.style.display="none";
	dlgremark.style.display="none";
	$('#userlist').datagrid({ onClickRow:
        function () {
            //单击行的时候，将单选按钮设置为选中
			var row = $('#userlist').datagrid('getSelected');
            
			$('#usercode').val(row.userCode);
			$('#username').val(row.userName);
			$('#organcode').val(row.organCode);
        }
    });
	initDataGrid($('#userlist'));
}

function displayorgan()
{
	$('#organlist').datagrid('loadData', { total: 0, rows: [] });
	$('#dlgorgancode').val("");
	$('#dlgorganname').val("");
	$('#organdlg').dialog('open');
}

function userquery()
{	
	var tturl = "authority/getUserList.do";
	
	var userParam = new Object();
	userParam.userCode = $('#usercode').val();
	userParam.userName = $('#username').val();
	userParam.organCode = $('#organcode').val();
	
	userParam.usertype = '01';
	
	displayDataGrid($('#userlist'),userParam,tturl);
}

function organquery()
{
	var tturl = "authority/getOrganList.do";
	
	var organParam = new Object();
	organParam.organCode = $('#dlgorgancode').val();
	organParam.organName = $('#dlgorganname').val();
	
	displayDataGrid($('#organlist'),organParam,tturl);
}

function organreturn()
{
	var row = $('#organlist').datagrid('getSelected');
    
	if(row==null)
	{
		$.messager.alert('操作提示','请选中要返回的数据！','error');
	}
	else
	{
		$('#organcode').val(row.organCode);
		$('#organdlg').dialog('close');	
	}
}

function userdelete()
{
	if($('#usercode').val()==null||$('#usercode').val()=="")
	{
		$.messager.alert('执行失败','请录入用户编码！','error');
		return;
	}
	
	var tturl = "authority/userdelete.do";
	
	var userParam = new Object();
	userParam.userCode = $('#usercode').val();
	
	ajaxdeal(tturl,userParam,null,null);
	
	$('#userlist').datagrid('loadData', { total: 0, rows: [] });
}

function useradd()
{
	if($('#usercode').val()==null||$('#usercode').val()=="")
	{
		$.messager.alert('执行失败','请录入用户编码！','error');
		return;
	}
	
	if($('#username').val()==null||$('#username').val()=="")
	{
		$.messager.alert('执行失败','请录入用户姓名！','error');
		return;
	}
	
	/*
	if($('#organcode').val()==null||$('#organcode').val()=="")
	{
		$.messager.alert('执行失败','请录入用户管理机构！','error');
		return;
	}
	*/
	if($('#password').val()==null||$('#password').val()=="")
	{
		$.messager.alert('执行失败','请录入用户密码！','error');
		return;
	}
	
	if($('#psdconfirm').val()==null||$('#psdconfirm').val()=="")
	{
		$.messager.alert('执行失败','请录入确认密码！','error');
		return;
	}
	
	if($('#psdconfirm').val()!=$('#password').val())
	{
		$.messager.alert('执行失败','密码输入不一致，请重新输入！','error');
		$('#psdconfirm').val("");
		$('#password').val("");
		return;
	}
	
	var tturl = "authority/useradd.do";
	
	var userParam = new Object();
	userParam.userCode = $('#usercode').val();
	userParam.userName = $('#username').val();
	userParam.organCode = $('#organcode').val();
	userParam.passWord = $('#password').val();
	
	ajaxdeal(tturl,userParam,null,null);
	
	$('#userlist').datagrid('loadData', { total: 0, rows: [] });
}

function usermodify()
{
	if($('#usercode').val()==null||$('#usercode').val()=="")
	{
		$.messager.alert('执行失败','请录入用户编码！','error');
		return;
	}
	
	if($('#username').val()==null||$('#username').val()=="")
	{
		$.messager.alert('执行失败','请录入用户姓名！','error');
		return;
	}
	/*
	if($('#organcode').val()==null||$('#organcode').val()=="")
	{
		$.messager.alert('执行失败','请录入用户管理机构！','error');
		return;
	}
	*/
	var tturl = "authority/userupdate.do";
	
	var userParam = new Object();
	userParam.userCode = $('#usercode').val();
	userParam.userName = $('#username').val();
	userParam.organCode = $('#organcode').val();
	
	ajaxdeal(tturl,userParam,null,null);
	
	$('#userlist').datagrid('loadData', { total: 0, rows: [] });
}

</script>
   
</head>
<body>
	<div id="organdlg" class="easyui-dialog" title="机构查询" 
		style="width:520px;height:500px;padding:10px" 
		data-options="iconCls: 'icon-save'">
		
		<table>
			<tr>
				<td class = "dstitle">
		        	<img src="images/butCollapse.gif" onclick= "showPage(this,dlgremark);">
		        	操作帮助
		        </td>
			</tr>
		</table>
		<div id="dlgremark" style="display:'none'">
			<table style="display:'none'">
				<tr>
					<td class = "dscontent">
					1、输入机构编码查询，可以查询出该机构下的所有机构(包含该机构)
					<br>
					2、机构名称支持模糊查询
					</td>
				</tr>
			</table>
		</div>
		
		<table>
			<tr>
	 			<td class = "dlgtitle">
	 				机构编码
	 			</td>
	 			<td class = "common">
	 				<input class = "dlgtxt" name="dlgorgancode" id="dlgorgancode">
	 			</td> 			
				<td class = "dlgtitle">
					机构名称
				</td>
				<td class = "common">
					<input class = "dlgtxt" name="dlgorganname" id="dlgorganname">
				</td>
			</tr>
		</table>
		<br>
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "organquery" onclick = "organquery()">查询</a>
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-undo'" id = "organreturn" onclick = "organreturn()">返回</a>
		<br>
		<br>
		<table id="organlist" class="easyui-datagrid" title="机构信息" style="width:480px;height:auto"
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
<div style="margin-left:0%">

	<table>
		<tr>
			<td class = "dstitle">
	        	<img src="images/butCollapse.gif" onclick= "showPage(this,remark);">
	        	操作帮助
	        </td>
		</tr>
	</table>
	<div id="remark" style="display:'none'">
		<table style="display:'none'">
			<tr>
				<td class = "dscontent">
				1、本菜单的修改，仅修改用户信息，如需修改密码，请到密码修改处修改
				<br>
				2、如果要修改用户编码，请通过先删除后增加的方式进行
				<br>
				3、查询功能的条件为，用户编码、用户姓名、管理机构，用户姓名支持模糊查询
				<br>
				4、删除功能仅可通过用户编码进行删除
				</td>
			</tr>
		</table>
	</div>

	<table class = "common">
		<tr>
 			<td class = "title">
 				用户编码：
 			</td>
 			<td class = "common">
 				<input class = "txt" name="usercode" id="usercode">
 			</td> 			
			<td class = "title">
				用户姓名：
			</td>
			<td class = "common">
				<input class = "txt" name="username" id="username">
			</td>
			<td class = "title">
				管理机构：
			</td>
			<td class = "common">
				<input class = "txt" name="organcode" id="organcode" onclick = "displayorgan();" readonly>
			</td>
 		</tr>
 		<tr>
 			<td class = "title">
				密码：
			</td>
			<td class = "common">
				<input class = "txt" name="password" id="password" type=password>
			</td>
			<td class = "title">
				密码确认：
			</td>
			<td class = "common">
				<input class = "txt" name="psdconfirm" id="psdconfirm" type=password>
			</td>
 		</tr>
 	</table>
 	<br>
 	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "userquery" onclick = "userquery()">用户查询</a>
 	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" id = "useradd" onclick = "useradd()">用户新增</a>
 	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" id = "usermodify" onclick = "usermodify()">用户修改</a>
 	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove'" id = "userdelete" onclick = "userdelete()">用户删除</a>
 	<br>
 	<br>
 	
 	<table id="userlist" class="easyui-datagrid" title="用户信息" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true" >
		<thead>
			<tr>
				<th data-options="field:'userCode',width:130">用户编码</th>
				<th data-options="field:'userName',width:150">用户姓名</th>
				<th data-options="field:'organCode',width:130">管理机构</th>
				<th data-options="field:'organCodeName',width:180">管理机构名称</th>
				<th data-options="field:'operator',width:130">创建人</th>
				<th data-options="field:'modifyDate',width:210">最后一次操作时间</th>
			</tr>
		</thead>
	</table>
</div>
</body>
</html>