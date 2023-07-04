/**
 @Date 2019-12-17
 @Project  service
 */

var sex_input = 'm';

var count = 60; //间隔函数，1秒执行
var timer; //timer变量，控制时间
var curCount;//当前剩余秒数
function sendMessage() {
    curCount = count;
    $("#btnSendCode").attr("disabled", "true");
    $("#btnSendCode").text(curCount + " 秒");
    timer = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次
}
function SetRemainTime() {
    if (curCount === 0) {
        window.clearInterval(timer);//停止计时器
        $("#btnSendCode").removeAttr("disabled");//启用按钮
        $("#btnSendCode").text("重新发送");
    }
    else {
        curCount--;
        $("#btnSendCode").text(curCount + " 秒");
    }
}
$(function () {
    $('#btnSendCode').on('click', function () {
        var mobile =$('#mobile').val();
        if(!validatemobile(mobile)){
            return false;
        }
        
        sendMessage();
        
        sendRequest("/user/checkno.do?mobilenumber="+mobile,null,function (data) 
		{
		},function(){});
    });
    $('#submit').on('click',function () 
    {
        var name = $('#name').val();
        var age = $('#age').val();
        var mobile =$('#mobile').val();
        var code =$('#code').val();
        if(!isChinese(name) || name.length >= 5){
            toast({
                message: '请输入正确的姓名！',
                time: 1500
            })
            return false;
        }
        if(age.length===0 || isNaN(age)){
            toast({
                message: '请输入正确的年龄！',
                time: 1500
            });
            return false;
        }
        if(!validatemobile(mobile)){
            return false;
        }
        if (typeof (code - 0) !== 'number' || code.length !== 4) {
            toast({
                message: '请输入正确的验证码！',
                time: 1500
            });
            return false;
        }
        
        var transdata = 
    	{
    		"name":name,
    		"mobile":mobile,
    		"checkno":code,
    		"channelCode":$('#channelCode').val(),
    		"pageType":$('#pageType').val(),
    		"planId":$('#planId').val(),
    		"sex":sex_input,
    		"age":age,
    		"payid":$('#payid').val()
    	};
        
        sendRequest("/life/activity/getChannelData.do",transdata,function (data) 
    	{
    		var obj = JSON.parse(data);
    	   	console.log(obj);
    	   	if(obj.code == '00'||obj.code == '02')
    	   	{
    	   		window.location.href = "/life/activity/oneyuango_success.do"
    	   	}
    	   	else
    	   	{
    	   		toast({message: obj.message,time: 1500});
    	   	}
    	},
    	function(){});
        
        return false;
    });
});

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

function sexclick(sex)
{
	sex_input = sex;
}
