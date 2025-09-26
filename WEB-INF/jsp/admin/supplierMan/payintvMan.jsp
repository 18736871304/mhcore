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
					initDataGrid($('#payintvlist'));

					inputList = [
						$('#payintv'),
						$('#orderid'),
					];

					checkList = [
						$('#payintv'),
						$('#orderid'),
					];

					disComBox($('#payintv'), "payintv", null);
					disComBox($('#qinsorgancode'), "insorgancode", null);
					disComBox($('#qismain'), "ismain", null);
					disComBox($('#qchannel'), "channel", null);
					disComBox($('#qrisktype'), "risktype", null);
					disComBox($('#qisseal'), "isseal", null);
					disComBox($('#qjointype'), "jointype", null);

					$('#qisseal').combobox('setValue', '01');
					$('#qismain').combobox('setValue', 'Y');
					$('#displayORno').css('visibility', 'hidden'); 
				}

				function aftercodeselect(comboxid) {

				}


				function selectone() {
					var row = $('#riskdefinelist').datagrid('getSelected');

					var tturl = "supplier/getPayintvList.do";

					var tParam = new Object();
					tParam.insorgancode = row.insorgancode;
					tParam.riskcode = row.riskcode;

					displayDataGrid($('#payintvlist'), tParam, tturl);


					var getIsDuiJie = new Object();

					getIsDuiJie.insorgancode = row.insorgancode
					getIsDuiJie.riskcode = row.riskcode
					ajaxdeal("supplier/getIsDuiJie.do", getIsDuiJie, getIsDuiJieaa, null);




					clearCarData();
				}


				function getIsDuiJieaa(data) {
					if (data.flag == '0') {
						$('#displayORno').css('visibility', 'hidden'); // 隐藏
					} else {
						$('#displayORno').css('visibility', 'visible');// 显示
					}
				}





				function selectonePayintv() {
					var rowPayintv = $('#payintvlist').datagrid('getSelected');

					$('#payintv').combobox('setValue', rowPayintv.payintvkey);
					$('#orderid').val(rowPayintv.orderid);
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

					clearCarData();
				}

				function saveSuss() {
					clearCarData();
					$('#payintvlist').datagrid('reload');
				}

				function clearCarData() {
					cleardata(inputList);
				}

				function payintvInsert() {
					var row = $('#riskdefinelist').datagrid('getSelected');

					if (row == null) {
						$.messager.alert('操作提示', '请选中险种数据！', 'error');
						return;
					}

					if (!checknotnull(checkList)) {
						return;
					}

					var tparam = new Object();
					tparam.payintvkey = $('#payintv').combobox('getValue');
					tparam.payintvvalue = $('#payintv').combobox('getText');
					tparam.orderid = $('#orderid').val();

					tparam.insorgancode = row.insorgancode;
					tparam.riskcode = row.riskcode;

					ajaxdeal("supplier/payintvInsert.do", tparam, null, null, saveSuss);
				}

				function payintvUpdate() {
					var rowpayintv = $('#payintvlist').datagrid('getSelected');
					if (rowpayintv == null) {
						$.messager.alert('操作提示', '请选中要修改的数据！', 'error');
						return;
					}

					if (!checknotnull(checkList)) {
						return;
					}

					var tparam = new Object();
					tparam.payintvkey = $('#payintv').combobox('getValue');
					tparam.payintvvalue = $('#payintv').combobox('getText');
					tparam.orderid = $('#orderid').val()

					tparam.payintvserialno = rowpayintv.payintvserialno;

					ajaxdeal("supplier/payintvUpdate.do", tparam, null, null, saveSuss);
				}

				function payintvDelete() {
					var rowpayintv = $('#payintvlist').datagrid('getSelected');
					if (rowpayintv == null) {
						$.messager.alert('操作提示', '请选中要删除的数据！', 'error');
						return;
					}

					var tparam = new Object();
					tparam.payintvserialno = rowpayintv.payintvserialno;

					ajaxdeal("supplier/payintvDelete.do", tparam, null, null, saveSuss);
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
				<table id="riskdefinelist" class="easyui-datagrid" title="缴费方式管理" style="width:auto;height:auto"
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
						</tr>
					</thead>
				</table>
				<br>
				<div   id="displayORno" >
					<table id="payintvlist" class="easyui-datagrid" title="缴费方式信息" style="width:auto;height:auto"
						data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectonePayintv">
						<thead>
							<tr>
								<th data-options="field:'payintvvalue',width:120">缴费方式</th>
								<th data-options="field:'orderid',width:120">排序</th>
							</tr>
						</thead>
					</table>
					<br>
					<table class="common">
						<tr>
							<td class="reprot_title_4">
								缴费方式
							</td>
							<td class="report_common_4">
								<select class="easyui-combobox" style="width:160%" panelHeight="auto" name="payintv"
									id="payintv" notnull="缴费频率">
								</select>
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
					<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" id="payintvInsert"
						onclick="payintvInsert()">缴费方式录入</a>
					<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" id="payintvUpdate"
						onclick="payintvUpdate()">缴费方式修改</a>
					<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove'" id="payintvDelete"
						onclick="payintvDelete()">缴费方式删除</a>
				</div>
			</div>
		</body>

	</html>