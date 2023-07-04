<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%><head>
<title></title>
<script>

window.onload = function()
{
	policyDetailDlgInit();
	
	initDataGrid($('#policyList'));
	
	disComBox($('#qinsorgancode'),"insorgancode",null);
	disComBox($('#qstate'),"policyquery",null);
	disComBox($('#qappprovince'),"province",null);
	disComBox($('#qfincestate'),"fincestate",null);

    $('#menudisplaydlg').dialog('close');
	
	$('#qstate').combobox('setValue','40');
	
	/*
	disComBox($('#qstate'),"articlestate",null);
	
	$('#qstate').combobox('setValue','01');
	*/
	
	var tturl = "policy/get02Org.do";
	displayCombox($('#q02org'),null,tturl,"dd_key","dd_value");
	
	dlgUserInit();
	
	//$('#qacceptStartDate').datebox('setValue',getMonthOneFormatDate());
}

function aftercodeselect(comboxid)
{
	if(comboxid.attr("id")=="q02org")
	{	
		var tParam = new Object();
		tParam.organcode = comboxid.combobox('getValue');
		
		var tturl1 = "policy/get03Org.do";
		
		displayCombox($('#q03org'),tParam,tturl1,"dd_key","dd_value");
	}
	else if(comboxid.attr("id")=="q03org")
	{
		var tParam = new Object();
		tParam.organcode = comboxid.combobox('getValue');
		
		var tturl1 = "policy/get04Org.do";
		
		displayCombox($('#q04org'),tParam,tturl1,"dd_key","dd_value");
	}
	else if(comboxid.attr("id")=="qinsorgancode")
	{
		var tParam = new Object();
		var codes = comboxid.combobox('getValues');
        var ic = "";
        for(var i=0;i<codes.length;i++){
            if (ic != "") ic += "\',\'";
			ic += codes[i];
		}
        tParam.insorgancode = ic;
		var tturl1 = "policy/getRiskListin.do";
		
		displayCombox($('#qriskcode'),tParam,tturl1,"dd_key","dd_value");
	}
	else if(comboxid.attr("id")=="qappprovince")
	{
		var tParam = new Object();
		tParam.province = comboxid.combobox('getValue');
		
		var tturl1 = "policy/getCity.do";
		
		displayCombox($('#qappcity'),tParam,tturl1,"dd_key","dd_value");
	}
	else if(comboxid.attr("id")=="qappcity")
	{
		var tParam = new Object();
		tParam.city = comboxid.combobox('getValue');
		
		var tturl1 = "policy/getCountry.do";
		
		displayCombox($('#qappcountry'),tParam,tturl1,"dd_key","dd_value");
	}
}

function selectone()
{

}

function policyquery()
{
	var tturl = "policy/getFamilyPolicy.do";

	var tParam = new Object();

	tParam.contno = $('#qcontno').val();
	tParam.appname = $('#qappname').val();
	tParam.insname = $('#qinsname').val();
	
	tParam.reuserid = $('#qresuerkey').val();
	
	tParam.seruserid = $('#qseruserkey').val();
	
	
    var codes = $('#qinsorgancode').combobox('getValues');
    var ic = "";
    for(var i=0;i<codes.length;i++){
        if (ic != "") ic += "\',\'";
        ic += codes[i];
    }
    tParam.insorgancode = ic;
    tParam.state = $('#qstate').combobox('getValue');
    //tParam.state = "40";
    
	tParam.agentflag = '03';
	
	tParam.q02org = $('#q02org').combobox('getValue');
	tParam.q03org = $('#q03org').combobox('getValue');
	tParam.q04org = $('#q04org').combobox('getValue');
	//tParam.querytype = 'articletype';

	//险种编码多选
    var codess = $('#qriskcode').combobox('getValues');
    var icc = "";
    for(var j=0;j<codess.length;j++){
        if (icc != "") icc += "\',\'";
        icc += codess[j];
    }
    tParam.mainriskcode = icc;
    
    tParam.fincestate = $('#qfincestate').combobox('getValue');

	tParam.acceptStartDate = $('#qacceptStartDate').datebox("getValue");
	tParam.acceptEndDate = $('#qacceptEndDate').datebox("getValue");
	
	tParam.calstartdate = $('#qcStartDate').datebox("getValue");
	tParam.calenddate = $('#qcEndDate').datebox("getValue");
	
	tParam.appprovince = $('#qappprovince').combobox('getValue');
	tParam.appcity = $('#qappcity').combobox('getValue');
	tParam.appcountry = $('#qappcountry').combobox('getValue');

	tParam.organcode = $('#departmentId').val();
	
	tParam.cusname = $('#qcusname').val();
	
	displayDataGrid($('#policyList'), tParam, tturl ,onLoadSuccess);

	var sumurl = "policy/getPolicySum.do";
	
	ajaxdeal(sumurl,tParam,displaysumdata,null);
	
	//clearCarData();
}

