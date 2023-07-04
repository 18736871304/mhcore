<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%><head>
<title></title>
<script>

var inputList;
var checkList;

window.onload = function()
{
	initDataGrid20($('#policyList'));
	
	disComBox($('#qfincestate'),"fincestate",null);
	disComBox($('#qinsorgancode'),"insorgancode",null);
	
	$('#menudisplaydlg').dialog('close');
	
	$('#qacceptStartDate').datebox('setValue',getMonthOneFormatDate());
}

function aftercodeselect(comboxid)
{
	if(comboxid.attr("id")=="qinsorgancode")
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
}

function selectone()
{
}

function policyquery()
{
	var tturl = "policy/getPolicyList.do";

	var tParam = new Object();

	//tParam.contno = $('#qcontno').val();
	
	tParam.fincestate = $('#qfincestate').combobox('getValue');
	tParam.appname = $('#qappname').val();
	tParam.insname = $('#qinsname').val();
	
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
	
	tParam.acceptStartDate = $('#qacceptStartDate').datebox("getValue");
	tParam.acceptEndDate = $('#qacceptEndDate').datebox("getValue");
	
	tParam.organcode = $('#departmentId').val();
	
	tParam.state = '40';
	//tParam.fincestate = '01';
	
	displayDataGrid20($('#policyList'), tParam, tturl);
}

function saveSuss()
{
	$('#policyList').datagrid('reload');
}

function getChecked(){
    var nodes = $('#userauthtree').tree('getChecked');
    var s = '';
    var s2 = '';
    for(var i=0; i<nodes.length; i++){
        if (s != '') s += '\',\'';
        if (s2 != '') s2 += ',';
        s += nodes[i].id;
        s2 += nodes[i].text;
    }
    $('#departmentId').val(s);
    $('#departmentName').val(s2);

    $('#menudisplaydlg').dialog('close');
}

function userMenuDis()
{
    $("#userauthtree").tree(
        {
            url:'combox/departmentList.do'
        });
    $('#menudisplaydlg').dialog('open');
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

function getMonthOneFormatDate()
{
	var date = new Date();
    
    var seperator1 = "-";
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = year + seperator1 + month + seperator1 + "01";
    return currentdate;
}

</script>

</head>
<body>
<div style="margin-left:0%">
	<input type="text" hidden="hidden" id="departmentId">
	<div id="menudisplaydlg" class="easyui-dialog" title="机构查询"
		 style="width:300px;height:500px;padding:10px"
		 data-options="iconCls: 'icon-save'">
		<div style="margin-left:15%">
			<ul id="userauthtree" class="easyui-tree" data-options="animate:true,checkbox:true"></ul>
		</div>
		<a href="#" class="easyui-linkbutton" onclick="getChecked()">确认</a>
	</div>
	<table class = "common">
		<tr>
			<td class = "title">
				结算状态
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" panelWidth="200" name="qfincestate" id="qfincestate">
				</select>
			</td>
			<td class = "title">
				投保人姓名
			</td>
			<td class = "common">
				<input class = "txt" name="qappname" id="qappname">
			</td>
			<td class = "title">
				被保人姓名
			</td>
			<td class = "common">
				<input class = "txt" name="qinsname" id="qinsname">
			</td>
		</tr>
		<tr>
			<td class = "title">
				保险公司
			</td>
			<td class = "common">
				<input class="easyui-combobox" id="qinsorgancode" style="width:160%" name="qinsorgancode" data-options="valueField:'id',textField:'text',multiple:true,panelHeight:'auto'">
			</td>
			
			<td class = "title">
				险种名称
			</td>
			<td class = "common">
				<input class="easyui-combobox" id="qriskcode" style="width:160%" name="qriskcode" data-options="valueField:'id',textField:'text',multiple:true,panelHeight:'auto'">
			</td>
		</tr>
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
		</tr>
		
		<tr>
			<td class = "title">
				出单机构
			</td>
			<td class = "common" colspan="2">
				<input class = "txt" name="departmentName" id="departmentName" readonly><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-tip'" id = "userMenuDis" onclick = "userMenuDis()"></a>
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
				<th data-options="field:'fincestatename',width:80">结算状态</th>
				<th data-options="field:'accepttime',width:140">出单日期</th>
				<th data-options="field:'organname',width:80">出单分公司</th>
				<th data-options="field:'agentcom',width:80">出单事业部</th>
				<th data-options="field:'reusername',width:80">出单业务员</th>
				<th data-options="field:'serviceusername',width:80">服务人员</th>
				
				<th data-options="field:'contno',width:150">保单号</th>
				<th data-options="field:'statename',width:80">保单状态</th>
				<th data-options="field:'insorganname',width:80">保险公司</th>
				<th data-options="field:'riskname',width:160">险种名称</th>
				
				<th data-options="field:'appname',width:70">投保人姓名</th>
				
				<th data-options="field:'appprovincename',width:80">投保人所在省</th>
				<th data-options="field:'appcityname',width:80">投保人所在市</th>
				
				<th data-options="field:'amnt',width:80">保险金额</th>
				
				<th data-options="field:'insuyearvalue',width:70">保障期限</th>
				<th data-options="field:'prem',width:70">保费</th>
				<th data-options="field:'payintvvalue',width:70">缴费方式</th>
				<th data-options="field:'payendyearvalue',width:70">缴费年期</th>
				
				<th data-options="field:'fyp20',width:70">标保</th>
				
				<th data-options="field:'channelname',width:70">资源类型</th>
				
				<th data-options="field:'_operate',width:70,formatter:queryPolicyInfo">操作</th>
			</tr>
		</thead>
	</table>
</div>
</body>
</html>