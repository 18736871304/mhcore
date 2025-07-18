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
	$('#dlginsrevisitstatename').val(rowdata.insrevisitstatename);
	$('#dlginsorganname').val(rowdata.insorganname);
	
	$('#dlgriskname').val(rowdata.riskname);
	$('#dlgamnt').val(rowdata.amnt);
	$('#dlginsuyear').val(rowdata.insuyearvalue);
	
	$('#dlgprem').val(rowdata.prem);
	$('#dlgpayintvname').val(rowdata.payintvvalue);
	$('#dlgpayendyear').val(rowdata.payendyearvalue);
	
	$('#dlgcvalidate').val(rowdata.cvalidate);
	
	$('#dlgappname').val(rowdata.appname);
	$('#dlgappsexname').val(rowdata.appsexname);
	$('#dlgappbirthday').val(rowdata.appbirthday);
	
	$('#dlgappprovincename').val(rowdata.appprovincename);
	$('#dlgappcityname').val(rowdata.appcityname);
	$('#dlgappcountryname').val(rowdata.appcountryname);
	
	$('#dlgappaddress').val(rowdata.appaddress);
	
	$('#dlgactivitychannelname').val(rowdata.activitychannelname);
	
	if(rowdata.disxubao=='Y')
	{
		var tParam = new Object();
	
		tParam.orderid = rowdata.xborderid;
	
		var queryurl = "policy/getOriginXbList.do";
	
		ajaxdeal(queryurl,tParam,disXbContNo,null);
		
		
		//console.log(
		/*
		var xbHtml = "";
		xbHtml = xbHtml + '<tr><td class = "regittitle">首年保单号</td><td class = "common"><input class = "txt" readonly value = "'+rowdata.contno+'"></td></tr>';
		
		$('#xb_contno_html').html("");
		$('#xb_contno_html').html(xbHtml);
		*/
	}
	else
	{
		common_contno_tr.style.display="";
		$('#xb_contno_html').html("");
	}
	
	disInsured(rowdata);
	disSubRiskList(rowdata);
}

function disXbContNo(data)
{
	common_contno_tr.style.display="none";
	console.log(data)
	
	var xbHtml = "";
	
	for(var i=0;i<data.xblist.length;i++)
	{
		if(i==0)
		{
			xbHtml = xbHtml + '<tr><td class = "regittitle">首年保单号</td><td class = "common"><input class = "txt" readonly value = "'+data.xblist[i].orgin_contno+'"></td></tr>';
		}
		
		if(data.xblist[i].contno!=null&&data.xblist[i].contno!="")
		{
			xbHtml = xbHtml + '<tr><td class = "regittitle">第'+getIndexName(data.xblist[i].policyyear)+'年保单号</td><td class = "common"><input class = "txt" readonly value = "'+data.xblist[i].contno+'"></td></tr>';
		}
	}
	
	$('#xb_contno_html').html("");
	$('#xb_contno_html').html(xbHtml);
}

function disSubRiskList(row){
	var tParam = new Object();
	tParam.orderid = row.orderid;
	var queryurl = "policy/getSubRiskInfo.do";
	ajaxdeal(queryurl,tParam,dealSubRiskList,null);
}

