function intentionInsert(mobile,riskcode,insorgancode)
{
	if(mobile==null||mobile=="")
	{
		alert("请输入手机号码！");
	    return false;
	}
		
	if(mobile.length==0)
	{
		alert("请输入手机号码！");
	    return false;
	}
	   
	if(!validatemobile(mobile))
	{
	   alert("请输入有效的手机号码");
	   return false;	
	}
	   
	var transdata = 
	{
		"mobile":mobile,
		"riskcode":riskcode,
		"insorgancode":insorgancode
	};
	   
	sendRequest("../../userintention/userintentionInsert.do",transdata,function (data) 
	{
	    var obj = JSON.parse(data);
	    console.log(obj);
		if(obj.code == '00')
		{
		   $('.step2').show().siblings().hide();
		}
		else
		{
 		   
		}
	},
	function(){});
}