<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%><head>
	<title></title>
	<link rel="stylesheet" href="../../../../css/inputbox/line6.css">
<script>

var inputList;
var checkList;
var doubleList;

window.onload = function()
{
	initDataGrid($('#rigthscardslist'));
	
	inputList = [
	 			$('#cardtype'),
	 	];

	 checkList = [
	 			$('#cardtype'),
	 	];
	
	disComBox($('#qcardtype'),"cardtype",null);
	disComBox($('#cardtype'),"cardtype",null);
}

function aftercodeselect(comboxid)
{
}

function selectone()
{

}

function saveSuss()
{
	cleardata(inputList);
	$('#rigthscardslist').datagrid('reload');
	$('#filename').val("");
	$('#textfield').val($('#filename').val());
}

function FileUpload()
{
	if(!checknotnull(checkList))
	{
		return;
	}

	var tparam = prepareparam(inputList);
	
	ajaxFileUpload('filename','rightsMan/cardsUpload.do',tparam,null,null,saveSuss);
	//上传完毕之后，把浏览框中的文本清除。
}

function cardsQuery()
{
	var tturl = "rightsMan/getRightsCardsList.do";

	var tParam = new Object();
	
	tParam.cardtype = $('#qcardtype').combobox('getValue');

	displayDataGrid($('#rigthscardslist'), tParam, tturl);

	clearUploadData();
}

function clearUploadData() 
{
	cleardata(inputList);
	$('#filename').val("");
	$('#textfield').val($('#filename').val());
}

</script>
</head>
<body>
<div style="margin-left:0%">
	<table class = "common">
		<tr>
			<td class = "reprot_title">
				权益卡类型
			</td>
			<td class = "report_common">
				<select class = "easyui-combobox" style="width:90%" panelHeight="auto" name="qcardtype" id="qcardtype">
				</select>
			</td>
			
			<td></td><td></td>
			<td></td><td></td>
			<td></td><td></td>
			<td></td><td></td>
			<td></td><td></td>
		</tr>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "cardsQuery" onclick = "cardsQuery()">查询</a>
	<a href="/upload/rights_cards.xls" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "templete_download">模板下载</a>
	<br>
	<br>
	<table id="rigthscardslist" class="easyui-datagrid" title="权益卡列表" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<th data-options="field:'cardtypename',width:125">权益卡类型</th>
				<th data-options="field:'cardno',width:125">卡号</th>
				<th data-options="field:'uploaddate',width:200">导入时间</th>
				<th data-options="field:'userid',width:125">绑定手机号</th>
			</tr>
		</thead>
	</table>
	<br>
	<table class = "common">
		<tr>
			<td class = "reprot_title_4">
				权益卡类型
			</td>
			<td class = "report_common_4">
				<select class = "easyui-combobox" style="width:90%" panelHeight="auto" name="cardtype" id="cardtype" notnull = "权益卡类型">
				</select>
			</td>
			<td></td><td></td>
			<td></td><td></td>
		</tr>
	</table>
	
	<br>
<div class="upload-box">
	<input type='text' name='textfield' id='textfield' class='upload-txt' />  
 	<button id = "file-view" class="smsbutton">浏览...</button> 	
 	<input type="file" name="myfiles" class="upload-file" id="filename" size="28" onchange="document.getElementById('textfield').value=this.value.substr(12)" /> 	
 	<button id = "file-upload" class="smsbutton" onclick = "FileUpload()">上传</button>
</div>
<br>
</div>
</body>
</html>