function dealSubRiskList(data){
	var subRiskHtml = "";
	console.log(data)
	if(data.subriskInfo!=null&&data.subriskInfo.length>0){
		
		subRiskHtml = subRiskHtml + '<tr><td class = "dstitle" style="height:25px">附加险信息</td></tr>';
		
		for(var i=0;i<data.subriskInfo.length;i++)
		{
			subRiskHtml = subRiskHtml + '<tr><td class = "regittitle">险种名称</td><td class = "common"><input class = "txt" readonly name="dlgriskname" id="dlgriskname" value = "'+getQueryData(data.subriskInfo[i].riskname)+'"></td></tr>';
			subRiskHtml = subRiskHtml + '<tr><td class = "regittitle">保险金额</td><td class = "common"><input class = "txt" readonly name="dlgamnt" id="dlgamnt" value = "'+getQueryData(data.subriskInfo[i].amnt)+'"></td></tr>';
			subRiskHtml = subRiskHtml + '<tr><td class = "regittitle">缴费方式</td><td class = "common"><input class = "txt" readonly name="dlgpayintvname" id="dlgpayintvname" value = "'+getQueryData(data.subriskInfo[i].payintvvalue)+'"></td></tr>';
			subRiskHtml = subRiskHtml + '<tr><td class = "regittitle">缴费年期</td><td class = "common"><input class = "txt" readonly name="dlgpayendyear" id="dlgpayendyear" value = "'+getQueryData(data.subriskInfo[i].payendyearvalue)+'"></td></tr>';
			subRiskHtml = subRiskHtml + '<tr><td class = "regittitle">保障期限</td><td class = "common"><input class = "txt" readonly name="dlginsuyear" id="dlginsuyear" value = "'+getQueryData(data.subriskInfo[i].insuyearvalue)+'"></td></tr>';
			subRiskHtml = subRiskHtml + '<tr><td class = "regittitle">保费</td><td class = "common"><input class = "txt" readonly name="dlgprem" id="dlgprem" value = "'+getQueryData(data.subriskInfo[i].prem)+'"></td></tr>';
		}	
	}
	
	$('#subRiskList').html("");
	$('#subRiskList').html(subRiskHtml);
}

function disInsured(row)
{
	var insuredHtml = "";
	if(row.queryinsured=='Y'){
		var tParam = new Object();
		tParam.orderid = row.orderid;
		var queryurl = "policy/disInsuredList.do";
		ajaxdeal(queryurl,tParam,dealInsuredList,null);
	}else{
		insuredHtml = insuredHtml + '<tr><td class = "dstitle" style="height:25px">被保人信息</td></tr>';
		insuredHtml = insuredHtml + '<tr><td class = "regittitle">投被保人关系</td><td class = "common"><input class = "txt" readonly name="dlgrelaname" id="dlgrelaname" value = "'+row.relaname+'"></td></tr>';
		insuredHtml = insuredHtml + '<tr><td class = "regittitle">被保人姓名</td><td class = "common">	<input class = "txt" readonly name="dlginsname" id="dlginsname" value = "'+row.insname+'"></td></tr>';
		insuredHtml = insuredHtml + '<tr><td class = "regittitle">被保人性别</td><td class = "common"><input class = "txt" readonly name="dlginssexname" id="dlginssexname" value = "'+row.inssexname+'"></td></tr>';
		insuredHtml = insuredHtml + '<tr><td class = "regittitle">被保人生日</td><td class = "common"><input class = "txt" readonly name="dlginsbirthday" id="dlginsbirthday" value = "'+row.insbirthday+'"></td></tr>';
		insuredHtml = insuredHtml + '<tr><td class = "regittitle">被保人所在省</td><td class = "common"><input class = "txt" readonly name="dlginsprovincename" id="dlginsprovincename" value = "'+getQueryData(row.insprovincename)+'"></td></tr>';
		insuredHtml = insuredHtml + '<tr><td class = "regittitle">被保人所在市</td><td class = "common"><input class = "txt" readonly name="dlginscityname" id="dlginscityname" value = "'+getQueryData(row.inscityname)+'"></td></tr>';
		insuredHtml = insuredHtml + '<tr><td class = "regittitle">被保人所在区</td><td class = "common"><input class = "txt" readonly name="dlginscountryname" id="dlginscountryname" value = "'+getQueryData(row.inscountryname)+'"></td></tr>';
		insuredHtml = insuredHtml + '<tr><td class = "regittitle">被保人详细地址</td><td class = "common"><input class = "txt" readonly name="dlginsaddress" id="dlginsaddress" value = "'+getQueryData(row.insaddress)+'"></td></tr>';
	
		$('#insuredList').html("");
		$('#insuredList').html(insuredHtml);
	}
}

