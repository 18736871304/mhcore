<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%><head>
<title></title>
<link rel="stylesheet" href="../../../../css/inputbox/line3.css?v_2022_05_16">
<script>

var inputList;
var checkList;

window.onload = function()
{
	initDataGrid20($('#userList'));
	
	inputList = [
				$('#recordtype'),
				$('#recorddate'),
				$('#remark'),
	 	];

	 checkList = [
				$('#recordtype'),
				$('#recorddate'),
				$('#remark'),
	 	];
	
	var tturl = "user/getUsertype.do";
	var tParam = new Object();
	// tParam.typeStr = "('00','01','0001','02','0201','03','04','05')";
	tParam.typeStr = "00,01,0001,02,0201,03,04,05"
	displayCombox($('#qusertype'),tParam,tturl,"dd_key","dd_value");
	
	disComBox($('#qsex'),"sex",null);
	
	disComBox($('#qusergrade'),"usergrade",null);
	disComBox($('#qworkyears'),"workyears",null);
	disComBox($('#qcontracttype'),"contracttype",null);
	disComBox($('#qdegree'),"degree",null);
	disComBox($('#qposition'),"position",null);
	
	$('#qusertype').combobox('setValue','02');
	
	userDetailDlgInit();
	
	var tturl = "policy/get02Org.do";
	displayCombox($('#q02org'),null,tturl,"dd_key","dd_value");
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
	else
	{
		teamAfterSelect(comboxid);
	}
}

function selectone()
{
}

function userquery()
{
	var tturl = "user/getUserList20.do";

	var tParam = new Object();

	//tParam.userid = $('#quserid').val();
	tParam.usercode = $('#qusercode').val();
	tParam.realname = $('#qrealname').val();
	tParam.mobilenumber = $('#qmobilenumber').val();
	
	tParam.cardno = $('#qcardno').val();
	
	tParam.usertype = $('#qusertype').combobox('getValue');
	tParam.typeStr = "00,01,0001,02,0201,03,04,05,09";
	
	tParam.sex = $('#qsex').combobox('getValue');
	
	var workyears_codes = $('#qworkyears').combobox('getValues');
	var workyears_Str = "";
	workyears_Str = workyears_codes.join(","); 
	
	// for(var i=0;i<workyears_codes.length;i++)
    // {
	// 	if (workyears_Str != "") 
    //     {
	// 		workyears_Str += ",";
    //     }
		
	// 	workyears_Str = workyears_Str + workyears_codes[i];
    // }
	
	tParam.workyears = workyears_Str;
	
	
	tParam.contracttype = $('#qcontracttype').combobox('getValue');
	tParam.degree = $('#qdegree').combobox('getValue');
	tParam.usergrade = $('#qusergrade').combobox('getValue');
	tParam.position = $('#qposition').combobox('getValue');
	
	tParam.q02org = $('#q02org').combobox('getValue');
	tParam.q03org = $('#q03org').combobox('getValue');

	var q04org_codes = $('#q04org').combobox('getValues');
    var q04orgStr = "";
	q04orgStr = q04org_codes.join(","); 
    // for(var i=0;i<q04org_codes.length;i++)
    // {
    //     if (q04orgStr != "") 
    //     {
    //     	q04orgStr += "','";
    //     }
    //     q04orgStr += q04org_codes[i];
    // }
	tParam.q04org = q04orgStr;
	
	tParam.teamid = getQTeamId();
	
	displayDataGrid20($('#userList'), tParam, tturl);

	clearCarData();
}

function saveSuss()
{
	clearCarData();
	$('#userList').datagrid('reload');
}

function clearCarData() 
{
	cleardata(inputList);
}

function recordInsert()
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
	tparam.userid = row.userid;
	
	ajaxdeal("userMan/userRecordInsert.do",tparam,null,null,saveSuss);
}

</script>

</head>
<body>
<%@ include file="/WEB-INF/jsp/admin/user/userDetailDlg.jsp"%>
<div style="margin-left:0%">
	<table class = "common">
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

			<td class = "title">
				身份证号码
			</td>
			<td class = "common">
				<input class = "txt" name="qcardno" id="qcardno">
			</td>
			
			<td class = "title">
				学历
			</td>
			<td class = "common">
				<select class = "easyui-combobox" panelHeight="auto" style="width:160%" name="qdegree" id="qdegree">
				</select>
			</td>
			
			<td class = "title">
				人员状态
			</td>
			<td class = "common">
				<select class = "easyui-combobox" panelHeight="auto" style="width:160%" name="qusertype" id="qusertype">
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
		
			<td class = "title">
				职岗
			</td>
			<td class = "common">
				<select class = "easyui-combobox" panelHeight="auto" style="width:160%" name="qposition" id="qposition">
				</select>
			</td>
		
			<td class = "title">
				司龄（月）
			</td>
			<td class = "common">
				<select class = "easyui-combobox" panelHeight="auto" style="width:160%" name="qworkyears" id="qworkyears" data-options="multiple:true">
				</select>
			</td>
			
			<td class = "title">
				合同类型
			</td>
			<td class = "common">
				<select class = "easyui-combobox" panelHeight="auto" style="width:160%" name="qcontracttype" id="qcontracttype">
				</select>
			</td>
		</tr>
		
		<tr>
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
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="q04org" id="q04org" data-options="multiple:true">
				</select>
			</td>
			<%@ include file="/WEB-INF/jsp/admin/team/teamQuery.jsp"%>
		</tr>
		
	
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "userquery" onclick = "userquery()">查询</a>
	<br>
	<br>
	<table id="userList" class="easyui-datagrid" title="人员信息" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<%@ include file="/WEB-INF/common/column/organ/organList.jsp"%>
				<%@ include file="/WEB-INF/common/column/user/userList.jsp"%>
			</tr>
		</thead>
	</table>
	<br>
	<table class = "common" style="width: 49%;">
		<tr>
			<td class = "title">
				项目
			</td>
			<td class = "common">
				<input class = "txt" name="recordtype" id="recordtype" notnull = "项目">
			</td>
			<td class = "title">
				日期
			</td>
			<td class = "common">
				<input class="easyui-datebox" style="width: 160%" id="recorddate" name="recorddate" notnull = "日期">
			</td>
		
		</tr>
		<!-- <tr>
		
			
			<td></td><td></td>
			<td></td><td></td>
		</tr> -->
	</table>
	<table class = "common" style="width:56.5%">
		<tr>
			<td class = "title" >
				备注
			</td>
			<td class="common"  colspan="3">
				<textarea notnull = "备注" class="txt" style="width: 485px;height: auto;" id="remark" name="remark">
				</textarea>
			</td>
			
		
		</tr>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" id = "userInsert" onclick = "recordInsert()">信息录入</a>
</div>
</body>
</html>