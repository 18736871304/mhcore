<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%><head>
<title></title>
<script>

var inputList;
var checkList;
var doubleList;

var checkList01;

var amntType;
var minamnt;
var maxamnt; 

window.onload = function()
{
	$(".easyui-combobox").combobox({
		                 editable:false  //是否可编辑
		                 });
	
	$('#insorgancode').combobox({
		                 editable:true  //是否可编辑
		                 });
	
	$(".special").hide();
	$(".hotline").hide();
	$('#hotlinetype').next(".combo").hide();
	$(".referral").hide();
	
	query_table.style.display="none";
	//selectAmnt.style.display="none";
	$('#selectAmnt').next(".combo").hide();
	
	dlgAppntInit();
	policyDetailDlgInit();
	policyUrlDlgInit();
	
	initDataGrid20($('#policyList'));
	
	inputList = [
	 			$('#contno'),
	 			$('#startdate'),
	 			$('#cvalidate'),
	 			$('#reuserid'),
	 			
	 			$('#insorgancode'),
	 			$('#riskcode'),
	 			$('#prem'),
	 			//$('#payintv'),
	 			//$('#payendyearflag'),
	 			//$('#payendyear'),
	 			
	 			//$('#insuyearflag'),
	 			//$('#insuyear'),
	 			
	 			$('#appname'),
	 			$('#appidno'),
	 			$('#appmobile'),
	 			$('#appprovince'),
	 			$('#appcity'),
	 			$('#appcountry'),
	 			$('#appaddress'),
	 			
	 			$('#appsex'),
	 			$('#appbirthday'),
	 			
	 			$('#relatoapp'),
	 			$('#insname'),
	 			$('#insidno'),
	 			$('#insmobile'),
	 			$('#insprovince'),
	 			$('#inscity'),
	 			$('#inscountry'),
	 			$('#insaddress'),
	 			
	 			$('#inssex'),
	 			$('#insbirthday')
	 	];
	
	checkList = [
	 			$('#contno'),
	 			$('#startdate'),
	 			$('#cvalidate'),
	 			$('#reuserid'),
	 			
	 			$('#insorgancode'),
	 			$('#riskcode'),
	 			$('#prem'),
	 			//$('#payintv'),
	 			//$('#payendyearflag'),
	 			//$('#payendyear'),
	 			//$('#insuyearflag'),
	 			//$('#insuyear'),
	 			
	 			$('#appname'),
	 			//$('#appidno'),
	 			$('#appmobile'),
	 			//$('#appprovince'),
	 			//$('#appcity'),
	 			//$('#appcountry'),
	 			//$('#appaddress'),
	 			
	 			//$('#appsex'),
	 			//$('#appbirthday'),
	 			
	 			$('#relatoapp'),
	 			
	 			$('#insname'),
	 			//$('#insidno'),
	 			//$('#insmobile'),
	 			//$('#insprovince'),
	 			//$('#inscity'),
	 			//$('#inscountry'),
	 			//$('#insaddress'),
	 			
	 			//$('#inssex'),
	 			//$('#insbirthday')
	 	];
	
	checkList01 = [
				$('#contno'),
				$('#startdate'),
				$('#cvalidate'),
				$('#reuserid'),
		 			
				$('#insorgancode'),
				$('#riskcode'),
				$('#prem'),
				//$('#amnt'),
				//$('#payintv'),
				//$('#payendyearflag'),
				//$('#payendyear'),
				//$('#insuyearflag'),
	 			//$('#insuyear'),
		 			
				$('#appname'),
				//$('#appidno'),
				$('#appmobile'),
				//$('#appprovince'),
				//$('#appcity'),
				//$('#appcountry'),
				//$('#appaddress'),
		 			
				//$('#appsex'),
				//$('#appbirthday')
		];
	
	dlgUserInit();
	
	disComBox($('#relatoapp'),"relatoapp",null);
	disComBox($('#qinsorgancode'),"insorgancode",null);
	disComBox($('#insorgancode'),"insorgancode",null);
	//disComBox($('#payintv'),"payintv",null);
	
	//disComBox($('#payendyearflag'),"payendyearflag",null);
	
	//disComBox($('#insuyearflag'),"insuyearflag",null);
	
	disComBox($('#appprovince'),"province",null);
	disComBox($('#insprovince'),"province",null);
	
	disComBox($('#channeltype'),"channeltype",null);
	disComBox($('#hotlinetype'),"hotlinetype",null);
	
	//disComBox($('#qstate'),"policyquery",null);
	
	//$('#qstate').combobox('setValue','40');
	
	/*
	disComBox($('#qstate'),"articlestate",null);
	
	$('#qstate').combobox('setValue','01');
	*/
	
	/*
	var tturl = "policy/get02Org.do";
	displayCombox($('#q02org'),null,tturl,"dd_key","dd_value");
	*/
}