function dealInsuredList(data){
	var insuredHtml = "";
	console.log(data)
	for(var i=0;i<data.insuredList.length;i++)
	{
		var index = i+1;
		
		insuredHtml = insuredHtml + '<tr><td class = "dstitle" style="height:25px">被保人信息【'+getQueryData(getIndexName(index))+'】</td></tr>';
		insuredHtml = insuredHtml + '<tr><td class = "regittitle">投被保人关系</td><td class = "common"><input class = "txt" readonly name="dlgrelaname" id="dlgrelaname" value = "'+getQueryData(data.insuredList[i].relaname)+'"></td></tr>';
		insuredHtml = insuredHtml + '<tr><td class = "regittitle">被保人姓名</td><td class = "common">	<input class = "txt" readonly name="dlginsname" id="dlginsname" value = "'+getQueryData(data.insuredList[i].insname)+'"></td></tr>';
		insuredHtml = insuredHtml + '<tr><td class = "regittitle">被保人性别</td><td class = "common"><input class = "txt" readonly name="dlginssexname" id="dlginssexname" value = "'+getQueryData(data.insuredList[i].inssexname)+'"></td></tr>';
		insuredHtml = insuredHtml + '<tr><td class = "regittitle">被保人生日</td><td class = "common"><input class = "txt" readonly name="dlginsbirthday" id="dlginsbirthday" value = "'+getQueryData(data.insuredList[i].insbirthday)+'"></td></tr>';
		insuredHtml = insuredHtml + '<tr><td class = "regittitle">被保人所在省</td><td class = "common"><input class = "txt" readonly name="dlginsprovincename" id="dlginsprovincename" value = "'+getQueryData(data.insuredList[i].insprovincename)+'"></td></tr>';
		insuredHtml = insuredHtml + '<tr><td class = "regittitle">被保人所在市</td><td class = "common"><input class = "txt" readonly name="dlginscityname" id="dlginscityname" value = "'+getQueryData(data.insuredList[i].inscityname)+'"></td></tr>';
		insuredHtml = insuredHtml + '<tr><td class = "regittitle">被保人所在区</td><td class = "common"><input class = "txt" readonly name="dlginscountryname" id="dlginscountryname" value = "'+getQueryData(data.insuredList[i].inscountryname)+'"></td></tr>';
		insuredHtml = insuredHtml + '<tr><td class = "regittitle">被保人详细地址</td><td class = "common"><input class = "txt" readonly name="dlginsaddress" id="dlginsaddress" value = "'+getQueryData(data.insuredList[i].insaddress)+'"></td></tr>';
	}
	
	$('#insuredList').html("");
	$('#insuredList').html(insuredHtml);
}

function getQueryData(intputTxt)
{
	if(intputTxt==null||intputTxt==''){
		return '';	
	}

	return intputTxt;

}

function getIndexName(policyyear)
{
	if(policyyear=='1')
	{
		return '一';
	}
    else if(policyyear=='2')
	{
		return '二';
	}
	else if(policyyear=='3')
	{
		return '三';
	}
	else if(policyyear=='4')
	{
		return '四';
	}
	else if(policyyear=='5')
	{
		return '五';
	}
	else if(policyyear=='6')
	{
		return '六';
	}
	else if(policyyear=='7')
	{
		return '七';
	}
	else if(policyyear=='8')
	{
		return '八';
	}
	else if(policyyear=='9')
	{
		return '九';
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
			<tr id = "common_contno_tr">
	 			<td class = "regittitle">
	 				保单号
	 			</td>
	 			<td class = "common">
	 				<input class = "txt" readonly name="dlgcontno" id="dlgcontno">
	 			</td>
	 		</tr>
	 	</table>
		<table style="width: 100%;" id = "xb_contno_html">
		</table>
		<table style="width: 100%;">
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
					回访状态
				</td>
				<td class = "common">
					<input class = "txt" readonly name="dlginsrevisitstatename" id="dlginsrevisitstatename">
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
	 	</table>
		<table style="width: 100%;" id = "subRiskList">
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
		</table>
		<table style="width: 100%;" id = "insuredList">
		</table>
		<table style="width: 100%;">
			<tr>
				<td class = "dstitle" style="height:25px">
		        	资源信息
		        </td>
			</tr>
			<tr>
	 			<td class = "regittitle">
	 				渠道类型
	 			</td>
	 			<td class = "common">
	 				<input class = "txt" readonly name="dlgactivitychannelname" id="dlgactivitychannelname">
	 			</td>
			</tr>
		</table>
		<br>
	</div>
</div>