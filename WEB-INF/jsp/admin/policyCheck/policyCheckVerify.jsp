<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%><head>
<title></title>
<script>
	var inputList;
	window.onload = function() {
		inputList = [];
		initDataGrid20($('#policyList'));

		$('#menudisplaydlg').dialog('close');
	}

	function aftercodeselect(comboxid) {
	}

	function selectone() {
	}
	function clearCarData() {
		cleardata(inputList);
	}

	function policyquery() {
		var tturl = "policy/getPolicyList.do";
		var startdate = $('#qstartdate').datebox("getValue");
		if(startdate==null||startdate=="")
		{
			$.messager.alert('执行失败','出单起期不能为空！','error');
			return;
		}
		if(startdate != null && startdate != ""){
			var enddate = $('#qenddate').datebox("getValue");
			var fromDate = new Date(startdate.replace(/-/g, "/"));
			var toDate = new Date(enddate.replace(/-/g, "/"));
			if (Date.parse(fromDate) > Date.parse(toDate)) {//时间戳对比
				$.messager.alert('操作提示','起期应早于止期！','error');  
				return ;
			} 
		}
		
		var tParam = new Object();
		tParam.contno = $('#qcontno').val();
		tParam.acceptStartDate = startdate;
		tParam.acceptEndDate = enddate;
		tParam.state = "40";
		tParam.agentflag = '02';
		tParam.q02org = $('#q02org').combobox('getValue');
		tParam.q03org = $('#q03org').combobox('getValue');
		tParam.q04org = $('#q04org').combobox('getValue');
		displayDataGrid20($('#policyList'), tParam, tturl);
		clearCarData();
	}

	function displaysumdata(data) {
	}

	function getChecked() {
	}

	function saveSuss() {
		$('#policyList').datagrid('reload');
		$('#qcontno').val("");
	}
	function policyverify() {
		var ids = [];
		var rows = $('#policyList').datagrid('getSelections');
		if (rows.length <= 0) {
			$.messager.alert('操作提示', '请选中要修改的数据！', 'error');
			return;
		}
		for (var i = 0; i < rows.length; i++) {
			ids.push(rows[i].orderid);
			ids.join(',');
		}
		var tParam = new Object();
		tParam.ids = ids;
		ajaxdeal("policyCheck/policyverify.do", tParam, null, null, saveSuss);
	}

	function policyverifyAll() {
		ajaxdeal("policyCheck/policyverifyAll.do", null, null, null, saveSuss);
	}
</script>
</head>
<body>
	<div style="margin-left: 0%">
		<table class="common">
			<tr>
				<td class = "title">
					保单号
				</td>
				<td class = "common">
					<input class = "txt" name="qcontno" id="qcontno">
				</td>
				<td class = "title">
					出单起期
				</td>
				<td class = "common">
					<input class="easyui-datebox" style="width: 160%" id="qstartdate" name="qstartdate" notnull = "出单起期">
				</td>
				
				<td class = "title">
					出单止期
				</td>
				<td class = "common">
					<input class="easyui-datebox" style="width: 160%" id="qenddate" name="qenddate" notnull = "出单止期">
					(算头不算尾)
				</td>
			</tr>
			<tr hidden="hidden">
				<td class="title">省公司</td>
				<td class="common"><select class="easyui-combobox"
					style="width: 160%" panelHeight="auto" name="q02org" id="q02org">
				</select></td>
				<td class="title">分公司</td>
				<td class="common"><select class="easyui-combobox"
					style="width: 160%" panelHeight="auto" name="q03org" id="q03org">
				</select></td>
				<td class="title">事业部</td>
				<td class="common"><select class="easyui-combobox"
					style="width: 160%" panelHeight="auto" name="q04org" id="q04org">
				</select></td>
			</tr>
		</table>
		<br> 
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="articlequery" onclick="policyquery()">保单查询</a> 
		<br> 
		<br> 
		<table id="policyList" class="easyui-datagrid" title="保单信息"
			style="width: auto; height: auto"
			data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone">
			<thead>
				<tr>
					<th data-options="field:'accepttime',width:140">出单日期</th>
					<th data-options="field:'organname',width:90">出单分公司</th>
					<th data-options="field:'agentcom',width:120">出单事业部</th>
					<th data-options="field:'reusername',width:70">出单员</th>
					<th data-options="field:'serviceusername',width:80">保单服务人员</th>
					<th data-options="field:'contno',width:140">保单号</th>
					<th data-options="field:'statename',width:90">保单状态</th>
					<th data-options="field:'insorganname',width:90">保险公司</th>
					<th data-options="field:'riskname',width:190">险种</th>

					<th data-options="field:'amnt',width:90">保额</th>
					<th data-options="field:'prem',width:90">保费</th>
					<th data-options="field:'payendyear',width:70">缴费年期</th>
					<th data-options="field:'payendyearflag',width:80">缴费年期单位</th>

					<th data-options="field:'fyp20',width:60">标保</th>

					<th data-options="field:'appname',width:70">投保人姓名</th>
					<th data-options="field:'appsexname',width:70">投保人性别</th>
					<th data-options="field:'appbirthday',width:70">投保人生日</th>
					<th data-options="field:'appprovincename',width:90">投保人所在省</th>
					<th data-options="field:'appcityname',width:90">投保人所在市</th>
					<th data-options="field:'appcountryname',width:90">投保人所在县</th>
					<th data-options="field:'appaddress',width:150">投保人地址</th>

					<th data-options="field:'relaname',width:100">投被保人关系</th>

					<th data-options="field:'insname',width:70">被保人姓名</th>
					<th data-options="field:'inssexname',width:70">被保人性别</th>
					<th data-options="field:'insbirthday',width:70">被保人生日</th>
					<th data-options="field:'insprovincename',width:90">被保人所在省</th>
					<th data-options="field:'inscityname',width:90">被保人所在市</th>
					<th data-options="field:'inscountryname',width:90">被保人所在县</th>
					<th data-options="field:'insaddress',width:150">被保人地址</th>

					<th data-options="field:'cvalidate',width:140">保单生效日期</th>

					<th data-options="field:'freelookperiod',width:70">犹豫期天数</th>
					<th data-options="field:'accountdate',width:140">保单核算日期</th>
					<!-- <th data-options="field:'fincestate',width:140">资金状态</th> -->
				</tr>
			</thead>
		</table>
		<br> <a href="#" class="easyui-linkbutton"
			data-options="iconCls:'icon-edit'" onclick="policyverify()">审批通过</a>
		<a href="#" class="easyui-linkbutton"
			data-options="iconCls:'icon-edit'" onclick="policyverifyAll()">批量审批通过</a>
	</div>
</body>
</html>