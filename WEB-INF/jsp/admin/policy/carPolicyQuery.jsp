<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%><head>
    <title></title>
    <script>

        window.onload = function()
        {
            initDataGrid20($('#C_contlist'));

            disComBox($('#qinsorgancode'),"insorgancode",null);
            disComBox($('#qstate'),"policystate",null);
//            disComBox($('#qappprovince'),"province",null);

            $('#menudisplaydlg').dialog('close');

            $('#qstate').combobox('setValue','40');

            /*
            disComBox($('#qstate'),"articlestate",null);

            $('#qstate').combobox('setValue','01');
            */

//            var tturl = "policy/get02Org.do";
//            displayCombox($('#q02org'),null,tturl,"dd_key","dd_value");

            dlgUserInit();
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
                ic = codes.join(","); 
                // for(var i=0;i<codes.length;i++){
                //     if (ic != "") ic += "\',\'";
                //     ic += codes[i];
                // }
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

        function C_contquery()
        {
            var tturl = "car/getCarPolicyList.do";

            var tParam = new Object();

            tParam.orderid = $('#qorderid').val();
            tParam.reuserid = $('#qreuserid').val();
            tParam.organcode = $('#departmentId').val();
            tParam.syproposalprtno = $('#qsyproposalprtno').val();
            tParam.jqproposalprtno = $('#qjqproposalprtno').val();
            var codes = $('#qinsorgancode').combobox('getValues');
            var ic = "";

            ic = codes.join(","); 
            // for(var i=0;i<codes.length;i++){
            //     if (ic != "") ic += "\',\'";
            //     ic += codes[i];
            // }
            tParam.insorgancode = ic;
            tParam.state = $('#qstate').combobox('getValue');
//            tParam.ownerName = $('#qdriverName').val();
//            tParam.licenseNo = $('#qdriverNum').val();
            displayDataGrid20($('#C_contlist'), tParam, tturl);

//            var sumurl = "policy/getPolicySum.do";
//
//            ajaxdeal(sumurl,tParam,displaysumdata,null);
//
//            clearCarData();
        }

        function displaysumdata(data)
        {
            $('#sumprem').val(data.sumprem);
            $('#policycount').val(data.policycount);
            $('#sumfyp').val(data.sumfyp);
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
<%@ include file="/WEB-INF/jsp/admin/policy/userDlg.jsp"%>
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
                单号
            </td>
            <td class = "common">
                <input class = "txt" name="qorderid" id="qorderid">
            </td>
            <td class = "title">
                出单员
            </td>
            <td class = "common">
                <input class = "txt" name="qreuserid" id="qreuserid" readonly onclick = "disuUserDlg($('#qreuserid'));">
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
                商业险单号
            </td>
            <td class = "common">
                <input class = "txt" name="qsyproposalprtno" id="qsyproposalprtno">
            </td>
            <td class = "title">
                交强险单号
            </td>
            <td class = "common">
                <input class = "txt" name="qjqproposalprtno" id="qjqproposalprtno">
            </td>
            <td class = "title">
                保险公司
            </td>
            <td class = "common">
                <input class="easyui-combobox" id="qinsorgancode" style="width:160%" name="qinsorgancode" data-options="valueField:'id',textField:'text',multiple:true,panelHeight:'auto'">
            </td>
        </tr>
        <%--<tr>--%>
            <%--<td class = "title">--%>
                <%--车主--%>
            <%--</td>--%>
            <%--<td class = "common">--%>
                <%--<input class = "txt" name="qdriverName" id="qdriverName">--%>
            <%--</td>--%>
            <%--<td class = "title">--%>
                <%--车牌号--%>
            <%--</td>--%>
            <%--<td class = "common">--%>
                <%--<input class = "txt" name="qdriverNum" id="qdriverNum">--%>
            <%--</td>--%>
        <%--</tr>--%>
        <tr>
            <td class = "title">
                出单部门点选
            </td>
            <td class = "common" colspan="2">
                <input class = "txt" name="departmentName" id="departmentName" readonly><a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-tip'" id = "userMenuDis" onclick = "userMenuDis()"></a>
            </td>
        </tr>
    </table>
    <br>
    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id = "C_contquery" onclick = "C_contquery()">车单查询</a>
    <br>
    <br>
    <table id="C_contlist" class="easyui-datagrid" title="用户信息信息" style="width:auto;height:auto"
           data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone" >
        <thead>
        <tr>
            <th data-options="field:'orderid',width:120">单号</th>
            <th data-options="field:'insorgancode',width:120">保险公司</th>
            <th data-options="field:'syproposalprtno',width:120">商业险单号</th>
            <th data-options="field:'jqproposalprtno',width:120">交强险单号</th>
            <th data-options="field:'state',width:120">状态</th>
            <th data-options="field:'ownerName',width:120">车主</th>
            <th data-options="field:'licenseNo',width:120">车牌号</th>
            <th data-options="field:'phone',width:120">联系电话</th>
            <th data-options="field:'reuserid',width:120">出单员</th>
            <%--<th data-options="field:'sumprem',width:120">总保费</th>--%>
            <%--<th data-options="field:'bizprem',width:120">商业险费用</th>--%>
            <%--<th data-options="field:'forceprem',width:120">交强险费用</th>--%>
            <th data-options="field:'makedate',width:120">生成日期</th>
            <th data-options="field:'organcode',width:120">部门</th>
            <th data-options="field:'appname',width:120">投保人姓名</th>
            <th data-options="field:'apphone',width:120">投保人手机号</th>
        </tr>
        </thead>
    </table>
    <br>
</div>
</body>
</html>