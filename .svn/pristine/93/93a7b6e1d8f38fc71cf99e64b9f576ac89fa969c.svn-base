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
	initDataGrid($('#carlist'));
	
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
	$('#carlist').datagrid('hideColumn','policyserialno');
	$('#carlist').datagrid('hideColumn','getorgan');
	$('#carlist').datagrid('hideColumn','insorgancode');
	$('#carlist').datagrid('hideColumn','riskcode');
	$('#carlist').datagrid('hideColumn','insuredIdType');
	//$('#carlist').datagrid('hideColumn','insuredSex');
	$('#carlist').datagrid('hideColumn','usernaturecode');
	$('#carlist').datagrid('hideColumn','carcategorycode');
	//$('#carlist').datagrid('hideColumn','channelcode');
}

function aftercodeselect(comboxid)
{
	/*
	if(comboxid.attr("id")=="usernaturecode")
	{
		disComBox($('#carcategorycode'),"carkind"+comboxid.combobox('getText'),null);
	}
	*/
}

function initcombox()
{
	var tturl = "buzupload/getorganList.do";
	var carParam = new Object();
	carParam.organcode = $('#iamsoprorgan').val();
	
	displayCombox($('#getorgan'),carParam,tturl,"key","value");
	displayCombox($('#qgetorgan'),carParam,tturl,"key","value");
	
	disComBox($('#insorgancode'),"insorgancode00p",null);
	disComBox($('#qinsorgancode'),"insorgancode00p",null);
	
	disComBox($('#insuredIdType'),"iDType",null);
	disComBox($('#insuredSex'),"sex",null);
	disComBox($('#riskcode'),"priskcode",null);
	
	disComBox($('#usernaturecode'),"carusages",null);
	
	disComBox($('#channelcode'),"channelcode",null);
	//disComBox($('#carcategorycode'),"carkind",null);
	
	disComBox($('#qriskcode'),"priskcode",null);
}

function carquery()
{
	var tturl = "buzupload/getCarList.do";
	
	var carParam = new Object();
	carParam.plateno = $('#qplateno').val();
	carParam.startDate = $('#qstartdate').datebox("getValue");
	carParam.endDate = $('#qenddate').datebox("getValue");
	
	carParam.insuredName = $('#qinsuredName').val();
	carParam.agentcode = $('#qagentcode').val();
	carParam.insorganCode = $('#qinsorgancode').combobox('getText');
	carParam.getOrgan = $('#qgetorgan').combobox('getText');
	
	carParam.policyno = $('#qpolicyno').val();
	carParam.policystartdate = $('#qpolicystartdate').datebox("getValue");
	carParam.policyenddate = $('#qpolicyenddate').datebox("getValue");
	carParam.riskcode = $('#qriskcode').combobox('getText');
	
	carParam.policyState = '02';
	
	displayDataGrid($('#carlist'),carParam,tturl);
	
	clearCarData();
}

function carinsert()
{	
	if(!doubleDefaultZero(doublelist))
	{
		return;
	}
	
	if(!checknotnull(checklist))
	{
		return;	
	}
	
	var tparam = prepareparam(inputList);
	
	ajaxdeal("buzupload/carInsert.do",tparam,null,null,saveSuss);
}

