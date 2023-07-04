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
	initDataGrid20($('#userwxlist'));

	disComBox($('#qstate'),"wxstate",null);
	disComBox($('#state'),"wxstate",null);
	
	$(".state00").hide();
	$(".state01").hide();
	$(".state02").hide();
	
	$('#menudisplaydlg').dialog('close');
	
	var tturl = "policy/get02Org.do";
	displayCombox($('#q02org'),null,tturl,"dd_key","dd_value");
	
	dlgUserInit();
	
	inputList = [
	 			$('#wxno'),
	 			$('#password'),
	 			$('#mobile'),
	 			$('#remark'),
	 	];

	 	checkList = [
	 			$('#wxno'),
	 			$('#password'),
	 	];
	 	
	 $('#remark').val("");
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
	else if(comboxid.attr("id")=="state")
	{
		$(".state00").hide();
		$(".state01").hide();
		$(".state02").hide();
		
		if(comboxid.combobox('getValue')=="00")
		{
			$(".state00").show();
		}
		else if(comboxid.combobox('getValue')=="01")
		{
			$(".state01").show();
		}
	    else if(comboxid.combobox('getValue')=="02")
		{
			$(".state02").show();
		}
	}
	else
	{
		teamAfterSelect(comboxid);
	}
}

function selectone()
{
}

function saveSuss()
{
	clearCarData();
	$('#userwxlist').datagrid('reload');
}

function clearCarData() 
{
	$('#state').combobox('setValue','');
	cleardata(inputList);
	
	$(".state00").hide();
	$(".state01").hide();
	$(".state02").hide();
}

function userwxquery()
{
	var tturl = "userwx/getUserwxList.do";

	var tParam = new Object();

	tParam.wxno = $('#qwxno').val();
	tParam.mobile = $('#qmobile').val();
	tParam.state = $('#qstate').combobox('getValue');
	
	tParam.usercode = $('#qusercode').val();
	tParam.username = $('#qusername').val();
	
	tParam.organcode = $('#departmentId').val();

	tParam.q02org = $('#q02org').combobox('getValue');
	tParam.q03org = $('#q03org').combobox('getValue');

	var q04org_codes = $('#q04org').combobox('getValues');
    var q04orgStr = "";
    for(var i=0;i<q04org_codes.length;i++)
    {
        if (q04orgStr != "") 
        {
        	q04orgStr += "','";
        }
        q04orgStr += q04org_codes[i];
    }
	tParam.q04org = q04orgStr;
	
	tParam.teamid = getQTeamId();
	
	displayDataGrid20($('#userwxlist'), tParam, tturl);
}

function userwxUpdateState()
{
	var row = $('#userwxlist').datagrid('getSelected');
	if(row==null)
	{
		$.messager.alert('操作提示','请选中要操作的数据！','error');
		return;
	}
	
	var newstate = $('#state').combobox('getValue');
	
	if(newstate==null||newstate=="")
	{
		$.messager.alert('操作提示','状态不能为空！','error');
		return;
	}
	
	if(newstate=="00")
	{
		$.messager.alert('操作提示','新增/删除状态，不允许操作此按钮！','error');
		return;
	}

	if(newstate=="01")
	{
		if($('#realname').attr('checked')!="checked")
		{
			$.messager.alert('操作提示','请勾选实名认证！','error');
			return;
		}
		
		if($('#userkey').val()==null||$('#userkey').val()=='')
		{
			$.messager.alert('操作提示','使用人姓名不能为空！','error');
			return;
		}
		
		if($('#bindmobile').attr('checked')!="checked")
		{
			$.messager.alert('操作提示','请勾选绑定手机号！','error');
			return;
		}
		
		if($('#bindcard').attr('checked')!="checked")
		{
			$.messager.alert('操作提示','请勾选绑定银行卡！','error');
			return;
		}
	}
	
	if(newstate=="02")
	{
		if($('#password_02').attr('checked')!="checked")
		{
			$.messager.alert('操作提示','请勾选密码重置！','error');
			return;
		}
		
		if($('#unrealname').attr('checked')!="checked")
		{
			$.messager.alert('操作提示','请勾选注销实名认证！','error');
			return;
		}
		
		if($('#mobile_02').attr('checked')!="checked")
		{
			$.messager.alert('操作提示','请勾选解绑手机号！','error');
			return;
		}
		
		if($('#bankcard').attr('checked')!="checked")
		{
			$.messager.alert('操作提示','请勾选解绑银行卡！','error');
			return;
		}
		
		if($('#nocuswx').attr('checked')!="checked")
		{
			$.messager.alert('操作提示','请勾选删除非客户微信！','error');
			return;
		}
		
		if($('#dealcuspass').attr('checked')!="checked")
		{
			$.messager.alert('操作提示','请勾选成交客户交接！','error');
			return;
		}
	}
	
	var tparam = new Object();
	
	tparam.state = newstate;
	tparam.wxserialno = row.wxserialno;
	
	tparam.oldstate = row.state;
	tparam.olduserid = row.userid;
	tparam.oldorgancode = row.organcode;
	
	tparam.userid = $('#userkey').val()
	
	ajaxdeal("userwx/userwxUpdateState.do",tparam,null,null,saveSuss);
}

