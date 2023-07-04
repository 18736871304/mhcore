<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="format-detection" content="telephone=no, email=no">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, viewport-fit=cover">
    <title>签名</title>
    <link rel="stylesheet" href="../css/user/agreement/normalize.css?v=20190912_01">
    <link rel="stylesheet" href="../css/user/agreement/common.css?v=20190912_01">
    <link rel="stylesheet" href="../css/user/agreement/signature.css?v=20190912_01">
</head>
<body>
<div class="main">
    <div class="content">
        <div class="signature-top">
            <div class="signature-content-wraper">
                            <div class="signature-header">
                                <div class="signature-header-content">
                                    <p>尊敬的${name}<span></span>:</p>
                                    <p style="text-indent: 2em">您好，感谢您选择美华保险！</p>
                                    <p style="text-indent: 2em">为了维护您的合法权益，请您使用<span style="color: #dc220d;">正楷字体</span>签字确认投保，感谢您的支持！</p>
                                </div>
                            </div>
                            <div class="signature-wraper">
                                <h3>投保人签名</h3>
                                <div class="signature-content" id="signatureArea"></div>
                            </div>
            </div>
            <div class="submit-success-wraper hide">
                <div class="header">
                    <div class="logo">
                        <!--<img src="../images/user/agreement/meihua_logo.png">-->
                    </div>
                    <div class="title-img"></div>
                </div>
                <div class="submit-success-content">
                    <div class="submit-success-content-img">
                        <img src="../images/user/agreement/submit_success.png">
                    </div>
                    <div class="submit-success-content-text">
                        	提交成功！
                    </div>
                </div>
            </div>
        </div>

        <div class="signature-bottom">
            <div class="signature-button-submit-wraper">
                <button id="resetButton">重新签名</button>
                <button class="submit-button" id="submitButton" disabled="disabled">确认提交</button>
            </div>
            <div class="signature-button-check-agreement hide">
                <button id = "queryagreement">查看服务协议</button>
            </div>
            <input hidden = "" id = "buzid" value = "${buzid}">
            <input hidden = "" id = "filename">
        </div>
    </div>
</div>
<script src="../js/user/agreement/lib/jQuery-1.12.4.min.js"></script>
<script src="../js/user/agreement/lib/jq-signature.min.js"></script>
<script src="../js/user/agreement/signature.js?v=20190917"></script>
<script>
var issign = '${issign}';
var pdfurl = '${pdfurl}';

$(function () 
{
	if(issign=="00")
	{
		//display success, hide signature
        $('.signature-content-wraper').hide()
        $('.submit-success-wraper').show()
        $('.signature-button-submit-wraper').hide()
        $('.signature-button-check-agreement').show()
        //change .main background color
        $('.main').css({
            background: '#fff'
        })
        
        $('#filename').val(pdfurl)
	}
})
</script>
</body>
</html>
