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
    <title>1元掌握全国产品对比</title>
    <link rel="stylesheet" href="/css/activity/1yuango/normalize.css?v=20191223">
    <link rel="stylesheet" href="/css/activity/1yuango/common.css?v=20191223">
    <link rel="stylesheet" href="/css/activity/1yuango/form.css?v=20191223">
</head>
<body>

<input type="hidden" style="display:none" class="channelCode" id="channelCode" value="${channelCode}">
<input type="hidden" style="display:none" class="pageType" id="pageType" value="${pageType}">
<input type="hidden" style="display:none" class="planId" id="planId" value="${planId}">
<input type="hidden" style="display:none" class="payid" id="payid" value="${payid}">

<div class="main">
	<div class="page">
		<form action="#" class="form">
			<div class="input name">
				<span class="left">姓名</span>
				<input class="right" type="text" placeholder="请输入 " name="name" id="name">
			</div>
			<div class="input gender">
				<span class="left">性别</span>
				<div class="right">
					<div class="radio active" >
						<input  id="male" type="radio" value="0" name="gender" checked onclick = "sexclick('m')">
						<label  for="male" class="radio-label">男士</label>
					</div>
					<div class="radio" >
						<input  id="female" type="radio"  value="1" name="gender" onclick = "sexclick('f')">
						<label  for="female" class="radio-label">女士</label>
					</div>
				</div>
			</div>
			<div class="input age">
				<span class="left">年龄</span>
				<input class="right" type="tel" placeholder="请输入" name="age" id="age">
			</div>
			<div class="input mobile">
				<span class="left">手机号码</span>
				<input class="right" type="tel" placeholder="请输入" name="mobile" maxlength=11 id="mobile">
			</div>
			<div class="input code">
				<span class="left">验证码</span>
				<input class="right" type="tel" placeholder="请输入" name="code" id="code">
				<button class="codeText" type="button" id="btnSendCode" >获取验证码</button>
			</div>
			<div class="submit">
				<input type="submit" id="submit">
			</div>
		</form>
	</div>
</div>
<script src="/js/common/lcl/lib/jquery1.12.4.min.js"></script>
<script src="/js/activity/1yuango/common.js"></script>
<script src="/js/activity/1yuango/form.js?v=20200104"></script>
</body>
</html>
