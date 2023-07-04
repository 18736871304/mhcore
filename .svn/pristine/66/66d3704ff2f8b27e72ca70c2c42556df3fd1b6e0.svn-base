<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%>

<head>
<title></title>
<link rel="stylesheet" href="../../../../css/inputbox/line6.css">
<script>
var inputList;
var checkList;
var doubleList;

window.onload = function () 
{
	initDataGrid($('#articleConfigList'));
	
	inputList = [
				$('#topcontent'),
				$('#middlecontent'),
				$('#bottomcontent')
			];

	checkList = [
				$('#topcontent'),
				$('#middlecontent'),
				$('#bottomcontent')
			];
	
	$('#topcontent').val('');
	$('#middlecontent').val('');
	$('#bottomcontent').val('');
}

function aftercodeselect(comboxid) 
{
	
}

function selectone() 
{
	var row = $('#articleConfigList').datagrid('getSelected');
	
	$('#topcontent').val(row.topcontent);
	$('#middlecontent').val(row.middlecontent);
	$('#bottomcontent').val(row.bottomcontent);
}

function saveSuss() 
{
	clearInputData() 
	$('#articleConfigList').datagrid('reload');
}

function clearInputData() 
{
	cleardata(inputList);
}

function articleConfigAdd()
{
	if(!checknotnull(checkList))
	{
		return;
	}
	
	var tparam = prepareparam(inputList);



	ajaxdeal("articleMan/addArticleConfig.do", tparam, null, null, saveSuss);
}

function articleConfigEdit()
{
	var row = $('#articleConfigList').datagrid('getSelected');
	
	if(row==null)
	{
		$.messager.alert('操作提示','请选中要保存的数据！','error');
		return;
	}

	if(!checknotnull(checkList))
	{
		return;
	}

	var tparam = prepareparam(inputList);
	tparam.configid = row.configid;

	ajaxdeal("articleMan/editArticleConfig.do", tparam, null, null, saveSuss);
}

function articleConfigDelete()
{
	var row = $('#articleConfigList').datagrid('getSelected');
	
	if(row==null)
	{
		$.messager.alert('操作提示','请选中要删除的数据！','error');
		return;
	}
	
	var tparam = new Object();
	tparam.configid = row.configid;
	
	ajaxdeal("articleMan/deleteArticleConfig.do", tparam, null, null, saveSuss);
}

function articleConfigQuery()
{
	var tturl = "articleMan/getArticleConfigList.do";

	var tParam = new Object();
	tParam.topcontent = $('#qtopcontent').val();
	
	displayDataGrid($('#articleConfigList'), tParam, tturl);

	clearInputData();
}
	
</script>
</head>
<body>
	<div style="margin-left:0%">
		<table class="common">
			<td class = "title">
				顶部标题
			</td>
			<td class = "common">
				<input class = "txt" name="qtopcontent" id="qtopcontent" notnull = "顶部标题">
			</td>
			<td></td><td></td>
			<td></td><td></td>
		</table>
		<br>
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="articleConfigQuery" onclick="articleConfigQuery()">查询</a>
		<br>
		<br>
		<table id="articleConfigList" class="easyui-datagrid" title="文章配置列表" style="width:auto;height:auto"
			data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone">
			<thead>
				<tr>
					<th data-options="field:'configid',width:230">配置ID</th>
					<th data-options="field:'topcontent',width:150">顶部标题</th>
					<th data-options="field:'middlecontent',width:150">中部文案</th>
					<th data-options="field:'bottomcontent',width:150">底部引导</th>
					<th data-options="field:'modifydatestr',width:150">最后一次修改时间</th>
				</tr>
			</thead>
		</table>
		<br>
		<table class="common">
			<tr>
				<td class="reprot_title_4">
					顶部标题
				</td>
				<td class="report_common_4" colspan="3">
					<textarea notnull="顶部标题" class="txt" style="width: 600px;height: 30px;" id="topcontent" name="topcontent">
				    </textarea>
				</td>
				<td></td><td></td>
			</tr>
			<tr>
				<td class="reprot_title_4">
					中部文案
				</td>
				<td class="report_common_4" colspan="3">
					<textarea notnull="中部文案" class="txt" style="width: 600px;height: 30px;" id="middlecontent" name="middlecontent">
				    </textarea>
				</td>
			</tr>
			<tr>	
				<td class="reprot_title_4">
					底部引导
				</td>
				<td class="report_common_4" colspan="3">
					<textarea notnull="底部引导" class="txt" style="width: 600px;height: 30px;" id="bottomcontent" name="bottomcontent">
				    </textarea>
				</td>
				
				<td></td><td></td>
			</tr>
		</table>
		<br>
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" id="articleConfigAdd" onclick="articleConfigAdd()">新增</a>
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" id="articleConfigEdit" onclick="articleConfigEdit()">修改</a>
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove'" id="articleConfigDelete" onclick="articleConfigDelete()">删除</a>
	</div>
</body>

</html>