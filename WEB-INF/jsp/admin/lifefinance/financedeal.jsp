<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%><head>
	<title></title>
<script>

var inputList;
var checkList;
var doubleList;
var balanbatchno;
window.onload = function()
{
	initDataGrid20($('#lifebalancelist'));
	initDataGrid20($('#lifepolicyBalanceList'));
	
	inputList = [
	];

	checkList = [
	];
	
	var tturl = "combox/disComBox.do?comboxType=checktype";
	displayCombox($('#qstate'),null,tturl,"dd_key","dd_value");
	
	var tturl = "combox/disComBox.do?comboxType=insorgancode";
	displayCombox($('#qinsorgancode'),null,tturl,"dd_key","dd_value");
	displayCombox($('#qinsorgancode2'),null,tturl,"dd_key","dd_value");
	
}

function selectone()
{
}

function saveSuss()
{
	clearCarData();
}

function clearCarData() 
{
	cleardata(inputList);
}

function lifebalancequery()
{
	var tturl = "lifefinance/getLifebalanceList.do";
	var tParam = new Object();

	tParam.insorgancode = $('#qinsorgancode').combobox('getValue');
	tParam.startdate = $('#startdate').datebox("getValue");
	tParam.enddate = $('#enddate').datebox("getValue");

	displayDataGrid20($('#lifebalancelist'), tParam, tturl);

	clearLifeData();
}

function clearLifeData() 
{
	cleardata(inputList);
}

function selectone()
{
	var row = $('#lifebalancelist').datagrid('getSelected');
	balanbatchno = row.balanbatchno;

}

function fileupload()
{
	if(null==balanbatchno || ""== balanbatchno)
	{
		$.messager.alert("error",'上传时请选择要核对的批次号！');
		return;
	}
	var tParam = new Object();
	tParam.balanbatchno=balanbatchno;
	ajaxFileUpload('lifebalancefile','lifefinance/importAnddealFile.do',tParam,null,null,saveSuss);

	//上传完毕之后，把浏览框中的文本清除。
	$('#textfield').val("");
}

function lifepolicyBalanceQuery(type)
{
	/* var checkresult = $('#qstate').combobox('getValue');
	if(checkresult == null || checkresult == ""){
		$.messager.alert('操作提示', '请选择状态！');
		return;
	} */
	if(balanbatchno == null || balanbatchno == ""){
		$.messager.alert('操作提示', '请选择批次号！');
		return;
	}
	var tParam = new Object();
	tParam.balanbatchno=balanbatchno;
	tParam.insorgancode = $('#qinsorgancode2').combobox('getValue');
	tParam.state = $('#qstate').combobox('getValue');
	tParam.startdate = $('#jsStartdate').datebox("getValue");
	tParam.enddate = $('#jsEnddate').datebox("getValue");
	if("query"== type){
		var tturl = "lifefinance/getLpblist.do";
		displayDataGrid20($('#lifepolicyBalanceList'), tParam, tturl);
	}
	if(type == "download"){
		var tturl = "lifefinance/lifepolicybalanceDownLoad.do";
		ajaxdeal(tturl,tParam,listdownloadreturn,null);
	}
}

function listdownloadreturn(data)
{
	if(data.flag == "0")
	{
		if(data.message == null || data.message == "")
		{
			$.messager.alert('执行失败','没有生成下载文件','error');	
		}
		else
		{
			$.messager.alert('执行成功',"执行成功，请点击下载",'info');	
			//判断id存在的代码
			if($("#xiazai").length>0)
			{
				$("#xiazai").remove();
				$('#cardownload').after("&nbsp&nbsp<a id = 'xiazai' href = 'download.do?filename="+data.message+"'>点击下载</a>");
			}
			else
			{
				$('#cardownload').after("&nbsp&nbsp<a id = 'xiazai' href = 'download.do?filename="+data.message+"'>点击下载</a>");
			}
		}
	}
	else
	{
		if(data.message == null || data.message == "")
		{
			$.messager.alert('执行失败','操作失败','error');	
		}
		else
		{
			$.messager.alert('执行失败',data.message,'error');	
		}
	}
}

</script>

