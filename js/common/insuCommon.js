//ajax
function sendRequest(url, data, success, error) 
{
    $.ajax({
        url: url,
        type: "post",
        async: true,
        data: data ? data : {},
        beforeSend:function(){
           $(".loading").show();
        },
        success: function (data) {
            if (success) {
                success(data);
            }
        },
        error: function (data) {
            if (error) {
                error(data);
            }
        },
        complete:function(){
           $(".loading").hide();
        }
    });
}

function validatemobile(mobile)
{
	if(mobile==null||mobile=="")
    {
	   $(".pop").show();
       $(".mask").show();
       $(".pop span").text("请输入手机号码！");
       return false;
    }
	
    if(mobile.length==0)
    {
       $(".pop").show();
	   $(".mask").show();
	   $(".pop span").text("请输入手机号码！");
       return false;
    }
    
    if(mobile.length!=11)
    {
    	$(".pop").show();
		$(".mask").show();
		$(".pop span").text("请输入有效的手机号码！");
        return false;
    }
    
    var myreg = /^0?1[3|4|5|7|8][0-9]\d{8}$/;
    if(!myreg.test(mobile))
    {
    	$(".pop").show();
		$(".mask").show();
		$(".pop span").text("请输入有效的手机号码！");
        return false;
    }
    return true;
}


function commonMobileCheck(mobile)
{
	if(mobile.length!=11)
    {
    	return false;
    }
    
    var myreg = /^0?1[3|4|5|7|8][0-9]\d{8}$/;
    if(!myreg.test(mobile))
    {
    	return false;
    }
    return true;
}

function checknotnull(checkid,checkstr)
{	
	if(checkid.val()==""||checkid.val()==null)
	{
		$(".pop").show();
		$(".mask").show();
		$(".pop span").text(checkstr);
		return false;
	}
	return true;
}