function userwxInsert()
{
	if(!checknotnull(checkList))
	{
		return;
	}
	
	if($('#mobile').val()!=null&&$('#mobile').val()!=''&&$('#mobile').val()!='0')
	{
		if(!validatemobile($('#mobile').val()))	
		{
			return;	
		}
	}

	var tparam = prepareparam(inputList);

	ajaxdeal("userwx/userwxInsert.do",tparam,null,null,saveSuss);
}

</script>
</head>
<body>
<%@ include file="/WEB-INF/jsp/admin/policy/userDlg.jsp"%>
<div style="margin-left:0%">
	<table class = "common">
		<tr>
			<td class = "title">
				微信号
			</td>
			<td class = "common">
				<input class = "txt" name="qwxno" id="qwxno">
			</td>
			<td class = "title">
				绑定手机号
			</td>
			<td class = "common">
				<input class = "txt" name="qmobile" id="qmobile">
			</td>
			<td class = "title">
				状态
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="qstate" id="qstate">
				</select>
			</td>
		</tr>
		<tr>
			<td class = "title">
				使用人编码
			</td>
			<td class = "common">
				<input class = "txt" name="qusercode" id="qusercode">
			</td>
			
			<td class = "title">
				使用人姓名
			</td>
			<td class = "common">
				<input class = "txt" name="qusername" id="qusername">
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
		</tr>
		
		<%@ include file="/WEB-INF/jsp/admin/team/teamQuery.jsp"%>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "userwxquery" onclick = "userwxquery()">微信号查询</a>
	<br>
	<br>
	<table id="userwxlist" class="easyui-datagrid" title="微信号信息" style="width:auto;height:auto"
		data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
		<thead>
			<tr>
				<th data-options="field:'wxno',width:110">微信号</th>
				<th data-options="field:'mobile',width:110">手机号</th>
				
				<th data-options="field:'password',width:110">微信密码</th>
				
				<th data-options="field:'statename',width:90">状态</th>
				
				<th data-options="field:'realname',width:90">实名认证</th>
				<th data-options="field:'bindcard',width:90">绑定银行卡</th>
				
				<th data-options="field:'usercode',width:90">使用人编码</th>
				<th data-options="field:'username',width:90">使用人姓名</th>
				
				<th data-options="field:'organ02name',width:90">所属省公司</th>
				<th data-options="field:'organname',width:90">所属分公司</th>
				<th data-options="field:'agentcom',width:90">所属营业部</th>
				<th data-options="field:'teamname',width:90">所属团队</th>
				
				<th data-options="field:'oldusercode',width:90">原使用人编码</th>
				<th data-options="field:'oldusername',width:90">原使用人姓名</th>
				
				<th data-options="field:'oldorgan02name',width:90">原所属省公司</th>
				<th data-options="field:'oldorganname',width:90">原所属分公司</th>
				<th data-options="field:'oldagentcom',width:90">原所属营业部</th>
				<th data-options="field:'oldteamname',width:90">原所属团队</th>
			</tr>
		</thead>
	</table>
	<br>
	<table class = "common">
		<tr>
			<td class = "title">
				状态
			</td>
			<td class = "common">
				<select class = "easyui-combobox" style="width:160%" panelHeight="auto" name="state" id="state" notnull = "状态">
				</select>
			</td>
			<td></td><td></td>
			<td></td><td></td>
		</tr>
		<tr class = 'state01'>
			<td class = "title">
				实名认证
			</td>
			<td class = "common">
				<input type="checkbox" id="realname">
			</td>
			
			<td class = "title">
				使用人姓名
			</td>
			<td class = "common">
				<input class = "txt" name="username" id="username" readonly onclick = "disuUserDlg($('#usercode'),$('#userkey'),$('#username'));">
				<input type = 'hidden' id = 'userkey'>
				<input class = "txt" type = 'hidden' id = 'usercode'>
			</td>
			<td></td><td></td>
		</tr>
		
		<tr class = 'state01'>
			<td class = "title">
				绑定手机号
			</td>
			<td class = "common">
				<input type="checkbox" id="bindmobile">
			</td>
			<td></td><td></td>
			<td></td><td></td>
		</tr>
		
		<tr class = 'state01'>
			<td class = "title">
				绑定银行卡
			</td>
			<td class = "common">
				<input type="checkbox" id="bindcard">
			</td>
			<td></td><td></td>
			<td></td><td></td>
		</tr>
		
		<tr class = 'state02'>
			<td class = "title">
				重置微信密码
			</td>
			<td class = "common">
				<input type="checkbox" id="password_02">
			</td>
			<td></td><td></td>
			<td></td><td></td>
		</tr>
		<tr class = 'state02'>
			<td class = "title">
				注销实名认证
			</td>
			<td class = "common">
				<input type="checkbox" id="unrealname">
			</td>
			<td></td><td></td>
			<td></td><td></td>
		</tr>
		<tr class = 'state02'>
			<td class = "title">
				解绑手机号
			</td>
			<td class = "common">
				<input type="checkbox" id="mobile_02">
			</td>
			<td></td><td></td>
			<td></td><td></td>
		</tr>
		<tr class = 'state02'>
			<td class = "title">
				解绑银行卡
			</td>
			<td class = "common">
				<input type="checkbox" id="bankcard">
			</td>
			<td></td><td></td>
			<td></td><td></td>
		</tr>
		<tr class = 'state02'>
			<td class = "title">
				删除非客户微信
			</td>
			<td class = "common">
				<input type="checkbox" id="nocuswx">
			</td>
			<td></td><td></td>
			<td></td><td></td>
		</tr>
		<tr class = 'state02'>
			<td class = "title">
				成交客户交接
			</td>
			<td class = "common">
				<input type="checkbox" id="dealcuspass">
			</td>
			<td></td><td></td>
			<td></td><td></td>
		</tr>
		<tr class = 'state00'>
			<td class = "title">
				微信号
			</td>
			<td class = "common">
				<input class = "txt" name="wxno" id="wxno" notnull = "微信号">
			</td>
			
			<td class = "title">
				手机号
			</td>
			<td class = "common">
				<input class = "txt" name="mobile" id="mobile" notnull = "绑定手机号">
			</td>
			
			<td class = "title">
				微信密码
			</td>
			<td class = "common">
				<input class = "txt" name="password" id="password" notnull = "密码">
			</td>
		</tr>
		<tr class = 'state00'>
			<td class = "title">
				备注
			</td>
			<td class="common"  colspan="3">
				<textarea notnull = "备注" class="txt" style="width: 600px;height: 60px;" id="remark" name="remark">
				</textarea>
			</td>
			<td></td><td></td>
		</tr>
	</table>
	<br>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" id = "userwxInsert" onclick = "userwxInsert()">微信号录入</a>
	<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" id = "userwxUpdateState" onclick = "userwxUpdateState()">修改状态</a>
</div>
</body>
</html>
