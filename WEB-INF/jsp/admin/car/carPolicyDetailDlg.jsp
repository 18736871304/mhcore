<%@ page contentType="text/html;charset=utf-8"%>

<script>

function carPolicyDetailDlgInit()
{
	$('#carPolicyDetailDlg').dialog('close');
}

function disCarPolicyDetailDlg(rowdata,disappphone)
{
	$('#carPolicyDetailDlg').dialog('open');
	
	$('#dlgsigndate').val(rowdata.signdate);
	$('#dlgarea').val(rowdata.area);
	$('#dlgpolicyno').val(rowdata.policyno);
	$('#dlginsorganname').val(rowdata.insorganname);
	$('#dlgriskkindname').val(rowdata.riskkindname);
	$('#dlgriskname').val(rowdata.riskname);
	$('#dlgstartdate').val(rowdata.startdate);
	$('#dlgprem').val(rowdata.prem);
	$('#dlgtax').val(rowdata.tax);
	
	$('#dlgappname').val(rowdata.appntname);
	$('#dlgappidtypename').val(rowdata.appntidtypename);
	$('#dlgappidno').val(rowdata.appntidno);
	$('#dlginsurename').val(rowdata.insurename);
	$('#dlginsureidtypename').val(rowdata.insureidtypename);
	$('#dlginsureidno').val(rowdata.insureidno);

	$('#dlgcarownername').val(rowdata.carownername);
	$('#dlgcarowneridtypename').val(rowdata.carowneridtypename);
	$('#dlgcarowneridno').val(rowdata.carowneridno);
	$('#dlgplateno').val(rowdata.plateno);
	$('#dlgframeno').val(rowdata.frameno);
	$('#dlgengineno').val(rowdata.engineno);
	$('#dlgfirstdate').val(rowdata.firstdate);
	$('#dlgusenaturename').val(rowdata.usenaturename);
	$('#dlgbuyprice').val(rowdata.buyprice);
	$('#dlgseatcount').val(rowdata.seatcount);
	$('#dlgbuyprice').val(rowdata.buyprice);
	$('#dlgenergytypename').val(rowdata.energytypename);
	$('#dlgvehiclebrand').val(rowdata.vehiclebrand);
	$('#dlgmadefactory').val(rowdata.madefactory);
	$('#dlgvehiclemodel').val(rowdata.vehiclemodel);
	$('#dlgvehiclestyledesc').val(rowdata.vehiclestyledesc);
	$('#dlgpoweight').val(rowdata.poweight);
	$('#dlgpower').val(rowdata.power);
	
	$('#dlgton').val(rowdata.ton);
}

</script>