function aftercodeselect(comboxid)
{
	if(comboxid.attr("id")=="q02org")
	{	
		var tParam = new Object();
		tParam.organcode = comboxid.combobox('getValue');
		
		var tturl1 = "policy/get03Org.do";
		
		displayCombox($('#q03org'),tParam,tturl1,"dd_key","dd_value");
	}
	else if(comboxid.attr("id")=="q03org")
	{
		var tParam = new Object();
		tParam.organcode = comboxid.combobox('getValue');
		
		var tturl1 = "policy/get04Org.do";
		
		displayCombox($('#q04org'),tParam,tturl1,"dd_key","dd_value");
	}
	else if(comboxid.attr("id")=="insorgancode")
	{
		dealInsOrgan();
	}
	else if(comboxid.attr("id")=="appprovince")
	{
		var tParam = new Object();
		tParam.province = comboxid.combobox('getValue');
		
		var tturl1 = "policy/getCity.do";
		
		displayCombox($('#appcity'),tParam,tturl1,"dd_key","dd_value");
	}
	else if(comboxid.attr("id")=="insprovince")
	{
		var tParam = new Object();
		tParam.province = comboxid.combobox('getValue');
		
		var tturl1 = "policy/getCity.do";
		
		displayCombox($('#inscity'),tParam,tturl1,"dd_key","dd_value");
	}
	else if(comboxid.attr("id")=="appcity")
	{
		var tParam = new Object();
		tParam.city = comboxid.combobox('getValue');
		
		var tturl1 = "policy/getCountry.do";
		
		displayCombox($('#appcountry'),tParam,tturl1,"dd_key","dd_value");
	}
	else if(comboxid.attr("id")=="inscity")
	{
		var tParam = new Object();
		tParam.city = comboxid.combobox('getValue');
		
		var tturl1 = "policy/getCountry.do";
		
		displayCombox($('#inscountry'),tParam,tturl1,"dd_key","dd_value");
	}
	/**
	else if(comboxid.attr("id")=="payintv")
	{
		if(comboxid.combobox('getValue')=='0')
		{
			$('#payendyearflag').combobox('setValue','Y');
			$('#payendyear').val('1000');
			
			payyear.style.display="none";
		}
		else
		{
			$('#payendyearflag').combobox('setValue','');
			$('#payendyear').val('');
			
			payyear.style.display="";
		}
	}
	*/
	else if(comboxid.attr("id")=="riskcode")
	{
		dealRiskCode();
	}
	else if(comboxid.attr("id")=="selectAmnt")
	{
		//alert(comboxid.combobox('getValue'));
	}
	else if(comboxid.attr("id")=="channeltype")
	{
		if(comboxid.combobox('getValue')=="02")
		{
			$(".special").show();
			$(".hotline").hide();
			$('#hotlinetype').next(".combo").hide();
			$(".referral").hide();
		}
		else if(comboxid.combobox('getValue')=="03")
		{
			$(".special").hide();
			$(".hotline").show();
			$('#hotlinetype').next(".combo").show();
			$(".referral").hide();
		}
		else if(comboxid.combobox('getValue')=="05")
		{
			$(".special").hide();
			$(".hotline").hide();
			$('#hotlinetype').next(".combo").hide();
			$(".referral").show();
		}
		else
		{
			$(".special").hide();
			$(".hotline").hide();
			$('#hotlinetype').next(".combo").hide();
			$(".referral").hide();
		}
	}
}

function dealInsOrgan()
{
	var tParam = new Object();
	tParam.insorgancode = $('#insorgancode').combobox('getValue');
	
	var tturl1 = "policy/getMainRiskList.do";
	
	displayCombox($('#riskcode'),tParam,tturl1,"dd_key","dd_value");
}

function dealRiskCode()
{
	var tParam = new Object();
	tParam.insorgancode = $('#insorgancode').combobox('getValue');
	tParam.riskcode = $('#riskcode').combobox('getValue');
	
	ajaxdeal("supplier/getRiskAmntType.do",tParam,getRiskAmntType,null);
	
	getPayIntv();
	getPayendyear();
	getInsureyear();
}

function getRiskAmntType(data)
{
	amntType = data.amnttype
	
	if(amntType=="01")
	{
		numAmnt.style.display="";
		$('#selectAmnt').next(".combo").hide();
		
		minamnt = data.minAmnt;
		maxamnt = data.maxAmnt;
	}
	else if(amntType=="02")
	{
		numAmnt.style.display="none";
		$('#selectAmnt').next(".combo").show();
		
		var tParam = new Object();
		tParam.amntid = data.amntId;
		
		var tturl1 = "supplier/getAmntList.do";
		
		displayCombox($('#selectAmnt'),tParam,tturl1,"dd_key","dd_value");
	}
	else
	{
		$.messager.alert('操作提示','未录入保额配置数据，不允许录单！','error');
		return;
	}
}

function getPayIntv()
{
	var tParam = new Object();
	tParam.insorgancode = $('#insorgancode').combobox('getValue');
	tParam.riskcode = $('#riskcode').combobox('getValue');
	
	var tturl1 = "supplier/getPayintv.do";
	
	displayCombox($('#payintv'),tParam,tturl1,"dd_key","dd_value");
}

function getPayendyear()
{
	var tParam = new Object();
	tParam.insorgancode = $('#insorgancode').combobox('getValue');
	tParam.riskcode = $('#riskcode').combobox('getValue');
	
	var tturl1 = "supplier/getPayendyear.do";
	
	displayCombox($('#payendyear'),tParam,tturl1,"dd_key","dd_value");
}

function getInsureyear()
{
	var tParam = new Object();
	tParam.insorgancode = $('#insorgancode').combobox('getValue');
	tParam.riskcode = $('#riskcode').combobox('getValue');
	
	var tturl1 = "supplier/getInsureyear.do";
	
	displayCombox($('#insuyear'),tParam,tturl1,"dd_key","dd_value");
}

