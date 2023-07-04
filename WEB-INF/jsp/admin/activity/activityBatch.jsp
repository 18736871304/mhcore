<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%><head>
	<title></title>
	<link rel="stylesheet" href="../../../../css/inputbox/line3.css?v_2022_05_16">
<script>

var inputList;
var checkList;
var doubleList;

window.onload = function()
{
	initDataGrid($('#activitybatchlist'));
	
	inputList = [
	 			$('#organcode'),
	 			$('#sourcelevel'),
	 			$('#batchno'),
	 	];

	 checkList = [
				$('#organcode'),
				$('#sourcelevel'),
				$('#batchno'),
	 	];
	
	disComBox($('#qorgancode'),"crmsysterm",null);
	disComBox($('#qsourcelevel'),"sourcelevel_import",null);
	
	disComBox($('#organcode'),"crmsysterm",null);
	disComBox($('#sourcelevel'),"sourcelevel_import",null);
}

function aftercodeselect(comboxid)
{
}

function selectone()
{

}

function saveSuss()
{
	clearBatchData();
	$('#activitybatchlist').datagrid('reload');
}

function clearBatchData() 
{
	cleardata(inputList);
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
	
	ajaxFileUpload('filename','activity/activityBatchUpload.do',tparam,null,null,saveSuss);
	//上传完毕之后，把浏览框中的文本清除。
}

function activityBatchQuery()
{
	var tturl = "activity/getActivityBatchList.do";

	var tParam = new Object();

	tParam.startdate = $('#qstartdate').datebox("getValue");
	tParam.enddate = $('#qenddate').datebox("getValue");
	
	tParam.organcode = $('#qorgancode').combobox('getValue');
	tParam.sourcelevel = $('#qsourcelevel').combobox('getValue');
	
	displayDataGrid($('#activitybatchlist'), tParam, tturl);

	clearBatchData();
}

</script>
<style>
	td.reprot_title{
		width: 7%;
	}
	td.report_common {
		width: 12%;
	}
</style>
</head>
<body>
<div style="margin-left:0%">
	<table class = "common">
		<tr>
			<td class = "reprot_title">
				导入起期
			</td>
			<td class = "report_common">
				<input class="easyui-datebox" style="width: 90%" id="qstartdate" name="qstartdate">
			</td>
			
			<td class = "reprot_title">
				导入止期
			</td>
			<td class = "report_common">
				<input class="easyui-datebox" style="width: 90%" id="qenddate" name="qenddate">
			</td>
			
			<td class = "reprot_title">
				CRM系统
			</td>
			<td class = "report_common">
				<select class = "easyui-combobox" style="width:90%" panelHeight="auto" name="qorgancode" id="qorgancode">
				</select>
			</td>
			
			<td class = "reprot_title" style="width: 8%;">
				初始资源等级
			</td>
			<td class = "report_common">
				<select class = "easyui-combobox" style="width:90%" panelHeight="auto" name="qsourcelevel" id="qsourcelevel">
				</select>
			</td>
			
			<td></td><td></td>
			<td></td><td></td>
		</tr>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "usermobilequery" onclick = "activityBatchQuery()">查询</a>
	<a href="/upload/batch_upload.xls" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "templete_download">模板下载</a>
	<br>
	<br>
	<table id="activitybatchlist" class="easyui-datagrid" title="CRM资源导入" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<th data-options="field:'organname',width:70">CRM系统</th>
				<th data-options="field:'sourcelevel',width:80">初始资源等级</th>
				<th data-options="field:'batchno',width:120">批次号</th>
				<th data-options="field:'allcount',width:70">总数量</th>
				<th data-options="field:'repeatcount',width:70">重复数量</th>
				<th data-options="field:'successcount',width:70">成功数量</th>
				<th data-options="field:'callcount',width:70">拨打数量</th>
				<th data-options="field:'connectcount',width:70">接通数量</th>
				<th data-options="field:'connectrate',width:70" sortable="true">接通率</th>
				
				<th data-options="field:'bcount',width:70" sortable="true">B类资源数量</th>
				<th data-options="field:'bminuscount',width:70" sortable="true">B-类资源数量</th>
				<th data-options="field:'ccount',width:70" sortable="true">C类资源数量</th>
				<th data-options="field:'cminuscount',width:70" sortable="true">C-类资源数量</th>
				<th data-options="field:'zcount',width:70" sortable="true">Z类资源数量</th>
				
				<th data-options="field:'follow01count',width:70" sortable="true">微信</th>
				<th data-options="field:'follow01rate',width:70" sortable="true">微信率</th>
				<th data-options="field:'follow02count',width:70" sortable="true">配置方案</th>
				<th data-options="field:'follow02rate',width:70" sortable="true">配置方案率</th>
				<th data-options="field:'follow03count',width:70" sortable="true">认清市场</th>
				<th data-options="field:'follow03rate',width:70" sortable="true">认清市场率</th>
				<th data-options="field:'follow04count',width:70" sortable="true">渠道服务</th>
				<th data-options="field:'follow04rate',width:70" sortable="true">渠道服务率</th>
				<th data-options="field:'follow05count',width:70" sortable="true">促销T单</th>
				<th data-options="field:'follow05rate',width:70" sortable="true">促销T单率</th>
				<th data-options="field:'follow07count',width:70" sortable="true">已成交</th>
				<th data-options="field:'follow07rate',width:70" sortable="true">已成交率</th>
				
				<th data-options="field:'otherstore01count',width:70" sortable="true">非标体客户</th>
				<th data-options="field:'otherstore01rate',width:70" sortable="true">非标体客户率</th>
				<th data-options="field:'otherstore02count',width:70" sortable="true">高龄客户</th>
				<th data-options="field:'otherstore02rate',width:70" sortable="true">高龄客户率</th>
				<th data-options="field:'otherstore03count',width:70" sortable="true">同行资源</th>
				<th data-options="field:'otherstore03rate',width:70" sortable="true">同行资源率</th>
				<th data-options="field:'otherstore04count',width:70" sortable="true">空号停机</th>
				<th data-options="field:'otherstore04rate',width:70" sortable="true">空号停机率</th>
				
				<!-- <th data-options="field:'surpluscount',width:90">剩余资源数量</th> -->
				<th data-options="field:'makedate',width:125">操作时间</th>
				<th data-options="field:'operatorname',width:70">操作人</th>
			</tr>
		</thead>
	</table>
	<br>
	<table class = "common"  style="width:73.5%">
		<tr>
			<td class = "reprot_title">
				CRM系统
			</td>
			<td class = "report_common">
				<select class = "easyui-combobox" style="width:90%" panelHeight="auto" name="organcode" id="organcode" notnull = "CRM系统">
				</select>
			</td>
			<td class = "reprot_title">
				初始资源等级
			</td>
			<td class = "report_common">
				<select class = "easyui-combobox" style="width:90%" panelHeight="auto" name="sourcelevel" id="sourcelevel" notnull = "初始资源等级">
				</select>
			</td>
			<td class = "reprot_title">
				批次号
			</td>
			<td class = "report_common">
				<input class = "txt" name="batchno" id="batchno" notnull = "批次号">
			</td>
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
<font color="red">此报表一小时更新一次
</font>
</div>
</body>
</html>
