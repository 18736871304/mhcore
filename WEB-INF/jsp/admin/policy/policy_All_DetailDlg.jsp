<%@ page contentType="text/html;charset=utf-8"%>

<script>

function policyDetailDlgInit()
{
	$('#policyDetailDlg').dialog('close');
}

function dispolicyDetailDlg(rowdata)
{
	//$('#mianrisklast').after('<tr><td class = "dstitle" style="height:25px">123</td></tr>');
	
	console.log(rowdata.subrisklist);
	
	if(rowdata.subrisklist.length!=0)
	{
		var subHtml = "";
		
		for(var i=0;i<rowdata.subrisklist.length;i++)
		{
			subHtml = subHtml + '<tr><td class = "dstitle" style="height:25px">附加险信息'+(i+1)+'</td></tr>';
			subHtml = subHtml + '<tr><td class = "regittitle">险种名称</td><td class = "common"><input class = "txt" readonly value = "'+rowdata.subrisklist[i].riskname+'"></td></tr>';
			subHtml = subHtml + '<tr><td class = "regittitle">保险金额</td><td class = "common"><input class = "txt" readonly value = "'+rowdata.subrisklist[i].amnt+'"></td></tr>'
			subHtml = subHtml + '<tr><td class = "regittitle">缴费方式</td><td class = "common"><input class = "txt" readonly value = "'+rowdata.subrisklist[i].payintvvalue+'"></td></tr>'
			subHtml = subHtml + '<tr><td class = "regittitle">缴费年期</td><td class = "common"><input class = "txt" readonly value = "'+rowdata.subrisklist[i].payendyearvalue+'"></td></tr>'
			subHtml = subHtml + '<tr><td class = "regittitle">保障期限</td><td class = "common"><input class = "txt" readonly value = "'+rowdata.subrisklist[i].insuyearvalue+'"></td></tr>'
			subHtml = subHtml + '<tr><td class = "regittitle">保费</td><td class = "common"><input class = "txt" readonly value = "'+rowdata.subrisklist[i].prem+'"></td></tr>'
			//subHtml = subHtml + '<tr><td class = "regittitle">保单生效日期</td><td class = "common"><input class = "txt" readonly value = "'+rowdata.subrisklist[i].cvalidate+'"></td></tr>'
			//subHtml = subHtml + '<tr><td class = "regittitle">犹豫期天数</td><td class = "common"><input class = "txt" readonly value = "'+rowdata.subrisklist[i].freelookperiod+'"></td></tr>'
		}
	}
	
	$('#subrisk').html("");
	$('#subrisk').html(subHtml);
	
	$('#mianrisklast').after(subHtml);
	
	$('#policyDetailDlg').dialog('open');
	
	$('#dlgaccepttime').val(rowdata.mainrisk.accepttime);
	$('#dlgreusername').val(rowdata.mainrisk.reusername);
	$('#dlgserviceusername').val(rowdata.mainrisk.serviceusername);
	
	$('#dlgcontno').val(rowdata.mainrisk.contno);
	$('#dlgstatename').val(rowdata.mainrisk.statename);
	$('#dlginsorganname').val(rowdata.mainrisk.insorganname);
	
	$('#dlgriskname').val(rowdata.mainrisk.riskname);
	$('#dlgamnt').val(rowdata.mainrisk.amnt);
	$('#dlginsuyear').val(rowdata.mainrisk.insuyearvalue);
	
	$('#dlgprem').val(rowdata.mainrisk.prem);
	$('#dlgpayintvname').val(rowdata.mainrisk.payintvvalue);
	$('#dlgpayendyear').val(rowdata.mainrisk.payendyearvalue);
	
	$('#dlgcvalidate').val(rowdata.mainrisk.cvalidate);
	$('#dlgfreelookperiod').val(rowdata.mainrisk.freelookperiod);
	$('#dlgaccountdate').val(rowdata.mainrisk.accountdate);
	
	$('#dlgappname').val(rowdata.mainrisk.appname);
	$('#dlgappsexname').val(rowdata.mainrisk.appsexname);
	$('#dlgappbirthday').val(rowdata.mainrisk.appbirthday);
	
	$('#dlgappprovincename').val(rowdata.mainrisk.appprovincename);
	$('#dlgappcityname').val(rowdata.mainrisk.appcityname);
	$('#dlgappcountryname').val(rowdata.mainrisk.appcountryname);
	
	$('#dlgappaddress').val(rowdata.mainrisk.appaddress);
	$('#dlgrelaname').val(rowdata.mainrisk.relaname);
	
	$('#dlginsname').val(rowdata.mainrisk.insname);
	$('#dlginssexname').val(rowdata.mainrisk.inssexname);
	$('#dlginsbirthday').val(rowdata.mainrisk.insbirthday);
	
	$('#dlginsprovincename').val(rowdata.mainrisk.insprovincename);
	$('#dlginscityname').val(rowdata.mainrisk.inscityname);
	$('#dlginscountryname').val(rowdata.mainrisk.inscountryname);
	
	$('#dlginsaddress').val(rowdata.mainrisk.insaddress);
	
	$('#dlgchanneltype').val(rowdata.mainrisk.channelname);
	
	if(rowdata.mainrisk.channeltype=="02")
	{
		$('#dlgbatchno').val(rowdata.mainrisk.channel02name);
		
		channel02.style.display="";
		channel03.style.display="none";
		channel03_01.style.display="none";
		channel05.style.display="none";
	}
	else if(rowdata.mainrisk.channeltype=="03")
	{
		$('#dlghotlinetype').val(rowdata.mainrisk.channel01name);
		$('#dlggenerationtime').val(rowdata.mainrisk.channel02name);
		
		channel02.style.display="none";
		channel03.style.display="";
		channel03_01.style.display="";
		channel05.style.display="none";
	}
	else if(rowdata.mainrisk.channeltype=="05")
	{
		$('#dlgchannelappname').val(rowdata.mainrisk.channel02name);
		
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
				<td class = "dstitle" style="height:25px">
		        	主险信息
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
		</table>
		<table style="width: 100%;" id = "subrisk">
		</table>
		<table style="width: 100%;">
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