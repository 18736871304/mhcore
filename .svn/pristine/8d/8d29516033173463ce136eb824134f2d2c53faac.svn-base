<%@ page contentType="text/html;charset=utf-8" %>


	<style>
		.divText {
			border: #878787 1px solid;
			min-height: 23px;
			width: 85%;
			font-size: 14px;
		}
	</style>


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
			 

			$('#addprem').val(rowdata.addprem == 0 ? '' : rowdata.addprem);

			$('#addpremdesc').text("");
			$('#addpremdesc').html(rowdata.addpremdesc);
			$('#expectdesc').text("");
			$('#expectdesc').html(rowdata.expectdesc);
			$('#reason').text("");
			$('#reason').html(rowdata.reason);
			$('#cooperdesc').text("");
			$('#cooperdesc').html(rowdata.cooperdesc);

			$('#remark').text("")
			$('#remark').html(rowdata.remark);
			opencoconclusionDlg(rowdata.coconclusion)
		}
		function opencoconclusionDlg(val) {
			if (val != null) {
				try {
					const obj = JSON.parse(val);
				 
					// 解析成功且是对象或数组
					if (obj.desc) {
						$("#coconclusion").html(obj.desc);
					} else if (obj.reason) {
						$("#coconclusion").html(obj.reason);
					} else if (obj.noticeList) {
						const questionDescs = [];
						obj.noticeList.forEach(notice => {
							notice.qas.forEach(qa => {
								if (qa.questionList && qa.questionList.length > 0) {
									qa.questionList.forEach(question => {
										if (question.questionDesc) {
											questionDescs.push(question.questionDesc);
										}
									});
								}
							});
						});
						$("#coconclusion").html(questionDescs.join(','));
					} else {
						$("#coconclusion").text('');
					}
				} catch (e) {
					$("#coconclusion").html(val);
				}
			} else {
				$("#coconclusion").text('');
			}
		}







	</script>

	<div id="policyDetailDlg" class="easyui-dialog" title="人核详细信息查询"
		style="width:600px;height:640px;padding:10px;top:10px" data-options="iconCls: 'icon-save',">
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
						核保结论
					</td>
					<td class="common">
						<div id="coconclusion" class="divText"></div>


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
						<!-- <input class="txt" readonly name="addpremdesc" id="addpremdesc"> -->
						<div id="addpremdesc" class="divText"></div>
					</td>
				</tr>

				<tr>
					<td class="regittitle">
						除责描述
					</td>
					<td class="common">
						<!-- <input class="txt" readonly name="expectdesc" id="expectdesc"> -->
						<div id="expectdesc" class="divText"></div>
					</td>
				</tr>


				<tr>
					<td class="regittitle">
						拒保原因
					</td>
					<td class="common">
						<!-- <input class="txt" readonly name="reason" id="reason"> -->
						<div id="reason" class="divText"></div>
					</td>
				</tr>

				<tr>
					<td class="regittitle">
						保司描述
					</td>
					<td class="common">
						<!-- <input class="txt" readonly name="cooperdesc" id="cooperdesc"> -->
						<div id="cooperdesc" class="divText"></div>

					</td>
				</tr>




				<tr>
					<td class="regittitle">
						备注信息
					</td>
					<td class="common">
						<div id="remark" class="divText"></div>
					</td>
				</tr>





			</table>
			<br>
		</div>
	</div>