<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta content="yes" name="apple-mobile-web-app-capable">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<meta name="format-detection" content="telephone=no, email=no">
	<meta name="viewport"
		  content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, viewport-fit=cover">
	<title>服务委托协议</title>
	<link rel="stylesheet" href="../css/user/agreement/normalize.css?v=20190912_01">
	<link rel="stylesheet" href="../fonts/user/useragreement/iconfont.css?v=20190912_01">
	<link rel="stylesheet" href="../css/user/agreement/common.css?v=20190912_01">
	<link rel="stylesheet" href="../css/user/agreement/agreement.css?v=20190912_01">
</head>
<body>
<div class="main">
	<div class="header">
		<div class="logo">
			<img src="../images/user/agreement/meihua_logo.png">
		</div>
		<div class="title-img">
			<img src="../images/user/agreement/agreement_title.png">
		</div>
	</div>
	<div class="content">
		<div class="content-wraper">
			<div class="content-title">客户服务委托协议</div>
			<div class="content-form">
				<div class="input-wraper">
					<span class="input-lable">姓名</span>
					<span class="input-content"><input type="text" placeholder="请输入姓名" id="uName"></span>
				</div>
				<div class="input-wraper">
					<span class="input-lable">身份证号</span>
					<span class="input-content"><input type="text" placeholder="请输入身份证号" id="idCard"></span>
				</div>
				<div class="input-wraper">
					<span class="input-lable">手机号</span>
					<span class="input-content"><input type="number" maxlength="11" placeholder="请输入手机号" id="cellphoneNumber"></span>
				</div>
				<div class="varify-code-wraper">
					<div class="input-wraper varify-code">
						<span class="input-lable">验证码</span>
						<span class="input-content">
						<input type="number" placeholder="请输入验证码" id="varifyCode">
					</span>
					</div>
					<div class="input-wraper varify-code varify-code-submit-wraper" id="sendVarifyCode">
						<span class="varify-code-submit"><button id="sendVarifyCodeButton">发送</button></span>
					</div>
				</div>
			</div>
			<div class="content-submit">
				<button id="nextButton">下一步</button>
			</div>
		</div>
	</div>
</div>
<input hidden = "" id = "openid" value = "${openid}">
<div class="loading hide">
	<div class="loading-wraper">
		<div class="loading-icon">
			<i class="iconfont icon-loading"></i>
		</div>
	</div>
</div>
<script src="../js/user/agreement/lib/jQuery-1.12.4.min.js"></script>
<script src="../js/user/agreement/agreement.js?v=20191107"></script>
</body>
</html>
