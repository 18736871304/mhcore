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
	<title>智能核保</title>
	<link rel="stylesheet" href="/css/common/lcl/lib/weui.min.css">
	<link rel="stylesheet" href="/css/common/lcl/lib/jquery-weui.min.css">
	<link rel="stylesheet" href="/css/common/lcl/common.css">
	<link rel="stylesheet" href="/fonts/lcl/iconfont.css">
	<link rel="stylesheet" href="/css/hongkang/smartuw/zhinenghebao.css">
</head>
<body>

<input type="hidden" name="insurebirthday" id="insurebirthday" value="${insurebirthday}">
<input type="hidden" name="insuresex" id="insuresex" value="${insuresex}">
			
<input type="hidden" name="amnt" id="amnt" value="${amnt}">
<input type="hidden" name="prem" id="prem" value="${prem}">
<input type="hidden" name="payendyear" id="payendyear" value="${payendyear}">
<input type="hidden" name="insuyear" id="insuyear" value="${insuyear}">
<input type="hidden" name="payintv" id="payintv" value="${payintv}">
			
<input type="hidden" name="iszjyl" id="iszjyl" value="${iszjyl}">
<input type="hidden" name="isexzl" id="isexzl" value="${isexzl}">
<input type="hidden" name="isdbbjb" id="isdbbjb" value="${isdbbjb}">

<input type="hidden" name="isabzkx" id="isabzkx" value="${isabzkx}">
			
<input type="hidden" name="riskCode" id="riskCode" value="${riskCode}">

<div class="smart-check" id="smartCheck">
	<div class="smart-check-content">
		<div class="content-title">选择告知异常所属的病种模块</div>
		<ul id="questionBox"></ul>
	</div>
	<div class="footer">
		<p>说明：若您有“被保险人健康告知”中问及、但智能核保中没有的疾病或状况，则无法线上投保。</p>
	</div>
</div>
<script src="/js/common/lcl/lib/jquery1.12.4.min.js"></script>
<script src="/js/common/lcl/lib/jquery-weui.min.js"></script>
<script src="/js/common/lcl/common.js"></script>
<script src="/js/hongkang/smartuw/smartCheck.js?v=20191209_01"></script>
</body>
</html>