function dealSelectRiskCode()
{
	var tParam = new Object();
	tParam.insorgancode = $('#insorgancode').combobox('getValue');
	tParam.riskcode = $('#riskcode').combobox('getValue');
	
	ajaxdeal("supplier/getRiskAmntType.do",tParam,getSelectRiskAmntType,null);
	
	getPayIntv();
	getPayendyear();
	getInsureyear();
}

function getSelectRiskAmntType(data)
{	
	amntType = data.amnttype
	var row = $('#policyList').datagrid('getSelected');
	
	if(amntType=="01")
	{
		numAmnt.style.display="";
		$('#selectAmnt').next(".combo").hide();
		
		minamnt = data.minAmnt;
		maxamnt = data.maxAmnt;
		
		$('#numAmnt').val(row.amnt);
	}
	else if(amntType=="02")
	{
		numAmnt.style.display="none";
		$('#selectAmnt').next(".combo").show();
		
		var tParam = new Object();
		tParam.amntid = data.amntId;
		
		var tturl1 = "supplier/getAmntList.do";
		displayCombox($('#selectAmnt'),tParam,tturl1,"dd_key","dd_value");
		
		//alert(row.amnt);
		$('#selectAmnt').combobox('setValue',row.amnt);
	}
	else
	{
		$.messager.alert('操作提示','未录入保额配置数据，不允许录单！','error');
		return;
	}
}

function selectone()
{
	var row = $('#policyList').datagrid('getSelected');
	
	if(row.riskcode!=row.mainriskcode)
	{
		clearLifeData();
		return;	
	}
	
	$('#contno').val(row.contno);	
	$('#startdate').datebox('setValue',row.accepttime);
	$('#cvalidate').datebox('setValue',row.cvalidate);
	
	$('#resuerkey').val(row.reuserid)
	$('#reuserid').val(row.reusercode);
	
	$('#insorgancode').combobox('setValue',row.insorgancode);
	dealInsOrgan();
	
	$('#riskcode').combobox('setValue',row.riskcode);
	
	dealSelectRiskCode();
	
	$('#payintv').combobox('setValue',row.payintv);
	$('#payendyear').combobox('setValue',row.payendyearkey);
	$('#insuyear').combobox('setValue',row.insuyearkey);
	
	$('#prem').val(row.prem);
	
	//$('#amnt').val(row.amnt);
	//$('#payintv').combobox('setValue',row.payintv);
	//$('#payendyearflag').combobox('setValue',row.payendyearflag);
	//$('#payendyear').val(row.payendyear);
	
	//$('#insuyearflag').combobox('setValue',row.insuyearflag);
	//$('#insuyear').val(row.insuyear);
	
	
	$('#appname').val(row.appname);
	$('#appidno').val(row.appidno);
	$('#appmobile').val(row.appphone);
	$('#appprovince').combobox('setValue',row.appprovince);
	
	disappcity(row.appprovince);
	$('#appcity').combobox('setValue',row.appcity);
	
	disappcountry(row.appcity);
	$('#appcountry').combobox('setValue',row.appcountry);
	$('#appaddress').val(row.appaddress);
	
	//$('#appsex').val(row.appsex);
	//$('#appbirthday').val(row.appbirthday);
		
	$('#relatoapp').combobox('setValue',row.relatoapp);
	
	if(row.relatoapp=="00")
	{
		$("#insisone").prop("checked",true);
		
		isapp1.style.display="none";
		isapp2.style.display="none";
		isapp3.style.display="none";
		isapp4.style.display="none";
	}
	else
	{
		$("#insisone").prop("checked",false);
		
		isapp1.style.display="";
		isapp2.style.display="";
		isapp3.style.display="";
		isapp4.style.display="";
	}
	
	$('#insname').val(row.insname);
	$('#insidno').val(row.insidno);
	$('#insmobile').val(row.insphone);
	$('#insprovince').combobox('setValue',row.insprovince);
	
	disinscity(row.insprovince);
	$('#inscity').combobox('setValue',row.inscity);
	
	disinscountry(row.inscity);
	$('#inscountry').combobox('setValue',row.inscountry);
	$('#insaddress').val(row.insaddress);
	
	//$('#inssex').val(row.inssex);
	//$('#insbirthday').val(row.insbirthday);
	
	//数据库和ui存的性别不一样，所以，重算一下，比较靠谱
	disAppIdInfo();
	disinsIdInfo();
	
	$('#channeltype').combobox('setValue',row.channeltype);	
	
	if(row.channeltype=='02')
	{
		$('#batchno').val(row.channel02value);
		
		$(".special").show();
		$(".hotline").hide();
		$('#hotlinetype').next(".combo").hide();
		$(".referral").hide();
	}
	else if($('#channeltype').combobox('getValue')=="03")
	{
		$('#hotlinetype').combobox('setValue',row.channel01value);
		$('#generationtime').datebox('setValue',row.channel02value);
		
		
		$(".special").hide();
		$(".hotline").show();
		$('#hotlinetype').next(".combo").show();
		$(".referral").hide();
	}
	else if($('#channeltype').combobox('getValue')=="05")
	{
		$('#channelappntserialno').val(row.channel02value);
		$('#channelappname').val(row.channel02name);
		
		$(".special").hide();
		$(".hotline").hide();
		$('#hotlinetype').next(".combo").hide();
		$(".referral").show();
	}
	else
	{
		$(".special").hide();
		$(".hotline").hide();
		$('#hotlinetype').next(".combo").hide();
		$(".referral").hide();
	}
}

