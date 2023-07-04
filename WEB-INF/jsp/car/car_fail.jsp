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
    <link rel="stylesheet" href="../../css/life/box.css?v=18080302">
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
            <span>${message}</span>
        </div>
    </div>
</div>
</body>
</html>