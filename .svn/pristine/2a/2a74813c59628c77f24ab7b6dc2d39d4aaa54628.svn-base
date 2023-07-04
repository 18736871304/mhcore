<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%>

<head>
	<title>密码管理</title>
	<link rel="stylesheet" href="../../../css/inputbox/line3.css?v_2022_05_16">
	<script type="text/javascript" src="../../../js/jquery/md5.js"></script>
	<script>
		window.onload = function () {
			initDataGrid20($('#userlist'));

			var tturl = "policy/get02Org.do";
			displayCombox($('#q02org'), null, tturl, "dd_key", "dd_value");
		}

		function aftercodeselect(comboxid) {
			if (comboxid.attr("id") == "q02org") {
				var tParam = new Object();
				tParam.organcode = comboxid.combobox('getValue');

				var tturl1 = "policy/get03Org.do";

				displayCombox($('#q03org'), tParam, tturl1, "dd_key", "dd_value");
			} else if (comboxid.attr("id") == "q03org") {
				var tParam = new Object();
				tParam.organcode = comboxid.combobox('getValue');

				var tturl1 = "policy/get04Org.do";

				displayCombox($('#q04org'), tParam, tturl1, "dd_key", "dd_value");
			}
		}

		function userquery() {
			var tturl = "authority/getUserList20.do";

			var userParam = new Object();
			userParam.userCode = $('#usercode').val();
			userParam.userName = $('#username').val();
			userParam.usertype = '02';

			userParam.q02org = $('#q02org').combobox('getValue');
			userParam.q03org = $('#q03org').combobox('getValue');

			var q04org_codes = $('#q04org').combobox('getValues');
			var q04orgStr = "";
			for (var i = 0; i < q04org_codes.length; i++) {
				if (q04orgStr != "") {
					q04orgStr += "','";
				}
				q04orgStr += q04org_codes[i];
			}
			userParam.q04org = q04orgStr;

			displayDataGrid20($('#userlist'), userParam, tturl);
		}

		function passwordmodify() {
			if ($('#usercode').val() == null || $('#usercode').val() == "") {
				$.messager.alert('执行失败', '请录入用户编码！', 'error');
				return;
			}
			/*
			if($('#ypassword').val()==null||$('#ypassword').val()=="")
			{
				$.messager.alert('执行失败','请录入原用户密码！','error');
				return;
			}
			*/
			if ($('#xpassword').val() == null || $('#xpassword').val() == "") {
				$.messager.alert('执行失败', '请录入新用户密码！', 'error');
				return;
			}

			if ($('#xpsdconfirm').val() == null || $('#xpsdconfirm').val() == "") {
				$.messager.alert('执行失败', '请录入确认密码！', 'error');
				return;
			}

			if ($('#xpsdconfirm').val() != $('#xpassword').val()) {
				$.messager.alert('执行失败', '新密码输入不一致，请重新输入！', 'error');
				$('#ypassword').val("");
				$('#xpsdconfirm').val("");
				$('#xpassword').val("");
				return;
			}

			var tturl = "authority/psdUpdate.do";

			var userParam = new Object();
			userParam.userCode = $('#usercode').val();
			// userParam.passWord =   $('#xpassword').val();
			//userParam.yuanPassWord = $('#ypassword').val();
			userParam.passWord = hex_md5($('#xpassword').val()).toUpperCase()
			ajaxdeal(tturl, userParam, null, null);

			//$('#ypassword').val("");
			$('#xpsdconfirm').val("");
			$('#xpassword').val("");

			$('#userlist').datagrid('loadData', {
				total: 0,
				rows: []
			});
		}
	</script>
</head>

<body>
	<div style="margin-left:0%">

		<table class="common">
			<tr>
				<td class="title">
					用户编码
				</td>
				<td class="common">
					<input class="txt" name="usercode" id="usercode">
				</td>

				<td class="title">
					用户姓名
				</td>
				<td class="common">
					<input class="txt" name="username" id="username">
				</td>

				<!-- <td></td>
			<td></td>
 		</tr>
 		<tr> -->
				<td class="title">
					省公司
				</td>
				<td class="common">
					<select class="easyui-combobox" style="width:160%" panelHeight="auto" name="q02org" id="q02org">
					</select>
				</td>
				<td class="title">
					分公司
				</td>
				<td class="common">
					<select class="easyui-combobox" style="width:160%" panelHeight="auto" name="q03org" id="q03org">
					</select>
				</td>
				<td class="title">
					营业部
				</td>
				<td class="common">
					<select class="easyui-combobox" style="width:160%" panelHeight="auto" name="q04org" id="q04org"
						data-options="multiple:true">
					</select>
				</td>
				<td></td>
				<td></td>
			</tr>
		</table>
		<br>
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="userquery"
			onclick="userquery()">查询</a>
		<br>
		<br>

		<table id="userlist" class="easyui-datagrid" title="用户信息" style="width:auto;height:auto"
			data-options="rownumbers:true,singleSelect:true,pagination:true">
			<thead>
				<tr>
					<th data-options="field:'organ02name',width:70">所属省公司</th>
					<th data-options="field:'organcode03name',width:70">所属分公司</th>
					<th data-options="field:'organCodeName',width:70">所属营业部</th>
					<th data-options="field:'userCode',width:70">用户编码</th>
					<th data-options="field:'userName',width:70">用户姓名</th>
					<!--<th data-options="field:'organCode',width:130">管理机构</th>
				<th data-options="field:'organCodeName',width:180">管理名称</th>-->
					<th data-options="field:'operator',width:70">创建人</th>
					<th data-options="field:'modifyDate',width:130">最后一次操作时间</th>
				</tr>
			</thead>
		</table>
		<br>
		<table class="common" style="width:49%;">
			<tr>
				<td class="title">
					新密码
				</td>
				<td class="common">
					<input class="txt" name="xpassword" id="xpassword" type=password>
				</td>


				<td class="title">
					新密码确认
				</td>
				<td class="common">
					<input class="txt" name="xpsdconfirm" id="xpsdconfirm" type=password>
				</td>
			</tr>
		</table>

		<br>

		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" id="passwordmodify"
			onclick="passwordmodify()">密码修改</a>

	</div>
</body>

</html>