<%@ page contentType="text/html;charset=utf-8" %>
	<html>
	<%@ include file="/WEB-INF/common/include.jsp" %>

		<head>
			<title></title>
			<link rel="stylesheet" href="../../../../css/inputbox/line6.css?v=202004">
			<script>

				var inputList;
				var checkList;
				var doubleList;

				window.onload = function () {
					initDataGrid($('#riskdefinelist'));
					initDataGrid($('#amntlistlist'));

				

					disComBox($('#qinsorgancode'), "insorgancode", null);
					disComBox($('#qismain'), "ismain", null);
					disComBox($('#qchannel'), "channel", null);
					disComBox($('#qrisktype'), "risktype", null);
					disComBox($('#qisseal'), "isseal", null);
					disComBox($('#qjointype'), "jointype", null);

					$('#qisseal').combobox('setValue', '01');
					$('#qismain').combobox('setValue', 'Y');

					disComBox($('#amnttype'), "amnttype", null);

					amnttype01.style.display = "none";
					amnttype02.style.display = "none";

					inputList01 = [
						$('#amnttype'),
						$('#minamnt'),
						$('#maxamnt'),
					];

					checkList01 = [
						$('#amnttype'),
						$('#minamnt'),
						$('#maxamnt'),
					];

					inputList02 = [
						$('#amntkey'),
						$('#amntvalue'),
						$('#orderid'),
					];

					checkList02 = [
						$('#amntkey'),
						$('#amntvalue'),
						$('#orderid'),
					];

					$('#displayORno').css('visibility', 'hidden');
				}

				function aftercodeselect(comboxid) {
					if (comboxid.attr("id") == "amnttype") {
						disByAmntType();
					}
				}

				function disByAmntType() {
					if ($('#amnttype').combobox('getValue') == "01") {
						amnttype01.style.display = "";
						amnttype02.style.display = "none";
					}
					else if ($('#amnttype').combobox('getValue') == "02") {
						amnttype01.style.display = "none";
						amnttype02.style.display = "";
					}
					else if ($('#amnttype').combobox('getValue') == "") {
						amnttype01.style.display = "none";
						amnttype02.style.display = "none";
					}
				}

				function selectone(index) {
					var row = $('#riskdefinelist').datagrid('getSelected');

					$('#amnttype').combobox('setValue', row.amnttype);
					disByAmntType();

					if ($('#amnttype').combobox('getValue') == "01") {
						$('#amntlistlist').datagrid('loadData', { total: 0, rows: [] });

						$('#minamnt').val(row.minamnt);
						$('#maxamnt').val(row.maxamnt);
					}
					else if ($('#amnttype').combobox('getValue') == "02") {
						var tturl = "supplier/getAmntlistList.do";

						var tParam = new Object();
						tParam.amntserialno = row.amntserialno

						displayDataGrid($('#amntlistlist'), tParam, tturl);

						$('#minamnt').val(0);
						$('#maxamnt').val(0);
					}
					else {
						$('#amntlistlist').datagrid('loadData', { total: 0, rows: [] });

						$('#minamnt').val(0);
						$('#maxamnt').val(0);
					}

					var getIsDuiJie = new Object();

					getIsDuiJie.insorgancode = row.insorgancode
					getIsDuiJie.riskcode = row.riskcode
					ajaxdeal("supplier/getIsDuiJie.do", getIsDuiJie, getIsDuiJieaa, null);

					clearCarData02();
				}

				function getIsDuiJieaa(data) {
					if (data.flag == '0') {
						$('#displayORno').css('visibility', 'hidden'); // 隐藏
					} else {
						$('#displayORno').css('visibility', 'visible');// 显示
					}
				}

				function selectoneAmnt() {
					var rowamnt = $('#amntlistlist').datagrid('getSelected');

					$('#amntkey').val(rowamnt.amntkey);
					$('#amntvalue').val(rowamnt.amntvalue);
					$('#orderid').val(rowamnt.orderid);
				}

				function saveSuss01() {
					clearCarData01();
					$('#riskdefinelist').datagrid('reload');
				}

				function clearCarData01() {
					cleardata(inputList01);
				}

				function riskdefinequery() {
					var tturl = "supplier/getRiskdefineList.do";

					var tParam = new Object();

					tParam.insorgancode = $('#qinsorgancode').combobox('getValue');
					tParam.riskname = $('#qriskname').val();
					tParam.ismain = $('#qismain').combobox('getValue');

					tParam.channel = $('#qchannel').combobox('getValue');
					tParam.risktype = $('#qrisktype').combobox('getValue');
					tParam.isseal = $('#qisseal').combobox('getValue');
					tParam.jointype = $('#qjointype').combobox('getValue');

					displayDataGrid($('#riskdefinelist'), tParam, tturl);

					clearCarData01();
					clearCarData02();

					amnttype01.style.display = "none";
					amnttype02.style.display = "none";
				}

				function riskamntInsert() {
					var row = $('#riskdefinelist').datagrid('getSelected');
					if (row == null) {
						$.messager.alert('操作提示', '请选中险种数据！', 'error');
						return;
					}

					if (!checknotnull(checkList01)) {
						return;
					}

					var tparam = prepareparam(inputList01);
					tparam.amntserialno = row.amntserialno;
					tparam.insorgancode = row.insorgancode;
					tparam.riskcode = row.riskcode;

					ajaxdeal("supplier/amntInsert.do", tparam, null, null, saveSuss01);
				}

				function saveSuss02(data) {
					clearCarData02();

					if (data.amntserialno != "") {
						var tturl = "supplier/getAmntlistList.do";

						var tParam = new Object();
						tParam.amntserialno = data.amntserialno;

						displayDataGrid($('#amntlistlist'), tParam, tturl);

						var row = $('#riskdefinelist').datagrid('getSelected');

						var rowindex = $('#riskdefinelist').datagrid("getRowIndex", row);
						row.amnttypename = '下拉选择';
						row.amntserialno = data.amntserialno;

						$('#riskdefinelist').datagrid('refreshRow', rowindex);

						$.messager.alert('执行成功', '操作成功', 'info');
					}
					else {
						$.messager.alert('执行失败', '操作失败', 'error');
					}
				}

				function clearCarData02() {
					cleardata(inputList02);
				}

				function amntlistInsert() {
					var row = $('#riskdefinelist').datagrid('getSelected');

					if (row == null) {
						$.messager.alert('操作提示', '请选中险种数据！', 'error');
						return;
					}

					if (!checknotnull(checkList02)) {
						return;
					}

					var tparam = prepareparam(inputList02);

					tparam.amntserialno = row.amntserialno;
					tparam.insorgancode = row.insorgancode;
					tparam.riskcode = row.riskcode;

					ajaxdeal("supplier/amntlistInsert.do", tparam, saveSuss02, null);
				}

				function amntlistUpdate() {
					var row = $('#riskdefinelist').datagrid('getSelected');

					if (row == null) {
						$.messager.alert('操作提示', '请选中险种数据！', 'error');
						return;
					}

					var rowamnt = $('#amntlistlist').datagrid('getSelected');

					if (rowamnt == null) {
						$.messager.alert('操作提示', '请选中保额选项数据！', 'error');
						return;
					}

					if (!checknotnull(checkList02)) {
						return;
					}

					var tparam = prepareparam(inputList02);

					tparam.amntlistserialno = rowamnt.amntlistserialno;
					tparam.amntserialno = row.amntserialno;
					tparam.insorgancode = row.insorgancode;
					tparam.riskcode = row.riskcode;

					ajaxdeal("supplier/amntlistUpdate.do", tparam, saveSuss02, null);
				}

				function amntlistDelete() {
					var row = $('#riskdefinelist').datagrid('getSelected');

					if (row == null) {
						$.messager.alert('操作提示', '请选中险种数据！', 'error');
						return;
					}

					var rowamnt = $('#amntlistlist').datagrid('getSelected');
					if (rowamnt == null) {
						$.messager.alert('操作提示', '请选中要删除的数据！', 'error');
						return;
					}

					var tparam = new Object();
					tparam.amntserialno = row.amntserialno;
					tparam.amntlistserialno = rowamnt.amntlistserialno;

					ajaxdeal("supplier/amntlistDelete.do", tparam, saveSuss02, null);
				}


			</script>

		</head>

		<body>
			<div style="margin-left:0%">
				<table class="common">
					<tr>
						<td class="reprot_title">
							签约渠道
						</td>
						<td class="report_common">
							<select class="easyui-combobox" style="width:160%" panelHeight="auto" name="qchannel"
								id="qchannel">
							</select>
						</td>

						<td class="reprot_title">
							险种类型
						</td>
						<td class="report_common">
							<select class="easyui-combobox" style="width:160%" panelHeight="auto" name="qrisktype"
								id="qrisktype">
							</select>
						</td>

						<td class="reprot_title">
							保险公司
						</td>
						<td class="report_common">
							<select class="easyui-combobox" style="width:160%" name="qinsorgancode" id="qinsorgancode">
							</select>
						</td>

						<td class="reprot_title">
							险种名称
						</td>
						<td class="report_common">
							<input class="txt" name="qriskname" id="qriskname">
						</td>

						<td class="reprot_title" hidden>
							是否主险
						</td>
						<td class="report_common" hidden>
							<select class="easyui-combobox" style="width:160%" panelHeight="auto" name="qismain"
								id="qismain">
							</select>
						</td>

						<td class="reprot_title">
							产品属性
						</td>
						<td class="report_common">
							<select class="easyui-combobox" style="width:160%" panelHeight="auto" name="qjointype"
								id="qjointype">
							</select>
						</td>

						<td class="reprot_title">
							是否在售
						</td>
						<td class="report_common">
							<select class="easyui-combobox" style="width:160%" panelHeight="auto" name="qisseal"
								id="qisseal">
							</select>
						</td>
					</tr>
				</table>
				<br>
				<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="riskdefinequery"
					onclick="riskdefinequery()">查询</a>
				<br>
				<br>
				<table id="riskdefinelist" class="easyui-datagrid" title="保险金额管理" style="width:auto;height:auto"
					data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone">
					<thead>
						<tr>
							<th data-options="field:'groupcode',width:90">保险产品编码</th>
							<th data-options="field:'channelname',width:80">签约渠道</th>
							<th data-options="field:'risktypename',width:80">险种类型</th>
							<th data-options="field:'insorganname',width:90">保险公司</th>
							<th data-options="field:'riskname',width:320">险种名称</th>
							<th data-options="field:'jointypename',width:80">产品属性</th>
							<th data-options="field:'issealname',width:80">是否在售</th>
							<th data-options="field:'amnttypename',width:80">保险金额类型</th>
						</tr>
					</thead>
				</table>
				<br>
				<div id="displayORno">
					<table class="common">
						<tr>
							<td class="reprot_title_4">
								保险金额类型
							</td>
							<td class="report_common_4">
								<select class="easyui-combobox" style="width:160%" panelHeight="auto" name="amnttype"
									id="amnttype" notnull="保险金额类型">
								</select>
							</td>

							<td></td>
							<td></td>
						</tr>
					</table>
					<br>
					<div id="amnttype01">
						<table class="common">
							<tr>
								<td class="reprot_title_4">
									保险金额下限
								</td>
								<td class="report_common_4">
									<input class="txt" name="minamnt" id="minamnt" notnull="保险金额下限">
								</td>
								<td class="reprot_title_4">
									保险金额上限
								</td>
								<td class="report_common_4">
									<input class="txt" name="maxamnt" id="maxamnt" notnull="保险金额上限">
								</td>

								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</table>
						<br>
						<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" id="riskamntInsert"
							onclick="riskamntInsert()">保险金额录入</a>
					</div>

					<div id="amnttype02">
						<table id="amntlistlist" class="easyui-datagrid" title="保险金额信息" style="width:auto;height:auto"
							data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectoneAmnt">
							<thead>
								<tr>
									<th data-options="field:'amntkey',width:120">保险金额</th>
									<th data-options="field:'amntvalue',width:120">显示名称</th>
									<th data-options="field:'orderid',width:120">排序</th>
								</tr>
							</thead>
						</table>
						<br>

						<table class="common">
							<tr>
								<td class="reprot_title_4">
									保险金额
								</td>
								<td class="report_common_4">
									<input class="txt" name="amntkey" id="amntkey" notnull="保险金额">
								</td>
								<td class="reprot_title_4">
									显示名称
								</td>
								<td class="report_common_4">
									<input class="txt" name="amntvalue" id="amntvalue" notnull="显示名称">
								</td>
								<td class="reprot_title_4">
									排序
								</td>
								<td class="report_common_4">
									<input class="txt" name="orderid" id="orderid" notnull="排序">
								</td>

								<td></td>
								<td></td>
							</tr>
							<tr>
						</table>

						<br>
						<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" id="amntlistInsert"
							onclick="amntlistInsert()">保险金额录入</a>
						<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" id="amntlistUpdate"
							onclick="amntlistUpdate()">保险金额修改</a>
						<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove'" id="amntlistDelete"
							onclick="amntlistDelete()">保险金额删除</a>
					</div>

				</div>
			</div>
		</body>

	</html>