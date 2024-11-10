<%@ page contentType="text/html;charset=utf-8"%>

<script>
	function userDetailDlgInit() {
		$('#userDetailDlg').dialog('close');
	}

	function disuserDetailDlg(rowdata) {
		$('#userDetailDlg').dialog('open');

		dlg_userphoto_url.style.display = "none";
		dlg_idcardfront_url.style.display = "none";
		dlg_idcardback_url.style.display = "none";
		dlg_degree_url.style.display = "none";
		dlg_othercertify_url.style.display = "none";

		$('#dlg_teamname').val(rowdata.teamname);
		$('#dlg_usercode').val(rowdata.usercode);
		$('#dlg_realname').val(rowdata.realname);
		$('#dlg_usergrade').val(rowdata.usergradename);

		$('#dlg_positionname').val(rowdata.positionname);
		$('#dlg_qwuserid').val(rowdata.qwuserid);
		$('#dlg_phoneno').val(rowdata.phoneno);


		$('#dlg_certifno').val(rowdata.certifno);

		$('#dlg_mobile').val(rowdata.mobilenumber);
		$('#dlg_cardno').val(rowdata.cardno);

		$('#dlg_rgtaddress').val(rowdata.rgtaddress);
		$('#dlg_nowaddress').val(rowdata.nowaddress);

		$('#dlg_nationality').val(rowdata.nationalityname);

		$('#dlg_marriagename').val(rowdata.marriagename);
		$('#dlg_polityvisagename').val(rowdata.polityvisagename);
		$('#dlg_degreename').val(rowdata.degreename);
		$('#dlg_graduateschool').val(rowdata.graduateschool);
		$('#dlg_speciality').val(rowdata.speciality);
		$('#dlg_familylinker').val(rowdata.familylinker);

		$('#dlg_familyrelation').val(rowdata.familyrelationname);

		$('#dlg_familylinkphone').val(rowdata.familylinkphone);
		$('#dlg_bankcardno').val(rowdata.bankcardno);

		if (rowdata.photourl != null && rowdata.photourl != "") {
			$('#dlg_userphoto_url').attr('src', rowdata.photourl);
			dlg_userphoto_url.style.display = "";
		}

		if (rowdata.idcardfronturl != null && rowdata.idcardfronturl != "") {
			$('#dlg_idcardfront_url').attr('src', rowdata.idcardfronturl);
			dlg_idcardfront_url.style.display = "";
		}

		if (rowdata.idcardbankurl != null && rowdata.idcardbankurl != "") {
			$('#dlg_idcardback_url').attr('src', rowdata.idcardbankurl);
			dlg_idcardback_url.style.display = "";
		}

		if (rowdata.degreeurl != null && rowdata.degreeurl != "") {
			$('#dlg_degree_url').attr('src', rowdata.degreeurl);
			dlg_degree_url.style.display = "";
		}

		if (rowdata.othercertifyurl != null && rowdata.othercertifyurl != "") {
			$('#dlg_othercertify_url').attr('src', rowdata.othercertifyurl);
			dlg_othercertify_url.style.display = "";
		}
	}
</script>