function disappcity(provinceStr)
{
	var tParam = new Object();
	tParam.province = provinceStr;
	
	var tturl1 = "policy/getCity.do";
	
	displayCombox($('#appcity'),tParam,tturl1,"dd_key","dd_value");
}

function disappcountry(cityStr)
{
	var tParam = new Object();
	tParam.city = cityStr;
	
	var tturl1 = "policy/getCountry.do";
	
	displayCombox($('#appcountry'),tParam,tturl1,"dd_key","dd_value");
}

function disinscity(provinceStr)
{
	var tParam = new Object();
	tParam.province = provinceStr;
	
	var tturl1 = "policy/getCity.do";
	
	displayCombox($('#inscity'),tParam,tturl1,"dd_key","dd_value");
}

function disinscountry(cityStr)
{
	var tParam = new Object();
	tParam.city = cityStr;
	
	var tturl1 = "policy/getCountry.do";
	
	displayCombox($('#inscountry'),tParam,tturl1,"dd_key","dd_value");
}

function policyquery()
{
	var tturl = "policy/getPolicyList.do";

	var tParam = new Object();

	tParam.contno = $('#qcontno').val();
	tParam.appname = $('#qappname').val();
	tParam.reuserid = $('#qreuserid').val();
	tParam.insorgancode = $('#qinsorgancode').combobox('getValue');
	
	tParam.state = "80','82";
	tParam.agentflag = '02';
	
	tParam.q02org = $('#q02org').combobox('getValue');
	tParam.q03org = $('#q03org').combobox('getValue');
	tParam.q04org = $('#q04org').combobox('getValue');
	//tParam.querytype = 'articletype';
	
	displayDataGrid20($('#policyList'), tParam, tturl);

	clearCarData();
}

function lifeinsert()
{
	//alert($('#insisone').attr('checked')=="checked");
	
	if($('#insisone').attr('checked')=="checked")
	{
		if(!checknotnull(checkList01))
		{
			return;
		}
	}
	else
	{
		if(!checknotnull(checkList))
		{
			return;
		}	
	}
	
	//return;
	
	var tparam = prepareparam(inputList);
	
	tparam.reuserid = $('#resuerkey').val();
	
	if(amntType=="01")
	{
		if($('#numAmnt').val()==""||$('#numAmnt').val()==null)
		{
			$.messager.alert('操作提示','保险金额不能为空！','error');
			return;
		}
		
		if((tparam.amnt-minamnt)>0||(tparam.amnt-maxamnt)>0)
		{
			$.messager.alert('操作提示','保额范围，需要在'+minamnt+'~'+maxamnt+'，请重新输入！','error');
			return;
		}
		
		tparam.amnt = $('#numAmnt').val();
	}
	else if(amntType=="02")
	{
		if($('#selectAmnt').combobox('getValue')==""||$('#selectAmnt').combobox('getValue')==null)
		{
			$.messager.alert('操作提示','保险金额不能为空！','error');
			return;
		}
		
		tparam.amnt = $('#selectAmnt').combobox('getValue');
	}
	else
	{
		$.messager.alert('操作提示','未录入保额配置数据，不允许录单！','error');
		return;
	}
	
	if($('#payintv').combobox('getValue')==""||$('#payintv').combobox('getValue')==null)
	{
		$.messager.alert('操作提示','缴费方式不能为空！','error');
		return;
	}
	tparam.payintv = $('#payintv').combobox('getValue');
	
	if($('#payendyear').combobox('getValue')==""||$('#payendyear').combobox('getValue')==null)
	{
		$.messager.alert('操作提示','缴费方式不能为空！','error');
		return;
	}
	tparam.payendyear = $('#payendyear').combobox('getValue');
	
	if($('#insuyear').combobox('getValue')==""||$('#insuyear').combobox('getValue')==null)
	{
		$.messager.alert('操作提示','保险期间不能为空！','error');
		return;
	}
	tparam.insuyear = $('#insuyear').combobox('getValue');
	
	tparam.riskname = $('#riskcode').combobox('getText');
	tparam.insisone = $('#insisone').attr('checked');

	if($('#channeltype').combobox('getValue')==""||$('#channeltype').combobox('getValue')==null)
	{
		$.messager.alert('操作提示','资源来源不能为空！','error');
		return;
	}
	
	tparam.channeltype = $('#channeltype').combobox('getValue');
	
	if($('#channeltype').combobox('getValue')=="02")
	{
		if($('#batchno').val()==""||$('#batchno').val()==null)
		{
			$.messager.alert('操作提示','批次号不能为空！','error');
			return;
		}
		
		tparam.channel02value = $('#batchno').val(); 
	}
	else if($('#channeltype').combobox('getValue')=="03")
	{
		if($('#hotlinetype').combobox('getValue')==""||$('#hotlinetype').combobox('getValue')==null)
		{
			$.messager.alert('操作提示','热线不能为空！','error');
			return;
		}
		
		if($('#generationtime').datebox("getValue")==""||$('#generationtime').datebox("getValue")==null)
		{
			$.messager.alert('操作提示','线索产生日期不能为空！','error');
			return;
		}
		
		tparam.channel01value = $('#hotlinetype').combobox('getValue');
		tparam.channel02value = $('#generationtime').datebox("getValue"); 
	}
	else if($('#channeltype').combobox('getValue')=="05")
	{
		if($('#channelappntserialno').val()==""||$('#channelappntserialno').val()==null)
		{
			$.messager.alert('操作提示','投保人不能为空！','error');
			return;
		}
		
		tparam.channel02value = $('#channelappntserialno').val(); 
	}
	
	if(!checkBirthday())
	{
		return;
	}
	
	ajaxdeal("policy/lifePolicyInsert.do",tparam,null,null,saveSuss);
}

