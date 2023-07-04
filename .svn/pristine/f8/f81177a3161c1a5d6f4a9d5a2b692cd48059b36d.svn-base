<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%>
<head>    
   <title>车险业务上传</title>  

<script>

var inputList;

var checklist;

var doublelist;

var organgrade;

window.onload = function()
{
	initDataGrid($('#lifeinsurancelist'));
	
	hideProColumn();
	
	inputList = [$('#policyprintno'),
	             $('#invoiceprintno'),
	             $('#CInsFlagPrtNo'),
	             $('#getorgan'),
	             $('#plateno'),
	             $('#insorgancode'),
	             $('#agentcode'),
	             $('#agentname'),
	             $('#policyno'),
	             //$('#signdate'),
	             $('#policystartdate'),
	             $('#policyenddate'),
	             $('#dealdate'),
	             //$('#channelcode'),
	             $('#insuredName'),
	             $('#insuredIdType'),
	             $('#insuredIdNo'),
	             //$('#insuredSex'),
	             //$('#insuredBirthday'),
	             $('#insuredPhone'),
	             //$('#insuredAddress'),
	             $('#riskcode'),
	             $('#premium'),
	             $('#travelTax'),
	             //$('#carprice'),
	             $('#usernaturecode'),
	             $('#carcategorycode'),
	             $('#frameno'),
	             $('#engineno'),
	             $('#motorcyclename'),
	             $('#firstrecorddate'),
	             $('#remark'),
	             $('#bnfName')];
	             //$('#annualdate'),
	             //$('#SeatCount'),
	             //$('#tonnage')];
	
	checklist = [$('#policyprintno'),
	             $('#invoiceprintno'),
	             //$('#CInsFlagPrtNo'),
	             $('#getorgan'),
	             $('#plateno'),
	             $('#insorgancode'),
	             //$('#agentcode'),
	             //$('#agentname'),
	             $('#policyno'),
	             $('#dealdate'),
	             //$('#channelcode'),
	             //$('#signdate'),
	             $('#policystartdate'),
	             $('#policyenddate'),
	             $('#insuredName'),
	             $('#insuredIdType'),
	             $('#insuredIdNo'),
	             $('#insuredPhone'),
	             $('#riskcode'),
	             $('#premium'),
	             $('#travelTax'),
	             $('#bnfName')];
	
	doublelist = [$('#premium'),
	              //$('#SeatCount'),
	              //$('#tonnage'),
	              //$('#carprice'),
		          $('#travelTax')];
	
	//initcombox();
	//insOrganInit();
	
	organgrade = $('#iamsorgangrade').val();
	
	if(organgrade=="02"||organgrade=="03")
	{
		$('#getorgan').combobox('setValue',$('#iamsoprorgan').val());
	}
	
	mhdisplay();
	
	caruserinfo.style.display="none";
	
	document.onkeydown = function(e)
	{ 
	    var ev = document.all ? window.event : e;
	    if(ev.keyCode==13) 
	    {
	    	quickinput();
	    }
	}
}

function quickinput()
{
	if($('#policyno').val()==""||$('#policyno').val()==null)
	{
		$.messager.alert('操作提示','保单号不能为空','info');
		
		return;	
	}

	$.ajax
	({
		  type: 'POST',
		  url: "./quickinput/syx.do",
		  data: "policyno="+$('#policyno').val(),
		  //dataType: "policyno="+$('#policyno').val(),
		  success: function(data)
		  {
		  	var jsonobj = (new Function("return " + data))();
	     
	        //policyno.disabled = true; 
	        
	        $('#plateno').val(jsonobj["plateno"]);
	        $('#dealdate').datebox('setValue',jsonobj["dealdate"]);
	        $('#insuredName').val(jsonobj["insuredName"]);
	        $('#riskcode').combobox('setValue',jsonobj["riskcode"]);
	        $('#premium').val(jsonobj["premium"]);
	        $('#frameno').val(jsonobj["frameno"]);
	        $('#engineno').val(jsonobj["engineno"]);
	        $('#motorcyclename').val(jsonobj["motorcyclename"]);
	        
	        $('#firstrecorddate').datebox('setValue',jsonobj["firstrecorddate"]);
	        $('#policystartdate').datebox('setValue',jsonobj["policystartdate"].substr(0, 10));
	        $('#policyenddate').datebox('setValue',jsonobj["policyenddate"].substr(0, 10));
	        
	        caruserinfo.style.display="";
	        $('#caruserinfo').val(jsonobj["carcategorycode"]);
		  }
	});
} 