<div id="userDetailDlg" class="easyui-dialog" title="人员详细信息查询" style="width:700px;height:600px;padding:10px;top:10px"
	data-options="iconCls: 'icon-save',">
	<div style="margin-left:2%">
		<table style="width: 100%;">


			<tr>
				<td class="dstitle" style="height:25px">
					人员信息
				</td>
			</tr>
			<tr>
				<td class="regittitle">
					所属团队
				</td>
				<td class="common">
					<input class="txt" readonly name="dlg_teamname" id="dlg_teamname">
				</td>
			</tr>
			<tr>
				<td class="regittitle">
					人员编码
				</td>
				<td class="common">
					<input class="txt" readonly name="dlg_usercode" id="dlg_usercode">
				</td>
			</tr>

			<tr>
				<td class="regittitle">
					人员姓名
				</td>
				<td class="common">
					<input class="txt" readonly name="dlg_realname" id="dlg_realname">
				</td>
			</tr>
			<tr>
				<td class="regittitle">
					身份证号码
				</td>
				<td class="common">
					<input class="txt" readonly name="dlg_cardno" id="dlg_cardno">
				</td>
			</tr>
			<tr>
				<td class="regittitle">
					户籍地址
				</td>
				<td class="common">
					<input class="txt" readonly name="dlg_rgtaddress" id="dlg_rgtaddress">
				</td>
			</tr>

			<tr>
				<td class="regittitle">
					现住址
				</td>
				<td class="common">
					<input class="txt" readonly name="dlg_nowaddress" id="dlg_nowaddress">
				</td>
			</tr>

			<tr>
				<td class="regittitle">
					民族
				</td>
				<td class="common">
					<input class="txt" readonly name="dlg_nationality" id="dlg_nationality">
				</td>
			</tr>
			<tr>
				<td class="regittitle">
					政治面貌
				</td>
				<td class="common">
					<input class="txt" readonly name="dlg_polityvisagename" id="dlg_polityvisagename">
				</td>
			</tr>
			<tr>
				<td class="regittitle">
					婚姻状况
				</td>
				<td class="common">
					<input class="txt" readonly name="dlg_marriagename" id="dlg_marriagename">
				</td>
			</tr>
			<tr>
				<td class="regittitle">
					学历
				</td>
				<td class="common">
					<input class="txt" readonly name="dlg_degreename" id="dlg_degreename">
				</td>
			</tr>

			<tr>
				<td class="regittitle">
					毕业院校
				</td>
				<td class="common">
					<input class="txt" readonly name="dlg_graduateschool" id="dlg_graduateschool">
				</td>
			</tr>

			<tr>
				<td class="regittitle">
					所学专业
				</td>
				<td class="common">
					<input class="txt" readonly name="dlg_speciality" id="dlg_speciality">
				</td>
			</tr>

			<tr>
				<td class="regittitle">
					家庭联系人
				</td>
				<td class="common">
					<input class="txt" readonly name="dlg_familylinker" id="dlg_familylinker">
				</td>
			</tr>

			<tr>
				<td class="regittitle">
					家庭关系
				</td>
				<td class="common">
					<input class="txt" readonly name="dlg_familyrelation" id="dlg_familyrelation">
				</td>
			</tr>

			<tr>
				<td class="regittitle">
					家庭联系电话
				</td>
				<td class="common">
					<input class="txt" readonly name="dlg_familylinkphone" id="dlg_familylinkphone">
				</td>
			</tr>

			<tr>
				<td class="regittitle">
					私人号码
				</td>
				<td class="common">
					<input class="txt" readonly name="dlg_mobile" id="dlg_mobile">
				</td>
			</tr>

			<tr>
				<td class="regittitle">
					职能级别
				</td>
				<td class="common">
					<input class="txt" readonly name="dlg_usergrade" id="dlg_usergrade">
				</td>
			</tr>

			<tr>
				<td class="regittitle">
					职岗
				</td>
				<td class="common">
					<input class="txt" readonly name="dlg_positionname" id="dlg_positionname">
				</td>
			</tr>

			<tr>
				<td class="regittitle">
					企业微信ID
				</td>
				<td class="common">
					<input class="txt" readonly name="dlg_qwuserid" id="dlg_qwuserid">
				</td>
			</tr>
			<tr>
				<td class="regittitle">
					工作手机
				</td>
				<td class="common">
					<input class="txt" readonly name="dlg_phoneno" id="dlg_phoneno">
				</td>
			</tr>




			<tr>
				<td class="regittitle">
					执业登记号
				</td>
				<td class="common">
					<input class="txt" readonly name="dlg_certifno" id="dlg_certifno">
				</td>
			</tr>













			<tr>
				<td class="regittitle">
					工资卡卡号
				</td>
				<td class="common">
					<input class="txt" readonly name="dlg_bankcardno" id="dlg_bankcardno">
				</td>
			</tr>
		</table>

		<table style="width: 100%;">
			<tr>
				<td class="dstitle" style="height:25px">
					人员照片
				</td>
			</tr>
		</table>
		<img src="" id='dlg_userphoto_url' width="300" height="400" />

		<table style="width: 100%;">
			<tr>
				<td class="dstitle" style="height:25px">
					身份证正面图片
				</td>
			</tr>
		</table>
		<img src="" id='dlg_idcardfront_url' width="475" height="300" />

		<table style="width: 100%;">
			<tr>
				<td class="dstitle" style="height:25px">
					身份证反面图片
				</td>
			</tr>
		</table>
		<img src="" id='dlg_idcardback_url' width="475" height="300" />

		<table style="width: 100%;">
			<tr>
				<td class="dstitle" style="height:25px">
					学历证明图片
				</td>
			</tr>
		</table>
		<img src="" id='dlg_degree_url' width="475" height="300" />

		<table style="width: 100%;">
			<tr>
				<td class="dstitle" style="height:25px">
					其它证明文件
				</td>
			</tr>
		</table>
		<img src="" id='dlg_othercertify_url' width="475" height="300" />
		<br>
	</div>
</div>