function displaysumdata(data)
{
	if(data==null||data=="")
	{
		$('#sumprem').val("");
		$('#policycount').val("");
		$('#sumfyp').val("");
		$('#sumfyp20').val("");
	}
	else
	{
		$('#sumprem').val(data.sumprem);
		$('#policycount').val(data.policycount);
		$('#sumfyp').val(data.sumfyp);
		$('#sumfyp20').val(data.sumfyp20);
	}
}

function getChecked(){
    var nodes = $('#userauthtree').tree('getChecked');
    var s = '';
    var s2 = '';
    for(var i=0; i<nodes.length; i++){
        if (s != '') s += '\',\'';
        if (s2 != '') s2 += ',';
        s += nodes[i].id;
        s2 += nodes[i].text;
    }
    $('#departmentId').val(s);
    $('#departmentName').val(s2);

    $('#menudisplaydlg').dialog('close');
}

function userMenuDis()
{
    $("#userauthtree").tree(
    {
    	url:'combox/departmentList.do'
    });
    $('#menudisplaydlg').dialog('open');
}

function queryPolicyInfo(val,row,index)
{
	return '<a href="#" onclick="openDlg('+index+')">查看详情</a>'; 
}

function openDlg(index)
{
	var rows=$('#policyList').datagrid('getRows');//获取所有当前加载的数据行
	var row=rows[index];
	
	//alert(row.agentcom);
	
	dispolicyDetailDlg(row);
}

function getMonthOneFormatDate()
{
	var date = new Date();
    
    var seperator1 = "-";
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = year + seperator1 + month + seperator1 + "01";
    return currentdate;
}

//根据生日获取年龄
function getAgeByBirthDay(birth){
    var returnAge = "";
    var aDate = new Date();
    var nowYear = aDate.getFullYear();
    var nowMonth = (aDate.getMonth()+1) < 10 ? '0'+(aDate.getMonth()+1) : (aDate.getMonth()+1);
    var nowDay = (aDate.getDate()) < 10 ? '0'+aDate.getDate() : aDate.getDate();

    var birthYear = birth.split("-")[0];
    var birthMonth = birth.split("-")[1];
    var birthDay = birth.split("-")[2];
    if(nowYear == birthYear){
        returnAge = 0;// 同年 则为0岁
    } else {
        var ageDiff = nowYear - birthYear ; // 年之差
        if (ageDiff > 0){
            if (nowMonth == birthMonth){
                var dayDiff = nowDay - birthDay;// 日之差
                if (dayDiff < 0) {
                    returnAge = ageDiff - 1;
                } else {
                    returnAge = ageDiff ;
                }
            } else {
                var monthDiff = nowMonth - birthMonth;// 月之差
                if (monthDiff < 0) {
                    returnAge = ageDiff - 1;
                } else {
                    returnAge = ageDiff ;
                }
            }
        }
    }
    return returnAge;
}

function disAppntAge(val,row,index)
{
	if(row.appbirthday==null||row.appbirthday=="")
	{
		return "";
	}
	else
	{
		return (getAgeByBirthDay(row.appbirthday));	
	}
}

