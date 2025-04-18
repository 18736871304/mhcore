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
	initDataGrid($('#articleDistributeList'));
	
	inputList = [
				$('#cluetype'),
				$('#articletype01'),
				$('#articletype02'),
				$('#userid'),
				$('#orderbyid'),
				$('#remark')
			];

			checkList = [
				$('#cluetype'),
				$('#articletype01'),
				$('#articletype02'),
				$('#userid'),
				$('#orderbyid')
			];
	
	disComBox($('#articletype01'),"yesno",null);
	disComBox($('#articletype02'),"yesno",null);
	disComBox($('#cluetype'),"cluetype",null);
	disComBox($('#qcluetype'),"cluetype",null);
	
	$('#qcluetype').combobox('setValue', 'douyin01');
	
	dlgUserInit();
	init02Org();
	
	$('#remark').val("");
}

function aftercodeselect(comboxid) 
{
	organAfterSelect(comboxid);
}

function selectone() 
{
	var row = $('#articleDistributeList').datagrid('getSelected');
	
	$('#usercode').val(row.usercode);
	$('#userid').val(row.userid);
	$('#username').val(row.username);
	
	$('#articletype01').combobox('setValue',row.articletype01);
	$('#articletype02').combobox('setValue',row.articletype02);
	$('#cluetype').combobox('setValue',row.cluetype);
	
	$('#orderbyid').val(row.orderbyid);
	
	$('#remark').val(row.remark);
}

function saveSuss() 
{
	clearInputData() 
	$('#articleDistributeList').datagrid('reload');
}

function clearInputData() 
{
	$('#username').val("");
	cleardata(inputList);
}

function articleDistributeAdd()
{
	if(!checknotnull(checkList))
	{
		return;
	}

	var tparam = prepareparam(inputList);

	ajaxdeal("articleMan/addArticleDistributeUser.do", tparam, null, null, saveSuss);
}

function articleDistributeEdit()
{
	var row = $('#articleDistributeList').datagrid('getSelected');
	
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
	tparam.distributeid = row.distributeid;
	tparam.old_userid = row.userid;
	tparam.old_orderbyid = row.orderbyid;
	tparam.old_cluetype = row.cluetype;

	ajaxdeal("articleMan/editArticleDistributeUser.do", tparam, null, null, saveSuss);
}

function articleDistributeDelete()
{
	var row = $('#articleDistributeList').datagrid('getSelected');
	
	if(row==null)
	{
		$.messager.alert('操作提示','请选中要删除的数据！','error');
		return;
	}
	
	var tparam = new Object();
	tparam.distributeid = row.distributeid;
	tparam.cluetype = row.cluetype;
	
	ajaxdeal("articleMan/deleteArticleDistributeUser.do", tparam, null, null, saveSuss);
}

function articleDistributeQuery()
{
	var tturl = "articleMan/getArticleDistributeList.do";

	var tParam = new Object();

	tParam.q02org = $('#q02org').combobox('getValue');
	tParam.q03org = $('#q03org').combobox('getValue');
	tParam.q04org = getOrgan04Code();

	tParam.teamid = getQTeamId();
	tParam.cluetype = $('#qcluetype').combobox('getValue');

	displayDataGrid($('#articleDistributeList'), tParam, tturl);

	clearInputData();
}
	
</script>
</head>
<body>
<%@ include file="/WEB-INF/jsp/admin/policy/userDlg.jsp"%>
	<div style="margin-left:0%">
		<table class="common">
			<tr>
				<td class="reprot_title">
					渠道活码
				</td>
				<td class="report_common">
					<select class="easyui-combobox" style="width:90%" panelHeight="auto" name="qcluetype" id="qcluetype">
					</select>
				</td>
				<td style="width:6%"></td><td style="width:10%"></td>
				<td style="width:6%"></td><td style="width:10%"></td>
				<td style="width:6%"></td><td style="width:10%"></td>
				<td style="width:6%"></td><td style="width:10%"></td>
				<td style="width:6%"></td><td style="width:10%"></td>
			</tr>
			<%@ include file="/WEB-INF/jsp/admin/team/organAndTeamQuery.jsp"%>
		</table>
		<br>
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="articleDistributeQuery" onclick="articleDistributeQuery()">查询</a>
		<br>
		<br>
		<table id="articleDistributeList" class="easyui-datagrid" title="企微分配规则" style="width:auto;height:auto"
			data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone">
			<thead>
				<tr>
					<th data-options="field:'cluetypename',width:80">渠道活码</th>
					<th data-options="field:'organ02name',width:70">所属省公司</th>
					<th data-options="field:'organname',width:70">所属分公司</th>
					<th data-options="field:'agentcom',width:70">所属营业部</th>
					<th data-options="field:'teamname',width:100">所属团队</th>
					<th data-options="field:'usercode',width:70">业务员编号</th>
					<th data-options="field:'usergradename',width:90">职能级别</th>
					<th data-options="field:'username',width:70">业务员姓名</th>
					
					<th data-options="field:'orderbyid',width:50">排序</th>
					<th data-options="field:'articletype01',width:70">重疾</th>
					<th data-options="field:'articletype02',width:70">理财</th>
					
					<th data-options="field:'modifydatestr',width:125">最新修改时间</th>
					<th data-options="field:'remark',width:300">备注</th>
				</tr>
			</thead>
		</table>
		<br>
		<table class="common">
			<tr>
				<td class="reprot_title_4">
					渠道活码
				</td>
				<td class="report_common_4">
					<select class="easyui-combobox" style="width:90%" panelHeight="auto" name="cluetype" id="cluetype">
					</select>
				</td>
			</tr>
			<tr>
				<td class="reprot_title_4">
					业务员姓名
				</td>
				<td class="report_common_4">
					<input class = "txt" name="username" id="username" notnull = "业务员姓名" readonly 
					onclick="disuUserDlg($('#usercode'),$('#userid'),$('#username'),'02');">
					<input class = "txt" hidden name="userid" id="userid" notnull = "业务员姓名">
					<input class = "txt" hidden name="usercode" id="usercode" notnull = "业务员姓名">
				</td>
				
				<td class="reprot_title_4">
					排序
				</td>
				<td class="report_common_4">
					<input class = "txt" name="orderbyid" id="orderbyid" notnull = "分配顺序">
				</td>

				<td class="reprot_title_4">
					重疾
				</td>
				<td class="report_common_4">
					<select class="easyui-combobox" style="width:90%" panelHeight="auto" name="articletype01" id="articletype01">
					</select>
				</td>
				
				<td class="reprot_title_4">
					理财
				</td>
				<td class="report_common_4">
					<select class="easyui-combobox" style="width:90%" panelHeight="auto" name="articletype02" id="articletype02">
					</select>
				</td>
			</tr>
			<tr>
				<td class="reprot_title_4">
					备注
				</td>
				<td class="report_common_4" colspan="3">
					<textarea notnull="备注" class="txt" style="width: 600px;height: 75px;" id="remark" name="remark">
				    </textarea>
				</td>
				<td></td><td></td>
			</tr>
		</table>
		<br>
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" id="articleDistributeEdit" onclick="articleDistributeEdit()">保存</a>
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" id="articleDistributeAdd" onclick="articleDistributeAdd()">新增</a>
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove'" id="articleDistributeDelete" onclick="articleDistributeDelete()">删除</a>
	</div>
</body>

</html>