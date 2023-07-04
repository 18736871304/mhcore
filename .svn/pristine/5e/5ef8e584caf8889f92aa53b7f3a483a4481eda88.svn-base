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

	initRenewQuery('01','query');
}

function aftercodeselect(comboxid) {
	qRenewAftercodeselect(comboxid);
}

function selectone() {

}

function displaysumdata(data) {
	if (data == null || data == "") {
		$('#policycount').val("");
		$('#sumreprem').val("");
		$('#paypolicycount').val("");
		$('#sumxbpayprem').val("");
	} else {
		$('#policycount').val(data.policycount);
		$('#sumreprem').val(data.sumreprem);
		$('#paypolicycount').val(data.paypolicycount);
		$('#sumxbpayprem').val(data.sumxbpayprem);

		if ($('#sumreprem').val() == "" && $('#sumxbpayprem').val() == "0.00") {
			$('#sumxbpayprem').val("");
		}
	}
}
</script>

</head>
<%@ include file="/WEB-INF/jsp/admin/policy/userDlg.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/policy/policyDetailDlg.jsp"%>

<body>
	<div style="margin-left:0%">
		<%@ include file="/WEB-INF/common/query/renew/xbCommonQuery.jsp"%>
		<br>
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="articlequery" onclick="xbPolicyquery()">查询</a>
		<br>
		<br>
		<table id="policyList" class="easyui-datagrid" title="保单信息" style="width:auto;height:auto"
			data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone">
			<thead>
				<tr>
					<%@ include file="/WEB-INF/common/column/renew/xbList.jsp"%>
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
					<input class="txt" id="sumxbpayprem" name="sumxbpayprem" readonly>
				</td>
		</table>
	</div>
</body>

</html>