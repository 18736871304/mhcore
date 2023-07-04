<%@ page contentType="text/html;charset=utf-8"%>

<script>

function policyDetailDlgInit()
{
	$('#policyDetailDlg').dialog('close');
}

function dispolicyDetailDlg(rowdata,disappphone)
{
	$('#policyDetailDlg').dialog('open');
	
	$('#dlgaccepttime').val(rowdata.accepttime);
	$('#dlgreusername').val(rowdata.reusername);
	$('#dlgserviceusername').val(rowdata.serviceusername);
	
	$('#dlgcontno').val(rowdata.contno);
	$('#dlgstatename').val(rowdata.statename);
	$('#dlginsorganname').val(rowdata.insorganname);
	
	$('#dlgriskname').val(rowdata.riskname);
	$('#dlgamnt').val(rowdata.amnt);
	$('#dlginsuyear').val(rowdata.insuyearvalue);
	
	$('#dlgprem').val(rowdata.prem);
	$('#dlgpayintvname').val(rowdata.payintvvalue);
	$('#dlgpayendyear').val(rowdata.payendyearvalue);
	
	$('#dlgcvalidate').val(rowdata.cvalidate);
	$('#dlgfreelookperiod').val(rowdata.freelookperiod);
	$('#dlgaccountdate').val(rowdata.accountdate);
	
	$('#dlgappname').val(rowdata.appname);
	$('#dlgappsexname').val(rowdata.appsexname);
	$('#dlgappbirthday').val(rowdata.appbirthday);
	
	$('#dlgappprovincename').val(rowdata.appprovincename);
	$('#dlgappcityname').val(rowdata.appcityname);
	$('#dlgappcountryname').val(rowdata.appcountryname);
	
	$('#dlgappaddress').val(rowdata.appaddress);
	$('#dlgrelaname').val(rowdata.relaname);
	
	$('#dlginsname').val(rowdata.insname);
	$('#dlginssexname').val(rowdata.inssexname);
	$('#dlginsbirthday').val(rowdata.insbirthday);
	
	$('#dlginsprovincename').val(rowdata.insprovincename);
	$('#dlginscityname').val(rowdata.inscityname);
	$('#dlginscountryname').val(rowdata.inscountryname);
	
	$('#dlginsaddress').val(rowdata.insaddress);
	
	$('#dlgchanneltype').val(rowdata.channelname);
	
	if(rowdata.channeltype=="02")
	{
		$('#dlgbatchno').val(rowdata.channel02name);
		
		channel02.style.display="";
		channel03.style.display="none";
		channel03_01.style.display="none";
		channel05.style.display="none";
	}
	else if(rowdata.channeltype=="03")
	{
		$('#dlghotlinetype').val(rowdata.channel01name);
		$('#dlggenerationtime').val(rowdata.channel02name);
		
		channel02.style.display="none";
		channel03.style.display="";
		channel03_01.style.display="";
		channel05.style.display="none";
	}
	else if(rowdata.channeltype=="05")
	{
		$('#dlgchannelappname').val(rowdata.channel02name);
		
		channel02.style.display="none";
		channel03.style.display="none";
		channel03_01.style.display="none";
		channel05.style.display="";
	}
	else
	{	
		channel02.style.display="none";
		channel03.style.display="none";
		channel03_01.style.display="none";
		channel05.style.display="none";	
	}
	
	dis_appphone.style.display="none";
	if(disappphone=='01')
	{
		$('#dlgappphone').val(rowdata.appphone);
		dis_appphone.style.display="";
	}
}

</script>

