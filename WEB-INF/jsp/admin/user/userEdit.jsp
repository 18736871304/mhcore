<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%><head>
<title></title>
<script>

var inputList;
var checkList;

window.onload = function()
{
	workyears_id.style.display="none";
	
	initDataGrid($('#userList'));
	
	inputList = [
	 			$('#userid'),
	 			$('#usercode'),
	 			$('#realname'),
	 			$('#mobilenumber'),
	 			$('#cardno'),
	 			$('#organcode'),
	 			$('#usergrade'),
	 			$('#workyears')
	 	];

	 checkList = [
	 			//$('#userid'),
	 			$('#usercode'),
	 			$('#realname'),
	 			$('#mobilenumber'),
	 			$('#cardno'),
	 			$('#organcode'),
	 			$('#usergrade'),
	 			$("#entrydate")
	 			//$('#usertype')
	 			
	 	];
	
	OrganInit();
	 
	var tturl = "user/getUsertype.do";
	var tParam = new Object();
	
	/* tParam.typeStr = "('01','0001','0201')";
	displayCombox($('#usertype'),tParam,tturl,"dd_key","dd_value"); */
	
	var tturl = "user/getUsertype.do";
	// tParam.typeStr = "('00','01','05')";
	tParam.typeStr = "00,01,05";
	displayCombox($('#qusertype'),tParam,tturl,"dd_key","dd_value");
	
	$('#menudisplaydlg').dialog('close');
}

function aftercodeselect(comboxid)
{
}

function selectone()
{
	var row = $('#userList').datagrid('getSelected');
	$('#userid').val(row.userid);
	$('#usercode').val(row.usercode);
	$('#realname').val(row.realname);
	$('#mobilenumber').val(row.mobilenumber);
	$('#cardno').val(row.cardno);
	$('#organcode').val(row.organcode);
	$('#workyears').val(row.workyears);
	
	dealorgan(row.organcode);
	
	$('#usergrade').combobox('setValue',row.usergrade);
	
	$('#usertype').val(row.typecode);
	//$('#usertype').val(row.typecode);
	
	$('#entrydate').datebox('setValue',row.entrydate);
}

function userquery()
{
	var tturl = "user/getUserList.do";

	var tParam = new Object();

	tParam.usercode = $('#qusercode').val();
	tParam.realname = $('#qrealname').val();
	tParam.mobilenumber = $('#qmobilenumber').val();

	//tParam.organcode = $('#qorgancode').val();
	tParam.organcode = $('#departmentId').val();
	
	tParam.usertype = $('#qusertype').combobox('getValue');
	tParam.typeStr = "00,01,05";
	
	displayDataGrid($('#userList'), tParam, tturl);

	clearCarData();
}

function saveSuss()
{
	clearCarData();
	$('#userList').datagrid('reload');
}

function clearCarData() 
{
	$('#entrydate').datebox('setValue',"");
	
	cleardata(inputList);
}

function useredit()
{
	var row = $('#userList').datagrid('getSelected');
	
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
	
	tparam.oldorgancode = row.organcode;
	tparam.usertype = row.typecode;
	tparam.entrydate = $('#entrydate').datebox("getValue");
	
	ajaxdeal("user/userUpdate.do",tparam,null,null,saveSuss);
	//userquery();
}

function dealorgan(organcode)
{
	var tParam = new Object();
	tParam.organcode = organcode;
	
	var tturl1 = "basiclaw/getlawgrade.do";
	
	displayCombox($('#usergrade'),tParam,tturl1,"dd_key","dd_value");
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

</script>

</head>
<body>
<%@ include file="/WEB-INF/jsp/organ/OrganInfoDlg.jsp"%>
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
				员工编号
			</td>
			<td class = "common">
				<input class = "txt" name="qusercode" id="qusercode">
			</td>
			<td class = "title">
				员工姓名
			</td>
			<td class = "common">
				<input class = "txt" name="qrealname" id="qrealname">
			</td>
			<td class = "title">
				员工状态
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" name="qusertype" id="qusertype">
				</select>
			</td>
		</tr>
		<tr>
			<td class = "title">
				手机号码
			</td>
			<td class = "common">
				<input class = "txt" name="qmobilenumber" id="qmobilenumber">
			</td>
			<td class = "title">
				员工机构
			</td>
			<td class = "common" colspan="2">
				<input class = "txt" name="departmentName" id="departmentName" readonly><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-tip'" id = "userMenuDis" onclick = "userMenuDis()"></a>
			</td>
		</tr>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "userquery" onclick = "userquery()">员工查询</a>
	<br>
	<br>
	<table id="userList" class="easyui-datagrid" title="员工信息" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<th data-options="field:'organ03name',width:100">所属分公司</th>
				<th data-options="field:'organname',width:100">所属事业部</th>
				<th data-options="field:'usercode',width:80">员工编号</th>
				<th data-options="field:'realname',width:100">员工姓名</th>
				<th data-options="field:'mobilenumber',width:90">手机号码</th>
				<th data-options="field:'cardno',width:150">身份证号码</th>
				<th data-options="field:'usertype',width:80">员工状态</th>
				<th data-options="field:'usergradename',width:110">员工级别</th>
				<th data-options="field:'workyears',width:70">司龄（月）</th>
			</tr>
		</thead>
	</table>
	<br>
	<table class = "common">
		<tr>
			<input class = "txt" hidden name="userid" readonly id="userid" notnull = "员工编码">
			<input class = "txt" hidden name="usertype" readonly id="usertype" notnull = "状态编码">
			
			<td class = "title">
				员工编号
			</td>
			<td class = "common">
				<input readonly="readonly" class = "txt" name="usercode" id="usercode" notnull = "员工编号">
			</td>
			<td class = "title">
				员工姓名
			</td>
			<td class = "common">
				<input class = "txt" name="realname" id="realname" notnull = "员工姓名">
			</td>
			<td class = "title">
				手机号码
			</td>
			<td class = "common">
				<input class = "txt" name="mobilenumber" id="mobilenumber" notnull = "手机号码">
			</td>
		</tr>
		<tr>
			<td class = "title">
				身份证号
			</td>
			<td class = "common">
				<input class = "txt" name="cardno" id="cardno" notnull = "身份证号">
			</td>
			<td class = "title">
				机构编码
			</td>
			<td class = "common">
				<input class = "txt" name="organcode" id="organcode"
				readonly  onclick = "disorgan($('#organcode'),'05',null,'dealorgan');" notnull = "机构编码">
			</td>
			<td class = "title">
				员工级别
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="usergrade" id="usergrade" notnull = "员工级别">
				</select>
			</td>
		</tr>
		<tr id = "workyears_id">
			<td class="title">司龄</td>
			<td class="common"><input class="txt" maxlength="10" name="workyears" id="workyears" notnull="司龄"></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
		<tr>
 			<td class = "title">
				下团队日期
			</td>
			<td class = "common">
				<input class="easyui-datebox" style="width: 160%" id="entrydate" name="entrydate" notnull = "下团队日期">
			</td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
 		</tr>
			<!-- 	<tr>
			<td class = "title">
				员工状态
			</td>
			<td class = "common">
				<select disabled="disabled" class = "easyui-combobox" style="width:160%" panelHeight="auto" name="usertype" id="usertype" notnull = "员工状态">
				</select>
			</td>
		</tr> -->
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" id = "useredit" onclick = "useredit()">员工修改</a>
</div>
</body>
</html>