</head>
<body>
<div style="margin-left:0%">
	<table class = "common" >
		<tr>
			<td class = "title">
				保险公司
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qinsorgancode" id="qinsorgancode">
				</select>
			</td>
			<td class = "title">
				结算日期起期
			</td>
			<td class = "common">
				<input class="easyui-datebox" style="width:160%" name="startdate" id="startdate">
			</td>
			<td class = "title">
				结算日期止期
			</td>
			<td class = "common">
				<input class="easyui-datebox" style="width:160%" name="enddate" id="enddate">
			</td>
		</tr>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "lifebalancequery" onclick = "lifebalancequery()">查询</a>
	
	<table id="lifebalancelist" class="easyui-datagrid" title="结算数据信息" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<th data-options="field:'balanbatchno',width:150">结算批次号</th>
				<th data-options="field:'insorgancode',width:120">保险公司</th>
				<th data-options="field:'startdate',width:120">结算开始日期</th>
				<th data-options="field:'enddate',width:120">结算结束日期</th>
				<th data-options="field:'state',width:120">状态</th>
				<th data-options="field:'operator',width:120">操作员</th>
				<th data-options="field:'makedate',width:120">生成日期</th>
			</tr>
		</thead>
	</table>
<br/>核对信息上传<br/>
<div class="upload-box">
	<input type='text' name='textfield' id='textfield' class='upload-txt' />  
 	<button id = "file-view" class="smsbutton">浏览...</button> 	
 	<input type="file" name="myfiles" class="upload-file" id="lifebalancefile" size="28" onchange="document.getElementById('textfield').value=this.value.substr(12)" /> 	
 	<button id = "file-upload" class="smsbutton" onclick = "fileupload()">上传</button>
 <br/><br/>	
</div>
	<hr>
	<table class = "common" >
		<tr>
			<td class = "title">
				保险公司
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qinsorgancode2" id="qinsorgancode2">
				</select>
			</td>
			<td class = "title">
				状态
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qstate" id="qstate">
				</select>
			</td>
			<td></td>
		</tr>
		<tr>
			<td class = "title">
				结算日期起期
			</td>
			<td class = "common">
				<input class="easyui-datebox" style="width:160%" name="jsStartdate" id="jsStartdate">
			</td>
			<td class = "title">
				结算日期止期
			</td>
			<td class = "common">
				<input class="easyui-datebox" style="width:160%" name="jsEnddate" id="jsEnddate">
			</td>
		</tr>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "lifepolicyBalanceQuery" onclick = "lifepolicyBalanceQuery('query')">查询</a>
	
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" id = "lifepolicyBalanceDownload" onclick = "lifepolicyBalanceQuery('download')">下载</a>
	<br>
	<br>
	<div id="tempdiv">
	
	<table id="lifepolicyBalanceList" class="easyui-datagrid" title="核对数据信息" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<!-- <th data-options="field:'orderid',width:140">订单号</th> -->
				<th data-options="field:'policyno',width:150">保单号</th>
				<th data-options="field:'balancebatchno',width:140">批次号</th>
				<th data-options="field:'insorgancode',width:100">保险公司</th>
				<th data-options="field:'riskcode',width:100">险种编码</th>
				<th data-options="field:'riskname',width:120">险种名称</th>
				<th data-options="field:'prem',width:100">保费</th>
				<th data-options="field:'fyp',width:100">FYP</th>
				<th data-options="field:'amnt',width:100">保额</th>
				<th data-options="field:'rate',width:100">保险公司结算费率</th>
				<th data-options="field:'fee',width:100">保险公司结算费用</th>
				<th data-options="field:'agentrate',width:100">业务员费率</th>
				<th data-options="field:'agentfee',width:100">业务员费用</th>
				<!-- <th data-options="field:'payintv',width:100">缴费方式</th>
				<th data-options="field:'payendyear',width:120">缴费期间</th> -->
				<th data-options="field:'caldate',width:120">结算时间</th>
				<th data-options="field:'state',width:120">核对结果</th>
				<th data-options="field:'remark',width:260">差异信息</th>
			</tr>
		</thead>
	</table>
	</div>
	<br>
	<br>
</div>
</body>
</html>