<div id="policyDetailDlg" class="easyui-dialog" title="保单详细信息查询" 
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
	 				<input class = "txt" readonly name="dlgaccepttime" id="dlgaccepttime">
	 			</td>
	 		</tr>
			<tr>	
				<td class = "regittitle">
					出单业务员
				</td>
				<td class = "common">
					<input class = "txt" readonly name="dlgreusername" id="dlgreusername">
				</td>
			</tr>
			<tr>
				<td class = "regittitle">
					服务人员
				</td>
				<td class = "common">
					<input class = "txt" readonly name="dlgserviceusername" id="dlgserviceusername">
				</td>
			</tr>
			<tr>
	 			<td class = "regittitle">
	 				保单号
	 			</td>
	 			<td class = "common">
	 				<input class = "txt" readonly name="dlgcontno" id="dlgcontno">
	 			</td>
	 		</tr>
			<tr>		
				<td class = "regittitle">
					保单状态
				</td>
				<td class = "common">
					<input class = "txt" readonly name="dlgstatename" id="dlgstatename">
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
	 				险种名称
	 			</td>
	 			<td class = "common">
	 				<input class = "txt" readonly name="dlgriskname" id="dlgriskname">
	 			</td>
	 		</tr>
			<tr> 			
				<td class = "regittitle">
					保险金额
				</td>
				<td class = "common">
					<input class = "txt" readonly name="dlgamnt" id="dlgamnt">
				</td>
			</tr>
			
			<tr>			
				<td class = "regittitle">
					缴费方式
				</td>
				<td class = "common">
					<input class = "txt" readonly name="dlgpayintvname" id="dlgpayintvname">
				</td>
			</tr>
			<tr>
				<td class = "regittitle">
					缴费年期
				</td>
				<td class = "common">
					<input class = "txt" readonly name="dlgpayendyear" id="dlgpayendyear">
				</td>
			</tr>
			<tr>
				<td class = "regittitle">
					保障期限
				</td>
				<td class = "common">
					<input class = "txt" readonly name="dlginsuyear" id="dlginsuyear">
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
	 				保单生效日期
	 			</td>
	 			<td class = "common">
	 				<input class = "txt" readonly name="dlgcvalidate" id="dlgcvalidate">
	 			</td> 
	 		</tr>
			<tr>			
				<td class = "regittitle">
					犹豫期天数
				</td>
				<td class = "common">
					<input class = "txt" readonly name="dlgfreelookperiod" id="dlgfreelookperiod">
				</td>
			</tr>
			<tr>
				<td class = "regittitle">
					保单核算日期
				</td>
				<td class = "common">
					<input class = "txt" readonly name="dlgaccountdate" id="dlgaccountdate">
				</td>
			</tr>
			<tr>
				<td class = "dstitle" style="height:25px">
		        	投保人信息
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
	 		<tr id="dis_appphone">
	 			<td class = "regittitle">
	 				投保人电话
	 			</td>
	 			<td class = "common">
	 				<input class = "txt" readonly name="dlgappphone" id="dlgappphone">
	 			</td>
	 		</tr>
			<tr>			
				<td class = "regittitle">
					投保人性别
				</td>
				<td class = "common">
					<input class = "txt" readonly name="dlgappsexname" id="dlgappsexname">
				</td>
			</tr>
			<tr>
				<td class = "regittitle">
					投保人生日
				</td>
				<td class = "common">
					<input class = "txt" readonly name="dlgappbirthday" id="dlgappbirthday">
				</td>
			</tr>
			<tr>
	 			<td class = "regittitle">
	 				投保人所在省
	 			</td>
	 			<td class = "common">
	 				<input class = "txt" readonly name="dlgappprovincename" id="dlgappprovincename">
	 			</td>
	 		</tr>
			<tr>		
				<td class = "regittitle">
					投保人所在市
				</td>
				<td class = "common">
					<input class = "txt" readonly name="dlgappcityname" id="dlgappcityname">
				</td>
			</tr>
			<tr>
				<td class = "regittitle">
					投保人所在区
				</td>
				<td class = "common">
					<input class = "txt" readonly name="dlgappcountryname" id="dlgappcountryname">
				</td>
			</tr>
			<tr>
	 			<td class = "regittitle">
	 				投保人详细地址
	 			</td>
	 			<td class = "common">
	 				<input class = "txt" readonly name="dlgappaddress" id="dlgappaddress">
	 			</td>
			</tr>
			<tr>
				<td class = "dstitle" style="height:25px">
		        	被保人信息
		        </td>
			</tr>
			<tr>
	 			<td class = "regittitle">
	 				投被保人关系
	 			</td>
	 			<td class = "common">
	 				<input class = "txt" readonly name="dlgrelaname" id="dlgrelaname">
	 			</td>
			</tr>
			<tr>
	 			<td class = "regittitle">
	 				被保人姓名
	 			</td>
	 			<td class = "common">
	 				<input class = "txt" readonly name="dlginsname" id="dlginsname">
	 			</td>
	 		</tr>
			<tr>			
				<td class = "regittitle">
					被保人性别
				</td>
				<td class = "common">
					<input class = "txt" readonly name="dlginssexname" id="dlginssexname">
				</td>
			</tr>
			<tr>
				<td class = "regittitle">
					被保人生日
				</td>
				<td class = "common">
					<input class = "txt" readonly name="dlginsbirthday" id="dlginsbirthday">
				</td>
			</tr>
			<tr>
	 			<td class = "regittitle">
	 				被保人所在省
	 			</td>
	 			<td class = "common">
	 				<input class = "txt" readonly name="dlginsprovincename" id="dlginsprovincename">
	 			</td>
	 		</tr>
			<tr>			
				<td class = "regittitle">
					被保人所在市
				</td>
				<td class = "common">
					<input class = "txt" readonly name="dlginscityname" id="dlginscityname">
				</td>
			</tr>
			<tr>
				<td class = "regittitle">
					被保人所在区
				</td>
				<td class = "common">
					<input class = "txt" readonly name="dlginscountryname" id="dlginscountryname">
				</td>
			</tr>
			<tr>
	 			<td class = "regittitle">
	 				被保人详细地址
	 			</td>
	 			<td class = "common">
	 				<input class = "txt" readonly name="dlginsaddress" id="dlginsaddress">
	 			</td>
			</tr>
			<tr>
				<td class = "dstitle" style="height:25px">
		        	资源信息
		        </td>
			</tr>
			<tr>
	 			<td class = "regittitle">
	 				资源来源
	 			</td>
	 			<td class = "common">
	 				<input class = "txt" readonly name="dlgchanneltype" id="dlgchanneltype">
	 			</td>
			</tr>
			<tr id = "channel03">
	 			<td class = "regittitle">
	 				热线渠道
	 			</td>
	 			<td class = "common">
	 				<input class = "txt" readonly name="dlghotlinetype" id="dlghotlinetype">
	 			</td>
			</tr>
			<tr id = "channel03_01">
	 			<td class = "regittitle">
	 				线索产生时间
	 			</td>
	 			<td class = "common">
	 				<input class = "txt" readonly name="dlggenerationtime" id="dlggenerationtime">
	 			</td>
			</tr>
			<tr id = "channel02">
	 			<td class = "regittitle">
	 				批次号
	 			</td>
	 			<td class = "common">
	 				<input class = "txt" readonly name="dlgbatchno" id="dlgbatchno">
	 			</td>
			</tr>
			<tr id = "channel05">
	 			<td class = "regittitle">
	 				投保人
	 			</td>
	 			<td class = "common">
	 				<input class = "txt" readonly name="dlgchannelappname" id="dlgchannelappname">
	 			</td>
			</tr>
		</table>
		<br>
	</div>
</div>