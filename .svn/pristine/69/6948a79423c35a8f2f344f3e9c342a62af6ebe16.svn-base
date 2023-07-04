<%@ page contentType="text/html;charset=utf-8"%>

<script>

var tbuzserialno;

var tbuztype;

function commUploadInit()
{
	$('#commUploadDlg').dialog('close');
}

function discommUpload(buzserialno,buztype)
{
	$('#commUploadDlg').dialog('open');
	$("#commUploadDlg").panel("move",{top:$(document).scrollTop() + ($(window).height()-400) * 0.5});
	$(".window-shadow").hide();
	
	tbuzserialno = buzserialno;
	tbuztype = buztype;
}

function commUploadRE()
{
	$('#commUploadDlg').dialog('close');
}

function dataFileUpload()
{
	if(tbuzserialno==null)
	{
		$.messager.alert('Debug信息','未进行弹出框初始化！','error');
		return;	
	}
	
	tparam = new Object();
	tparam.buzserialno = tbuzserialno;
	tparam.buztype = tbuztype;
	
	ajaxFileUpload('filename', 'commonFileUpload.do', tparam, null, null,filesaveSuss);
	//上传完毕之后，把浏览框中的文本清除。
	$('#textfield').val($('#filename').val());
}

</script>

<div id="commUploadDlg" class="easyui-dialog" title="上传操作" 
		style="width:600px;height:300px;padding:10px;top:300px;left:250px" 
		data-options="iconCls: 'icon-save',">

	<table>
		<tr>
			<td class="dstitle">数据上载</td>
		</tr>
	</table>
	<!-- 上传信息展示区域 -->
	<div class="upload-box">
		<input type='text' name='textfield' id='textfield' class='upload-txt' />
		<button id="file-view" class="smsbutton">浏览...</button>
		<input type="file" name="myfiles" class="upload-file" id="filename" size="28"
			onchange="document.getElementById('textfield').value=this.value.substr(12)" />
		<button id="file-upload" class="smsbutton" onclick="dataFileUpload()">上传</button>

	</div>

</div>