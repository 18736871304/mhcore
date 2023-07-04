<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%><head>
	<title></title>
<script>

var inputList;
var checkList;
var doubleList;

window.onload = function()
{
	initDataGrid($('#carlist'));

	inputList = [
			$('#province'),
			$('#city'),
			$('#country'),
	];

	checkList = [
			$('#province'),
			$('#city'),
			$('#country'),
	];
//    disComBox($('#qprovince'),"province",null);
}

function aftercodeselect(comboxid)
{
//    alert(comboxid.attr("id"));
    if(comboxid.attr("id")=="qprovince")
    {
//        var tParam = new Object();
//        tParam.organcode = comboxid.combobox('getValue');
//
//        var tturl1 = "policy/get03Org.do";
//
//        displayCombox($('#q03org'),tParam,tturl1,"dd_key","dd_value");
    }
//    else if(comboxid.attr("id")=="q03org")
//    {
//        var tParam = new Object();
//        tParam.organcode = comboxid.combobox('getValue');
//
//        var tturl1 = "policy/get04Org.do";
//
//        displayCombox($('#q04org'),tParam,tturl1,"dd_key","dd_value");
//    }
}

function selectone()
{
	var row = $('#carlist').datagrid('getSelected');

	$('#province').val(row.province);
	$('#city').val(row.city);
	$('#country').val(row.country);
}

function saveSuss()
{
	clearCarData();
	$('#carlist').datagrid('reload');
}

function clearCarData() 
{
	cleardata(inputList);
}

function carInsert()
{
	if(!checknotnull(checkList))
	{
		return;
	}

	var tparam = prepareparam(inputList);

	ajaxdeal("cartemp/cartempInsert.do",tparam,null,null,saveSuss);
}

function carUpdate()
{
	var row = $('#carlist').datagrid('getSelected');
	if(row==null)
	{
		$.messager.alert('操作提示','请选中要修改的数据！','error');
		return;
	}
	
	if(!checknotnull(checkList))
	{
		return;
	}

	var tparam = prepareparam(inputList);
	tparam.carserialno = row.carserialno;

	ajaxdeal("cartemp/cartempUpdate.do",tparam,null,null,saveSuss);
}

function carDelete()
{
	var row = $('#carlist').datagrid('getSelected');
	if(row==null)
	{
		$.messager.alert('操作提示','请选中要删除的数据！','error');
		return;
	}
	
	var tparam = new Object();
	tparam.carserialno = row.carserialno;

	ajaxdeal("cartemp/cartempDelete.do",tparam,null,null,saveSuss);
}

function carquery()
{
	var tturl = "car/getCartempList.do";

	var tParam = new Object();

	tParam.province = $('#qprovince').val();
	tParam.city = $('#qcity').val();
	tParam.country = $('#qcountry').val();
	tParam.platetitle = $('#qplatetitle').val();
	tParam.platenumber = $('#qplatenumber').val();
	tParam.carowner = $('#qcarowner').val();
	tParam.mobilenumber = $('#qmobilenumber').val();
	tParam.reuserid = $('#qreuserid').val();

	displayDataGrid($('#carlist'), tParam, tturl);

//	clearCarData();
}

</script>

</head>
<body>
<div style="margin-left:0%">
	<table class = "common">
		<%--<tr>--%>
			<%--<td class = "title">--%>
				<%--省份--%>
			<%--</td>--%>
			<%--<td class = "common">--%>
				<%--<input class = "easyui-combobox" name="qprovince" id="qprovince">--%>
			<%--</td>--%>
			<%--<td class = "title">--%>
				<%--城市--%>
			<%--</td>--%>
			<%--<td class = "common">--%>
				<%--<input class = "easyui-combobox" name="qcity" id="qcity">--%>
			<%--</td>--%>
			<%--<td class = "title">--%>
				<%--县城--%>
			<%--</td>--%>
			<%--<td class = "common">--%>
				<%--<input class = "easyui-combobox" name="qcountry" id="qcountry">--%>
			<%--</td>--%>
		<%--</tr>--%>
		<tr>
			<%--<td class = "title">--%>
				<%--车牌号头--%>
			<%--</td>--%>
			<%--<td class = "common">--%>
				<%--<input class = "txt" name="qplatetitle" id="qplatetitle">--%>
			<%--</td>--%>
			<td class = "title">
				车牌号
			</td>
			<td class = "common">
				<input class = "txt" name="qplatenumber" id="qplatenumber">
			</td>
			<td class = "title">
				车主
			</td>
			<td class = "common">
				<input class = "txt" name="qcarowner" id="qcarowner">
			</td>
			<td class = "title">
				手机号码
			</td>
			<td class = "common">
				<input class = "txt" name="qmobilenumber" id="qmobilenumber">
			</td>
		</tr>
		<tr>
			<td class = "title">
				推荐人
			</td>
			<td class = "common">
				<input class = "txt" name="qreuserid" id="qreuserid">
			</td>
		</tr>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "carquery" onclick = "carquery()">车辆查询</a>
	<br>
	<br>
	<table id="carlist" class="easyui-datagrid" title="车辆信息" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<th data-options="field:'province',width:120">省份</th>
				<th data-options="field:'city',width:120">城市</th>
				<th data-options="field:'country',width:120">县城</th>
				<%--<th data-options="field:'platetitle',width:120">车牌号头</th>--%>
				<th data-options="field:'platenumber',width:120">车牌号</th>
				<th data-options="field:'carowner',width:120">车主</th>
				<th data-options="field:'mobilenumber',width:120">手机号码</th>
				<%--<th data-options="field:'reuserid',width:120">推荐人</th>--%>
				<%--<th data-options="field:'operator',width:120">操作员</th>--%>
				<th data-options="field:'makedate',width:120">生成日期</th>
				<%--<th data-options="field:'modifydate',width:120">修改日期</th>--%>
				<th data-options="field:'insorgancode',width:120">保险公司</th>
			</tr>
		</thead>
	</table>
	<br>
	<%--<table class = "common">--%>
		<%--<tr>--%>
			<%--<td class = "title">--%>
				<%--省份--%>
			<%--</td>--%>
			<%--<td class = "common">--%>
				<%--<input class = "txt" name="province" id="province"notnull = "省份">--%>
			<%--</td>--%>
			<%--<td class = "title">--%>
				<%--城市--%>
			<%--</td>--%>
			<%--<td class = "common">--%>
				<%--<input class = "txt" name="city" id="city"notnull = "城市">--%>
			<%--</td>--%>
			<%--<td class = "title">--%>
				<%--县城--%>
			<%--</td>--%>
			<%--<td class = "common">--%>
				<%--<input class = "txt" name="country" id="country"notnull = "县城">--%>
			<%--</td>--%>
		<%--</tr>--%>
		<%--<tr>--%>
	<%--</table>--%>
	<br>
	<%--<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" id = "carInsert" onclick = "carInsert()">车辆录入</a>--%>
	<%--<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" id = "carUpdate" onclick = "carUpdate()">车辆修改</a>--%>
	<%--<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove'" id = "carDelete" onclick = "carDelete()">车辆删除</a>--%>
</div>
</body>
</html>