function lifedelete()
{
	var row = $('#policyList').datagrid('getSelected');
	if(row==null)
	{
		$.messager.alert('操作提示','请选中要删除的数据！','error');
		return;
	}
	
	var tparam = new Object();
	tparam.orderid = row.orderid;

	ajaxdeal("policy/lifePolicyDelete.do",tparam,null,null,deleteSuss);
}

function deleteSuss()
{
	$('#policyList').datagrid('reload');
}

function saveSuss()
{
	clearLifeData();
	$('#policyList').datagrid('reload');
}

function clearLifeData() 
{
	cleardata(inputList);
	
	$('#numAmnt').val("");
	$('#selectAmnt').combobox('setValue',"");
	$('#insuyear').combobox('setValue',"");
	$('#payintv').combobox('setValue',"");
	$('#payendyear').combobox('setValue',"");
}

function disAppIdInfo()
{
	if(checkCardId($('#appidno').val()))
	{
		$('#appsex').val(getSexByIDNo($('#appidno').val()));
		$('#appbirthday').val(getBirthdatByIdNo($('#appidno').val()));
	}
	else
	{
		$('#appidno').val("");
	}
}

function disinsIdInfo()
{
	if(checkCardId($('#insidno').val()))
	{
		$('#inssex').val(getSexByIDNo($('#insidno').val()));
		$('#insbirthday').val(getBirthdatByIdNo($('#insidno').val()));
	}
	else
	{
		$('#insidno').val("");
	}
}

function insisone()
{	
	if($('#insisone').attr('checked')=="checked")
	{
		isapp1.style.display="none";
		isapp2.style.display="none";
		isapp3.style.display="none";
		isapp4.style.display="none";
	}
	else
	{
		isapp1.style.display="";
		isapp2.style.display="";
		isapp3.style.display="";
		isapp4.style.display="";
	}
}

function policyExam(state)
{
	var row = $('#policyList').datagrid('getSelected');
	
	if(row==null)
	{
		$.messager.alert('操作提示','请选中要操作的数据！','error');
		return;
	}
	
	var tparam = new Object();
	
	tparam.orderid = row.orderid;
	tparam.state = state;
	
	ajaxdeal("policy/policyUpdateStace.do",tparam,null,null,saveSuss);
}

function queryPolicyInfo(val,row,index)
{
	return '<a href="#" onclick="openDlg('+index+')">查看详情</a>'; 
}

function openDlg(index)
{
	var rows=$('#policyList').datagrid('getRows');//获取所有当前加载的数据行
	var row=rows[index];
	
	//alert(row.agentcom);
	
	dispolicyDetailDlg(row);
}

