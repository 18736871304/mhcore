function DocNoCheck(startno,endno)
{
	if(startno==''||endno=='')
	{
		$.messager.alert('操作提示','起止号码都不能为空！','error');
		return false;		
	}
	
	if(startno.length!=endno.length)
	{
		$.messager.alert('操作提示','起止号码的长度不一致！','error');
		return false;
	}  
	if(!isDocNo(startno))
	{
		$.messager.alert('操作提示','起始号码格式非法，编号的开头可以是字母或者数字，其后只能是数字流水号！','error');
		return false;
	}
	if(!isDocNo(endno))
	{
		$.messager.alert('操作提示','终止号码格式非法，编号的开头可以是字母或者数字，其后只能是数字流水号！','error');
		return false;
	}
	
	var patrn=/[a-zA-Z]/; 
	var abcLength=0;
	for(var i=0;i<startno.length;i++)
	{
		if(patrn.exec(startno.substring(i,i+1))!=null)
		{
			abcLength=abcLength+1;
			if(startno.substring(i,i+1)!=endno.substring(i,i+1))
			{
				$.messager.alert('操作提示','起止号码的开头字母不一致！','error');
				return false;
			}
		}
	}
	for(var i=abcLength;i<endno.length;i++)
	{
		if(patrn.exec(endno.substring(i,i+1))!=null)
		{
			if(startno.substring(i,i+1)!=endno.substring(i,i+1))
			{
				$.messager.alert('操作提示','起止号码的开头字母不一致！','error');
				return false;
			}
		}
	}
	return true;
}
//编号的开头可以是字母，而后只能是数字流水号
function isDocNo(startNo) 
{
  var patrn=/^[a-zA-Z]*[0-9]+$/; 
  if (patrn.exec(startNo)==null) 
  {
	  return false;
  }
  return true;
}
