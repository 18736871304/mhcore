<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport">
	<meta content="yes" name="apple-mobile-web-app-capable">
	<meta content="black" name="apple-mobile-web-app-status-bar-style">
	<meta content="telephone=no" name="format-detection">
	<title>美华保险服务</title>
	<link rel="stylesheet" href="../../css/life/box.css?v=18080301">
	<script src="../../js/jquery/jquery-3.6.0.min.js"></script>
	<style>
	  html{
	       font-size: calc(100vw/18.75)!important;
	  }
	</style>
</head>
<body>
<div class="success-wrap">
   <div class="top-wrap textAlgin-center">
        <img src="../../images/life/tz-fail-icon.png" alt="">
     <p class="txt-1">投保未成功</p>
     <div class="txt-3">
                   <span>提示：${message }</span>
                   <div class="tishi" align="left">
                   <p>温馨提示： 很抱歉，您的保单投保没有成功,请再次</p>
                   <p>核实信息和账户余额，您还可以直接与我们的保险</p>
                   <p>经纪人直接联系。</p>
                   </div>
     </div>
   </div>
   <div class="mid2-wrap">
   </div>
   <div class="bot-wrap textAlgin-center">
     <img src="../../images/life/mhwx.png" alt="">
     <p class="txt-1">长按或扫描二维码</p>
     <p class="txt-1" style="margin-top: 0.0rem;">关注保单信息进展</p>
   </div>
</div>
</body> 
</html>