function lifeupdate()
{
	var row = $('#policyList').datagrid('getSelected');
	
	if(row==null)
	{
		$.messager.alert('操作提示','请选中要操作的数据！','error');
		return;
	}
	
	if($('#insisone').attr('checked')=="checked")
	{
		if(!checknotnull(checkList01))
		{
			return;
		}
	}
	else
	{
		if(!checknotnull(checkList))
		{
			return;
		}	
	}
	//return;
	
	var tparam = prepareparam(inputList);
	
	tparam.reuserid = $('#resuerkey').val();
	
	if(amntType=="01")
	{
		if($('#numAmnt').val()==""||$('#numAmnt').val()==null)
		{
			$.messager.alert('操作提示','保险金额不能为空！','error');
			return;
		}
		
		if((tparam.amnt-minamnt)>0||(tparam.amnt-maxamnt)>0)
		{
			$.messager.alert('操作提示','保额范围，需要在'+minamnt+'~'+maxamnt+'，请重新输入！','error');
			return;
		}
		
		tparam.amnt = $('#numAmnt').val();
	}
	else if(amntType=="02")
	{
		if($('#selectAmnt').combobox('getValue')==""||$('#selectAmnt').combobox('getValue')==null)
		{
			$.messager.alert('操作提示','保险金额不能为空！','error');
			return;
		}
		
		tparam.amnt = $('#selectAmnt').combobox('getValue');
	}
	else
	{
		$.messager.alert('操作提示','未录入保额配置数据，不允许录单！','error');
		return;
	}
	
	if($('#payintv').combobox('getValue')==""||$('#payintv').combobox('getValue')==null)
	{
		$.messager.alert('操作提示','缴费方式不能为空！','error');
		return;
	}
	tparam.payintv = $('#payintv').combobox('getValue');
	
	if($('#payendyear').combobox('getValue')==""||$('#payendyear').combobox('getValue')==null)
	{
		$.messager.alert('操作提示','缴费方式不能为空！','error');
		return;
	}
	tparam.payendyear = $('#payendyear').combobox('getValue');
	
	if($('#insuyear').combobox('getValue')==""||$('#insuyear').combobox('getValue')==null)
	{
		$.messager.alert('操作提示','保险期间不能为空！','error');
		return;
	}
	tparam.insuyear = $('#insuyear').combobox('getValue');
	
	tparam.riskname = $('#riskcode').combobox('getText');
	tparam.insisone = $('#insisone').attr('checked');
	
	if($('#channeltype').combobox('getValue')==""||$('#channeltype').combobox('getValue')==null)
	{
		$.messager.alert('操作提示','资源来源不能为空！','error');
		return;
	}
	
	tparam.channeltype = $('#channeltype').combobox('getValue');
	
	if($('#channeltype').combobox('getValue')=="02")
	{
		if($('#batchno').val()==""||$('#batchno').val()==null)
		{
			$.messager.alert('操作提示','批次号不能为空！','error');
			return;
		}
		
		tparam.channel02value = $('#batchno').val(); 
	}
	else if($('#channeltype').combobox('getValue')=="03")
	{
		if($('#hotlinetype').combobox('getValue')==""||$('#hotlinetype').combobox('getValue')==null)
		{
			$.messager.alert('操作提示','热线不能为空！','error');
			return;
		}
		
		if($('#generationtime').datebox("getValue")==""||$('#generationtime').datebox("getValue")==null)
		{
			$.messager.alert('操作提示','线索产生日期不能为空！','error');
			return;
		}
		
		tparam.channel01value = $('#hotlinetype').combobox('getValue');
		tparam.channel02value = $('#generationtime').datebox("getValue"); 
	}
	else if($('#channeltype').combobox('getValue')=="05")
	{
		if($('#channelappntserialno').val()==""||$('#channelappntserialno').val()==null)
		{
			$.messager.alert('操作提示','投保人不能为空！','error');
			return;
		}
		
		tparam.channel02value = $('#channelappntserialno').val(); 
	}
	
	tparam.orderid = row.orderid;
	tparam.oldpolicyno = row.contno;
	tparam.oldstate = row.state;
	
	tparam.contserialno = row.contserialno;
	tparam.appntserialno = row.appntserialno;
	tparam.insuredserialno = row.insuredserialno;
	tparam.riskserialno = row.riskserialno;

	tparam.oldismain = row.ismain;
	tparam.oldmainriskcode = row.mainriskcode;
	
	if(!checkBirthday())
	{
		return;
	}
	
	ajaxdeal("policy/lifePolicyUpdate.do",tparam,null,null,saveSuss);
}

function checkBirthday()
{
	var appage = getAgeByBirthDay($('#appbirthday').val());
	var insage = getAgeByBirthDay($('#insbirthday').val());
	
	//关系父母，投保人是被保险人的父母
	if($('#relatoapp').combobox('getValue')=="01")
	{
		if(appage<insage)
		{
			$.messager.alert('操作提示','投保人是被保险人的父母，投保人的年龄不能小于被保险人的年龄！','error');
			return false;
		}
	}
	else if($('#relatoapp').combobox('getValue')=="03")
	{
		if(appage>insage)
		{
			$.messager.alert('操作提示','投保人是被保险人的子女，投保人的年龄不能大于被保险人的年龄！','error');
			return false;
		}
	}
	
	return true;
}

//根据生日获取年龄
function getAgeByBirthDay(birth){
    var returnAge = "";
    var aDate = new Date();
    var nowYear = aDate.getFullYear();
    var nowMonth = (aDate.getMonth()+1) < 10 ? '0'+(aDate.getMonth()+1) : (aDate.getMonth()+1);
    var nowDay = (aDate.getDate()) < 10 ? '0'+aDate.getDate() : aDate.getDate();

    var birthYear = birth.split("-")[0];
    var birthMonth = birth.split("-")[1];
    var birthDay = birth.split("-")[2];
    if(nowYear == birthYear){
        returnAge = 0;// 同年 则为0岁
    } else {
        var ageDiff = nowYear - birthYear ; // 年之差
        if (ageDiff > 0){
            if (nowMonth == birthMonth){
                var dayDiff = nowDay - birthDay;// 日之差
                if (dayDiff < 0) {
                    returnAge = ageDiff - 1;
                } else {
                    returnAge = ageDiff ;
                }
            } else {
                var monthDiff = nowMonth - birthMonth;// 月之差
                if (monthDiff < 0) {
                    returnAge = ageDiff - 1;
                } else {
                    returnAge = ageDiff ;
                }
            }
        }
    }
    return returnAge;
}

</script>

