<%@ page contentType="text/html;charset=utf-8" %>
	<html>
	<%@ include file="/WEB-INF/common/include.jsp" %>

		<head>
			<title></title>
			<link rel="stylesheet" href="../../../../css/inputbox/line6.css?v=20230326">
			<script>
				var checkList;

				window.onload = function () {
					initDataGrid20($('#policyList'));

					policyDetailDlgInit();
					dlgUserInit();

					initRenewQuery('00', 'confirm');

					checkList = [
						$('#policyno'),
					]
				}

				function aftercodeselect(comboxid) {
					qRenewAftercodeselect(comboxid);
				}

				function selectone() {

				}

				function saveSussaa(data) {
					console.log(data)
				}


				
				function xbpayConfirm() {
					var row = $('#policyList').datagrid('getSelected');

					if (row == null) {
						$.messager.alert('操作提示', '请选中要操作的数据！', 'error');
						return;
					}

					if (!checknotnull(checkList)) {
						return;
					}

					if (!row.callbacktype == '02') {
						$.messager.alert('操作提示', '该保单已对接，不能手工确认！', 'error');
						return;
					}

					var tparam = new Object();

					tparam.xbserialno = row.xbserialno;
					tparam.policyno = $('#policyno').val().trim();

					ajaxdeal("policy/xbPayConfirm.do", tparam, null, null, saveSuss);
				}

				function saveSuss() {
					$('#policyList').datagrid('reload');
					$('#policyno').val('');
				
				}

				function checkpolicyno() {
					const val = $('#policyno').val();
					if (val != null && val.trim() !== '') {
						var tParam = new Object();
						tParam.contno = val.trim();
						var queryurl = "policy/getOnePolicy.do";
						ajaxdeal(queryurl, tParam, disXbPolicyInfo, null);
					}
				}

		
				function disXbPolicyInfo(data) {
					if (data.policy != null && data.policy.state == '40') {
						$('#xbpaydate').val(data.policy.accepttime);
						$('#xbpayprem').val(data.policy.prem);
					}
					else {
						$.messager.alert('操作提示', '保单号不存在，请确认后重新输入！', 'error');
						return;
					}
				}

			
			</script>

		</head>
		<%@ include file="/WEB-INF/jsp/admin/policy/userDlg.jsp" %>
			<%@ include file="/WEB-INF/jsp/admin/policy/policyDetailDlg.jsp" %>

				<body>
					<div style="margin-left:0%">
						<%@ include file="/WEB-INF/common/query/renew/xbCommonQuery.jsp" %>
							<br>
							<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="articlequery"
								onclick="xbPolicyquery()">查询</a>
							<br>
							<br>
							<table id="policyList" class="easyui-datagrid" title="保单信息" style="width:auto;height:auto"
								data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone">
								<thead>
									<tr>
										<%@ include file="/WEB-INF/common/column/renew/xbList.jsp" %>
									</tr>
								</thead>
							</table>
							<br>
							<table class="common">
								<tr>
									<td class="reprot_title_4">
										新保单号
									</td>
									<td class="report_common_4">
										<input class="txt" id="policyno" name="policyno" onchange="checkpolicyno()"
											notnull="续保保单号">
									</td>

									<td class="reprot_title_4">
										实收日期
									</td>
									<td class="report_common_4">
										<input class="txt" id="xbpaydate" name="xbpaydate" disabled="disabled">
									</td>

									<td class="reprot_title_4">
										实收保费
									</td>
									<td class="report_common_4">
										<input class="txt" id="xbpayprem" name="xbpayprem" disabled="disabled">
									</td>
									<td></td>
									<td></td>
								</tr>
							</table>
							<br>
							<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" id="xbpayConfirm"
								onclick="xbpayConfirm()">实收确认</a>
					</div>
				</body>

	</html>