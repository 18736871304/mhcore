<%@ page contentType="text/html;charset=utf-8" %>
  <html>
  <%@ include file="/WEB-INF/common/include.jsp" %>

    <head>
      <title></title>
      <link rel="stylesheet" href="../../../../css/inputbox/line6.css" />
      <script>
        var inputList;
        var checkList;
        var doubleList;

        window.onload = function () {

          $('#protocolDetailDlg').dialog('close');

          initDataGrid20($("#protocollist"));
          initDataGrid20($("#filelist"));

          inputList = [
            $("#protocoltype"),
            $("#insorgancode"),
            $("#protocolobject"),
            $("#startdate"),
            $("#enddate"),
            $("#linkman"),
            $("#linkmobile"),
            $("#invoiceinfo"),
            $('#pureinsorgancode'),
            $("#url"),
            $("#accountno"),
            $("#report_remark"),
            $("#remark")
          ];

          checkList = [
            $("#insorgancode"),
            $("#protocolobject"),
            $("#startdate"),
            $("#enddate"),
            $("#linkman"),
            $("#linkmobile"),
            $("#invoiceinfo"),
            // $('#pureinsorgancode')
          ];
          disComBox($('#pureinsorgancode'), "insorgancode", null);
          disComBox($("#qinsorgancode"), "channel", null);
          disComBox($("#insorgancode"), "channel", null);


          disComBox($("#protocoltype"), "protocoltype", null);
          $("#protocoltype").combobox("setValue", "01");
          $("#invoiceinfo").val("");
          $("#accountno").val("");
          $("#remark") .val("");
          $("#report_remark").val("");



          // 监听选择框的值变化
          $('#insorgancode').combobox({
            onChange: function (newValue, oldValue) {
              if (newValue == '01') {
                // 否则启用其他输入框
                $('#pureinsorgancode').combobox('enable');


              } else {
                // 如果选择的是 01，则禁用其他输入框
                $('#pureinsorgancode').combobox('disable');

              }
            }
          });

        };

        function aftercodeselect(comboxid) { }

        function selectone() {
          var row = $("#protocollist").datagrid("getSelected");

          $("#protocoltype").combobox("setValue", row.protocoltype);


          if (row.type != 'channel') {
            $("#insorgancode").combobox("setValue", '01');
            $("#pureinsorgancode").combobox("setValue", row.insorgancode);
          } else {
            $("#insorgancode").combobox("setValue", row.insorgancode);
            $("#pureinsorgancode").combobox("setValue", '');
          }



          $("#protocolobject").val(row.protocolobject);
          $("#startdate").datebox("setValue", row.startdate);
          $("#enddate").datebox("setValue", row.enddate);
          $("#linkman").val(row.linkman);
          $("#linkmobile").val(row.linkmobile);
          $("#invoiceinfo").val(row.invoiceinfo);
          $("#url ").val(row.url);
          $("#accountno").val(row.accountno);
          $("#remark").val(row.remark);
     
          $("#report_remark").val(row.report_remark);





          disFileList();
        }

        function saveSuss() {
          clearCarData();
          $("#protocollist").datagrid("reload");
        }

        function clearCarData() {
          cleardata(inputList);
        }

        function protocolInsert() {
          if (!checknotnull(checkList)) {
            return;
          }
          var tparam = prepareparam(inputList);
          if (tparam.insorgancode == '01') {
            tparam.insorgancode = tparam.pureinsorgancode
          }

          if (tparam.insorgancode == '' || tparam.insorgancode == null) {
            $.messager.alert("操作提示", "自营渠道 请选择保险公司！", "error");
            return
          }
          // tparam.startdate = formatDate(tparam.startdate)
          // tparam.enddate = formatDate(tparam.enddate)

          ajaxdeal("supplier/protocolInsert.do", tparam, null, null, saveSuss);
        }

        function formatDate(dateString) {
          const date = new Date(dateString);
          let month = '' + (date.getMonth() + 1);
          let day = '' + date.getDate();
          let year = date.getFullYear();

          if (month.length < 2)
            month = '0' + month;
          if (day.length < 2)
            day = '0' + day;

          return [year, month, day].join('-');
        }

        function protocolUpdate() {
          var row = $("#protocollist").datagrid("getSelected");
          if (row == null) {
            $.messager.alert("操作提示", "请选中要修改的数据！", "error");
            return;
          }

          if (!checknotnull(checkList)) {
            return;
          }



          var tparam = prepareparam(inputList);


          if (tparam.insorgancode == '01') {
            tparam.insorgancode = tparam.pureinsorgancode
          }

          if (tparam.insorgancode == '' || tparam.insorgancode == null) {
            $.messager.alert("操作提示", "自营渠道 请选择保险公司！", "error");
            return
          }

          tparam.protocolserialno = row.protocolserialno;

          ajaxdeal("supplier/protocolUpdate.do", tparam, null, null, saveSuss);
        }

        function protocolDelete() {
          var row = $("#protocollist").datagrid("getSelected");
          if (row == null) {
            $.messager.alert("操作提示", "请选中要删除的数据！", "error");
            return;
          }

          var tparam = new Object();
          tparam.protocolserialno = row.protocolserialno;

          ajaxdeal("supplier/protocolDelete.do", tparam, null, null, saveSuss);
        }

        function protocolquery() {
          var tturl = "supplier/getProtocolList.do";

          var tParam = new Object();

          tParam.insorgancode = $("#qinsorgancode").combobox("getValue");
          tParam.protocoltype = $("#qprotocoltype").combobox("getValue");

          tParam.protocolstate = $("#qprotocolstate").val();



          tParam.startdateStart = $('#selstartdate').datebox("getValue");
          tParam.enddateEnd = $('#selenddate').datebox("getValue");


          displayDataGrid($("#protocollist"), tParam, tturl);

          clearCarData();
        }

        function selectonefile() { }

        function signdownload(val, row, index) {
          return (
            '<a href="https://insure.meihualife.com/filedownload.do?fileid=' +
            row.fileid +
            '">下载</a>'
          );
        }

        function disFileList() {
          var row = $("#protocollist").datagrid("getSelected");
          if (row == null) {
            return;
          }

          var tturl = "/getFileListOrderByName.do";

          var tparam = new Object();
          tparam.buzid = row.protocolserialno;
          tparam.buztype = "0202";

          displayDataGrid($("#filelist"), tparam, tturl);
        }



        function updateTextValue() {
          const fileInput = document.getElementById('filename');
          const textfield = document.getElementById('textfield');
          const files = fileInput.files;
          const fileNames = [];
          for (let i = 0; i < files.length; i++) {
            fileNames.unshift(files[i].name);
          }
          textfield.value = fileNames.join(', ');
        }



        function FileUpload() {

          var row = $("#protocollist").datagrid("getSelected");

          if (row == null) {
            $.messager.alert("操作提示", "请选中要操作的数据！", "error");
            return;
          }


          if ($("#textfield").val() == null || $("#textfield").val() == "") {
            $.messager.alert("操作提示", "请选中要上传的数据！", "error");
            return;
          }

          var tparam = new Object();
          tparam.buzid = row.protocolserialno;


          ajaxFileUpload("filename", "supplier/protocolUpLoad.do", tparam, null, null, uploadsaveSuss);
          //上传完毕之后，把浏览框中的文本清除。
        }

        function fileDelete() {
          var row = $("#filelist").datagrid("getSelected");
          if (row == null) {
            $.messager.alert("操作提示", "请选中要操作的数据！", "error");
            return;
          }

          var tparam = new Object();
          tparam.fileid = row.fileid;

          ajaxdeal(
            "supplier/uwfileDelete.do",
            tparam,
            null,
            null,
            uploadsaveSuss
          );
        }

        function uploadsaveSuss() {
          $("#textfield").val("");
          $("#filelist").datagrid("reload");
        }

        function queryDetail(val, row, index) {
          return '<a href="#" onclick="openDlg(' + index + ')">查看详情</a>';
        }

        function openDlg(index) {
          var rows = $('#protocollist').datagrid('getRows');//获取所有当前加载的数据行
          var row = rows[index];

          $('#protocolDetailDlg').dialog('open').dialog('resize');
          // $('#protocolMain').text(row.invoiceinfo) 
          // disuserDetailDlg(row);
        }
        function queryinsorgan(val, row, index) {
          var rows = $('#protocollist').datagrid('getRows');//获取所有当前加载的数据行
          var row = rows[index];


          if (row.type == 'channel') {
            return ''
          } else {
            return row.insorganname
          }
        }
        function queryqudao(val, row, index) {
          var rows = $('#protocollist').datagrid('getRows');//获取所有当前加载的数据行
          var row = rows[index];

          if (row.type == 'insorgancode') {
            return '自营'
          } else {
            return row.insorganname
          }
        }

        function queryinvoiceinfo(val, row, index) {
          var rows = $('#protocollist').datagrid('getRows');//获取所有当前加载的数据行
          var row = rows[index];
          var aa = row.invoiceinfo
          const indexaa = aa.indexOf("公司");
          // 如果找到“公司”，则返回包含“公司”的前部分
          if (indexaa !== -1) {
            return aa.substring(0, indexaa + 2); // +2 是为了包含“公司”这两个字
          }
          // 如果没有找到“公司”，则返回原字符串
          return  aa;
        }





      </script>
    </head>

    <body>
      <div style="margin-left: 0%">
        <table class="common">
          <tr>
            <td class="reprot_title">签约渠道</td>
            <td class="reprot_common">
              <select class="easyui-combobox" style="width: 160%" name="qinsorgancode" id="qinsorgancode"></select>
            </td>
            <td class="reprot_title">
              协议起期
            </td>
            <td class="reprot_common">
              <input class="easyui-datebox" style="width: 160%" id="selstartdate" name="selstartdate" notnull="协议起期">
            </td>

            <td class="reprot_title">
              协议止期
            </td>
            <td class="reprot_common">
              <input class="easyui-datebox" style="width: 160%" id="selenddate" name="selenddate" notnull="协议止期">
            </td>
            <!-- <td style="width: 6%"></td>
            <td style="width: 10%"></td> -->
            <td style="width: 6%"></td>
            <td style="width: 10%"></td>
            <td style="width: 6%"></td>
            <td style="width: 10%"></td>
            <td style="width: 6%"></td>
            <td style="width: 10%"></td>
          </tr>
          <tr hidden>
            <td class="reprot_title">协议分类</td>
            <td class="reprot_common">
              <select class="easyui-combobox" style="width: 160%" panelHeight="auto" name="qprotocoltype"
                id="qprotocoltype"></select>
            </td>
            <td class="reprot_title">协议状态</td>
            <td class="reprot_common">
              <select class="easyui-combobox" style="width: 160%" panelHeight="auto" name="qprotocolstate"
                id="qprotocolstate"></select>
            </td>
          </tr>
        </table>
        <br />
        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="protocolquery"
          onclick="protocolquery()">查询</a>
        <br />
        <br />
        <table id="protocollist" class="easyui-datagrid" title="协议管理" style="width: auto; height: auto"
          data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone">
          <thead>
            <tr>
              <th data-options="field:'insorganname',width:80,formatter:queryqudao">签约渠道</th>
              <th data-options="field:'insorgancode',width:90,formatter:queryinsorgan">保险公司</th>
              <th data-options="field:'protocolobject',width:80,">协议对象</th>
              <th data-options="field:'startdate',width:80">协议起期</th>
              <th data-options="field:'enddate',width:80">协议止期</th>
              <!--<th data-options="field:'protocolstatename',width:80">协议状态</th> -->
              <th data-options="field:'linkman',width:80">对接人</th>
              <th data-options="field:'linkmobile',width:80">联系电话</th>

              <th data-options="field:'invoiceinfo',width:210,formatter:queryinvoiceinfo">开票信息</th>

              <th data-options="field:'url',width:240">网址</th>
              <th data-options="field:'accountno',width:180">账号</th>
              <th data-options="field:'report_remark',width:220">上报保监口径</th>
              <th data-options="field:'_operate',width:70,formatter:queryDetail">协议信息</th>
              <th data-options="field:'remark',width:160">备注</th>

            </tr>
          </thead>
        </table>
        <br />
        <table class="common">
          <tr>
            <td class="reprot_title_4" hidden>协议分类</td>
            <td class="reprot_common_4" hidden>
              <select class="easyui-combobox" style="width: 160%" panelHeight="auto" name="protocoltype"
                id="protocoltype" notnull="协议分类"></select>
            </td>
          </tr>
          <tr>
            <td class="reprot_title_4">签约渠道</td>
            <td class="reprot_common_4">
              <select class="easyui-combobox" style="width: 160%" name="insorgancode" id="insorgancode"
                notnull="合作机构"></select>
            </td>

            <td class="reprot_title">
              保险公司
            </td>
            <td class="reprot_common_4">
              <select class="easyui-combobox" style="width:160%" name="pureinsorgancode" id="pureinsorgancode"
                notnull="保险公司">
              </select>
            </td>

            <td class="reprot_title_4">协议对象</td>
            <td class="reprot_common_4">
              <input class="txt" name="protocolobject" id="protocolobject" notnull="协议对像" />
            </td>


            <td class="reprot_title_4">网址</td>
            <td class="reprot_common_4">
              <input class="txt" name="url" id="url" notnull="网址" />
            </td>


          </tr>
          <tr>
            <td class="reprot_title_4">协议起期</td>
            <td class="reprot_common_4">
              <input class="easyui-datebox" style="width: 160%" name="startdate" id="startdate" notnull="协议起期" />
            </td>
            <td class="reprot_title_4">协议止期</td>
            <td class="reprot_common_4">
              <input class="easyui-datebox" style="width: 160%" name="enddate" id="enddate" notnull="协议止期" />
            </td>
            <td class="reprot_title_4">对接人</td>
            <td class="reprot_common_4">
              <input class="txt" name="linkman" id="linkman" notnull="对接人" />
            </td>
            <td class="reprot_title_4">联系电话</td>
            <td class="reprot_common_4">
              <input class="txt" name="linkmobile" id="linkmobile" notnull="联系电话" />
            </td>
          </tr>

        </table>


        <table class="common">
          <tr>
            <td class="reprot_title_4">上报保监口径</td>
            <td style="width: 50%">
              <input class="txt" name="report_remark" style="width: 600px; height: auto" id="report_remark"
                notnull="上报保监口径" />
            </td>
            <td style="width: 9%"></td>
            <td style="width: 15%"></td>
            <td style="width: 9%"></td>
            <td style="width: 15%"></td>
          </tr>
        </table>
        <table class="common">
          <tr>
            <td class="reprot_title_4">开票信息</td>
            <td style="width: 50%">
              <textarea notnull="开票信息" class="txt" style="width: 600px; height: auto" id="invoiceinfo"
                name="invoiceinfo">
            </textarea>
            </td>
            <td style="width: 9%"></td>
            <td style="width: 15%"></td>
            <td style="width: 9%"></td>
            <td style="width: 15%"></td>
          </tr>
        </table>
        <table class="common">
          <tr>
            <td class="reprot_title_4">账号</td>
            <td style="width: 50%">
              <textarea notnull="账号" class="txt" style="width: 600px; height: 118px" id="accountno" name="accountno">
            </textarea>
            </td>
            <td style="width: 9%"></td>
            <td style="width: 15%"></td>
            <td style="width: 9%"></td>
            <td style="width: 15%"></td>
          </tr>
        </table>
        <table class="common">
          <tr>
            <td class="reprot_title_4">备注</td>
            <td style="width: 50%">
                <input class="txt" name="remark" style="width: 600px; height: auto" id="remark"
                notnull="备注" />
            </textarea>
            </td>
            <td style="width: 9%"></td>
            <td style="width: 15%"></td>
            <td style="width: 9%"></td>
            <td style="width: 15%"></td>
          </tr>
        </table>

        <br />
        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" id="protocolInsert"
          onclick="protocolInsert()">协议录入</a>
        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" id="protocolUpdate"
          onclick="protocolUpdate()">协议修改</a>
        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove'" id="protocolDelete"
          onclick="protocolDelete()">协议删除</a>
      </div>

      <div id="protocolDetailDlg" class="easyui-dialog" title="协议信息"
        style="width:700px;height:auto;padding:10px;top:10px" data-options="iconCls: 'icon-save'">

        <div class="upload-box-uw">
          <input type="text" name="textfield" id="textfield" class="upload-txt" />
          <button id="file-view" class="smsbutton">浏览...</button>
          <input type="file" name="myfiles" class="upload-file-uw" multiple id="filename" size="28"
            onchange="updateTextValue()" />


          <button id="file-upload" class="smsbutton" onclick="FileUpload()">
            上传
          </button>
          <button id="file-delete" class="smsbutton" onclick="fileDelete()">
            删除
          </button>
        </div>
        <div>
          <table id="filelist" class="easyui-datagrid" title=""
            style="width: 666px; height: 600px;padding:10px;top:10px"
            data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectonefile">
            <thead>
              <tr>
                <th data-options="field:'filename',width:450">文件名称</th>
                <th data-options="field:'_signdownload',width:170,formatter:signdownload">
                  操作
                </th>
              </tr>
            </thead>
          </table>
        </div>

      </div>
    </body>

  </html>