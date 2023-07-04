<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>注册</title>
	  <link rel="stylesheet" href="../css/ajaxbefore.css">
	  <script src=" ../js/jquery/jquery-3.6.0.min.js"></script>
	  <script src=" ../js/common/insuCommon.js"></script>
<style type="text/css">
html,body {
	font-family: Arial;
	font-size: calc(100vw/ 18.75) !important;
	-webkit-text-size-adjust: none;
	color: #49496A;
	background: #fff;
}

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.login {
	margin-top: 1rem;
}

.loginItem {
	position: relative;
	margin: 0px;
	width: 100%;
	height: 2.2rem;
	line-height: 2.1rem;
	margin-top: 0.5rem;
	border-bottom: 1px solid #f2f2f2;
	padding: 0 1.25rem;
}

.loginInput {
	border: none;
	outline: none;
	line-height: 1.1rem;
	width: 14.5rem;
	font-size: 0.8rem;
	padding-left: 0.8rem;
	position: relative;
	top: -0.2rem;
}
.getCode{
	position: absolute;
	right: 1.25rem;
	top: 0.15rem;
	width: 3.5rem;
	height: 1.5rem;
	border:1px solid #e1e1e1;
	border-radius:4px;
	background: #fff;
	font-size: 0.5rem;
	color:#dc220d;
}
.forget{
	color: #d43333;
	text-align: right;
	padding-right: 35px;
	font-size: 0.8rem;
}
.goRegister{
	background-color: #dc220d;
	color: #fff;
	text-align: center;
	margin: 2.1rem 1.25rem 0;
	border-radius: 4px;
	line-height: 2.2rem;
	font-size:0.8rem;
 	
}
.zc{
	text-align: center;
	color: gray;
	font-size: 0.8rem;
}
.register{
	color: #d43333;
}
.mask{
    position: fixed;
    top: 0;
    left: 0;
    background: rgba(0, 0, 0, 0.5);
    width: 100%;
    height: 100%;
    z-index: 10000;
    display: none;
}
.pop {
    width: 12rem;
    border-radius: 5px;
    position: fixed;
    z-index: 5;
    left: 50%;
    margin-left: -6rem;
    top: 40%;
    margin-top: -75px;
    background: #fff;
    border: 1px solid #e2e2e2;
}
.pop span {
    max-height: 8rem;
    overflow-y: scroll;
    display: block;
    line-height: 160%;
    text-align: center;
    font-size: 0.65rem;
    padding: 1.4rem 0.6rem;
    color: #222;
}
.pop-sure {
    color: #dc220d;
    text-align: center;
    height: 43px;
    line-height: 43px;
    border-top: 0.025rem solid #e2e2e2;
    display: block;
    font-size: 0.8rem;
}
.loginHint_icon {
	display: inline-block;
}
</style>
</head>
<body>
	<!-- warning-->
	<div class="mask">
	    <div class="pop">
	        <span class="warn">错误警告</span>
	    	<a class="pop-sure">确定</a>
	    </div>
	</div>

	<!--加载动画-->
    <div class="loading">
        <div class="sk-circle">
            <div class="sk-circle1 sk-child"></div>
            <div class="sk-circle2 sk-child"></div>
            <div class="sk-circle3 sk-child"></div>
            <div class="sk-circle4 sk-child"></div>
            <div class="sk-circle5 sk-child"></div>
            <div class="sk-circle6 sk-child"></div>
            <div class="sk-circle7 sk-child"></div>
            <div class="sk-circle8 sk-child"></div>
            <div class="sk-circle9 sk-child"></div>
            <div class="sk-circle10 sk-child"></div>
            <div class="sk-circle11 sk-child"></div>
            <div class="sk-circle12 sk-child"></div>
        </div>
    </div>
	
	<!--main page-->
    <div class="login">
    	<div class="loginItem p">
			<img class="loginHint_icon" src="../images/number.png" alt="手机号" style="width: 0.9rem;height: 0.9rem;">
	    	<input class="loginInput" type="text" name="mobilenumber" id = "mobilenumber" placeholder="请输入注册的手机号">
    	</div>
    	<div class="loginItem p">
    		<img class="loginHint_icon" src="../images/code.png" alt="验证码" style="width: 0.85rem;height: 0.9rem;">
    		<input class="loginInput" type="text" name="checkno" id = "checkno" placeholder="请输入手机验证码">
   			<input class="getCode" type="button" id="btn" value="获取验证码" onclick="getmsg()" />
    	</div>
    	<div class="loginItem p">
    		<img class="loginHint_icon" src="../images/password.png" alt="输入密码"  style="width: 0.8rem;height: 0.9rem;">
    		<input class="loginInput" type="password" name="password" id = "password" placeholder="请输入密码">
    	</div>
    	<div class="loginItem p">
    		<img class="loginHint_icon" src="../images/confirm.png" alt="确认密码" style="width: 0.8rem;height: 0.9rem;">
    		<input class="loginInput" type="password" name="confirmpassword" id = "confirmpassword" placeholder="请输入确认密码">
    	</div>
    	<input type="hidden" name="backUrl" id = "backUrl" value = ${backUrl}>
    </div>
    <div>
    	<p class="bd goRegister">注 册</p>
    </div>

<script type="text/javascript">

var countdown=60; 

function sendemail()
{
    var obj = $("#btn");
    settime(obj);
}
function settime(obj) 
{   
	if (countdown == 0) 
    {
    	obj.attr('disabled',false);  
        obj.val("免费获取验证码");
        countdown = 60; 
        return;
    } 
    else
    {
        obj.attr('disabled',true);
        obj.val("重新发送(" + countdown + ")");
        countdown--; 
    } 
	setTimeout(function() 
	{ 
    settime(obj) 
    },1000) 
}

function getmsg()
{
	var mobile = $("#mobilenumber").val();
	
	if(!validatemobile(mobile))
	{
		return false;	
	}
	
	sendemail();
	
	sendRequest("../user/checkno.do?mobilenumber="+mobile,null,function (data) 
	{
    },function(){});
}
			
$('.bd').click(function()
{
	var mobile = $("#mobilenumber").val();
	
	if(!validatemobile(mobile))
	{
		return false;	
	}
	
	if(!checknotnull($("#checkno"),"请填写验证码！如还有问题，请联系客服"))
	{
		return false;
	}
			
	if(!checknotnull($("#password"),"请填写密码！如还有问题，请联系客服"))
	{
		return false;	
	}
			
	if(!$("#password").val()==$("#confirmpassword").val())
	{
		alert("密码和确认密码不一致！如还有问题，请联系客服");
	}
	
	$("#backUrl").val('${backUrl}');
	
	var transdata = 
	{
		"mobilenumber":$("#mobilenumber").val(),
		"checkno":$("#checkno").val(),
		"password":$("#password").val(),
		"confirmpassword":$("#confirmpassword").val()
	};
	
	sendRequest("../user/registerin.do",transdata,function (data) 
	{
		var obj = JSON.parse(data);
    	console.log(obj);
    	if(obj.code == '00')
    	{
    		if($("#backUrl").val()!=null&&$("#backUrl").val()!="")
	   		{
	   			window.location.href = $("#backUrl").val();
	   		}
	   		else
	   		{
	   			window.location.href = "../life/common/queryList.do";
	   		}
    	}
    	else
    	{
    		$(".pop").show();
            $(".mask").show();
            $(".pop span").text(obj.message);
    	}
	},
	function(){});
			
});
		
$('.pop-sure').click(function(){
	$('.mask').css("display","none");
});

</script>
</body>
</html>