function onLoadSuccess(data)
{
	var appntid = "";
	var start = 0;
	var rowslength = 0;
	
	for(var i=0;i<data.rows.length;i++)
	{
		if(i!=0)
		{
			if(appntid!=data.rows[i].appidno||i==data.rows.length-1)
			{
				if(appntid!=data.rows[i].appidno)
				{
					rowslength = i-start
				}
				else
				{
					if(i==data.rows.length-1&&appntid==data.rows[i].appidno&&i!=start)
					{
						rowslength = i-start+1;	
					}
				}
				
				if(rowslength>1)
				{
					$('#policyList').datagrid('mergeCells',{
						index: start,
						field: 'becomecustime',
						rowspan: rowslength
					});
					
					$('#policyList').datagrid('mergeCells',{
						index: start,
						field: 'appname',
						rowspan: rowslength
					});
					
					$('#policyList').datagrid('mergeCells',{
						index: start,
						field: 'appntage',
						rowspan: rowslength
					});
					
					$('#policyList').datagrid('mergeCells',{
						index: start,
						field: 'sumprem',
						rowspan: rowslength
					});
					
					$('#policyList').datagrid('mergeCells',{
						index: start,
						field: 'serviceusername',
						rowspan: rowslength
					});
					
					$('#policyList').datagrid('mergeCells',{
						index: start,
						field: 'seragentcom',
						rowspan: rowslength
					});
					
					$('#policyList').datagrid('mergeCells',{
						index: start,
						field: 'serorganname',
						rowspan: rowslength
					});
				}
				
				start = i;
				appntid=data.rows[i].appidno
			}
		}
		else
		{
			start = i;
			appntid=data.rows[i].appidno
		}
	}
}

function disSumPrem(val,row,index)
{
	if(val==null||val=="")
	{
		return "";	
	}
	else
	{
		return Number(val).toFixed(2);	
	}
}

function queryPolicyInfo00(val,row,index)
{
	if(val==null||val=="")
	{
		return "";	
	}
	else
	{
		return '<a href="#" onclick="queryPolicyInfo(\''+row.orderid00+'\',\''+row.relatoappnt00+'\',\''+row.riskcode00+'\')">'+row.risktypename00+'</a>';	
	}
}

function queryPolicyInfo01(val,row,index)
{
	if(val==null||val=="")
	{
		return "";	
	}
	else
	{
		return '<a href="#" onclick="queryPolicyInfo(\''+row.orderid01+'\',\''+row.relatoappnt01+'\',\''+row.riskcode01+'\')">'+row.risktypename01+'</a>';	
	}
}

function queryPolicyInfo02(val,row,index)
{
	if(val==null||val=="")
	{
		return "";	
	}
	else
	{
		return '<a href="#" onclick="queryPolicyInfo(\''+row.orderid02+'\',\''+row.relatoappnt02+'\',\''+row.riskcode02+'\')">'+row.risktypename02+'</a>';	
	}
}

function queryPolicyInfo03(val,row,index)
{
	if(val==null||val=="")
	{
		return "";	
	}
	else
	{
		return '<a href="#" onclick="queryPolicyInfo(\''+row.orderid03+'\',\''+row.relatoappnt03+'\',\''+row.riskcode03+'\')">'+row.risktypename03+'</a>';	
	}
}

function queryPolicyInfo(orderid,relatoappnt,riskcode)
{
	var tParam = new Object();
	
	tParam.orderid = orderid;
	tParam.relatoappnt = relatoappnt;
	tParam.mainriskcode = riskcode;
	
	var queryurl = "policy/getOnePolicyInfo.do";
	
	ajaxdeal(queryurl,tParam,openDlg,null);
}

function openDlg(data)
{
	dispolicyDetailDlg(data);
}

function getAppntName(val,row,index)
{
	if(val==null||val=="")
	{
		return "";	
	}
	else
	{
		return '<a href="#" onclick="getUserAgreement(\''+row.appidno+'\',\''+row.appname+'\')">'+val+'</a>';	
	}
}

function getUserAgreement(idno,appname)
{
	var tParam = new Object();
	
	tParam.idno = idno;
	tParam.appname = appname;
	
	var queryurl = "policy/getUserAgreementId.do";
	
	ajaxdeal(queryurl,tParam,downloadSignPdf,null);
}