function mhdisplay()
{
	disagent.style.display="none";
	
	disinsured.style.display="none";
	
	carinfo1.style.display="none";
	carinfo2.style.display="none";
	
	qagent.style.display="none";
}

function hideProColumn()
{
	$('#lifeinsurancelist').datagrid('hideColumn','policyserialno');
	$('#lifeinsurancelist').datagrid('hideColumn','getorgan');
	$('#lifeinsurancelist').datagrid('hideColumn','insorgancode');
	$('#lifeinsurancelist').datagrid('hideColumn','riskcode');
	$('#lifeinsurancelist').datagrid('hideColumn','insuredIdType');
	//$('#lifeinsurancelist').datagrid('hideColumn','insuredSex');
	$('#lifeinsurancelist').datagrid('hideColumn','usernaturecode');
	$('#lifeinsurancelist').datagrid('hideColumn','carcategorycode');
	//$('#lifeinsurancelist').datagrid('hideColumn','channelcode');
}

function clearCarData()
{
	cleardata(inputList);
	
	policyno.disabled = false;
	caruserinfo.style.display="none";
	
	if(organgrade=="02")
	{
		$('#getorgan').combobox('setValue',$('#iamsoprorgan').val());
	}
}

function selectonecar()
{
	var row = $('#lifeinsurancelist').datagrid('getSelected');
    
	$('#policyprintno').val(row.policyprintno);
	$('#invoiceprintno').val(row.invoiceprintno);
	$('#CInsFlagPrtNo').val(row.CInsFlagPrtNo);
	$('#getorgan').combobox('setValue',row.getorgan);
	$('#plateno').val(row.plateno);
	$('#insorgancode').combobox('setValue',row.insorgancode);
	$('#channelcode').combobox('setValue',row.channelcode);
	$('#dealdate').datebox('setValue',row.dealdate);
	$('#agentcode').val(row.agentcode);
	$('#agentname').val(row.agentname);
	$('#policyno').val(row.policyno);
	$('#signdate').datebox('setValue',row.signdate);
	$('#policystartdate').datebox('setValue',row.policystartdate);
	$('#policyenddate').datebox('setValue',row.policyenddate);
	$('#insuredName').val(row.insuredName);
	$('#insuredIdType').combobox('setValue',row.insuredIdType);
	$('#insuredIdNo').val(row.insuredIdNo);
	$('#insuredSex').combobox('setValue',row.insuredSex);
	$('#insuredBirthday').datebox('setValue',row.insuredBirthday);
	$('#insuredPhone').val(row.insuredPhone);
	$('#insuredAddress').val(row.insuredAddress);
	$('#riskcode').combobox('setValue',row.riskcode);
	$('#premium').val(row.premium);
	$('#travelTax').val(row.travelTax);
	$('#carprice').val(row.carprice);
	$('#usernaturecode').combobox('setValue',row.usernaturecode);
	$('#carcategorycode').combobox('setValue',row.carcategorycode);
	$('#frameno').val(row.frameno);
	$('#engineno').val(row.engineno);
	$('#motorcyclename').val(row.motorcyclename);
	$('#firstrecorddate').datebox('setValue',row.firstrecorddate);
	$('#annualdate').datebox('setValue',row.annualdate);
	$('#SeatCount').val(row.seatCount);
	$('#tonnage').val(row.tonnage);
	
	$('#remark').val(row.remark);
	$('#bnfName').val(row.bnfName);
	policyno.disabled = false;
	caruserinfo.style.display="none";
}

function exportLife(){
	var url = "<%=request.getContextPath()%>/authority/exportLife.do?";
	url += "orderid="+$('#orderid').val()+"&";
	url += "iAppentName="+$('#iAppentName').val()+"&";
	url += "iNsuredName="+$('#iNsuredName').val()+"&";
	url += "prem="+$('#prem').val()+"&";
	url += "idno="+$('#idno').val()+"&";
	url += "riskName="+$('#riskName').val()+"&";
	url += "iBnfname="+$('#iBnfname').val();
	window.location.href=url;
}

