<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html  style="font-size: calc(100vw/ 18.75);">
<head>
    <meta charset="utf-8" />
    <title>保单列表</title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width">
    <meta name="format-detection" content="telephone=no" />
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="full-screen" content="yes">
    <meta name="x5-fullscreen" content="true">
    <link rel="stylesheet" href="../../css/user/staff/public.css?v=20180717" />
    <link rel="stylesheet" href="../../css/user/staff/policy.css?v=20180721" />
    <link rel="stylesheet" type="text/css" href="../../css/user/staff/dropload.css" />
</head>

<body>
<div class="main d_footback policyBox">
    <header class="">
        <span>我的保单</span>
    </header>
    <!--START  选项卡-->
    <ul class="tabBox d_boxSz js_live_tab" obj="js_live_tablist">
        <li class="cur">
            <a>保障中</a>
        </li>
        <li>
            <a>已终止</a>
        </li>
        <li>
            <a>可续保</a>
        </li>
        <li>
            <a>待处理</a>
        </li>
    </ul>
    <!--END    选项卡-->
    <!--START  选项卡内容-->
    <div class="tabbody js_tabbody">
        <!--START  有效-->
        <div class="tabCon js_live_tablist cur">
            <ul>
                <!--<li class="row d_boxSz">
                    <a href="policy_self.html">
                        <div class="title">安心e生·无忧百万医疗</div>
                        <i class="failure"></i>
                        <p class="name">被保人：<span>杜燕</span></p>
                        <p class="time">保障期限：<span>2018年5月4日至2019年5月4日</span></p>
                    </a>
                </li>-->
            </ul>
        </div>
        <!--END    有效-->
        <!--START  已终止-->
        <div class="tabCon js_live_tablist">
            <ul></ul>
        </div>
        <!--END    已终止-->
        <!--START  可续保-->
        <div class="tabCon js_live_tablist">
            <ul></ul>
        </div>
        <!--END    可续保-->
        <!--START  待处理-->
        <div class="tabCon js_live_tablist">
            <ul></ul>
        </div>
        <!--END    待处理-->
    </div>

    <!--END    选项卡内容-->
</div>
</body>
<script type="text/javascript" src="../js/jquery/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/common/staff/dropload.js"></script>
<script type="text/javascript" src="../js/common/staff/public.js"></script>
<script type="text/javascript" src="../js/common/staff/policy.js?=20191001_01"></script>

</html>