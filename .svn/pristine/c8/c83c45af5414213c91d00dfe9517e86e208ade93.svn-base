<%@ page contentType="text/html;charset=utf-8"%>
<table class="common">
	<tr>
		<td class="reprot_title">
			应收起期
		</td>
		<td class="report_common">
			<input class="easyui-datebox" style="width: 160%" id="qrenewStartDate" name="qrenewStartDate" notnull="应收起期">
		</td>
		<td class="reprot_title">
			应收止期
		</td>
		<td class="report_common">
			<input class="easyui-datebox" style="width: 160%" id="qrenewEndDate" name="qrenewEndDate" notnull="应收止期">
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
			保单年度
		</td>
		<td class="report_common">
			<input class="txt" name="qpolicyyear" id="qpolicyyear">
		</td>
		
		<td class="reprot_title">
			续期状态
		</td>
		<td class="report_common">
			<select class="easyui-combobox" style="width:160%" panelHeight="auto" name="qrestate" id="qrestate"
				data-options="multiple:true">
			</select>
		</td>
	</tr>
	<tr>
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
			险种类型
		</td>
		<td class = "report_common">
			<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qrisktype" id="qrisktype">
			</select>
		</td>
	
		<td class = "reprot_title">
			产品属性
		</td>
		<td class = "report_common">
			<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qjointype" id="qjointype">
			</select>
		</td>
		<td class="reprot_title">
			保险产品编码
		</td>
		<td class="report_common">
			<input class="txt" name="qgroupcode" id="qgroupcode">
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
	
		<td class="reprot_title">
			电话号码
		</td>
		<td class="report_common">
			<input class="txt" name="qcusmobile" id="qcusmobile">
		</td>
		
		<td class = "reprot_title">
			确认方式
		</td>
		<td class = "report_common">
			<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qrenew_callbacktype" id="qrenew_callbacktype">
			</select>
		</td>
	</tr>
	<%@ include file="/WEB-INF/jsp/admin/team/organAndTeamQuery.jsp"%>
</table>

<script>
var renew_type = '12';//repayintv
var has_sum = '01'//01表示有汇总，00表示没有
function initRenewQuery(renewType,hasSum,oprtype)
{
	renew_type = renewType;
	has_sum = hasSum;
	
	disComBox($('#qinsorgancode'), "insorgancode", null);
	disComBox($('#qstate'), "policyquery", null);
	disComBox($('#qrestate'), "renewstate", null);
	disComBox($('#qriskchannel'), "channel", null);
	disComBox($('#qrisktype'),"risktype",null);
	disComBox($('#qjointype'),"jointype",null);
	disComBox($('#qrenew_callbacktype'),"renew_callbacktype",null);
	
	var t_stateList = "40,70,73,74"
	$('#qstate').combobox('setValues', t_stateList.split(","));
	init02Org();
	if(oprtype=='confirm')
	{
		$('#qrenew_callbacktype').combobox('setValue', '02');
	}
	$('#qrenewStartDate').datebox('setValue', getMonthOneFormatDate());
	$('#qrenewEndDate').datebox('setValue', getNextMonthOneFormatDate());
}

function qRenewAftercodeselect(comboxid) 
{
	if (comboxid.attr("id") == "qinsorgancode") {
		var tParam = new Object();
		var codes = comboxid.combobox('getValues');
	  // 判断是否为字母（包括大小写）
	  const isLetter = /^[A-Za-z]+$/.test(codes[0]);
        // 判断是否为汉字
        const isChinese = /^[\u4e00-\u9fa5]+$/.test(codes[0]);
        if (isChinese) {
          codes.splice(0, 1); // 从索引 0 开始删除 1 个元素
          $("#qinsorgancode").combobox('setValue', codes);
        }



		var ic = "";

		ic = codes.join(",");
		// for (var i = 0; i < codes.length; i++) {
		// 	if (ic != "") ic += "\',\'";
		// 	ic += codes[i];
		// }
		tParam.insorgancode = ic;
		var tturl1 = "policy/getRiskListin.do";
			displayCombox($('#qriskcode'), tParam, tturl1, "dd_key", "dd_value");
	}else {
		organAfterSelect(comboxid);
	}
}

function getRenewQueryParam() 
{
	var tParam = new Object();

	tParam.contno = $('#qcontno').val();

	tParam.reuserid = $('#qresuerkey').val();

	tParam.seruserid = $('#qseruserkey').val();

	var codes = $('#qinsorgancode').combobox('getValues');
	var ic = "";
	ic = codes.join(",");
	// for (var i = 0; i < codes.length; i++) {
	// 	if (ic != "") ic += "\',\'";
	// 	ic += codes[i];
	// }
	tParam.insorgancode = ic;

	var stateList = $('#qstate').combobox('getValues');
	var stateStr = "";
	stateStr = stateList.join(",");
	// for (var f = 0; f < stateList.length; f++) {
	// 	if (stateStr != "") stateStr += "\',\'";
	// 	stateStr += stateList[f];
	// }

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
	icc = codess.join(",");
	// for (var j = 0; j < codess.length; j++) {
	// 	if (icc != "") icc += "\',\'";
	// 	icc += codess[j];
	// }
	tParam.mainriskcode = icc;

	tParam.renewStartDate = $('#qrenewStartDate').datebox("getValue");
	tParam.renewEndDate = $('#qrenewEndDate').datebox("getValue");

	var reStateList = $('#qrestate').combobox('getValues');
	var reStateStr = "";
	reStateStr = reStateList.join(",");
	// for (var f = 0; f < reStateList.length; f++) {
	// 	if (reStateStr != "") reStateStr += "\',\'";
	// 	reStateStr += reStateList[f];
	// }

	tParam.restate = reStateStr;

	tParam.riskchannel = $('#qriskchannel').combobox('getValue');

	tParam.policyyear = $('#qpolicyyear').val();
	tParam.risktype = $('#qrisktype').combobox('getValue');
	tParam.jointype = $('#qjointype').combobox('getValue');
	tParam.renew_callbacktype = $('#qrenew_callbacktype').combobox('getValue');
	tParam.cusname = $('#qcusname').val();
	tParam.cusmobile = $('#qcusmobile').val();
	tParam.groupcode = $('#qgroupcode').val();
	
	tParam.repayintv = renew_type;
	
	return tParam;
}

function renewPolicyquery() 
{
	var tturl = "policy/getRenewPolicyList.do";
	var tParam = getRenewQueryParam();
	displayDataGrid20($('#policyList'), tParam, tturl);

	if(has_sum=='01')
	{
		var sumurl = "policy/getRePolicySum.do";
		ajaxdeal(sumurl, tParam, displaysumdata, null);
		clearCarData();
	}
}

</script>