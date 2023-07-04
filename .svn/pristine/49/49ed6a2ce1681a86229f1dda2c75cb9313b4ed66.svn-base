<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%>

<head>
	<title></title>
	<link rel="stylesheet" href="../../../../css/inputbox/line6.css">
	<script>
		window.onload = function () {
			policyDetailDlgInit();

			initDataGrid20($('#policyList'));

			disComBox($('#qinsorgancode'), "insorgancode", null);
			disComBox($('#qstate'), "policyquery", null);
			disComBox($('#qappprovince'), "province", null);
			disComBox($('#qfincestate'), "fincestate", null);
			disComBox($('#qinsrevisitstate'), "insrevisitstate", null);
			disComBox($('#qactivitychannel'), "source", null);

			$('#menudisplaydlg').dialog('close');

			$('#qstate').combobox('setValue', '40');

			/*
			disComBox($('#qstate'),"articlestate",null);
			
			$('#qstate').combobox('setValue','01');
			*/

			init02Org();
			dlgUserInit();
			policyUrlDlgInit();

			$('#qacceptStartDate').datebox('setValue', getMonthOneFormatDate());
		}

		function aftercodeselect(comboxid) {
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
			} else if (comboxid.attr("id") == "qappprovince") {
				var tParam = new Object();
				tParam.province = comboxid.combobox('getValue');

				var tturl1 = "policy/getCity.do";

				displayCombox($('#qappcity'), tParam, tturl1, "dd_key", "dd_value");
			} else if (comboxid.attr("id") == "qappcity") {
				var tParam = new Object();
				tParam.city = comboxid.combobox('getValue');

				var tturl1 = "policy/getCountry.do";

				displayCombox($('#qappcountry'), tParam, tturl1, "dd_key", "dd_value");
			} else {
				organAfterSelect(comboxid);
			}
		}

		function selectone() {

		}

		function getQueryParam() {
			var tParam = new Object();

			tParam.contno = $('#qcontno').val();
			tParam.cusname = $('#qcusname').val();
			tParam.cusmobile = $('#qcusmobile').val();

			tParam.reusername = $('#qusername').val();
			tParam.serusername = $('#qserusername').val();

			var codes = $('#qinsorgancode').combobox('getValues');
			var ic = "";
			for (var i = 0; i < codes.length; i++) {
				if (ic != "") ic += "\',\'";
				ic += codes[i];
			}
			tParam.insorgancode = ic;
			tParam.state = $('#qstate').combobox('getValue');
			tParam.agentflag = '02';

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

			tParam.fincestate = $('#qfincestate').combobox('getValue');
			tParam.insrevisitstate = $('#qinsrevisitstate').combobox('getValue');

			tParam.acceptStartDate = $('#qacceptStartDate').datebox("getValue");
			tParam.acceptEndDate = $('#qacceptEndDate').datebox("getValue");

			tParam.calstartdate = $('#qcStartDate').datebox("getValue");
			tParam.calenddate = $('#qcEndDate').datebox("getValue");

			tParam.appprovince = $('#qappprovince').combobox('getValue');
			tParam.appcity = $('#qappcity').combobox('getValue');
			tParam.appcountry = $('#qappcountry').combobox('getValue');

			tParam.organcode = $('#departmentId').val();

			var channel = $('#qactivitychannel').combobox('getValue');
			if (channel.length == 4) {
				tParam.channel = channel;
			} else if (channel.length > 4) {
				tParam.channeldetail = channel;
			}
			
			tParam.isxubao = $('#isxubao').combobox('getValue');

			tParam.riskchannel = '13';
			
			return tParam;
		}

		function policyquery() {
			var tturl = "policy/getPolicyList.do";

			var tParam = getQueryParam();

			displayDataGrid20($('#policyList'), tParam, tturl);

			var sumurl = "policy/getPolicySum.do";

			ajaxdeal(sumurl, tParam, displaysumdata, null);

			clearCarData();
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

		function openDlg(index) {
			var rows = $('#policyList').datagrid('getRows'); //获取所有当前加载的数据行
			var row = rows[index];

			//alert(row.agentcom);

			dispolicyDetailDlg(row);
		}
	</script>

</head>
<%@ include file="/WEB-INF/jsp/admin/policy/userDlg.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/policy/policyDetailDlg.jsp"%>
<%@ include file="/WEB-INF/jsp/dilog/policyUrlDlg.jsp"%>
<body>
	<div style="margin-left:0%">
		<input type="text" hidden="hidden" id="departmentId">
		<div id="menudisplaydlg" class="easyui-dialog" title="机构查询" style="width:300px;height:500px;padding:10px"
			data-options="iconCls: 'icon-save'">
			<div style="margin-left:15%">
				<ul id="userauthtree" class="easyui-tree" data-options="animate:true,checkbox:true"></ul>
			</div>
			<a href="#" class="easyui-linkbutton" onclick="getChecked()">确认</a>
		</div>
		<table class="common">
			<tr>
				<td class="reprot_title">
					出单起期
				</td>
				<td class="report_common">
					<input class="easyui-datebox" style="width: 90%" id="qacceptStartDate" name="qacceptStartDate"
						notnull="出单起期">
				</td>

				<td class="reprot_title">
					出单止期
				</td>
				<td class="report_common">
					<input class="easyui-datebox" style="width: 90%" id="qacceptEndDate" name="qacceptEndDate"
						notnull="出单止期">
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
					<select class="easyui-combobox" style="width:90%" panelHeight="auto" name="qstate" id="qstate">
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
					渠道类型
				</td>
				<td class="report_common">
					<select class="easyui-combobox" style="width:90%" panelHeight="auto" name="qactivitychannel"
						id="qactivitychannel">
					</select>
				</td>
			</tr>
			<tr>
				<td class="reprot_title">
					业务员姓名
				</td>
				<td class="report_common">
					<input class="txt" name="qusername" id="qusername">
				</td>

				<td class="reprot_title">
					服务人员
				</td>
				<td class="report_common">
					<input class="txt" name="qserusername" id="qserusername">
				</td>

				<td class="reprot_title">
					保险公司
				</td>
				<td class="report_common">
					<input class="easyui-combobox" id="qinsorgancode" style="width:90%" name="qinsorgancode"
						data-options="valueField:'id',textField:'text',multiple:true,panelHeight:'auto'">
				</td>

				<td class="reprot_title">
					险种名称
				</td>
				<td class="report_common">
					<input class="easyui-combobox" id="qriskcode" style="width:90%" name="qriskcode"
						data-options="valueField:'id',textField:'text',multiple:true,panelHeight:'auto'">
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
			</tr>

			<%@ include file="/WEB-INF/jsp/admin/team/organAndTeamQuery5.jsp"%>
		</table>
		<table class="common">
			<tr hidden>
				<td class="title">
					结算状态
				</td>
				<td class="common">
					<select class="easyui-combobox" style="width:160%" panelHeight="auto" panelWidth="200"
						name="qfincestate" id="qfincestate">
					</select>
				</td>
			</tr>

			<tr hidden="hidden">
				<td class="title">
					出单机构
				</td>
				<td class="common" colspan="2">
					<input class="txt" name="departmentName" id="departmentName" readonly><a href="#"
						class="easyui-linkbutton" data-options="iconCls:'icon-tip'" id="userMenuDis"
						onclick="userMenuDis()"></a>
				</td>
			</tr>

			<tr hidden="hidden">
				<td class="title">
					投保人所在省
				</td>
				<td class="common">
					<select class="easyui-combobox" style="width:160%" name="qappprovince" id="qappprovince">
					</select>
				</td>
				<td class="title">
					投保人所在市
				</td>
				<td class="common">
					<select class="easyui-combobox" style="width:160%" name="qappcity" id="qappcity">
					</select>
				</td>
				<td class="title">
					投保人所在县
				</td>
				<td class="common">
					<select class="easyui-combobox" style="width:160%" name="qappcountry" id="qappcountry">
					</select>
				</td>
			</tr>

			<tr hidden="hidden">
				<td class="title">
					核算起期
				</td>
				<td class="common">
					<input class="easyui-datebox" style="width: 160%" id="qcStartDate" name="qcStartDate"
						notnull="生效起期">
				</td>
				<td class="title">
					核算止期
				</td>
				<td class="common">
					<input class="easyui-datebox" style="width: 160%" id="qcEndDate" name="qcEndDate" notnull="生效止期">
					(算头不算尾)
				</td>
			</tr>

		</table>
		<br>
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="articlequery"
			onclick="policyquery()">查询</a>
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="policyquerydownload"
			onclick="policyquerydownload()">下载</a>
		<br>
		<br>
		<table id="policyList" class="easyui-datagrid" title="保单信息" style="width:auto;height:auto"
			data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone">
			<thead>
				<tr>
					<%@ include file="/WEB-INF/jsp/admin/policy/include/policyListItem.jsp"%>
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
			</tr>
			<tr>
				<td class="title">
					折算系数后标保合计
				</td>
				<td class="common">
					<input class="txt" id="coefficientsumfyp20" name="coefficientsumfyp20" readonly>
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