<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="format-detection" content="telephone=no, email=no">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, viewport-fit=cover">
    <title>登录</title>
    <link rel="stylesheet" href="/css/mypolicy/policytrust/lib/weui.min.css">
    <link rel="stylesheet" href="/css/mypolicy/policytrust/lib/jquery-weui.min.css">
    <link rel="stylesheet" href="/css/mypolicy/members/common.css">
    <link rel="stylesheet" href="/css/mypolicy/members/login.css">
</head>
<body>
<div class="main login-page">
    <div class="login-title">
        登录
    </div>
    <div class="login-form-wrap">
        <div class="login-form">
            <div class="weui-cells weui-cells_form">
                <div class="weui-cell">
                    <div class="weui-cell__hd login-icon-box">
                        <label class="weui-label">
                            <img src="/images/mypolicy/members/icon_account.png">
                        </label>
                    </div>
                    <div class="weui-cell__bd">
                        <input id="nameInput" class="weui-input" type="text" placeholder="请输入手机号码">
                    </div>
                </div>
                <div class="weui-cell weui-cell_vcode">
                    <div class="weui-cell__hd login-icon-box">
                        <label class="weui-label">
                            <img src="/images/mypolicy/members/icon_password.png">
                        </label>
                    </div>
                    <div class="weui-cell__bd">
                        <input id="varifyCodeInput" class="weui-input" type="tel" placeholder="请输入验证码">
                    </div>
                    <div class="weui-cell__ft">
                        <button id="codeButton" class="weui-vcode-btn varify-code-button" style="color: #dc220d;font-size: 14px;">获取验证码</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="login-button">
            <button id="loginButton">登录</button>
        </div>
    </div>
</div>
<script src="/js/mypolicy/policytrust/lib/jquery1.12.4.min.js"></script>
<script src="/js/mypolicy/policytrust/lib/jquery-weui.min.js"></script>
<script src="/js/mypolicy/members/common.js"></script>
<script src="/js/common/insuCommon.js"></script>
<script>
    $(function () {
        //Toast 默认时间
        var timer = null

        var loginFunc = {
            init: function () {
                this.bindEvent()
            },
            bindEvent: function () {
                var that = this
                // 重发验证码
                $('#codeButton').on('click', function () 
                {
                	var nameInput = $('#nameInput').val();
                	
                	/*
                	if(!validatemobile(nameInput))
                    {
                    	return false;
                    }
                	*/
                	console.log('codeButton')
                    var button = $(this)
                    var retryTime = 60
                    button.attr('disabled', 'disabled')
                    button.text(retryTime + '秒后重发')
                    clearInterval(timer)
                    timer = setInterval(function () {
                        retryTime--
                        button.text(retryTime + '秒后重发')
                        if (retryTime <= 0) {
                            button.removeAttr('disabled')
                            button.text('获取验证码')
                            clearInterval(timer)
                        }
                    }, 1000)
                    
                    sendRequest("/user/checkno.do?mobilenumber="+nameInput,null,function (data) 
            		{
            		},function(){});
                })
                $('#loginButton').on('click', function () 
                {
                    console.log('loginButton')
                    if (!that.varify()){
                        return false
                    }
                    //TODO  此处登录逻辑
                })
            },
            varify: function () {
                var nameInput = $('#nameInput').val()
                var varifyCodeInput = $('#varifyCodeInput').val()
                console.log(nameInput, varifyCodeInput)
                
                /*
                if(!validatemobile(nameInput))
                {
                	return false;
                }
                */
                
                if (!varifyCodeInput) {
                    $.toptip("请输入验证码", 2000, "error")
                    return false
                }
                
                var transdata = 
				{
					"checkno":varifyCodeInput,
					"mobile":nameInput,
				};
                
                sendRequest("/user/member_logon.do",transdata,function (data) 
        		{
        			var obj = JSON.parse(data);
        		   	console.log(obj);
        		   	if(obj.code == '00')
        		   	{
        		   		location.href = "/life/common/members.do";
        		   	}
        		   	else
        		   	{
        		   		$.toptip(obj.message, 2000, "error")
        		   		return false;
        		   	}
        		},
        		function(){});
                
                return true
            }
        }
        loginFunc.init()
    })
    
    function validatemobile(mobile)
	{
		if(mobile==null||mobile=="")
	    {
		   $.toptip('请输入手机号码！', 2000, 'error')
		   return false;
	    }
		
	    if(mobile.length==0)
	    {
		   $.toptip('请输入手机号码！', 2000, 'error')
		   return false;
	    }
	    
	    if(mobile.length!=11)
	    {
	    	$.toptip('请输入有效的手机号码！', 2000, 'error')
			return false;
	    }
	    
	    var myreg = /^0?1[3|4|5|7|8][0-9]\d{8}$/;
	    if(!myreg.test(mobile))
	    {
	    	$.toptip('请输入有效的手机号码！', 2000, 'error')
			return false;
	    }
	    return true;
	}
</script>
</body>
</html>
