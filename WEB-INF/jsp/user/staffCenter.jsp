<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html  style="font-size: calc(100vw/ 18.75);">
<head>
    <meta charset="UTF-8">
    <title>个人中心</title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width">
    <meta name="format-detection" content="telephone=no" />
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="full-screen" content="yes">
    <meta name="x5-fullscreen" content="true">
    <script src="../js/jquery/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="../../css/user/staff/public.css?v=20180717">
    <link rel="stylesheet" href="../../css/user/staff/usercenter.css?v=20180722">
</head>

<body>
<div class="main usercenter">
    <!--START  头部-->
    <div class="haedBox d_boxSz">
        <div class="imgbox d_left">
            <img src="${thumbnail}"/>
        </div>
        <div class="textbox d_left">
            <p class="name">${realname}</p>
            <p class="info"><i class="grade"></i><span id="title">${title}</span></p>
            <p class="info"><i class="job_title"></i><span id="job">${diploma}</span></p>
            <p class="jobnum"><i class="job_num"></i>${userid}</p>
        </div>
        <div class="setbox">
            <a class="" href="../../staff/toScSetting.do"><i></i></a>
        </div>
    </div>
    <!--END    头部-->
    <!--START  列表-->
    <div class="listbox">
        <a class="row" href="../../staff/staffProductList.do">
            <i class="icon safe_pro"></i><span>保险产品</span>
        </a>
        <a class="row" href="../../staff/staffPolicyList.do">
            <i class="icon policy"></i><span>我的保单</span>
        </a>
        <a class="row" href="/staff/plan/planList.do">
            <i class="icon plan"></i><span>计划书</span>
        </a>
    </div>
    <!--END    列表-->
    <div class="quit d_boxSz"><span><a style="text-decoration: none;" href = '../../user/staffLogout.do'>退出</a></span></div>
</div>
<script type="text/javascript">
    $(function () {
        var title = '${title}';
        var diploma = '${diploma}';
        var c_title = "";
        var c_diploma = "";
        if(title.length>16){
            c_title = title.substring(0,15);
            $('#title').html(c_title+'等');
        }
        if(diploma.length>16){
            c_diploma = diploma.substring(0,15);
            $('#job').html(c_diploma+'等');
        }
    });
</script>
</body>
</html>