function saveSuss()
{
	clearCarData();
	
	$('#carlist').datagrid('reload');
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
	var row = $('#carlist').datagrid('getSelected');
    
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

function cardelete()
{
	var row = $('#carlist').datagrid('getSelected');
    
	if(row==null)
	{
		$.messager.alert('操作提示','请选中要删除的数据！','error');
		return;
	}
	
	var carParam = new Object();
	carParam.policyserialno = row.policyserialno;
	
	ajaxdeal("buzupload/cardelete.do",carParam,null,null,saveSuss);
}

function carupdate()
{
	var row = $('#carlist').datagrid('getSelected');
    
	if(row==null)
	{
		$.messager.alert('操作提示','请选中要删除的数据！','error');
		return;
	}
	
	if(!checknotnull(checklist))
	{
		return;	
	}
	
	var tparam = prepareparam(inputList);
	tparam.policyserialno = row.policyserialno;
	
	ajaxdeal("buzupload/carUpdate.do",tparam,null,null,saveSuss);
}

function disInsIdInfo()
{
	if($('#insuredIdType').combobox('getText')==01)
	{
		if(checkCardId($('#insuredIdNo').val()))
		{
			$('#insuredSex').combobox('setValue',getSexByIDNo($('#insuredIdNo').val()));
			$('#insuredBirthday').datebox('setValue',getBirthdatByIdNo($('#insuredIdNo').val()));
		}
		else
		{
			$('#insuredSex').combobox('setValue',"");
			$('#insuredBirthday').datebox('setValue',"");
		}
	}
}

function carsubmit()
{
	var row = $('#carlist').datagrid('getSelected');
    
	if(row==null)
	{
		$.messager.alert('操作提示','请选中要提交的数据！','error');
		return;
	}
	
	var tparam = new Object();
	tparam.policyserialno = row.policyserialno;
	tparam.policystate = '01';
	
	ajaxdeal("buzupload/updateState.do",tparam,null,null,saveSuss);
}

</script>
   
</head>
<body>
<table class = "common">
		<tr>
			<td class = "title">
				保单号：
			</td>
			<td class = "common">
				<input class = "txt" name="qpolicyno" id="qpolicyno">
			</td>
			<td class = "title">
				保险公司：
			</td>
			<td class = "common">
				<input class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qinsorgancode" id="qinsorgancode" notnull = "保险公司">				
			</td>
			<td class = "title">
				出单机构：
			</td>
			<td class = "common">
				<input class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qgetorgan" id="qgetorgan" notnull = "出单机构">				
			</td>
		</tr>
		<tr>
			<td class = "title">
				车牌号：
			</td>
			<td class = "common">
				<input class = "txt" name="qplateno" id="qplateno">
			</td>			
			<td class="title">
				保单生效起期：
			</td>
			<td class="common">
				<input class="easyui-datebox" style="width: 160%" id="qpolicystartdate" name="qpolicystartdate">
			</td>
			<td class="title">
				保单生效止期：
			</td>
			<td class="common">
				<input class="easyui-datebox" style="width: 160%" id="qpolicyenddate" name="qpolicyenddate">
			</td>
 		</tr>
 		<tr>
			<td class = "title">
				险种编码:
			</td>
			<td class = "common">
				<input class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qriskcode" id="qriskcode" notnull = "险种编码">
			</td>
			<td class = "title">
				出单起期：
			</td>
			<td class = "common">
				<input class="easyui-datebox" style="width:160%" id="qstartdate" name="qstartdate" notnull = "出单起期">
			</td>
			<td class = "title">
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
		</tr>
</table>
<br>
 	<button id = "carquery" class="smsbutton" onclick = "carquery()">车险保单查询</button>
 	<br>
 	<br>
 	
 	<table id="carlist" class="easyui-datagrid" title="车险保单信息" style="width:1200px;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectonecar" >
		<thead>
			<tr>
				<th data-options="field:'policyserialno',width:90">保单流水号</th>
				<th data-options="field:'policyprintno',width:90">保单印刷号</th>
				<th data-options="field:'invoiceprintno',width:90">发票印刷号</th>
				<th data-options="field:'CInsFlagPrtNo',width:110">标志印刷号</th>
				<th data-options="field:'policyno',width:100">保单号</th>
				<th data-options="field:'getorgan',width:120">出单机构编码</th>
				<th data-options="field:'getorganname',width:100">出单机构</th>
				<th data-options="field:'plateno',width:90">车牌号</th>
				<th data-options="field:'insorgancode',width:90">保险公司编码</th>
				<th data-options="field:'insorganname',width:90">保险公司</th>
				<!-- 
				<th data-options="field:'agentcode',width:100">代理人编码</th>
				<th data-options="field:'agentname',width:100">代理人姓名</th>
				<th data-options="field:'channelcode',width:90">渠道编码</th>
				<th data-options="field:'channelname',width:90">渠道</th>
				 -->
				<th data-options="field:'riskcode',width:90">险种编码</th>
				<th data-options="field:'riskname',width:90">险种名称</th>
				<th data-options="field:'premium',width:100">保费</th>
				<th data-options="field:'travelTax',width:90">车船税</th>
				<th data-options="field:'dealdate',width:90">出单日期</th>
				<!--
				<th data-options="field:'signdate',width:90">签单日期</th>
				-->
				<th data-options="field:'policystartdate',width:100">保单生效日期</th>
				<th data-options="field:'policyenddate',width:110">保单有效日期至</th>
				<th data-options="field:'insuredName',width:90">被保人姓名</th>
				<th data-options="field:'insuredIdType',width:90">被保险人证件类型编码</th>
				<th data-options="field:'insuredIdTypeName',width:110">被保险人证件类型</th>
				<th data-options="field:'insuredIdNo',width:110">被保险人证件号码</th>
				<!--
				<th data-options="field:'insuredSex',width:90">被保险人性别编码</th>
				<th data-options="field:'insuredSexName',width:90">被保险人性别</th>
				<th data-options="field:'insuredBirthday',width:90">被保险人生日</th>
				-->
				<th data-options="field:'insuredPhone',width:90">被保险人电话</th>
				<!--
				<th data-options="field:'insuredAddress',width:90">被保险人地址</th>
				<th data-options="field:'carprice',width:120">新车购置价格(万元)</th>
				-->
				<th data-options="field:'usernaturecode',width:90">使用性质编码</th>
				<th data-options="field:'usernaturename',width:90">使用性质</th>
				<th data-options="field:'carcategorycode',width:90">车辆编码</th>
				<th data-options="field:'carcategoryname',width:150">车辆种类</th>
				<th data-options="field:'frameno',width:90">车架号</th>
				<th data-options="field:'engineno',width:100">发动机号</th>
				<th data-options="field:'motorcyclename',width:90">厂牌车型</th>
				<th data-options="field:'firstrecorddate',width:90">初登日期</th>
				<!--
				<th data-options="field:'annualdate',width:90">年审到期日</th>
				<th data-options="field:'seatCount',width:90">座位数</th>
				<th data-options="field:'tonnage',width:90">吨位数</th>
				-->
				<th data-options="field:'operatorname',width:90">录单员</th>
				<th data-options="field:'remark',width:200">备注</th>
				<th data-options="field:'bnfName',width:90">受益人姓名</th>
			</tr>
		</thead>
	</table>
<br>
<table class = "common">
	<tr>
		<td class = "dstitle" style="height:25px">
        	单证信息
        </td>
	</tr>
	<tr>
 		<td class = "title">
			保单印刷号：
		</td>
		<td class = "common">
			<input class = "txt" name="policyprintno" id="policyprintno" notnull = "保单印刷号">
		</td>
		<td class = "title">
			发票印刷号：
		</td>
		<td class = "common">
			<input class = "txt" name="invoiceprintno" id="invoiceprintno" notnull = "发票印刷号">
		</td>
		<td class = "title">
			标志印刷号：
		</td>
		<td class = "common">
			<input class = "txt" name="CInsFlagPrtNo" id="CInsFlagPrtNo" notnull = "标志印刷号">
		</td>
 	</tr>
	<tr>
		<td class = "dstitle" style="height:25px">
        	保单信息
        </td>
	</tr>
	<tr>
 		<td class = "title">
			出单机构：
		</td>
		<td class = "common">
			<input class = "easyui-combobox" style="width:160%" panelHeight="auto" name="getorgan" id="getorgan" notnull = "出单机构">
		</td>
		<td class = "title">
			车牌号：
		</td>
		<td class = "common">
			<input class = "txt" name="plateno" id="plateno" notnull = "车牌号">
		</td>
		<td class = "title">
			保险公司：
		</td>
		<td class = "common">
			<input class = "easyui-combobox" style="width:160%" panelHeight="auto" name="insorgancode" id="insorgancode" notnull = "保险公司">
		</td>
 	</tr>
	<tr>
 		<td class = "title">
			保单号码：
		</td>
		<td class = "common">
			<input class = "txt" name="policyno" id="policyno" notnull = "保单号码">
		</td>
		<td class = "title">
			出单日期：
		</td>
		<td class = "common">
			<input class="easyui-datebox" style="width:160%" name="dealdate" id="dealdate" notnull = "出单日期">
		</td>
 	</tr>
	<tr id = "disagent">
		<td class = "title">
			代理人编码：
		</td>
		<td class = "common">
			<input class = "txt" name="agentcode" id="agentcode" notnull = "代理人编码" readonly
			onclick = "disinsorgan($('#agentcode'),$('#agentname'));">
		</td>
		<td class = "title">
			代理人姓名：
		</td>
		<td class = "common">
			<input class = "txt" name="agentname" id="agentname" notnull = "代理人姓名" readonly>
		</td>
 		<td class = "title">
			渠道编码：
		</td>
		<td class = "common">
			<input class = "easyui-combobox" style="width:160%" panelHeight="auto" name="channelcode" id="channelcode" notnull = "渠道编码">
		</td>
		<td class = "title">
			签单日期：
		</td>
		<td class = "common">
			<input class="easyui-datebox" style="width:160%" name="signdate" id="signdate" notnull = "签单日期">
		</td>
 	</tr> 	
	<tr>
		<td class = "title">
			保单生效日期：
		</td>
		<td class = "common">
			<input class="easyui-datebox" style="width:160%" name="policystartdate" id="policystartdate" notnull = "保单生效日期">
		</td>
		<td class = "title">
			保单有效日期至：
		</td>
		<td class = "common">
			<input class="easyui-datebox" style="width:160%" name="policyenddate" id="policyenddate" notnull = "保单有效日期至">
		</td>
 	</tr>
 	<tr>
		<td class = "dstitle" style="height:25px">
        	被保险人信息
        </td>
	</tr>
 	<tr>
		<td class = "title">被保险人姓名：</td>
		<td class="common"><input notnull = "被保险人姓名" class = "txt" id="insuredName" name="insuredName" type="text"/></td>
		<td class = "title">被保险人证件类型：</td>
		<td class="common"><input class = "easyui-combobox" style="width:160%" panelHeight="auto" notnull = "被保险人证件类型" class = "txt" id="insuredIdType"  name="insuredIdType"/></td>
		<td class = "title">被保人证件号码：</td>
		<td class="common"><input notnull = "被保人证件号码" class = "txt" id="insuredIdNo" name="insuredIdNo" type="text" onblur= "disInsIdInfo()"/></td>
	</tr>
	<tr id = "disinsured">
		<td class = "title">被保人性别：</td>
		<td class="common"><input class = "easyui-combobox" notnull = "被保人性别" style="width:160%"  id="insuredSex" name="insuredSex" panelHeight="auto" type="text"/></td>
		<td class = "title">被保人出生日期：</td>
		<td class="common"><input  id="insuredBirthday" name="insuredBirthday" style="width:160%" class="easyui-datebox"/></td>		
		<td class = "title">被保险人通讯地址：</td>
		<td class="common"><input notnull = "被保险人通讯地址" class = "txt" id="insuredAddress" name="insuredAddress" type="text"/></td>
	</tr>
	<tr>
		<td class = "title">移动电话：</td>
		<td class="common"><input notnull = "移动电话" class = "txt" id="insuredPhone" name="insuredPhone" type="text"/></td>
	</tr>
	<tr>
		<td class = "dstitle" style="height:25px">
        	受益人信息
        </td>
	</tr>
	<tr>
		<td class = "title">受益人姓名：</td>
		<td class="common"><input notnull = "受益人姓名" class = "txt" id="bnfName" name="bnfName" type="text"/></td>
	</tr>
	<tr>
		<td class = "dstitle" style="height:25px">
        	险种信息
        </td>
	</tr>
	
	<tr>
		<td class = "title">
			险种编码:
		</td>
		<td class = "common">
			<input class = "easyui-combobox" style="width:160%" panelHeight="auto" name="riskcode" id="riskcode" notnull = "险种编码">
		</td>
		<td class = "title">
			保费：
		</td>
		<td class = "common">
			<input class = "txt" name="premium" id="premium" notnull = "保费">
		</td>
		<td class = "title">
			车船税：
		</td>
		<td class = "common">
			<input class = "txt" name="travelTax" id="travelTax" notnull = "车船税">
		</td>
	</tr>
	<tr>
		<td class = "dstitle" style="height:25px">
        	车辆信息
        </td>
	</tr>
	<tr>
		<td class = "title">
			初登日期:
		</td>
		<td class = "common">
			<input class="easyui-datebox" style="width:160%" name="firstrecorddate" id="firstrecorddate" notnull = "初登日期">
		</td>
		<td class = "title">
			使用性质：
		</td>
		<td class = "common">
			<input class = "easyui-combobox" style="width:160%" panelHeight="auto" name="usernaturecode" id="usernaturecode" notnull = "使用性质">
			<input class = "txt" name="caruserinfo" id="caruserinfo" disabled = true;>
		</td>
		<td class = "title">
			车辆种类：
		</td>
		<td class = "common">
			<input class = "easyui-combobox" style="width:160%" panelHeight="auto" panelWidth="200" name="carcategorycode" id="carcategorycode" notnull = "车辆种类">
		</td>
	</tr>
	<tr>
		<td class = "title">
			车架号:
		</td>
		<td class = "common">
			<input class = "txt" name="frameno" id="frameno" notnull = "车架号">
		</td>
		<td class = "title">
			发动机号：
		</td>
		<td class = "common">
			<input class = "txt" name="engineno" id="engineno" notnull = "发动机号">
		</td>
		<td class = "title">
			厂牌车型(车系+车型)：
		</td>
		<td class = "common">
			<input class = "txt" name="motorcyclename" id="motorcyclename" notnull = "厂系车型">
		</td>
	</tr>
	<tr id = "carinfo1">
 		<td class = "title">
			新车购置价格(万元):
		</td>
		<td class = "common">
			<input class = "txt" name="carprice" id="carprice" notnull = "新车购置价格">
		</td>
		<td class = "title">
			年审到期日期：
		</td>
		<td class = "common">
			<input class="easyui-datebox" style="width:160%" name="annualdate" id="annualdate" notnull = "年审到期日期">
		</td>
		<td class = "title">
			座位数：
		</td>
		<td class = "common">
			<input class = "txt" name="SeatCount" id="SeatCount" notnull = "座位数">
		</td>
 	</tr>
 	<tr id = "carinfo2">
		<td class = "title">
			吨位数：
		</td>
		<td class = "common">
			<input class = "txt" name="tonnage" id="tonnage" notnull = "吨位数">
		</td>
 	</tr>
	<tr>
		<td class = "title">备注：</td>
		<td class="common"  colspan="3"><textarea notnull = "备注" class="txt" style="width: 600px;height: auto;" id="remark" name="remark"></textarea></td>
	</tr>
 </table>

<br>
 	<button id = "carinsert" class="smsbutton" onclick = "carinsert()">车险保单增加</button>
 	<button id = "carupdate" class="smsbutton" onclick = "carupdate()">车险保单修改</button>
 	<button id = "cardelete" class="smsbutton" onclick = "cardelete()">车险保单删除</button>
 	<!-- 
 	<button id = "carsubmit" class="smsbutton" onclick = "carsubmit()">车险保单提交</button>
 	 -->
</body>
</html>