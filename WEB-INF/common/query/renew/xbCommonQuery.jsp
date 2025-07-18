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
	<tr>
		<td class="reprot_title">
			签约渠道
		</td>
		<td class="report_common">
			<select class="easyui-combobox" style="width:160%" panelHeight="auto" name="qriskchannel" id="qriskchannel">
			</select>
		</td>
		
		<td class="reprot_title">
			保险产品编码
		</td>
		<td class="report_common">
			<input class="txt" name="qgroupcode" id="qgroupcode">
		</td>
		
		<td class = "reprot_title">
			险种类型
		</td>
		<td class = "report_common">
			<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qrisktype" id="qrisktype">
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
			<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qxubao_callbacktype" id="qxubao_callbacktype">
			</select>
		</td>
	</tr>
	<%@ include file="/WEB-INF/jsp/admin/team/organAndTeamQuery.jsp"%>
</table>

<script>
var has_sum = '01'//01表示有汇总，00表示没有
function initRenewQuery(hasSum,oprtype)
{
	has_sum = hasSum;
	
	disComBox($('#qinsorgancode'), "insorgancode", null);
	disComBox($('#qstate'), "policyquery", null);
	disComBox($('#qxbstate'), "xubaostate", null);
	disComBox($('#qriskchannel'), "channel", null);
	disComBox($('#qrisktype'),"risktype",null);
	disComBox($('#qxubao_callbacktype'),"renew_callbacktype",null);
	disComBox($('#qpromise_xubao'),"ismain",null);
	
	var t_stateList = "40,70,73,74"
	$('#qstate').combobox('setValues', t_stateList.split(","));
	
	init02Org();
	
	if(oprtype=='confirm')
	{
		$('#qxubao_callbacktype').combobox('setValue', '02');
	}
	
	$('#qXubaoStartDate').datebox('setValue', getMonthOneFormatDate());
	$('#qXubaoEndDate').datebox('setValue', getNextMonthOneFormatDate());
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

function getXbQueryParam() 
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

	tParam.xbstartdate = $('#qXubaoStartDate').datebox("getValue");
	tParam.xbenddate = $('#qXubaoEndDate').datebox("getValue");

	var xbStateList = $('#qxbstate').combobox('getValues');
	var xbStateStr = "";
	reStateStr = xbStateList.join(",");
	// for (var f = 0; f < xbStateList.length; f++) {
	// 	if (xbStateStr != "") xbStateStr += "\',\'";
	// 	xbStateStr += xbStateList[f];
	// }

	tParam.xbstate = xbStateStr;

	tParam.riskchannel = $('#qriskchannel').combobox('getValue');

	tParam.xbpolicyyear = $('#qxbpolicyyear').val();
	tParam.risktype = $('#qrisktype').combobox('getValue');
	tParam.promise_xubao = $('#qpromise_xubao').combobox('getValue');
	
	tParam.xubao_callbacktype = $('#qxubao_callbacktype').combobox('getValue');
	tParam.cusname = $('#qcusname').val();
	tParam.cusmobile = $('#qcusmobile').val();
	tParam.groupcode = $('#qgroupcode').val();
	
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
	}
}

</script>