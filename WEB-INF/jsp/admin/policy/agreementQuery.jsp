<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%><head>
	<title></title>
	<link rel="stylesheet" href="../../../../css/inputbox/line6.css">
<script>

window.onload = function()
{
	initDataGrid20($('#agreementlist'));
	
	disComBox($('#qtbflag'),"tbflag",null);
	
	disComBox($('#qidnotype'),"idnotype",null);
}

function aftercodeselect(comboxid)
{
}

function selectone()
{
}

function saveSuss()
{
}

function clearCarData() 
{
}

function agreementQuery()
{
	var tturl = "userMan/getAgreementList.do";

	var tParam = new Object();

	tParam.name = $('#qname').val();
	tParam.mobile = $('#qmobile').val();
	tParam.idno = $('#qidno').val();
	
	tParam.tbflag = $('#qtbflag').combobox('getValue');
	
	tParam.signStartDate = $('#qstartdate').datebox("getValue");
	tParam.signEndDate = $('#qenddate').datebox("getValue");

	displayDataGrid20($('#agreementlist'), tParam, tturl);
}

function signdownload(val,row,index)
{
	return '<a href="https://insure.meihualife.com/user/pdfdownload.do?buzid='+row.agreementserialno+'">点击下载</a>';
}

</script>

</head>
<body>
	<table class = "common">
		<tr>
			<td class = "reprot_title">
				签约起期
			</td>
			<td class = "report_common">
				<input class="easyui-datebox" style="width: 90%" id="qstartdate" name="qstartdate">
			</td>
			
			<td class = "reprot_title">
				签约止期
			</td>
			<td class = "report_common">
				<input class="easyui-datebox" style="width: 90%" id="qenddate" name="qenddate">
			</td>
			
			<td class = "reprot_title">
				是否投保
			</td>
			<td class = "report_common">
				<select class = "easyui-combobox" style="width: 90%" panelHeight="auto" name="qtbflag" id="qtbflag">
				</select>
			</td>
			
			<td></td><td></td>
		</tr>
		
		<tr>
			<td class = "reprot_title">
				客户姓名
			</td>
			<td class = "report_common">
				<input class = "txt" name="qname" id="qname">
			</td>
			
			<td class = "reprot_title">
				电话号码
			</td>
			<td class = "report_common">
				<input class = "txt" name="qmobile" id="qmobile">
			</td>
			
			<td class = "reprot_title">
				证件类型
			</td>
			<td class = "report_common">
				<select class = "easyui-combobox" style="width: 90%" panelHeight="auto" name="qidnotype" id="qidnotype">
				</select>
			</td>
			
			<td class = "reprot_title">
				证件号
			</td>
			<td class = "report_common">
				<input class = "txt" name="qidno" id="qidno">
			</td>
		</tr>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "userwxquery" onclick = "agreementQuery()">查询</a>
	<br>
	<br>
	<table id="agreementlist" class="easyui-datagrid" title="签约客户信息" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<th data-options="field:'signdate',width:125">签约时间</th>
				<th data-options="field:'wxno',width:100">微信号</th>
				<th data-options="field:'name',width:70">客户姓名</th>
				<th data-options="field:'mobileStr',width:85">电话号码</th>
				
				<th data-options="field:'idnotype',width:60">证件类型</th>
				<th data-options="field:'idnoStr',width:130">证件号</th>
				
				<th data-options="field:'_signdownload',width:60,formatter:signdownload">查看详情</th>
				<th data-options="field:'tbflag',width:60">是否投保</th>
			</tr>
		</thead>
	</table>
	<br>
</div>
</body>
</html>