function carquery()
{
	var url = "<%=request.getContextPath()%>/authority/getLifeInsuranceManageCtlList.do"; 
	var carParam = new Object();
	carParam.orderid = $('#orderid').val();
	carParam.iAppentName = $('#iAppentName').val();
	carParam.iNsuredName = $('#iNsuredName').val(); 
	carParam.prem = $('#prem').val();
	carParam.idno = $('#idno').val();
	carParam.riskName = $('#riskName').val();
	carParam.iBnfname = $('#iBnfname').val();
	$('#lifeinsurancelist').datagrid({ 
		url:url, 
		loadMsg:'数据加载中请稍后……', 
		fitColumns:true,
		columns:[[ 
			{field:'orderid',title:'1订单号',width:180}, 
			{field:'iAppentName',title:'投保人',width:100}, 
			{field:'date',title:'投保日期',width:100}, 
			{field:'iNsuredName',title:'被保人',width:100}, 
			{field:'prem',title:'保费',width:100}, 
			{field:'idno',title:'证件号',width:200}, 
			{field:'riskName',title:'险种',width:100}, 
			{field:'iBnfname',title:'受益人',width:100}, 
			{field:'state',title:'保单状态',width:100,
				formatter: function (value, rowData, rowIndex) {
                    if (value == '0' ) {  
                        return '已收费承保';  
                    }  
                    if (value == '1' ) {  
                        return '核保未通过';  
                    }  
                    if (value == '2' ) {  
                        return '人工核保中';  
                    }  
                    if (value == '3' ) {  
                        return '收费中';  
                    }  
                    if (value == '4' ) {  
                        return '收费失败';  
                    }  
                    if (value == '5' ) {  
                        return '收费成功';  
                    }  
                    if (value == '6' ) {  
                        return '已拒保或延期';  
                    }  
                    if (value == '7' ) {  
                        return '保单生效已回执状态';  
                    }  
                    if (value == '8' ) {  
                        return '其他';  
                    }  
                    if (value == '9' ) {  
                        return '人工核保通过';  
                    }  
                    if (value == '10' ) {  
                        return '承保前撤件';  
                    }  
                    if (value == '11' ) {  
                        return '承保通过';  
                    }  
                    if (value == '12' ) {  
                        return '正在录入中';  
                    }  
                    if (value == '13' ) {  
                        return '核保通过';  
                    }  
                    if (value == '14' ) {  
                        return '承保未通过';  
                    }  
                    if (value == '15' ) {  
                        return '人核未进核心';  
                    }  
                }
			},
			{field:'imageparts',title:'是否已发送到ftp',width:100,align:'right',
				formatter: function (value, rowData, rowIndex) {
					if (value == '' ) {  
                        return '未返回';  
                    }  
					if (value == 'Y' ) {  
                        return '已发送';  
                    }  
					if (value == 'N' ) {  
                        return '不发送';  
                    }  
				}
			} 
		]]
	});
	displayDataGrid($('#lifeinsurancelist'),carParam,url);
	//clearCarData();
}
$(document).ready(function(){ 
}); 
</script>
   
