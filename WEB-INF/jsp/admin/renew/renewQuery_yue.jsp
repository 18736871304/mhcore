<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%>

<head>
	<title></title>
	<link rel="stylesheet" href="../../../../css/inputbox/line6.css">
<script>
window.onload = function () {
	initDataGrid20($('#policyList'));

	policyDetailDlgInit();
	dlgUserInit();
			
	initRenewQuery('1','01','query');
}

function aftercodeselect(comboxid) {
	qRenewAftercodeselect(comboxid);
}

function selectone() {

}

function policyquerydownload() {
	var tturl = "policy/renewPolicyListDownLoad.do";
	var tParam = getRenewQueryParam();

	ajaxdeal(tturl, tParam, listdownloadreturn, null);
}

function listdownloadreturn(data) {
	if (data.flag == "0") {
		if (data.message == null || data.message == "") {
			$.messager.alert('执行失败', '没有生成下载文件', 'error');
		} else {
			$.messager.alert('执行成功', "执行成功，请点击下载", 'info');
			//判断id存在的代码
			if ($("#xiazai").length > 0) {
				$("#xiazai").remove();
				$('#policyquerydownload').after("&nbsp&nbsp<a id = 'xiazai' href = 'download.do?filename=" + data
					.message + "'>点击下载</a>");
			} else {
				$('#policyquerydownload').after("&nbsp&nbsp<a id = 'xiazai' href = 'download.do?filename=" + data
					.message + "'>点击下载</a>");
			}
		}
	} else {
		if (data.message == null || data.message == "") {
			$.messager.alert('执行失败', '操作失败', 'error');
		} else {
			$.messager.alert('执行失败', data.message, 'error');
		}
	}
}

function displaysumdata(data) {
	if (data == null || data == "") {
		$('#policycount').val("");
		$('#sumreprem').val("");
		$('#paypolicycount').val("");
		$('#sumrepayprem').val("");
		$('#renewrate').val("");
	} else {
		$('#policycount').val(data.policycount);
		$('#sumreprem').val(data.sumreprem);
		$('#paypolicycount').val(data.paypolicycount);
		$('#sumrepayprem').val(data.sumrepayprem);

		if ($('#sumreprem').val() == "" && $('#sumrepayprem').val() == "0.00") {
			$('#sumrepayprem').val("");
		}

		if (($('#sumreprem').val() - 0) == 0 || $('#sumreprem').val() == "" || $('#sumreprem').val() == null) {
			$('#renewrate').val("");
		} else {
			var renewrate = Number($('#sumrepayprem').val()) / Number($('#sumreprem').val()) * 100;
			$('#renewrate').val(renewrate.toFixed(2) + '%');
		}
	}
}
</script>

</head>
<%@ include file="/WEB-INF/jsp/admin/policy/userDlg.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/policy/policyDetailDlg.jsp"%>

<body>
	<div style="margin-left:0%">
		<%@ include file="/WEB-INF/common/query/renew/renewCommonQuery_yue.jsp"%>
		<br>
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="articlequery" onclick="renewPolicyquery()">查询</a>
		<br>
		<br>
		<table id="policyList" class="easyui-datagrid" title="月缴保单信息" style="width:auto;height:auto"
			data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone">
			<thead>
				<tr>
					<%@ include file="/WEB-INF/common/column/renew/renewList_yue.jsp"%>
				</tr>
			</thead>
		</table>
		<br>
		<table class="common">
			<tr>
				<td class="reprot_title_4">
					应收单数合计
				</td>
				<td class="report_common_4">
					<input class="txt" id="policycount" name="policycount" readonly>
				</td>
				<td class="reprot_title_4">
					应收保费合计
				</td>
				<td class="report_common_4">
					<input class="txt" id="sumreprem" name="sumreprem" readonly>
				</td>

				<td class="reprot_title_4">
					实收单数合计
				</td>
				<td class="report_common_4">
					<input class="txt" id="paypolicycount" name="paypolicycount" readonly>
				</td>
				<td class="reprot_title_4">
					实收保费合计
				</td>
				<td class="report_common_4">
					<input class="txt" id="sumrepayprem" name="sumrepayprem" readonly>
				</td>
			<tr hidden>
				<td class="reprot_title_4">
					续保率
				</td>
				<td class="report_common_4">
					<input class="txt" id="renewrate" name="renewrate" readonly>
				</td>
			</tr>
		</table>
	</div>
</body>

</html>