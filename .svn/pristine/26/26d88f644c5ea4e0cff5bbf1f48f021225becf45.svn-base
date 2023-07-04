<%@ page contentType="text/html;charset=utf-8"%>
<table class="common">
	<tr>
		<td class="reprot_title">
			续保起期
		</td>
		<td class="report_common">
			<input class="easyui-datebox" style="width: 160%" id="qXubaoStartDate" name="qXubaoStartDate">
		</td>
		<td class="reprot_title">
			续保止期
		</td>
		<td class="report_common">
			<input class="easyui-datebox" style="width: 160%" id="qXubaoEndDate" name="qXubaoEndDate">
		</td>
		<td class="reprot_title">
			保单号
		</td>
		<td class="report_common">
			<input class="txt" name="qcontno" id="qcontno">
		</td>
		
		<td class="reprot_title">
			保单状态
		</td>
		<td class="report_common">
			<select class="easyui-combobox" style="width:160%" panelHeight="auto" name="qstate" id="qstate" data-options="multiple:true">
			</select>
		</td>
			
		<td class="reprot_title">
			回访状态
		</td>
		<td class="report_common">
			<select class="easyui-combobox" style="width:90%" panelHeight="auto" name="qinsrevisitstate"
				id="qinsrevisitstate">
			</select>
		</td>
		
		<td class="reprot_title">
			回执状态
		</td>
		<td class="report_common">
			<select class="easyui-combobox" style="width:90%" panelHeight="auto" name="qreceiptstate"
				id="qreceiptstate">
			</select>
		</td>
	</tr>
	<tr>
		<td class = "reprot_title">
			结算状态
		</td>
		<td class = "report_common">
			<select class = "easyui-combobox" style="width:160%" panelHeight="auto" panelWidth="200" name="qxbfincestate" id="qxbfincestate">
			</select>
		</td>
			
		<td class = "reprot_title">
			开票年月
		</td>
		<td class = "report_common">
			<input class="easyui-datebox" style="width: 160%" id="qxbinvoicemonth" name="qxbinvoicemonth">
		</td>
	
		<td class="reprot_title">
			签约渠道
		</td>
		<td class="report_common">
			<select class="easyui-combobox" style="width:160%" panelHeight="auto" name="qriskchannel" id="qriskchannel">
			</select>
		</td>
		
		<td class="reprot_title">
			保险公司
		</td>
		<td class="report_common">
			<input class="easyui-combobox" id="qinsorgancode" style="width:160%" name="qinsorgancode" data-options="valueField:'id',textField:'text',multiple:true,panelHeight:'auto'">
		</td>
		
		<td class="reprot_title">
			险种名称
		</td>
		<td class="report_common">
			<input class="easyui-combobox" id="qriskcode" style="width:160%" name="qriskcode" data-options="valueField:'id',textField:'text',multiple:true,panelHeight:'auto'">
		</td>
		
		<td class = "reprot_title">
			保证续保
		</td>
		<td class = "report_common" colspan="5">
			<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qpromise_xubao" id="qpromise_xubao" notnull = "保证续保">
			</select>
		</td>
	</tr>
	<tr>
		<td class="reprot_title">
			出单业务员
		</td>
		<td class="report_common">
			<input class="txt" name="qreuserid" id="qreuserid" readonly onclick="disuUserDlg($('#qreuserid'),$('#qresuerkey'));">
			<input type='hidden' id='qresuerkey'>
		</td>
		<td class="reprot_title">
			服务人员
		</td>
		<td class="report_common">
			<input class="txt" name="qseruserid" id="qseruserid" readonly onclick="disuUserDlg($('#qseruserid'),$('#qseruserkey'));">
			<input type='hidden' id='qseruserkey'>
		</td>
		
		<td class="reprot_title">
			客户姓名
		</td>
		<td class="report_common">
			<input class="txt" name="qcusname" id="qcusname">
		</td>
	
		<td class = "reprot_title">
			险种类型
		</td>
		<td class = "report_common">
			<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qrisktype" id="qrisktype">
			</select>
		</td>
		
		<td class="reprot_title">
			续保年度
		</td>
		<td class="report_common">
			<input class="txt" name="qxbpolicyyear" id="qxbpolicyyear">
		</td>
		
		<td class="reprot_title">
			续保状态
		</td>
		<td class="report_common">
			<select class="easyui-combobox" style="width:160%" panelHeight="auto" name="qxbstate" id="qxbstate" data-options="multiple:true">
			</select>
		</td>
	</tr>
	<%@ include file="/WEB-INF/jsp/admin/team/organAndTeamQuery.jsp"%>
</table>

