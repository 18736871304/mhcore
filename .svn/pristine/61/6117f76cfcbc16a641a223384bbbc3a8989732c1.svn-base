<%@ page contentType="text/html;charset=utf-8"%>
<th data-options="field:'_operate',width:70,formatter:queryDetail">查看详情</th>
<script>
function queryDetail(val,row,index)
{
	return '<a href="#" onclick="openDlg('+index+')">查看详情</a>';
}

function openDlg(index)
{
	var rows=$('#userList').datagrid('getRows');//获取所有当前加载的数据行
	var row=rows[index];
	
	disuserDetailDlg(row);
}
</script>