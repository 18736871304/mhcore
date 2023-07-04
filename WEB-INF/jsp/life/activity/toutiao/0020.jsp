<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="zh">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>保大病还增值的重疾险_立即测算保费_第三方保险服务持牌机构</title>
  <script src="/js/activity/common/flexible.js"></script>
  <script type="text/javascript" src="/js/20190824/jquery-1.7.1.min.js"></script>
  <link rel="stylesheet" href="/css/activity/0017/toast.css">
  <link rel="stylesheet" href="/css/activity/0017/init.css">
  <link rel="stylesheet" href="/css/activity/0017/index.min.css">
</head>
<body>
  <div class="content">
    <div class="img_box_01">
      <img src="/images/activity/0017/01_01.jpg" alt="" class="img_01">
      <img src="/images/activity/0017/01_02.jpg" alt="" class="img_02">
      <img src="/images/activity/0017/01_03.jpg" alt="" class="img_03">
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
          立即测算保费
        </div>
        <div class="text">*本人同意美华保险致电联系，提供保险相关服务</div>
      </div>
    </form>

    <div class="img_box_02">
      <img src="/images/activity/0017/02_01.jpg" alt="" class="img_01">
      <img src="/images/activity/0017/02_02.jpg" alt="" class="img_02">
      <img src="/images/activity/0017/02_03.jpg" alt="" class="img_03">
    </div>

    <div class="img_box_03">
      <img src="/images/activity/0017/03_01.jpg" alt="" class="img_01">
      <img src="/images/activity/0017/03_02.jpg" alt="" class="img_02">
      <img src="/images/activity/0017/03_03.jpg" alt="" class="img_03">
    </div>

    <div class="img_box_04">
      <img src="/images/activity/0017/04_01.jpg" alt="" class="img_01">
      <img src="/images/activity/0017/04_02.jpg" alt="" class="img_02">
    </div>

    <!-- <div class="banner terrace"></div> -->
    <form class="form_box bottom" id="upForm">
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
      <div class="list submit" id="upSub">
        <div class="btn">
          立即测算保费
        </div>
        <div class="text">*本人同意美华保险致电联系，提供保险相关服务</div>
      </div>
    </form>


    <div class="img_box_05">
      <img src="/images/activity/0017/05_01.jpg" alt="" class="img_01">
      <img src="/images/activity/0017/05_02.jpg" alt="" class="img_02">
      <img src="/images/activity/0017/05_03.jpg?v=20191211" alt="" class="img_03">
    </div>

    <div class="img_box_06">
      <img src="/images/activity/0017/06_01.jpg" alt="" class="img_01">
    </div>

    <div class="img_box_07">
      <img src="/images/activity/0017/07_01.jpg?v=20191211_01" alt="" class="img_01">
    </div>
  </div>

  <div class="to_top">
    立即测算保费
  </div>
</body>
<script>
(function(r,d,s,l){var meteor=r.meteor=r.meteor||[];meteor.methods=["track","off","on"];meteor.factory=function(method){return function(){
	  var args=Array.prototype.slice.call(arguments);args.unshift(method);meteor.push(args);return meteor}};for(var i=0;i<meteor.methods.length;i++){
	  var key=meteor.methods[i];meteor[key]=meteor.factory(key)}meteor.load=function(){var js,fjs=d.getElementsByTagName(s)[0];js=d.createElement(s);
	  js.src="https://analytics.snssdk.com/meteor.js/v1/"+l+"/sdk";fjs.parentNode.insertBefore(js,fjs)};meteor.load();if(meteor.invoked){return}
	  meteor.invoked=true;meteor.track("pageview")})(window,document,"script","108694470709");
</script>
<script src="/js/activity/common/index.js"></script>
<script src="/js/activity/common/form1.js?v=20191110"></script>
<script src="/js/activity/common/form2.js?v=20191110"></script>
<script src="/js/common/insuCommon.js"></script>
</html>