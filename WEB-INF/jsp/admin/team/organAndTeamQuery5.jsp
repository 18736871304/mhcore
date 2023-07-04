<%@ page contentType="text/html;charset=utf-8"%>
<script>
	/*
	 * 添加机构查询，只需要4步
	 * 1、初始化02org
	 * 2、aftercodeselect中加入else的部分
	 * 3、查询条件中加入q02org,q03org,q04org
	 * 4、引入本jsp文件
	 * 注：后台也需要相关的支持才行，这里说的只是前端的修改
	 */

	function init02Org() 
	{
		var tturl = "policy/get02Org.do";
		displayCombox($('#q02org'), null, tturl, "dd_key", "dd_value");
		
		disComBox($('#isxubao'), "yesno", null);
	}

	function organAfterSelect(comboxid) {
		if (comboxid.attr("id") == "q02org") {
			var tParam = new Object();
			tParam.organcode = comboxid.combobox('getValue');

			var tturl1 = "policy/get03Org.do";

			displayCombox($('#q03org'), tParam, tturl1, "dd_key", "dd_value");
		} else if (comboxid.attr("id") == "q03org") {
			var tParam = new Object();
			tParam.organcode = comboxid.combobox('getValue');

			var tturl1 = "policy/get04Org.do";

			displayCombox($('#q04org'), tParam, tturl1, "dd_key", "dd_value");
		} else if (comboxid.attr("id") == "q04org") {
			var tParam = new Object();
			var codes = comboxid.combobox('getValues');
			var ic = "'";
			for (var i = 0; i < codes.length; i++) {
				if (ic != "") ic += "\',\'";
				ic += codes[i];
			}
			ic += "'";
			tParam.organcode = ic;

			var tturl1 = "team/getTeamListByOrgan.do";

			displayCombox($('#q01team'), tParam, tturl1, "dd_key", "dd_value");
		} else if (comboxid.attr("id") == "q01team") {
			var tParam = new Object();
			var codes = comboxid.combobox('getValues');
			var ic = "";
			for (var i = 0; i < codes.length; i++) {
				ic += "'" + codes[i] + "'";
				if (i != codes.length - 1) {
					ic += ",";
				}
			}
			tParam.upteamid = ic;

			var tturl1 = "team/getTeamListByUpTeamId.do";

			displayCombox($('#q02team'), tParam, tturl1, "dd_key", "dd_value");
		}
	}

	function getOrgan04Code() {
		var q04org_codes = $('#q04org').combobox('getValues');
		var q04orgStr = "";
		for (var i = 0; i < q04org_codes.length; i++) {
			if (q04orgStr != "") {
				q04orgStr += "','";
			}
			q04orgStr += q04org_codes[i];
		}

		return q04orgStr;
	}

	function getQOrganCode() {
		var team_sqlstr = "";

		if ($('#q04org').combobox('getValues') != null && $('#q04org').combobox('getValues') != '') {
			var organ_codes = "";
			organ_codes = $('#q04org').combobox('getValues');

			if (organ_codes != null && organ_codes != '') {
				for (var i = 0; i < organ_codes.length; i++) {
					team_sqlstr += "'" + organ_codes[i] + "'";
					if (i != organ_codes.length - 1) {
						team_sqlstr += ",";
					}
				}
			}
		} else if ($('#q03org').combobox('getValue') != null && $('#q03org').combobox('getValue') != '') {
			team_sqlstr = "'" + $('#q03org').combobox('getValue') + "'";
		} else if ($('#q02org').combobox('getValue') != null && $('#q02org').combobox('getValue') != '') {
			team_sqlstr = "'" + $('#q02org').combobox('getValue') + "'";
		}

		return team_sqlstr;
	}

	function getQTeamId() {
		var team_codes = "";
		if ($('#q02team').combobox('getValues') != null && $('#q02team').combobox('getValues') != '') {
			team_codes = $('#q02team').combobox('getValues');
		} else if ($('#q01team').combobox('getValues') != null && $('#q01team').combobox('getValues') != '') {
			team_codes = $('#q01team').combobox('getValues');
		}

		var team_sqlstr = "";

		if (team_codes != null && team_codes != '') {
			for (var i = 0; i < team_codes.length; i++) {
				team_sqlstr += "'" + team_codes[i] + "'";
				if (i != team_codes.length - 1) {
					team_sqlstr += ",";
				}
			}
		}

		return team_sqlstr;
	}
</script>

<tr>
	<td class="reprot_title">
		省公司
	</td>
	<td class="reprot_common">
		<select class="easyui-combobox" style="width:90%" panelHeight="auto" name="q02org" id="q02org">
		</select>
	</td>
	<td class="reprot_title">
		分公司
	</td>
	<td class="reprot_common">
		<select class="easyui-combobox" style="width:90%" panelHeight="auto" name="q03org" id="q03org">
		</select>
	</td>
	<td class="reprot_title">
		营业部
	</td>
	<td class="reprot_common">
		<select class="easyui-combobox" style="width:90%" panelHeight="auto" name="q04org" id="q04org"
			data-options="multiple:true">
		</select>
	</td>

	<td class="reprot_title">
		事业部
	</td>
	<td class="reprot_common">
		<select class="easyui-combobox" style="width:90%" panelHeight="auto" name="q01team" id="q01team"
			data-options="multiple:true">
		</select>
	</td>
	
	<td class="reprot_title">
		团队
	</td>
	<td class = "reprot_common">
		<select class = "easyui-combobox" style="width:90%" panelHeight="auto" name="q02team" id="q02team" data-options="multiple:true">
		</select>
	</td>
	
	<td class = "reprot_title">
		是否续保
	</td>
	<td class = "reprot_common">
		<select class = "easyui-combobox" style="width:90%" panelHeight="auto" name="isxubao" id="isxubao">
		</select>
	</td>
</tr>