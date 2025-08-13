<%@ page contentType="text/html;charset=utf-8" %>

	<script>

		function policyDetailDlgInit() {
			$('#policyDetailDlg').dialog('close');
		}

		function dispolicyDetailDlg(rowdata, disappphone) {
			$('#policyDetailDlg').dialog('open');

			// 投保人信息
			$('#applyname').val(rowdata.applyname);
			$('#applycerttypeName').val(rowdata.applycerttypeName);
			$('#applycert').val(rowdata.applycert);
			$('#applymobile').val(rowdata.applymobile);
			$('#applyemail').val(rowdata.applyemail);

			// 被保人信息
			$('#insCname').val(rowdata.insCname);
			$('#insCertTypeName').val(rowdata.insCertTypeName);
			$('#insCert').val(rowdata.insCert);
			$('#insMobile').val(rowdata.insMobile);
			$('#insEmail').val(rowdata.insEmail);


			// 核保结论
			$('#addprem').val(rowdata.addprem);
			$('#addpremdesc').val(rowdata.addpremdesc);
			$('#expectdesc').val(rowdata.expectdesc);
			$('#reason').val(rowdata.reason);
			$('#cooperdesc').val(rowdata.cooperdesc);
			$('#uwurl').val(rowdata.uwurl);
			$('#insuranceLink').val(rowdata.insuranceLink);
			$('#payurl').val(rowdata.payurl);
			// $('#').val(rowdata.);
			// $('#').val(rowdata.);
			 



		}

	

	</script>

	<div id="policyDetailDlg" class="easyui-dialog" title="人核详细信息查询"
		style="width:600px;height:600px;padding:10px;top:10px" data-options="iconCls: 'icon-save',">
		<div style="margin-left:2%">

			<table style="width: 100%;">
				<tr>
					<td class="dstitle" style="height:25px">
						投保人信息
					</td>
				</tr>
				<tr>
					<td class="regittitle">
						投保人姓名
					</td>
					<td class="common">
						<input class="txt" readonly name="applyname" id="applyname">
					</td>
				</tr>
				<tr>
					<td class="regittitle">
						投保人证件类型
					</td>
					<td class="common">
						<input class="txt" readonly name="applycerttypeName" id="applycerttypeName">
					</td>
				</tr>
				<tr>
					<td class="regittitle">
						投保人证件号码
					</td>
					<td class="common">
						<input class="txt" readonly name="applycert" id="applycert">
					</td>
				</tr>
				<tr>
					<td class="regittitle">
						投保人手机号码
					</td>
					<td class="common">
						<input class="txt" readonly name="applymobile" id="applymobile">
					</td>
				</tr>
				<tr>
					<td class="regittitle">
						投保人电子邮箱
					</td>
					<td class="common">
						<input class="txt" readonly name="applyemail" id="applyemail">
					</td>
				</tr>

			</table>


			<table style="width: 100%;">

				<tr>
					<td class="dstitle" style="height:25px">
						被保人信息
					</td>
				</tr>
				<tr>
					<td class="regittitle">
						被保人姓名
					</td>
					<td class="common">
						<input class="txt" readonly name="insCname" id="insCname">
					</td>
				</tr>
				<tr>
					<td class="regittitle">
						被保人证件类型
					</td>
					<td class="common">
						<input class="txt" readonly name="insCertTypeName" id="insCertTypeName">
					</td>
				</tr>
				<tr>
					<td class="regittitle">
						被保人证件号码
					</td>
					<td class="common">
						<input class="txt" readonly name="insCert" id="insCert">
					</td>
				</tr>
				<tr>
					<td class="regittitle">
						被保人手机号码
					</td>
					<td class="common">
						<input class="txt" readonly name="insMobile" id="insMobile">
					</td>
				</tr>
				<tr>
					<td class="regittitle">
						被保人电子邮箱
					</td>
					<td class="common">
						<input class="txt" readonly name="insEmail" id="insEmail">
					</td>
				</tr>
			</table>
			<table style="width: 100%;">
				<tr>
					<td class="dstitle" style="height:25px">
						核保结论
					</td>
				</tr>
				<tr>
					<td class="regittitle">
						加费金额
					</td>
					<td class="common">
						<input class="txt" readonly name="addprem" id="addprem">
					</td>
				</tr>

				<tr>
					<td class="regittitle">
						加费描述
					</td>
					<td class="common">
						<input class="txt" readonly name="addpremdesc" id="addpremdesc">
					</td>
				</tr>

				<tr>
					<td class="regittitle">
						除责描述
					</td>
					<td class="common">
						<input class="txt" readonly name="expectdesc" id="expectdesc">
					</td>
				</tr>


				<tr>
					<td class="regittitle">
						拒保原因
					</td>
					<td class="common">
						<input class="txt" readonly name="reason" id="reason">
					</td>
				</tr>

				<tr>
					<td class="regittitle">
						保司描述
					</td>
					<td class="common">
						<input class="txt" readonly name="cooperdesc" id="cooperdesc">
					</td>
				</tr>


				<tr>
					<td class="regittitle">
						人核链接
					</td>
					<td class="common">
						<input class="txt" readonly name="uwurl" id="uwurl">
					</td>
				</tr>

				<tr>
					<td class="regittitle">
						投保链接
					</td>
					<td class="common">
						<input class="txt" readonly name="insuranceLink" id="insuranceLink">
					</td>
				</tr>


				<tr>
					<td class="regittitle">
						支付链接
					</td>
					<td class="common">
						<input class="txt" readonly name="payurl" id="payurl">
					</td>
				</tr>
			</table>
			<br>
		</div>
	</div>