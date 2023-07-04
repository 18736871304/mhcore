<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="zh">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>2020家庭保险方案免费领取</title>
  <script src="/js/activity/common/flexible.js"></script>
  <script type="text/javascript" src="/js/20190824/jquery-1.7.1.min.js"></script>
  <link rel="stylesheet" href="/css/activity/baidu/0024/toast.css">
  <link rel="stylesheet" href="/css/activity/baidu/0024/init.css">
  <link rel="stylesheet" href="/css/activity/baidu/0024/index.min.css">
</head>
<body>
  <div class="content">
    <div class="img_box_01">
      <img src="/images/activity/baidu/0024/01.jpg" alt="" class="img_01">
      <img src="/images/activity/baidu/0024/02.gif" alt="" class="img_02">
      <img src="/images/activity/baidu/0024/03.gif" alt="" class="img_03">
      <img src="/images/activity/baidu/0024/04.jpg" alt="" class="img_01">

    </div>
    <form class="form_box" id="topForm">
    	<input type="hidden" style="display:none" class="channelCode" id="channelCode" value="${channelCode}">
		<input type="hidden" style="display:none" class="pageType" id="pageType" value="${pageType}">
		<input type="hidden" style="display:none" class="planId" id="planId" value="${planId}">
      <div class="list">
        <input type="text" placeholder="请输入姓名" name="name">
      </div>
      
      <div class="list">
          <input type="text" placeholder="请输入手机号码" name="phone">
      </div>

      <div class="list flexbox get_code">
          <input type="text" placeholder="请输入验证码" name="code">
          <div class="btn">
            获取验证码
          </div>
      </div>
      <div class="list submit">
        <div class="btn" id="topSub">
          0元领取保险方案
        </div>
        <div class="text">*本人同意美华保险致电联系，提供保险相关服务</div>
      </div>
    </form>	  
	<div class="img_box_03">
      <img src="/images/activity/baidu/0024/05.jpg" alt="" class="img_02">
      <img src="/images/activity/baidu/0024/06.jpg" alt="" class="img_03">
	  <img src="/images/activity/baidu/0024/07_01.jpg" alt="" class="img_03">
    </div>
	

    

  
    


    <div class="img_box_06">
      <img src="/images/activity/baidu/0024/09.png" alt="" class="img_01">
    </div>

  </div>

  <div class="to_top">
    0元领取保险方案
  </div>
</body>
<script src="/js/activity/common/index.js"></script>
<script src="/js/activity/common/form1.js?v=20191110"></script>
<script src="/js/activity/common/form2.js?v=20191110"></script>
<script src="/js/common/insuCommon.js"></script>
</html>