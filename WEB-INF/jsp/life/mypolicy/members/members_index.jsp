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
    <title>VIP会员专享</title>
    <link rel="stylesheet" href="/css/mypolicy/policytrust/lib/weui.min.css">
    <link rel="stylesheet" href="/css/mypolicy/policytrust/lib/jquery-weui.min.css">
    <link rel="stylesheet" href="/css/mypolicy/members/common.css?v=20191218_01">
    <link rel="stylesheet" href="/css/mypolicy/members/index.css?v=20191216">
</head>
<body>
<div class="main">
    <div class="index-page">
        <div class="index-header">
            <div class="service-wrap">
                <div class="service-box">
                    <div class="service-img"><img id="serviceImg" src="${photourl}"></div>
                    <div class="service-name">我的管家：<span id="serviceName">${realname}</span></div>
                </div>
                <div class="vip-right-top-text">健康管理金卡</div>
                <div class="vip-right-bottom-text"><img src="/images/mypolicy/members/vip.png"></div>
            </div>
        </div>
        <div class="content">
            <div class="content-box-wrap">
                <ul class="content-box" id="contentBox">
                </ul>
            </div>
        </div>
    </div>
</div>
<script>
var ismember = '${ismember}';
</script>
<script src="/js/mypolicy/policytrust/lib/jquery1.12.4.min.js"></script>
<script src="/js/mypolicy/policytrust/lib/jquery-weui.min.js"></script>
<script src="/js/mypolicy/members/common.js?v=20191218"></script>
<script src="/js/mypolicy/members/index.js?v=20191104"></script>
</body>
</html>