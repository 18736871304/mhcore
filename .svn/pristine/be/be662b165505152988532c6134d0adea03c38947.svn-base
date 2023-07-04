<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%>

<head>
	<title>密码修改</title>
	<link rel="stylesheet" href="../../../../css/inputbox/line3.css?v_2022_05_16">
	<script src="../../../js/jquery/md5.js"></script>
	<script>
		window.onload = function () {
			remark.style.display = "none";
		}

		function passwordmodify() {
			
			if ($('#ypassword').val() == null || $('#ypassword').val() == "") {
				$.messager.alert('执行失败', '请录入原密码！', 'error');
				return;
			}
			
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
			userParam.userCode = $('#iamsopr').val();
			userParam.passWord = $('#xpassword').val();
			userParam.yuanPassWord = $('#ypassword').val();
			var regex = new RegExp(/^(?![A-Z]+$)(?![a-z]+$)(?!\d+$)(?![\W_]+$)\S{8,16}$/)
			if (!regex.test(userParam.passWord)) {
				$.messager.alert('密码错误', '密码至少为8位，且必须包含至少一个字母和一个数字', function (r) {
					if (r) {
						// exit action;
					}
				});
				return
			}
			userParam.yuanPassWord = hex_md5(userParam.yuanPassWord).toUpperCase()
			userParam.passWord = hex_md5(userParam.passWord).toUpperCase()
			ajaxdeal(tturl, userParam, null, null);

			$('#ypassword').val("");
			$('#xpsdconfirm').val("");
			$('#xpassword').val("");
		}
	</script>
	<style>
		td.common {
			width: 30%;
		}
	</style>

</head>

<body>

	<table>
		<tr>
			<td class="dstitle">
				<img src="images/butCollapse.gif" onclick="showPage(this,remark);">
				操作帮助
			</td>
		</tr>
	</table>
	<div id="remark" style="display:'none'">
		<table style="display:'none'">
			<tr>
				<td class="dscontent">
					1、本菜单用于用户修改自己的密码，【新密码】、【新密码确认】都为必录项
					<br>
					2、如果菜单中，只能看到本菜单，说明该用户没有被分配菜单，请联系系统管理员
					<br>
					3、密码至少为8位，且必须包含至少一个字母和一个数字
				</td>
			</tr>
		</table>
	</div>

	<table style="width: 73.5%;">
		<tr>
			<td class="title">
				原密码
			</td>
			<td class="common">
				<input class="txt" name="ypassword" id="ypassword" type=password autocomplete="off">
			</td>

			<td class="title">
				新密码
			</td>
			<td class="common">
				<input class="txt" name="xpassword" id="xpassword" type=password autocomplete="off">
			</td>
	
			<td class="title" style="width: 8%;">
				新密码确认
			</td>
			<td class="common">
				<input class="txt" name="xpsdconfirm" id="xpsdconfirm" type=password autocomplete="off">
			</td>
		</tr>
	</table>

	<br>
	<p style="font-size: 13px; color: rgb(255,0,0);">密码至少为8位，且必须包含至少一个字母和一个数字</p>
	<br>
	<button id="passwordmodify" class="smsbutton" onclick="passwordmodify()">修改密码</button>

</body>

</html>