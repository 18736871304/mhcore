<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%><head>
<title></title>
<script>

window.onload = function()
{
	initDataGrid($('#userList'));
	
	var tturl = "user/getUsertype.do";
	var tParam = new Object();
	tParam.typeStr = "('03')";
	displayCombox($('#qusertype'),tParam,tturl,"dd_key","dd_value");
	
	disComBox($('#qsex'),"sex",null);
	disComBox($('#qworkyears'),"workyears",null);
	disComBox($('#qcontracttype'),"contracttype",null);
	disComBox($('#qdegree'),"degree",null);
	disComBox($('#qusergrade'),"usergrade",null);
	
	$('#qusertype').combobox('setValue','03');
	
	userDetailDlgInit();
	
	$('#menudisplaydlg').dialog('close');
}

function aftercodeselect(comboxid)
{
}

function selectone()
{
}

function userquery()
{
	var tturl = "user/getUserList.do";

	var tParam = new Object();

	//tParam.userid = $('#quserid').val();
	tParam.usercode = $('#qusercode').val();
	tParam.realname = $('#qrealname').val();
	tParam.mobilenumber = $('#qmobilenumber').val();

	//tParam.organcode = $('#qorgancode').val();
	tParam.organcode = $('#departmentId').val();
	
	tParam.usertype = $('#qusertype').combobox('getValue');
	tParam.typeStr = "'03','09'";
	
	tParam.sex = $('#qsex').combobox('getValue');
	tParam.workyears = $('#qworkyears').combobox('getValue');
	tParam.contracttype = $('#qcontracttype').combobox('getValue');
	tParam.degree = $('#qdegree').combobox('getValue');
	tParam.usergrade = $('#qusergrade').combobox('getValue');
	
	displayDataGrid($('#userList'), tParam, tturl);

}

function saveSuss()
{
	$('#userList').datagrid('reload');
}

function userAudit(){
	  var row = $('#userList').datagrid('getSelected');
	  if(row==null)
		{
			$.messager.alert('操作提示','请选中要修改的数据！','error');
			return;
		}
	
	  var tparam = new Object();
	  tparam.userid = row.userid;
	  tparam.usercode = row.usercode;
	  ajaxdeal("user/userTurnOverAudit.do",tparam,null,null,saveSuss);
}

function userAudit_Not()
{
	  var row = $('#userList').datagrid('getSelected');
	  if(row==null)
	  {
			$.messager.alert('操作提示','请选中要修改的数据！','error');
			return;
	  }
	
	  var tparam = new Object();
	  tparam.userid = row.userid;
	  tparam.usercode = row.usercode;
	  ajaxdeal("user/userTurnOverAudit_Not.do",tparam,null,null,saveSuss);
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
<%@ include file="/WEB-INF/jsp/admin/user/userDetailDlg.jsp"%>
	<input type="text" hidden="hidden" id="departmentId">
	<div id="menudisplaydlg" class="easyui-dialog" title="机构查询"
		 style="width:300px;height:500px;padding:10px"
		 data-options="iconCls: 'icon-save'">
		<div style="margin-left:15%">
			<ul id="userauthtree" class="easyui-tree" data-options="animate:true,checkbox:true"></ul>
		</div>
		<a href="#" class="easyui-linkbutton" onclick="getChecked()">确认</a>
	</div>
<div style="margin-left:0%">
	<table class = "common" hidden = "">
		<tr>
			<td class = "title">
				人员编号
			</td>
			<td class = "common">
				<input class = "txt" name="qusercode" id="qusercode">
			</td>
			
			<td class = "title">
				人员姓名
			</td>
			<td class = "common">
				<input class = "txt" name="qrealname" id="qrealname">
			</td>
			
			<td class = "title">
				性别
			</td>
			<td class = "common">
				<select class = "easyui-combobox" panelHeight="auto" style="width:160%" name="qsex" id="qsex">
				</select>
			</td>
		</tr>
		<tr>
			<td class = "title">
				司龄（月）
			</td>
			<td class = "common">
				<select class = "easyui-combobox" panelHeight="auto" style="width:160%" name="qworkyears" id="qworkyears">
				</select>
			</td>
			
			<td class = "title">
				合同类型
			</td>
			<td class = "common">
				<select class = "easyui-combobox" panelHeight="auto" style="width:160%" name="qcontracttype" id="qcontracttype">
				</select>
			</td>
			
			<td class = "title">
				学历
			</td>
			<td class = "common">
				<select class = "easyui-combobox" panelHeight="auto" style="width:160%" name="qdegree" id="qdegree">
				</select>
			</td>
		</tr>
		<tr>
			<td class = "title">
				职能级别
			</td>
			<td class = "common">
				<select class = "easyui-combobox" panelHeight="auto" style="width:160%" name="qusergrade" id="qusergrade">
				</select>
			</td>
		</tr>
		<tr>
			<td class = "title">
				人员状态
			</td>
			<td class = "common">
				<select class = "easyui-combobox" panelHeight="auto" style="width:160%" name="qusertype" id="qusertype">
				</select>
			</td>
			<td class = "title">
				人员机构
			</td>
			<td class = "common" colspan="2">
				<input class = "txt" name="departmentName" id="departmentName" readonly><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-tip'" id = "userMenuDis" onclick = "userMenuDis()"></a>
			</td>
		</tr>
	</table>
	<br>
	<table id="userList" class="easyui-datagrid" title="人员信息" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<%@ include file="/WEB-INF/common/column/user/replaceUserName.jsp"%>
				<%@ include file="/WEB-INF/common/column/organ/organList.jsp"%>
				<%@ include file="/WEB-INF/common/column/user/userList.jsp"%>
				
				<th data-options="field:'dimissiondate',width:100">离职日期</th>
				<th data-options="field:'injobyears',width:100">在职时间（月）</th>
				<th data-options="field:'reason',width:200">离职原因</th>
			</tr>
		</thead>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "userquery" onclick = "userquery()">待审批人员查询</a>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" id = "userAudit" onclick = "userAudit()">审批通过</a>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" id = "userAudit_Not" onclick = "userAudit_Not()">审批不通过</a>
</div>
</body>
</html>