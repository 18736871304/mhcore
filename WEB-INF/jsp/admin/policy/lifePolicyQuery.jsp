<%@ page contentType="text/html;charset=utf-8" %>
	<html>
	<%@ include file="/WEB-INF/common/include.jsp" %>

		<head>
			<title></title>
			<link rel="stylesheet" href="../../../../css/inputbox/line3.css?v_2022_05_16">
			<script>
				window.onload = function () {
					policyDetailDlgInit();

					initDataGrid20($('#policyList'));

					initPolicyQuery('');

					$('#menudisplaydlg').dialog('close');

					init02Org();
					dlgUserInit();
					policyUrlDlgInit();
				}

				function aftercodeselect(comboxid) {
					qPolicyAftercodeselect(comboxid);
				}

				function selectone() {

				}

				function policyquerydownload() {
					var tturl = "policy/policyListDownLoad.do";

					var tParam = getQueryParam();

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
						$('#sumprem').val("");
						$('#policycount').val("");
						$('#sumfyp').val("");
						$('#sumfyp20').val("");
						$('#coefficientsumfyp20').val("");
					} else {
						$('#sumprem').val(data.sumprem);
						$('#policycount').val(data.policycount);
						$('#sumfyp').val(data.sumfyp);
						$('#sumfyp20').val(data.sumfyp20);
						$('#coefficientsumfyp20').val(data.coefficientsumfyp20);
					}
				}

				function getChecked() {
					var nodes = $('#userauthtree').tree('getChecked');
					var s = '';
					var s2 = '';
					for (var i = 0; i < nodes.length; i++) {
						if (s != '') s += '\',\'';
						if (s2 != '') s2 += ',';
						s += nodes[i].id;
						s2 += nodes[i].text;
					}
					$('#departmentId').val(s);
					$('#departmentName').val(s2);

					$('#menudisplaydlg').dialog('close');
				}

				function userMenuDis() {
					$("#userauthtree").tree({
						url: 'combox/departmentList.do'
					});
					$('#menudisplaydlg').dialog('open');
				}

				function queryPolicyInfo(val, row, index) {
					return '<a href="#" onclick="openDlg(' + index + ')">查看详情</a>';
				}

				var myData = ''
				function openDlg(index) {
					var rows = $('#policyList').datagrid('getRows'); //获取所有当前加载的数据行
					var row = rows[index];
					myData = row
				 	if (row.isxubao != null && row.isxubao != '' && row.isxubao == '05') {
						var tturl = "policy/getRe_Xb_Policy.do";
						var tParam = new Object();
						tParam.orderid = row.orderid;
						ajaxdeal(tturl, tParam, openPolicyDlg, null);

					} else {
						row.queryinsured = 'Y';
						dispolicyDetailDlg(row);
					}
				}



				function openPolicyDlg(data) {
					console.log(data)
					if (data.code == '1') {
						myData.queryinsured = 'Y';
						dispolicyDetailDlg(myData);
					}else{
						console.log(data.xbpolicyinfo.disxubao)
						myData.queryinsured = 'Y';
						myData.disxubao=data.xbpolicyinfo.disxubao
						myData.xborderid=data.xbpolicyinfo.xborderid
						dispolicyDetailDlg(myData);
					}
				}


			</script>

		</head>
		<%@ include file="/WEB-INF/jsp/admin/policy/userDlg.jsp" %>
			<%@ include file="/WEB-INF/jsp/admin/policy/policyDetailDlg.jsp" %>
				<%@ include file="/WEB-INF/jsp/dilog/policyUrlDlg.jsp" %>

					<body>
						<div style="margin-left:0%">
							<input type="text" hidden="hidden" id="departmentId">
							<div id="menudisplaydlg" class="easyui-dialog" title="机构查询"
								style="width:300px;height:500px;padding:10px" data-options="iconCls: 'icon-save'">
								<div style="margin-left:15%">
									<ul id="userauthtree" class="easyui-tree" data-options="animate:true,checkbox:true">
									</ul>
								</div>
								<a href="#" class="easyui-linkbutton" onclick="getChecked()">确认</a>
							</div>
							<%@ include file="/WEB-INF/common/query/policy/policyCommonQuery_New.jsp" %>
								<br>
								<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'"
									id="articlequery" onclick="policyquery()">查询</a>
								<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'"
									id="policyquerydownload" onclick="policyquerydownload()">下载</a>
								<br>
								<br>
								<table id="policyList" class="easyui-datagrid" title="保单信息"
									style="width:auto;height:auto"
									data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone">
									<thead>
										<tr>
											<%@ include file="/WEB-INF/jsp/admin/policy/include/policyListItem.jsp" %>
										</tr>
									</thead>
								</table>
								<br>
								<table class="common">
									<tr>
										<td class="title">
											单数合计
										</td>
										<td class="common">
											<input class="txt" id="policycount" name="policycount" readonly>
										</td>
										<td class="title">
											保费合计
										</td>
										<td class="common">
											<input class="txt" id="sumprem" name="sumprem" readonly>
										</td>
										<td class="title">
											标保合计
										</td>
										<td class="common">
											<input class="txt" id="sumfyp20" name="sumfyp20" readonly>
										</td>
										<!-- </tr>
			<tr> -->
										<td class="title" style="width:7%">
											折算系数后标保合计
										</td>
										<td class="common">
											<input class="txt" id="coefficientsumfyp20" name="coefficientsumfyp20"
												readonly>
										</td>
									</tr>
									<tr hidden="hidden">
										<td class="title">
											10年FYP合计
										</td>
										<td class="common">
											<input class="txt" id="sumfyp" name="sumfyp" readonly>
										</td>
									</tr>
								</table>
						</div>
					</body>

	</html>