</head>
<body onload="carquery()">
<table class = "common">
		<tr>
			<td class = "title">
				订单号：
			</td>
			<td class = "common">
				<input class = "txt" name="orderid" id="orderid">
			</td>
			<td class = "title">
				投保人：
			</td>
			<td class = "common">
				<input class = "txt" name="iAppentName" id="iAppentName">				
			</td>
			<!-- <td class = "title">
				投保日期：
			</td>
			<td class = "common">
				<input class="easyui-datebox" style="width: 160%" id="date" name="date">	
				<input class="easyui-datebox" style="width:160%" id="date" name="date" notnull = "投保日期">			
			</td> -->
		</tr>
		<tr>
			<td class = "title">
				被保人：
			</td>
			<td class = "common">
				<input class = "txt" name="iNsuredName" id="iNsuredName">
			</td>			
			<td class="title">
				保费：
			</td>
			<td class="common">
				<input class = "txt" name="prem" id="prem">
			</td>
			<td class="title">
				证件号：
			</td>
			<td class="common">
				<input class = "txt" name="idno" id="idno">
			</td>
 		</tr>
 		<tr>
			<td class = "title">
				险种:
			</td>
			<td class = "common">
				<input class = "txt" name="riskName" id="riskName">
			</td>
			<td class = "title">
				受益人2：
			</td>
			<td class = "common">
				<input class = "txt" name="iBnfname" id="iBnfname">
			</td>
			<!-- <td class = "title">
				出单止期：
			</td>
			<td class = "common">
				<input class="easyui-datebox" style="width:160%" id="qenddate" name="qenddate" notnull = "出单止期">
			</td>
 		</tr>
		<tr id = "qagent">
 			<td class = "title">
				代理人编码：
			</td>
			<td class = "common">
				<input class = "txt" name="qagentcode" id="qagentcode" readonly
				onclick = "disinsorgan($('#qagentcode'));">
			</td>
		</tr>
		<tr>
			<td class = "title">
				被保人姓名：
			</td>
			<td class = "common">
				<input class = "txt" name="qinsuredName" id="qinsuredName">
			</td>
		</tr> -->
</table>
<br>
 	<button id = "carquery" class="smsbutton" onclick = "carquery()">寿险保单查询</button>
 	<button id = "exportLifeId" class="button" onclick="exportLife()" >导出</button>
 	<br>
 	<br>
 	
 	<table id="lifeinsurancelist" class="easyui-datagrid" title="寿险保单信息" style="width:1200px;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectonecar" >
		<thead>
			<tr>
				<!-- <th data-options="field:'policyserialno',width:90">保单流水号</th>
				<th data-options="field:'policyprintno',width:90">保单印刷号</th>
				<th data-options="field:'invoiceprintno',width:90">发票印刷号</th>
				<th data-options="field:'CInsFlagPrtNo',width:110">标志印刷号</th>
				<th data-options="field:'policyno',width:100">保单号</th>
				<th data-options="field:'getorgan',width:120">出单机构编码</th>
				<th data-options="field:'getorganname',width:100">出单机构</th>
				<th data-options="field:'plateno',width:90">车牌号</th>
				<th data-options="field:'insorgancode',width:90">保险公司编码</th>
				<th data-options="field:'insorganname',width:90">保险公司</th>
				<th data-options="field:'riskcode',width:90">险种编码</th>
				<th data-options="field:'riskname',width:90">险种名称</th>
				<th data-options="field:'premium',width:100">保费</th>
				<th data-options="field:'travelTax',width:90">车船税</th>
				<th data-options="field:'dealdate',width:90">出单日期</th>
				<th data-options="field:'policystartdate',width:100">保单生效日期</th>
				<th data-options="field:'policyenddate',width:110">保单有效日期至</th>
				<th data-options="field:'insuredName',width:90">被保人姓名</th>
				<th data-options="field:'insuredIdType',width:90">被保险人证件类型编码</th>
				<th data-options="field:'insuredIdTypeName',width:110">被保险人证件类型</th>
				<th data-options="field:'insuredIdNo',width:110">被保险人证件号码</th>
				<th data-options="field:'insuredPhone',width:90">被保险人电话</th>
				<th data-options="field:'usernaturecode',width:90">使用性质编码</th>
				<th data-options="field:'usernaturename',width:90">使用性质</th>
				<th data-options="field:'carcategorycode',width:90">车辆编码</th>
				<th data-options="field:'carcategoryname',width:150">车辆种类</th>
				<th data-options="field:'frameno',width:90">车架号</th>
				<th data-options="field:'engineno',width:100">发动机号</th>
				<th data-options="field:'motorcyclename',width:90">厂牌车型</th>
				<th data-options="field:'firstrecorddate',width:90">初登日期</th>
				<th data-options="field:'operatorname',width:90">录单员</th>
				<th data-options="field:'remark',width:200">备注</th>
				<th data-options="field:'bnfName',width:90">受益人姓名</th> -->
			</tr>
		</thead>
	</table>
<br>
</body>
</html>