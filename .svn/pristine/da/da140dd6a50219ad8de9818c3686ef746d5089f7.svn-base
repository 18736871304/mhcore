<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%><head>
<title></title>
<script>

var inputList;
var checkList;

window.onload = function()
{
	dis_query.style.display="none";
	policyDetailDlgInit();
	
	initDataGrid20($('#policyList'));
	
	disComBox($('#qinsorgancode'),"insorgancode",null);

	disComBox($('#qstate'),"policyquery",null);
	
	$('#qstate').combobox('setValue','40');
	
	inputList = 
		[
			$('#appprovince'),
			$('#appcity'),
			$('#appcountry'),
			$('#appaddress'),
		 		
			$('#insprovince'),
			$('#inscity'),
			$('#inscountry'),
			$('#insaddress')
		];
	
	checkList = 
		[
	 		$('#appprovince'),
	 		$('#appcity'),
	 		$('#appcountry'),
	 		$('#appaddress'),
	 		
	 		$('#insprovince'),
	 		$('#inscity'),
	 		$('#inscountry'),
	 		$('#insaddress')
	 	];
	
	/*
	disComBox($('#qstate'),"articlestate",null);
	
	$('#qstate').combobox('setValue','01');
	*/
	
	var tturl = "policy/get02Org.do";
	displayCombox($('#q02org'),null,tturl,"dd_key","dd_value");
	
	disComBox($('#appprovince'),"province",null);
	disComBox($('#insprovince'),"province",null);
	disComBox($('#qappprovince'),"province",null);
	
	dlgUserInit();
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
	else if(comboxid.attr("id")=="qinsorgancode")
	{
		var tParam = new Object();
		var codes = comboxid.combobox('getValues');
        var ic = "";
        for(var i=0;i<codes.length;i++){
            if (ic != "") ic += "\',\'";
			ic += codes[i];
		}
        tParam.insorgancode = ic;
		var tturl1 = "policy/getRiskListin.do";
		
		displayCombox($('#qriskcode'),tParam,tturl1,"dd_key","dd_value");
	}
	else if(comboxid.attr("id")=="appprovince")
	{
		disappcity(comboxid.combobox('getValue'));
	}
	else if(comboxid.attr("id")=="insprovince")
	{
		disinscity(comboxid.combobox('getValue'));
	}
	else if(comboxid.attr("id")=="appcity")
	{
		disappcountry(comboxid.combobox('getValue'));
	}
	else if(comboxid.attr("id")=="inscity")
	{
		disinscountry(comboxid.combobox('getValue'));
	}
	else if(comboxid.attr("id")=="qappprovince")
	{
		var tParam = new Object();
		tParam.province = comboxid.combobox('getValue');
		
		var tturl1 = "policy/getCity.do";
		
		displayCombox($('#qappcity'),tParam,tturl1,"dd_key","dd_value");
	}
	else if(comboxid.attr("id")=="qappcity")
	{
		var tParam = new Object();
		tParam.city = comboxid.combobox('getValue');
		
		var tturl1 = "policy/getCountry.do";
		
		displayCombox($('#qappcountry'),tParam,tturl1,"dd_key","dd_value");
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

function selectone()
{
	var row = $('#policyList').datagrid('getSelected');
	
	$('#appprovince').combobox('setValue',row.appprovince);
	
	disappcity(row.appprovince);
	$('#appcity').combobox('setValue',row.appcity);
	
	disappcountry(row.appcity);
	$('#appcountry').combobox('setValue',row.appcountry);
	
	$('#appaddress').val(row.appaddress);
	
	$('#insprovince').combobox('setValue',row.insprovince);
	
	disinscity(row.insprovince);
	$('#inscity').combobox('setValue',row.inscity);
	
	disinscountry(row.inscity);
	$('#inscountry').combobox('setValue',row.inscountry);
	
	$('#insaddress').val(row.insaddress);
}

function policyquery()
{
	var tturl = "policy/getPolicyList.do";

	var tParam = new Object();

	tParam.contno = $('#qcontno').val();
	tParam.cusname = $('#qcusname').val();
	tParam.cusmobile = $('#qcusmobile').val();
	
	tParam.reuserid = $('#qreuserid').val();
	tParam.state = $('#qstate').combobox('getValue');
	tParam.agentflag = '03';
	
	var codes = $('#qinsorgancode').combobox('getValues');
    var ic = "";
    for(var i=0;i<codes.length;i++){
        if (ic != "") ic += "\',\'";
        ic += codes[i];
    }
    tParam.insorgancode = ic;
    
    //险种编码多选
    var codess = $('#qriskcode').combobox('getValues');
    var icc = "";
    for(var j=0;j<codess.length;j++){
        if (icc != "") icc += "\',\'";
        icc += codess[j];
    }
    tParam.mainriskcode = icc;
	
	tParam.q02org = $('#q02org').combobox('getValue');
	tParam.q03org = $('#q03org').combobox('getValue');
	tParam.q04org = $('#q04org').combobox('getValue');
	//tParam.querytype = 'articletype';
	
	tParam.acceptStartDate = $('#qacceptStartDate').datebox("getValue");
	tParam.acceptEndDate = $('#qacceptEndDate').datebox("getValue");
	
	tParam.appprovince = $('#qappprovince').combobox('getValue');
	tParam.appcity = $('#qappcity').combobox('getValue');
	tParam.appcountry = $('#qappcountry').combobox('getValue');
	
	displayDataGrid20($('#policyList'), tParam, tturl);
	
	clearCarData();
}

function updateaddress()
{
	var row = $('#policyList').datagrid('getSelected');
	if(row==null)
	{
		$.messager.alert('操作提示','请选中要修改的数据！','error');
		return;
	}
	
	if(!checknotnull(checkList))
	{
		return;
	}
	
	var tparam = prepareparam(inputList);
	tparam.appntserialno = row.appntserialno;
	tparam.insuredserialno = row.insuredserialno;
	
	ajaxdeal("policy/addressUpdate.do",tparam,null,null,saveSuss);
}

function saveSuss()
{
	clearLifeData();
	$('#policyList').datagrid('reload');
}

function clearLifeData() 
{
	cleardata(inputList);
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

function insisone()
{
	if($('#insisone').attr('checked')=="checked")
	{	
		$('#insprovince').combobox('setValue',$('#appprovince').combobox('getValue'));
		
		disinscity($('#appprovince').combobox('getValue'));
		$('#inscity').combobox('setValue',$('#appcity').combobox('getValue'));
		
		disinscountry($('#appcity').combobox('getValue'));
		$('#inscountry').combobox('setValue',$('#appcountry').combobox('getValue'));
		
		$('#insaddress').val($('#appaddress').val());
	}
}

</script>

</head>
<%@ include file="/WEB-INF/jsp/admin/policy/policyDetailDlg.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/policy/userDlg.jsp"%>
<body>
<div style="margin-left:0%">
	<table class = "common">
		<tr>
			<td class = "title">
				出单起期
			</td>
			<td class = "common">
				<input class="easyui-datebox" style="width: 160%" id="qacceptStartDate" name="qacceptStartDate" notnull = "出单起期">
			</td>
			<td class = "title">
				出单止期
			</td>
			<td class = "common">
				<input class="easyui-datebox" style="width: 160%" id="qacceptEndDate" name="qacceptEndDate" notnull = "出单止期">
				(算头不算尾)
			</td>
			
			<td class = "title">
				保单号
			</td>
			<td class = "common">
				<input class = "txt" name="qcontno" id="qcontno">
			</td>
		</tr>
		
		<tr>
			<td class = "title">
				保单状态
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qstate" id="qstate">
				</select>
			</td>
			
			<td class = "title">
				保险公司
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" name="qinsorgancode" id="qinsorgancode" data-options="valueField:'id',textField:'text',multiple:true">
				</select>
			</td>
			
			<td class = "title">
				险种名称
			</td>
			<td class = "common">
				<input class="easyui-combobox" id="qriskcode" style="width:160%" name="qriskcode" data-options="valueField:'id',textField:'text',multiple:true">
			</td>
		</tr>
		
		<tr>
			<td class = "title">
				客户姓名
			</td>
			<td class = "common">
				<input class = "txt" name="qcusname" id="qcusname">
			</td>
			
			<td class = "title">
				客户手机号码
			</td>
			<td class = "common">
				<input class = "txt" name="qcusmobile" id="qcusmobile">
			</td>
		</tr>
	</table>
	<table id = "dis_query">
		
		<tr>
			<td class = "title">
				业务员
			</td>
			<td class = "common">
				<input class = "txt" name="qreuserid" id="qreuserid" readonly onclick = "disuUserDlg($('#qreuserid'));">
			</td>
		</tr>
		
		<tr>
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
		<tr>
			<td class = "title">
				投保人所在省
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" name="qappprovince" id="qappprovince">
				</select>
			</td>
			<td class = "title">
				投保人所在市
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" name="qappcity" id="qappcity">
				</select>
			</td>
			<td class = "title">
				投保人所在区
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" name="qappcountry" id="qappcountry">
				</select>
			</td>
		</tr>
		
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "articlequery" onclick = "policyquery()">保单查询</a>
	<br>
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
	        	投保人信息
	        </td>
		</tr>
	
		<tr>
			<td class = "title">
				投保人所在省
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" name="appprovince" id="appprovince" notnull = "投保人所在省">
				</select>
			</td>
			<td class = "title">
				投保人所在市
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" name="appcity" id="appcity" notnull = "投保人所在市">
				</select>
			</td>
			<td class = "title">
				投保人所在区
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" name="appcountry" id="appcountry" notnull = "投保人所在区">
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
				是否同上
			</td>
			<td class = "common">
				<input type="checkbox" id = 'insisone' onclick = 'insisone();'>
			</td>
		</tr>
		
		<tr>
			<td class = "title">
				被保人所在省
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" name="insprovince" id="insprovince" notnull = "被保人所在省">
				</select>
			</td>
			<td class = "title">
				被保人所在市
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" name="inscity" id="inscity" notnull = "被保人所在市">
				</select>
			</td>
			<td class = "title">
				被保人所在区
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" name="inscountry" id="inscountry" notnull = "被保人所在区">
				</select>
			</td>
		</tr>
		<tr>
			<td class = "title">
				被保人详细地址
			</td>
			<td class = "common">
				<input class = "txt" name="insaddress" id="insaddress" notnull = "被保人详细地址">
			</td>
		</tr>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" id = "updateaddress" onclick = "updateaddress()">修改地址</a>
</div>
</body>
</html>