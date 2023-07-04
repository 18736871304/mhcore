<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%><head>
<title></title>
<link rel="stylesheet" href="../../../../css/inputbox/line6.css">
<script>

var checkList;

window.onload = function()
{
	initDataGrid20($('#policyList'));

	policyDetailDlgInit();
	dlgUserInit();
			
	initRenewQuery('12','00','confirm');
	
	checkList = [
			 		$('#renewpaytime'),
			 		$('#actualprem'),
				]
}

function aftercodeselect(comboxid)
{
	qRenewAftercodeselect(comboxid);
}

function selectone()
{
	var row = $('#policyList').datagrid('getSelected');
	
	if(row.actualprem!=null&&row.actualprem!="")
	{
		$('#actualprem').val(row.actualprem);
	}
	else
	{
		$('#actualprem').val(row.reprem);
	}
	
	$('#renewpaytime').datebox('setValue',row.renewpaytime);
}

function repayConfirm()
{
	var row = $('#policyList').datagrid('getSelected');
	
	if(row==null)
	{
		$.messager.alert('操作提示','请选中要操作的数据！','error');
		return;
	}
	
	if(!checknotnull(checkList))
	{
		return;
	}
	
	if(!row.callbacktype == '02')
	{
		$.messager.alert('操作提示','该保单已对接，不能手工确认！','error');
		return;
	}
	
	var tparam = new Object();
	
	tparam.renewserialno = row.renewserialno;
	tparam.actualprem = $('#actualprem').val();
	tparam.renewpaytime = $('#renewpaytime').datebox("getValue");
	
	ajaxdeal("policy/renewPayConfirm.do",tparam,null,null,saveSuss);
}

function saveSuss()
{
	$('#policyList').datagrid('reload');
	$('#actualprem').val('');
	$('#renewpaytime').datebox('setValue','');
}

function FileUpload()
{
	ajaxFileUpload('filename','/policy/yeayPayImport.do?type=year',null,null,null,saveSuss);
	//上传完毕之后，把浏览框中的文本清除。
}
</script>

</head>
<%@ include file="/WEB-INF/jsp/admin/policy/userDlg.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/policy/policyDetailDlg.jsp"%>
<body>
<div style="margin-left:0%">
	<%@ include file="/WEB-INF/common/query/renew/renewCommonQuery.jsp"%>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "articlequery" onclick = "renewPolicyquery()">查询</a>
  <a href="/upload/renewyear.xls" class="easyui-linkbutton" data-options="iconCls:'icon-search'"
  id="templete_download">模板下载</a>
  <br>
	<br>
	<table id="policyList" class="easyui-datagrid" title="年缴保单信息" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<%@ include file="/WEB-INF/common/column/renew/renewList.jsp"%>
			</tr>
		</thead>
	</table>
	<br>
	<table class = "common" style="width: 49%;">
		<tr>
			<td class = "title">
				实收日期
			</td>
			<td class = "common">
				<input class="easyui-datebox" style="width: 160%" id="renewpaytime" name="renewpaytime" notnull = "实收日期">
			</td>
			<td class = "title">
				实收保费
			</td>
			<td class = "common">
				<input class = "txt" id="actualprem" name="actualprem" notnull = "实收保费">
			</td>
		</tr>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" id = "repayConfirm" onclick = "repayConfirm()">实收确认</a>
	<br>
	<br>
	<!-- 上传信息展示区域 -->
	<div class="upload-box">
		<input type='txt' name='textfield' id='textfield' class='upload-txt' />
		<button id = "file-view" class="smsbutton">浏览...</button>
		<input type="file" name="myfiles" class="upload-file" id="filename" size="28" onchange="document.getElementById('textfield').value=this.value.substr(12)" />
		<button id = "file-upload" class="smsbutton" onclick = "FileUpload()">上传</button>
	</div>

</div>
</body>
</html>