<div id="carPolicyDetailDlg" class="easyui-dialog" title="保单详细信息查询" 
		style="width:600px;height:600px;padding:10px;top:10px" 
		data-options="iconCls: 'icon-save',">
	<div style="margin-left:2%">
		<table style="width: 100%;">
			<tr>
				<td class = "dstitle" style="height:25px">
		        	保单信息
		        </td>
			</tr>
			<tr>
	 			<td class = "regittitle">
	 				出单日期
	 			</td>
	 			<td class = "common">
	 				<input class = "txt" readonly name="dlgsigndate" id="dlgsigndate">
	 			</td>
	 		</tr>
	 		
	 		<tr>
	 			<td class = "regittitle">
	 				承保区域
	 			</td>
	 			<td class = "common">
	 				<input class = "txt" readonly name="dlgarea" id="dlgarea">
	 			</td>
	 		</tr>
	 		
			<tr>	
				<td class = "regittitle">
					保单号
				</td>
				<td class = "common">
					<input class = "txt" readonly name="dlgpolicyno" id="dlgpolicyno">
				</td>
			</tr>
			
			<tr>	
				<td class = "regittitle">
					保险公司
				</td>
				<td class = "common">
					<input class = "txt" readonly name="dlginsorganname" id="dlginsorganname">
				</td>
			</tr>
			
			<tr>	
				<td class = "regittitle">
					险种类别
				</td>
				<td class = "common">
					<input class = "txt" readonly name="dlgriskkindname" id="dlgriskkindname">
				</td>
			</tr>
			
			<tr>	
				<td class = "regittitle">
					险种名称
				</td>
				<td class = "common">
					<input class = "txt" readonly name="dlgriskname" id="dlgriskname">
				</td>
			</tr>
			
			<tr>	
				<td class = "regittitle">
					保险起期
				</td>
				<td class = "common">
					<input class = "txt" readonly name="dlgstartdate" id="dlgstartdate">
				</td>
			</tr>
			
			<tr>	
				<td class = "regittitle">
					保费
				</td>
				<td class = "common">
					<input class = "txt" readonly name="dlgprem" id="dlgprem">
				</td>
			</tr>
			
			<tr>	
				<td class = "regittitle">
					车船税
				</td>
				<td class = "common">
					<input class = "txt" readonly name="dlgtax" id="dlgtax">
				</td>
			</tr>
			
			<tr>
				<td class = "dstitle" style="height:25px">
		        	投被保人信息
		        </td>
			</tr>
			<tr>
	 			<td class = "regittitle">
	 				投保人姓名
	 			</td>
	 			<td class = "common">
	 				<input class = "txt" readonly name="dlgappname" id="dlgappname">
	 			</td>
	 		</tr>
			<tr>			
				<td class = "regittitle">
					投保人证件类型
				</td>
				<td class = "common">
					<input class = "txt" readonly name="dlgappidtypename" id="dlgappidtypename">
				</td>
			</tr>
			
			<tr>
	 			<td class = "regittitle">
	 				投保人证件号码
	 			</td>
	 			<td class = "common">
	 				<input class = "txt" readonly name="dlgappidno" id="dlgappidno">
	 			</td>
	 		</tr>
	 		
	 		<tr>
	 			<td class = "regittitle">
	 				被保人姓名
	 			</td>
	 			<td class = "common">
	 				<input class = "txt" readonly name="dlginsurename" id="dlginsurename">
	 			</td>
	 		</tr>
			<tr>			
				<td class = "regittitle">
					被保人证件类型
				</td>
				<td class = "common">
					<input class = "txt" readonly name="dlginsureidtypename" id="dlginsureidtypename">
				</td>
			</tr>
			
			<tr>
	 			<td class = "regittitle">
	 				被保人证件号码
	 			</td>
	 			<td class = "common">
	 				<input class = "txt" readonly name="dlginsureidno" id="dlginsureidno">
	 			</td>
	 		</tr>
			
			<tr>
				<td class = "dstitle" style="height:25px">
		        	车辆信息
		        </td>
			</tr>
			<tr>
	 			<td class = "regittitle">
	 				车主姓名
	 			</td>
	 			<td class = "common">
	 				<input class = "txt" readonly name="dlgcarownername" id="dlgcarownername">
	 			</td>
	 		</tr>
			<tr>			
				<td class = "regittitle">
					车主证件类型
				</td>
				<td class = "common">
					<input class = "txt" readonly name="dlgcarowneridtypename" id="dlgcarowneridtypename">
				</td>
			</tr>
			<tr>
	 			<td class = "regittitle">
	 				车主证件号码
	 			</td>
	 			<td class = "common">
	 				<input class = "txt" readonly name="dlgcarowneridno" id="dlgcarowneridno">
	 			</td>
	 		</tr>
			<tr>
	 			<td class = "regittitle">
	 				车牌号
	 			</td>
	 			<td class = "common">
	 				<input class = "txt" readonly name="dlgplateno" id="dlgplateno">
	 			</td>
	 		</tr>
			<tr>			
				<td class = "regittitle">
					车架号
				</td>
				<td class = "common">
					<input class = "txt" readonly name="dlgframeno" id="dlgframeno">
				</td>
			</tr>
			<tr>			
				<td class = "regittitle">
					发动机号
				</td>
				<td class = "common">
					<input class = "txt" readonly name="dlgengineno" id="dlgengineno">
				</td>
			</tr>
			
			<tr>			
				<td class = "regittitle">
					初登日期
				</td>
				<td class = "common">
					<input class = "txt" readonly name="dlgfirstdate" id="dlgfirstdate">
				</td>
			</tr>
			<tr>			
				<td class = "regittitle">
					车辆使用性质
				</td>
				<td class = "common">
					<input class = "txt" readonly name="dlgusenaturename" id="dlgusenaturename">
				</td>
			</tr>
			
			<tr>			
				<td class = "regittitle">
					新车购置价（元）
				</td>
				<td class = "common">
					<input class = "txt" readonly name="dlgbuyprice" id="dlgbuyprice">
				</td>
			</tr>
			<tr>			
				<td class = "regittitle">
					核定座位
				</td>
				<td class = "common">
					<input class = "txt" readonly name="dlgseatcount" id="dlgseatcount">
				</td>
			</tr>
			
			<tr>			
				<td class = "regittitle">
					核定载重量（吨）
				</td>
				<td class = "common">
					<input class = "txt" readonly name="dlgton" id="dlgton">
				</td>
			</tr>
			<tr>			
				<td class = "regittitle">
					能源种类
				</td>
				<td class = "common">
					<input class = "txt" readonly name="dlgenergytypename" id="dlgenergytypename">
				</td>
			</tr>
			
			<tr>			
				<td class = "regittitle">
					汽车品牌
				</td>
				<td class = "common">
					<input class = "txt" readonly name="dlgvehiclebrand" id="dlgvehiclebrand">
				</td>
			</tr>
			<tr>			
				<td class = "regittitle">
					汽车厂家
				</td>
				<td class = "common">
					<input class = "txt" readonly name="dlgmadefactory" id="dlgmadefactory">
				</td>
			</tr>
			
			<tr>			
				<td class = "regittitle">
					车辆型号
				</td>
				<td class = "common">
					<input class = "txt" readonly name="dlgvehiclemodel" id="dlgvehiclemodel">
				</td>
			</tr>
			<tr>			
				<td class = "regittitle">
					车型描述
				</td>
				<td class = "common">
					<input class = "txt" readonly name="dlgvehiclestyledesc" id="dlgvehiclestyledesc">
				</td>
			</tr>
			
			<tr>			
				<td class = "regittitle">
					整备质量（千克）
				</td>
				<td class = "common">
					<input class = "txt" readonly name="dlgpoweight" id="dlgpoweight">
				</td>
			</tr>
			<tr>			
				<td class = "regittitle">
					功率
				</td>
				<td class = "common">
					<input class = "txt" readonly name="dlgpower" id="dlgpower">
				</td>
			</tr>
		</table>
		<br>
	</div>
</div>