function downloadSignPdf(data)
{
	if(data==null)
	{
		$.messager.alert('操作提示','该客户未签署服务协议！','error');
		return;
	}	
	else
	{
		window.open("http://insure.meihualife.com/user/pdfdownload.do?buzid="+data.id);	
	}
}

</script>

</head>
<%@ include file="/WEB-INF/jsp/admin/policy/userDlg.jsp"%>
<%@ include file="/WEB-INF/jsp/admin/policy/policy_All_DetailDlg.jsp"%>
<body>
<div style="margin-left:0%">
	<input type="text" hidden="hidden" id="departmentId">
	<div id="menudisplaydlg" class="easyui-dialog" title="机构查询"
		 style="width:300px;height:500px;padding:10px"
		 data-options="iconCls: 'icon-save'">
		<div style="margin-left:15%">
			<ul id="userauthtree" class="easyui-tree" data-options="animate:true,checkbox:true"></ul>
		</div>
		<a href="#" class="easyui-linkbutton" onclick="getChecked()">确认</a>
	</div>
	<table class = "common">
		<tr>
			<td class = "title">
				保单状态
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qstate" id="qstate">
				</select>
			</td>
			
			<td class = "title">
				客户姓名
			</td>
			<td class = "common">
				<input class = "txt" name="qcusname" id="qcusname">
			</td>
			
			<td></td><td></td>
		</tr>
		<tr hidden = "">
			<td class = "title">
				保单号
			</td>
			<td class = "common">
				<input class = "txt" name="qcontno" id="qcontno">
			</td>
			<td class = "title">
				投保人姓名
			</td>
			<td class = "common">
				<input class = "txt" name="qappname" id="qappname">
			</td>
			<td class = "title">
				被保人姓名
			</td>
			<td class = "common">
				<input class = "txt" name="qinsname" id="qinsname">
			</td>
		</tr>
		
		<tr hidden = "">
			<td class = "title">
				出单业务员
			</td>
			<td class = "common">
				<input class = "txt" name="qreuserid" id="qreuserid" readonly onclick = "disuUserDlg($('#qreuserid'),$('#qresuerkey'));">
				<input type = 'hidden' id = 'qresuerkey'>
			</td>
			
			<td class = "title">
				服务人员
			</td>
			<td class = "common">
				<input class = "txt" name="qseruserid" id="qseruserid" readonly onclick = "disuUserDlg($('#qseruserid'),$('#qseruserkey'));">
				<input type = 'hidden' id = 'qseruserkey'>
			</td>
			
			<td class = "title">
				结算状态
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" panelWidth="200" name="qfincestate" id="qfincestate">
				</select>
			</td>
		</tr>
		<tr hidden = "">
			
			<td class = "title">
				保险公司
			</td>
			<td class = "common">
				<input class="easyui-combobox" id="qinsorgancode" style="width:160%" name="qinsorgancode" data-options="valueField:'id',textField:'text',multiple:true,panelHeight:'auto'">
			</td>
			
			<td class = "title">
				险种名称
			</td>
			<td class = "common">
				<input class="easyui-combobox" id="qriskcode" style="width:160%" name="qriskcode" data-options="valueField:'id',textField:'text',multiple:true,panelHeight:'auto'">
			</td>
		</tr>
		
		<tr hidden="hidden">
			<td class = "title">
				出单起期
			</td>
			<td class = "common">
				<input class="easyui-datebox" style="width: 160%" id="qacceptStartDate" name="qacceptStartDate" notnull = "出单起期">
			</td>
			<td class = "title">
				出单止期
			</td>
			<td class = "common">
				<input class="easyui-datebox" style="width: 160%" id="qacceptEndDate" name="qacceptEndDate" notnull = "出单止期">
				(算头不算尾)
			</td>
		</tr>
		
		<tr hidden="hidden">
			<td class = "title">
				出单机构
			</td>
			<td class = "common" colspan="2">
				<input class = "txt" name="departmentName" id="departmentName" readonly><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-tip'" id = "userMenuDis" onclick = "userMenuDis()"></a>
			</td>
		</tr>
		
		<tr hidden="hidden">
			<td class = "title">
				省公司
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="q02org" id="q02org">
				</select>
			</td>
			<td class = "title">
				分公司
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="q03org" id="q03org">
				</select>
			</td>
			<td class = "title">
				营业部
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="q04org" id="q04org">
				</select>
			</td>
		</tr>
		<tr hidden="hidden">
			<td class = "title">
				投保人所在省
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" name="qappprovince" id="qappprovince">
				</select>
			</td>
			<td class = "title">
				投保人所在市
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" name="qappcity" id="qappcity">
				</select>
			</td>
			<td class = "title">
				投保人所在县
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" name="qappcountry" id="qappcountry">
				</select>
			</td>
		</tr>
		
		<tr hidden="hidden">
			<td class = "title">
				核算起期
			</td>
			<td class = "common">
				<input class="easyui-datebox" style="width: 160%" id="qcStartDate" name="qcStartDate" notnull = "生效起期">
			</td>
			<td class = "title">
				核算止期
			</td>
			<td class = "common">
				<input class="easyui-datebox" style="width: 160%" id="qcEndDate" name="qcEndDate" notnull = "生效止期">
				(算头不算尾)
			</td>
		</tr>
		
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "articlequery" onclick = "policyquery()">保单查询</a>
	<br>
	<br>
	<table id="policyList" class="easyui-datagrid" title="保单信息" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<th data-options="field:'becomecustime',width:80" rowspan="2">新单日期</th>
				<th data-options="field:'appname',width:80,formatter:getAppntName" rowspan="2">投保人姓名</th>
				<th data-options="field:'appntage',width:80,formatter:disAppntAge" rowspan="2">投保人年龄</th>
				<th colspan="3">本人</th>
				<th colspan="3">父母</th>
				<th colspan="3">配偶</th>
				<th colspan="3">子女</th>
				<th data-options="field:'sumprem',width:80,formatter:disSumPrem" rowspan="2">保费合计</th>
				<th data-options="field:'serviceusername',width:80" rowspan="2">服务人员</th>
				
				<th data-options="field:'seragentcom',width:80" rowspan="2">所属营业部</th>
				<th data-options="field:'serorganname',width:80" rowspan="2">所属分公司</th>
				<th data-options="field:'serorgan02name',width:80" rowspan="2">所属省公司</th>
			</tr>
			<tr>
				<th data-options="field:'risktypename00',width:80,formatter:queryPolicyInfo00">险种类型</th>
				<th data-options="field:'amnt00',width:80">保险金额</th>
				<th data-options="field:'prem00',width:70">保费</th>

				<th data-options="field:'risktypename03',width:80,formatter:queryPolicyInfo03">险种类型</th>
				<th data-options="field:'amnt03',width:80">保险金额</th>
				<th data-options="field:'prem03',width:70">保费</th>
				
				<th data-options="field:'risktypename02',width:80,formatter:queryPolicyInfo02">险种类型</th>
				<th data-options="field:'amnt02',width:80">保险金额</th>
				<th data-options="field:'prem02',width:70">保费</th>
				
				<th data-options="field:'risktypename01',width:80,formatter:queryPolicyInfo01">险种类型</th>
				<th data-options="field:'amnt01',width:80">保险金额</th>
				<th data-options="field:'prem01',width:70">保费</th>
			</tr>
		</thead>
	</table>
	<br>
	<table class = "common">
		<tr>
			<td class = "title">
				单数合计
			</td>
			<td class = "common">
				<input class = "txt" id="policycount" name="policycount" readonly>
			</td>
			<td class = "title">
				保费合计
			</td>
			<td class = "common">
				<input class = "txt" id="sumprem" name="sumprem" readonly>
			</td>
			<td class = "title">
				标保合计
			</td>
			<td class = "common">
				<input class = "txt" id="sumfyp20" name="sumfyp20" readonly>
			</td>
		</tr>
		<tr hidden="hidden">
			<td class = "title">
				10年FYP合计
			</td>
			<td class = "common">
				<input class = "txt" id="sumfyp" name="sumfyp" readonly>
			</td>
		</tr>
	</table>
</div>
</body>
</html>