</head>
<body>
<%@ include file="/WEB-INF/jsp/admin/policy/policyDetailDlg.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/policy/userDlg.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/policy/appntDlg.jsp"%>
<%@ include file="/WEB-INF/jsp/dilog/policyUrlDlg.jsp"%>
<div style="margin-left:0%">
	<table class = "common" id="query_table">
		<tr>
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
				业务员工号
			</td>
			<td class = "common">
				<input class = "txt" name="qreuserid" id="qreuserid">
			</td>
		</tr>
		<tr>
			<td class = "title">
				保险公司
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qinsorgancode" id="qinsorgancode">
				</select>
			</td>
			<td class = "title" style="display:none">
				保单状态
			</td>
			<td class = "common" style="display:none">
				<select  editable="false" class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qstate" id="qstate">
				</select>
			</td>
		</tr>
		<tr>
			<td class = "title">
				省公司
			</td>
			<td class = "common">
				<select  editable="false" class = "easyui-combobox" style="width:160%" panelHeight="auto" name="q02org" id="q02org">
				</select>
			</td>
			<td class = "title">
				分公司
			</td>
			<td class = "common">
				<select  editable="false" class = "easyui-combobox" style="width:160%" panelHeight="auto" name="q03org" id="q03org">
				</select>
			</td>
			<td class = "title">
				事业部
			</td>
			<td class = "common">
				<select  editable="false" class = "easyui-combobox" style="width:160%" panelHeight="auto" name="q04org" id="q04org">
				</select>
			</td>
		</tr>
	</table>
	<br>
	<table id="policyList" class="easyui-datagrid" title="保单信息" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<%@ include file="/WEB-INF/jsp/admin/policy/include/policyListItem.jsp"%>
			</tr>
		</thead>
	</table>
	<br>
	<table class = "common">
		<tr>
			<td class = "dstitle" style="height:25px">
	        	保单信息
	        </td>
		</tr>
		<tr>
			<td class = "title">
				出单日期
			</td>
			<td class = "common">
				<input class="easyui-datebox" style="width: 160%" id="startdate" name="startdate" notnull = "出单日期">
			</td>
			
			<td class = "title">
				出单业务员
			</td>
			<td class = "common">
				<input class = "txt" name="reuserid" id="reuserid" notnull = "出单员"  readonly onclick = "disuUserDlg($('#reuserid'),$('#resuerkey'));">
				<input type = 'hidden' id = 'resuerkey'>
			</td>
			
			<td class = "title">
				保单号
			</td>
			<td class = "common">
				<input class = "txt" name="contno" id="contno" notnull = "保单号码">
			</td>
		</tr>
		
		<tr>
			<td class = "title">
				保险公司
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" name="insorgancode" id="insorgancode" notnull = "保险公司">
				</select>
			</td>
			
			<td class = "title">
				险种名称
			</td>
			<td class = "common">
				<select  editable="false" class = "easyui-combobox" style="width:160%" panelHeight="auto" panelWidth="200" name="riskcode" id="riskcode" notnull = "险种">
				</select>
			</td>
			
			<td class = "title">
				保险金额
			</td>
			<td class = "common">
				<select  editable="false" class = "easyui-combobox" style="width:160%" panelHeight="auto" panelWidth="200" name="selectAmnt" id="selectAmnt">
				</select>
				<input class = "txt" name="numAmnt" id="numAmnt">
			</td>
		</tr>
		
		<tr>
			<td class = "title">
				缴费方式
			</td>
			<td class = "common">
				<select  editable="false" class = "easyui-combobox" style="width:160%" panelHeight="auto" name="payintv" id="payintv" notnull = "缴费方式">
				</select>
			</td>
			<td class = "title">
				缴费年期
			</td>
			<td class = "common">
				<select  editable="false" class = "easyui-combobox" style="width:160%" panelHeight="auto" panelWidth="200" name="payendyear" id="payendyear">
				</select>
			</td>
			
			<td class = "title">
				保障期限
			</td>
			<td class = "common">
				<select  editable="false" class = "easyui-combobox" style="width:160%" panelHeight="auto" panelWidth="200" name="insuyear" id="insuyear">
				</select>
			</td>
		</tr>
		
		<tr>
			<td class = "title">
				保费
			</td>
			<td class = "common">
				<input class = "txt" name="prem" id="prem" notnull = "保费">
			</td>
		
			<td class = "title">
				保单生效日期
			</td>
			<td class = "common">
				<input class="easyui-datebox" style="width: 160%" id="cvalidate" name="cvalidate" notnull = "保单生效日期">
			</td>
		</tr>
		
		<tr>
			<td class = "dstitle" style="height:25px">
	        	投保人信息
	        </td>
		</tr>
		<tr>
			<td class = "title">
				投保人姓名
			</td>
			<td class = "common">
				<input class = "txt" name="appname" id="appname" notnull = "投保人姓名">
			</td>
			<td class = "title">
				投保人身份证号码
			</td>
			<td class = "common">
				<input class = "txt" name="appidno" id="appidno" notnull = "投保人身份证号码" onblur = "disAppIdInfo();" placeholder = "如客户未提供，请输入0">
			</td>
			<td class = "title">
				投保人手机号码
			</td>
			<td class = "common">
				<input class = "txt" name="appmobile" id="appmobile" notnull = "投保人手机号码">
			</td>
		</tr>
		<tr style="display:none">
			<td class = "title">
				性别
			</td>
			<td class = "common">
				<input class = "txt" name="appsex" id="appsex" notnull = "投保人性别">
			</td>
			<td class = "title">
				生日
			</td>
			<td class = "common">
				<input class = "txt" name="appbirthday" id="appbirthday" notnull = "投保人生日">
			</td>
		</tr>
		<tr>
			<td class = "title">
				投保人所在省
			</td>
			<td class = "common">
				<select  editable="false" class = "easyui-combobox" style="width:160%" panelHeight="auto" name="appprovince" id="appprovince" notnull = "投保人所在省">
				</select>
			</td>
			<td class = "title">
				投保人所在市
			</td>
			<td class = "common">
				<select  editable="false" class = "easyui-combobox" style="width:160%" panelHeight="auto" name="appcity" id="appcity" notnull = "投保人所在市">
				</select>
			</td>
			<td class = "title">
				投保人所在区
			</td>
			<td class = "common">
				<select  editable="false" class = "easyui-combobox" style="width:160%" panelHeight="auto" name="appcountry" id="appcountry" notnull = "投保人所在区">
				</select>
			</td>
		</tr>
		<tr>
			<td class = "title">
				投保人详细地址
			</td>
			<td class = "common">
				<input class = "txt" name="appaddress" id="appaddress" notnull = "投保人详细地址">
			</td>
		</tr>
		<tr>
			<td class = "dstitle" style="height:25px">
	        	被保人信息
	        </td>
		</tr>
		<tr>
			<td class = "title">
				是否同一人
			</td>
			<td class = "common">
				<input type="checkbox" id = 'insisone' onclick = 'insisone();'>
			</td>
		</tr>
		<tr id = 'isapp1'>
			<td class = "title">
				投保人是被保人的
			</td>
			<td class = "common">
				<select  editable="false" class = "easyui-combobox" style="width:160%" panelHeight="auto" name="relatoapp" id="relatoapp" notnull = "投保人是被保人的">
				</select>
			</td>
		</tr>
		<tr id = 'isapp2'>
			<td class = "title">
				被保人姓名
			</td>
			<td class = "common">
				<input class = "txt" name="insname" id="insname" notnull = "被保人姓名">
			</td>
			<td class = "title">
				被保人身份证号码
			</td>
			<td class = "common">
				<input class = "txt" name="insidno" id="insidno" notnull = "被保人身份证号码" onblur = "disinsIdInfo()" placeholder = "如客户未提供，请输入0">
			</td>
			<td class = "title">
				被保人手机号码
			</td>
			<td class = "common">
				<input class = "txt" name="insmobile" id="insmobile" notnull = "被保人手机号码">
			</td>
		</tr>
		<tr style="display:none">
			<td class = "title">
				性别
			</td>
			<td class = "common">
				<input class = "txt" name="inssex" id="inssex" notnull = "被保人性别">
			</td>
			<td class = "title">
				生日
			</td>
			<td class = "common">
				<input class = "txt" name="insbirthday" id="insbirthday" notnull = "被保人生日">
			</td>
		</tr>
		<tr id = 'isapp3'>
			<td class = "title">
				被保人所在省
			</td>
			<td class = "common">
				<select  editable="false" class = "easyui-combobox" style="width:160%" panelHeight="auto" name="insprovince" id="insprovince" notnull = "被保人所在省">
				</select>
			</td>
			<td class = "title">
				被保人所在市
			</td>
			<td class = "common">
				<select  editable="false" class = "easyui-combobox" style="width:160%" panelHeight="auto" name="inscity" id="inscity" notnull = "被保人所在市">
				</select>
			</td>
			<td class = "title">
				被保人所在区
			</td>
			<td class = "common">
				<select  editable="false" class = "easyui-combobox" style="width:160%" panelHeight="auto" name="inscountry" id="inscountry" notnull = "被保人所在区">
				</select>
			</td>
		</tr>
		<tr id = 'isapp4'>
			<td class = "title">
				被保人详细地址
			</td>
			<td class = "common">
				<input class = "txt" name="insaddress" id="insaddress" notnull = "被保人详细地址">
			</td>
		</tr>
		<tr>
			<td class = "dstitle" style="height:25px">
	        	资源信息
	        </td>
		</tr>
		<tr>
			<td class = "title">
				资源来源
			</td>
			<td class = "common">
				<select  editable="false" class = "easyui-combobox" style="width:160%" panelHeight="auto" name="channeltype" id="channeltype" notnull = "资源来源">
				</select>
			</td>
			
			<td class = "title hotline">
				热线渠道
			</td>
			<td class = "common hotline">
				<select  editable="false" class = "easyui-combobox" style="width:160%" panelHeight="auto" name="hotlinetype" id="hotlinetype" notnull = "热线">
				</select>
			</td>
			
			<td class = "title hotline">
				线索产生时间
			</td>
			<td class = "common hotline">
				<input class="easyui-datebox" style="width: 160%" id="generationtime" name="generationtime" notnull = "线索产生时间">
			</td>
			
			<td class = "title special">
				批次号
			</td>
			<td class = "common special">
				<input class = "txt special" name="batchno" id="batchno" notnull = "批次号">
			</td>
			
			<td class = "title referral">
				投保人
			</td>
			<td class = "common referral">
				<input class = "txt referral" readonly name="channelappname" id="channelappname" onclick = "disuappntdlg($('#channelappntserialno'),$('#channelappname'))" notnull = "投保人">
				<input class = "txt" hidden = "" name="channelappntserialno" id="channelappntserialno">
			</td>
		</tr>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "articlequery" onclick = "policyquery()">保单查询</a>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" id = "lifeinsert" onclick = "lifeinsert()">保单录入</a>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" id = "lifeupdate" onclick = "lifeupdate()">保单修改</a>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove'" id = "lifedelete" onclick = "lifedelete()">保单删除</a>
	<!-- 
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" id = "policyExam" onclick = "policyExam('81')">申请审核</a>
	 -->
</div>
</body>
</html>