<script>
var has_sum = '01'//01表示有汇总，00表示没有
function initRenewQuery(hasSum)
{
	has_sum = hasSum;
	
	disComBox($('#qinsorgancode'), "insorgancode", null);
	disComBox($('#qstate'), "policyquery", null);
	disComBox($('#qxbstate'), "xubaostate", null);
	disComBox($('#qriskchannel'), "channel", null);
	disComBox($('#qinsrevisitstate'), "insrevisitstate", null);
	disComBox($('#qreceiptstate'), "receiptstate", null);
	disComBox($('#qxbfincestate'),"fincestate",null);
	disComBox($('#qrisktype'),"risktype",null);
	disComBox($('#qpromise_xubao'),"ismain",null);
	
	var t_stateList = "40,70,73,74"
	$('#qstate').combobox('setValues', t_stateList.split(","));
	
	init02Org();
	
	$('#qXubaoStartDate').datebox('setValue', getMonthOneFormatDate());
	$('#qXubaoEndDate').datebox('setValue', getNextMonthOneFormatDate());
	
	$('#qxbinvoicemonth').datebox({formatter:function(date){
        var y = date.getFullYear();
        var m = date.getMonth() + 1;
        m = m < 10 ? '0' + m : m;
        return y.toString() + '-' + m.toString();
    },parser:function(date){
        console.log(date);
        if (date) {
            return new Date(String(date).substring(0, 4) + '-'
                    + String(date).substring(5,7));
        } else {
            return new Date();
        }
    }});
}

function qRenewAftercodeselect(comboxid) 
{
	if (comboxid.attr("id") == "qinsorgancode") {
		var tParam = new Object();
		var codes = comboxid.combobox('getValues');
		var ic = "";
		for (var i = 0; i < codes.length; i++) {
			if (ic != "") ic += "\',\'";
			ic += codes[i];
		}
		tParam.insorgancode = ic;
		var tturl1 = "policy/getRiskListin.do";
			displayCombox($('#qriskcode'), tParam, tturl1, "dd_key", "dd_value");
	}else {
		organAfterSelect(comboxid);
	}
}

function getXbQueryParam() 
{
	var tParam = new Object();

	tParam.contno = $('#qcontno').val();
	tParam.reuserid = $('#qresuerkey').val();
	tParam.seruserid = $('#qseruserkey').val();

	var codes = $('#qinsorgancode').combobox('getValues');
	var ic = "";
	for (var i = 0; i < codes.length; i++) {
		if (ic != "") ic += "\',\'";
		ic += codes[i];
	}
	tParam.insorgancode = ic;

	var stateList = $('#qstate').combobox('getValues');
	var stateStr = "";

	for (var f = 0; f < stateList.length; f++) {
		if (stateStr != "") stateStr += "\',\'";
		stateStr += stateList[f];
	}

	tParam.state = stateStr;

	tParam.agentflag = '02';
	tParam.renewflag = 'Y';

	tParam.q02org = $('#q02org').combobox('getValue');
	tParam.q03org = $('#q03org').combobox('getValue');
	tParam.q04org = getOrgan04Code();
	tParam.teamid = getQTeamId();

	//险种编码多选
	var codess = $('#qriskcode').combobox('getValues');
	var icc = "";
	for (var j = 0; j < codess.length; j++) {
		if (icc != "") icc += "\',\'";
		icc += codess[j];
	}
	tParam.mainriskcode = icc;

	tParam.xbstartdate = $('#qXubaoStartDate').datebox("getValue");
	tParam.xbenddate = $('#qXubaoEndDate').datebox("getValue");

	var xbStateList = $('#qxbstate').combobox('getValues');
	var xbStateStr = "";

	for (var f = 0; f < xbStateList.length; f++) {
		if (xbStateStr != "") xbStateStr += "\',\'";
		xbStateStr += xbStateList[f];
	}

	tParam.xbstate = xbStateStr;

	tParam.riskchannel = $('#qriskchannel').combobox('getValue');

	tParam.xbpolicyyear = $('#qxbpolicyyear').val();
	tParam.cusname = $('#qcusname').val();
	tParam.risktype = $('#qrisktype').combobox('getValue');
	
	tParam.xbfincestate = $('#qxbfincestate').combobox('getValue');
	tParam.xbinvoicemonth = $('#qxbinvoicemonth').datebox("getValue");
	
	tParam.insrevisitstate = $('#qinsrevisitstate').combobox('getValue');
	tParam.receiptstate = $('#qreceiptstate').combobox('getValue');
	tParam.promise_xubao = $('#qpromise_xubao').combobox('getValue');
	
	return tParam;
}

function xbPolicyquery() 
{
	var tturl = "policy/getXbPolicyList.do";
	var tParam = getXbQueryParam();
	displayDataGrid20($('#policyList'), tParam, tturl);

	if(has_sum=='01')
	{
		var sumurl = "policy/getXbPolicySum.do";
		ajaxdeal(sumurl, tParam, displaysumdata, null);
		clearCarData();
	}
}

</script>