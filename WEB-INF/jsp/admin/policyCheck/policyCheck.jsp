<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%><head>
	<title></title>
<script>

var inputList;
var checkList;
var doubleList;

window.onload = function()
{
	initDataGrid($('#policyRelevantlist'));
	initDataGrid($('#policyList'));
	
	//$("#tempquery").hide();
	$(".policyquery").hide();
	
	//$("#tempdiv").hide();
	$("#policydiv").hide();
	
	inputList = [
	];

	checkList = [
	];
	disComBox($('#qstate'),"policyquery",null);
	$('#qstate').combobox('setValue','40')
	var tturl = "combox/disComBox.do?comboxType=checktype";
	displayCombox($('#qcheckresult'),null,tturl,"dd_key","dd_value");
	
	$('#qcheckresult').combobox('setValue','00') //核对无差异
	
	var tturl = "combox/disComBox.do?comboxType=insorgancode";
	displayCombox($('#qinsorgancode'),null,tturl,"dd_key","dd_value");
	displayCombox($('#qinsorgancode2'),null,tturl,"dd_key","dd_value");
	
}

function aftercodeselect(comboxid)
{
	if(comboxid.attr("id")=="qcheckresult"){
		if( $('#qcheckresult').combobox('getValue')=='11'){
			$("#tempquery").hide();
			$(".policyquery").show();
		}else{
			$("#tempquery").show();
			$(".policyquery").hide();
		}
		
	}
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

function policyRelevantquery()
{
	$("#policyRelevantlist").datagrid("loadData", { total: 0, rows: [] });
	$("#policyList").datagrid("loadData", { total: 0, rows: [] });
	var checkresult = $('#qcheckresult').combobox('getValue');
	if(checkresult == null || checkresult == ""){
		$.messager.alert('操作提示', '请选择核对结果！');
		return;
	}else if(checkresult == "11"){ //代理公司多
		$("#tempdiv").hide();
		$("#policydiv").show();
		var tturl = "policy/getPolicyList.do";
		var tParam = new Object();
		tParam.contno = $('#qcontno').val();
		tParam.appname = $('#qappname').val();
		tParam.reuserid = $('#qreuserid').val();
		tParam.q02org = $('#q02org').combobox('getValue');
		tParam.q03org = $('#q03org').combobox('getValue');
		tParam.q04org = $('#q04org').combobox('getValue');
	    var codes = $('#qinsorgancode2').combobox('getValues');
	    var ic = "";
	    for(var i=0;i<codes.length;i++){
	        if (ic != "") ic += "\',\'";
	        ic += codes[i];
	    }
	    tParam.insorgancode = ic;
	    tParam.state = "40";
	    tParam.checkresult = checkresult;
		tParam.agentflag = '02';
		tParam.acceptStartDate = $('#qacceptStartDate').datebox("getValue");
		tParam.acceptEndDate = $('#qacceptEndDate').datebox("getValue");
		tParam.calstartdate = $('#qcStartDate').datebox("getValue");
		tParam.calenddate = $('#qcEndDate').datebox("getValue");
		tParam.organcode = $('#departmentId').val();
		displayDataGrid20($('#policyList'), tParam, tturl);
	}else{
		$("#tempdiv").show();
		$("#policydiv").hide();
		var tturl = "policyCheck/getPolicytempList.do";
		var tParam = new Object();
		tParam.policyno = $('#qpolicyno').val();
		var codes = $('#qinsorgancode').combobox('getValues');
		var ic = "";
		   for(var i=0;i<codes.length;i++){
		       if (ic != "") ic += "\',\'";
		       ic += codes[i];
		   }
		tParam.insorgancode = ic;
		var checkresult = $('#qcheckresult').combobox('getValue');
		tParam.checkresult = checkresult;
		tParam.makedate = $('#qmakedate').datebox("getValue");
		displayDataGrid($('#policyRelevantlist'), tParam, tturl);
	}
	 saveSuss();
}

function CarFinUpload()
{
	ajaxFileUpload('contfilename','policyCheck/importExcel.do',null,null,null,saveSuss);

	//上传完毕之后，把浏览框中的文本清除。
	$('#textfield').val("");
}

function cardownload()
{
	var checkresult = $('#qcheckresult').combobox('getValue');
	if(checkresult == null || checkresult == ""){
		$.messager.alert('操作提示', '请选择核对结果！');
		return;
	}else if(checkresult == "11"){ //代理公司多
		$("#tempdiv").hide();
		$("#policydiv").show();
		var tturl = "policyCheck/policytempDownLoad.do";
		var tParam = new Object();
		tParam.contno = $('#qcontno').val();
		tParam.appname = $('#qappname').val();
		tParam.reuserid = $('#qreuserid').val();
		tParam.q02org = $('#q02org').combobox('getValue');
		tParam.q03org = $('#q03org').combobox('getValue');
		tParam.q04org = $('#q04org').combobox('getValue');
	    var codes = $('#qinsorgancode2').combobox('getValues');
	    var ic = "";
	    for(var i=0;i<codes.length;i++){
	        if (ic != "") ic += "\',\'";
	        ic += codes[i];
	    }
	    tParam.insorgancode = ic;
	    tParam.state = "40";
		tParam.agentflag = '02';
		tParam.acceptStartDate = $('#qacceptStartDate').datebox("getValue");
		tParam.acceptEndDate = $('#qacceptEndDate').datebox("getValue");
		tParam.calstartdate = $('#qcStartDate').datebox("getValue");
		tParam.calenddate = $('#qcEndDate').datebox("getValue");
		tParam.organcode = $('#departmentId').val();
		tParam.checkresult = checkresult;
		ajaxdeal(tturl,tParam,listdownloadreturn,null);
	}else{
		$("#tempdiv").show();
		$("#policydiv").hide();
		var tturl = "policyCheck/policytempDownLoad.do";
		var tParam = new Object();
		tParam.policyno = $('#qpolicyno').val();
		var codes = $('#qinsorgancode').combobox('getValues');
		var ic = "";
		   for(var i=0;i<codes.length;i++){
		       if (ic != "") ic += "\',\'";
		       ic += codes[i];
		   }
		tParam.insorgancode = ic;
		var checkresult = $('#qcheckresult').combobox('getValue');
		tParam.checkresult = checkresult;
		tParam.makedate = $('#qmakedate').datebox("getValue");
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

	<table>
		<tr>
			<td class="dstitle">核对信息上传</td>
		</tr>
	</table>
<div class="upload-box">
	<input type='text' name='textfield' id='textfield' class='upload-txt' />  
 	<button id = "file-view" class="smsbutton">浏览...</button> 	
 	<input type="file" name="myfiles" class="upload-file" id="contfilename" size="28" onchange="document.getElementById('textfield').value=this.value.substr(12)" /> 	
 	<button id = "file-upload" class="smsbutton" onclick = "CarFinUpload()">上传</button>
 	
</div>
	<hr>
	<table class = "common" >
		<tr>
			<td class = "title">
				核对结果
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" name="qcheckresult" id="qcheckresult" >
				</select>
			</td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			
		</tr>
		<tr id="tempquery">
			<td class = "title" id="aaa">
				保险公司
			</td>
			<td class = "common">
				<input class="easyui-combobox" hidden id="qinsorgancode" style="width:160%" name="qinsorgancode" data-options="valueField:'id',textField:'text',multiple:true,panelHeight:'auto'">	
			</td>
			<td class = "title">
				保单号
			</td>
			<td class = "common">
				<input class = "txt" name="qpolicyno" id="qpolicyno">
			</td>
			<td class = "title">
				导入时间
			</td>
			<td class = "common">
				<input class="easyui-datebox" style="width: 160%" id="qmakedate" name="qmakedate" notnull = "导入时间">
			</td>
		</tr>
		<tr class="policyquery">
			<td class = "title">
				保单号
			</td>
			<td class = "common">
				<input class = "txt" name="qcontno" id="qcontno">
			</td>
			<td class = "title">
				投保人姓名
			</td>
			<td class = "common">
				<input class = "txt" name="qappname" id="qappname">
			</td>
			<td class = "title">
				业务员
			</td>
			<td class = "common">
				<input class = "txt" name="qreuserid" id="qreuserid" readonly onclick = "disuUserDlg($('#qreuserid'));">
			</td>
		</tr>
		<tr class="policyquery">
			<td class = "title">
				保险公司
			</td>
			<td class = "common">
				<%--<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qinsorgancode" id="qinsorgancode">--%>
				<%--</select>--%>
				<input class="easyui-combobox" id="qinsorgancode2" style="width:160%" name="qinsorgancode2" data-options="valueField:'id',textField:'text',multiple:true,panelHeight:'auto'">
			</td>
			<td class = "title">
				保单状态
			</td>
			<td class = "common">
				<select disabled="disabled" class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qstate" id="qstate">
				</select>
			</td>
			<td></td>
			<td></td>
		</tr>
		<tr hidden="hidden" >
			<td class = "title">
				省公司
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="q02org" id="q02org">
				</select>
			</td>
			<td class = "title">
				分公司
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="q03org" id="q03org">
				</select>
			</td>
			<td class = "title">
				事业部
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="q04org" id="q04org">
				</select>
			</td>
		</tr>
		<tr class="policyquery">
			<td class = "title">
				出单起期：
			</td>
			<td class = "common">
				<input class="easyui-datebox" style="width: 160%" id="qacceptStartDate" name="qacceptStartDate" notnull = "出单起期">
			</td>
			<td class = "title">
				出单止期：
			</td>
			<td class = "common">
				<input class="easyui-datebox" style="width: 160%" id="qacceptEndDate" name="qacceptEndDate" notnull = "出单止期">
				(算头不算尾)
			</td>
		</tr>
		<tr class="policyquery">
			<td class = "title">
				核算起期：
			</td>
			<td class = "common">
				<input class="easyui-datebox" style="width: 160%" id="qcStartDate" name="qcStartDate" notnull = "生效起期">
			</td>
			<td class = "title">
				核算止期：
			</td>
			<td class = "common">
				<input class="easyui-datebox" style="width: 160%" id="qcEndDate" name="qcEndDate" notnull = "生效止期">
				(算头不算尾)
			</td>
		</tr>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "policyRelevantquery" onclick = "policyRelevantquery()">核对数据查询</a>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "cardownload" onclick = "cardownload()">保单核对下载</a>
	<br>
	<br>
	<div id="tempdiv">
	
	<table id="policyRelevantlist" class="easyui-datagrid" title="核对数据信息" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr id="">
				<th data-options="field:'policyno',width:120">保单号</th>
				<th data-options="field:'insorgancode',width:120">保险公司</th>
				<th data-options="field:'premium',width:120">保费</th>
				<th data-options="field:'appntname',width:120">投保人</th>
				<th data-options="field:'insuredname',width:120">被保险人</th>
				<th data-options="field:'payintv',width:120">缴费方式</th>
				<th data-options="field:'payendyear',width:120">缴费期间</th>
				<th data-options="field:'riskcode',width:120">险种信息</th>
				<th data-options="field:'accepttime',width:120">承保时间</th>
				<th data-options="field:'makedate',width:120">生成时间</th>
				<th data-options="field:'checkresult',width:120">核对结果</th>
				<th data-options="field:'remark',width:260">差异信息</th>
			</tr>
		</thead>
	</table>
	</div>
	<div id="policydiv">
	<table id="policyList" class="easyui-datagrid" title="保单信息" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<th data-options="field:'accepttime',width:140">出单日期</th>
				<th data-options="field:'organname',width:90">出单分公司</th>
				<th data-options="field:'agentcom',width:120">出单事业部</th>
				<th data-options="field:'reusername',width:70">出单员</th>
				<th data-options="field:'serviceusername',width:80">保单服务人员</th>
				<th data-options="field:'contno',width:140">保单号</th>
				<th data-options="field:'statename',width:90">保单状态</th>
				<th data-options="field:'insorganname',width:90">保险公司</th>
				<th data-options="field:'riskname',width:190">险种</th>
				
				<th data-options="field:'amnt',width:90">保额</th>
				<th data-options="field:'prem',width:90">保费</th>
				<th data-options="field:'payendyear',width:70">缴费年期</th>
				<th data-options="field:'payendyearflag',width:80">缴费年期单位</th>
				
				<th data-options="field:'fyp20',width:60">标保</th>
				
				<th data-options="field:'appname',width:70">投保人姓名</th>
				<th data-options="field:'appsexname',width:70">投保人性别</th>
				<th data-options="field:'appbirthday',width:70">投保人生日</th>
				<th data-options="field:'appprovincename',width:90">投保人所在省</th>
				<th data-options="field:'appcityname',width:90">投保人所在市</th>
				<th data-options="field:'appcountryname',width:90">投保人所在县</th>
				<th data-options="field:'appaddress',width:150">投保人地址</th>
				
				<th data-options="field:'relaname',width:100">投被保人关系</th>
				
				<th data-options="field:'insname',width:70">被保人姓名</th>
				<th data-options="field:'inssexname',width:70">被保人性别</th>
				<th data-options="field:'insbirthday',width:70">被保人生日</th>
				<th data-options="field:'insprovincename',width:90">被保人所在省</th>
				<th data-options="field:'inscityname',width:90">被保人所在市</th>
				<th data-options="field:'inscountryname',width:90">被保人所在县</th>
				<th data-options="field:'insaddress',width:150">被保人地址</th>
				
				<th data-options="field:'cvalidate',width:140">保单生效日期</th>
				
				<th data-options="field:'freelookperiod',width:70">犹豫期天数</th>
				<th data-options="field:'accountdate',width:140">保单核算日期</th>
				<th data-options="field:'fincestate',width:100">审批状态</th>
				
			</tr>
		</thead>
	</table>
	</div>
</div>
</body>
</html>
