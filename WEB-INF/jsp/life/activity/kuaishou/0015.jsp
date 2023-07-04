<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="zh">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>保大病还增值的重疾险_立即测算保费_全网最低4.9元/天起</title>
  <script src="/js/activity/common/flexible.js"></script>
  <script type="text/javascript" src="/js/20190824/jquery-1.7.1.min.js"></script>
  <link rel="stylesheet" href="/css/activity/0013/toast.css">
  <link rel="stylesheet" href="/css/activity/0013/init.css">
  <link rel="stylesheet" href="/css/activity/0013/index.min.css?v=20191211">
</head>
<body>
  <div class="content">
    <div class="img_box_01">
      <img src="/images/activity/0013/01_01.jpg" alt="" class="img_01">
      <img src="/images/activity/0013/01_02.jpg" alt="" class="img_02">
      <img src="/images/activity/0013/01_03.jpg" alt="" class="img_03">
    </div>
    <form class="form_box" id="topForm">
    	<input type="hidden" style="display:none" class="channelCode" id="channelCode" value="${channelCode}">
		<input type="hidden" style="display:none" class="pageType" id="pageType" value="${pageType}">
		<input type="hidden" style="display:none" class="planId" id="planId" value="${planId}">
      <div class="list">
        <input type="text" placeholder="请输入姓名" name="name">
      </div>

      <div class="list gender flexbox">
        <div class="label">请选择性别</div>
        <div class="btn_box radio">
          <input type="hidden"  name="gender" value="m">
          <div class="male m br1 active" data-type="m">男</div>
          <div class="female f br1" data-type="f">女</div>
        </div>
      </div>

      <div class="list age flexbox">
        <div class="label">请选择年龄</div>
        <select class="" name="age">
          <option value="age01">0-17</option>
          <option value="age02">18-25</option>
          <option value="age03">26-30</option>
          <option value="age04">31-35</option>
          <option value="age05">36-40</option>
          <option value="age06">41-45</option>
        </select>
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
      <img src="/images/activity/0013/02_01.jpg" alt="" class="img_01">
      <img src="/images/activity/0013/02_02.jpg" alt="" class="img_02">
    </div>

    <div class="img_box_03">
      <img src="/images/activity/0013/03_01.jpg" alt="" class="img_01">
      <img src="/images/activity/0013/03_02.jpg" alt="" class="img_02">
      <img src="/images/activity/0013/03_03.jpg" alt="" class="img_03">
    </div>

    <div class="img_box_04">
      <img src="/images/activity/0013/04_01.jpg" alt="" class="img_01">
      <img src="/images/activity/0013/04_02.jpg" alt="" class="img_02">
    </div>

    <div class="img_box_05">
      <img src="/images/activity/0013/05_01.jpg" alt="" class="img_01">
      <img src="/images/activity/0013/05_02.jpg" alt="" class="img_02">
    </div>

    <!-- <div class="banner terrace"></div> -->
    <form class="form_box bottom" id="upForm">
      <div class="title"></div>

      <div class="list">
        <input type="text" placeholder="请输入姓名" name="name">
      </div>

      <div class="list gender flexbox">
        <div class="label">请选择性别</div>
        <div class="btn_box radio">
          <input type="hidden"  name="gender" value="m">
          <div class="male m br1 active" data-type="m">男</div>
          <div class="female f br1" data-type="f">女</div>
        </div>
      </div>

      <div class="list age flexbox">
        <div class="label">请选择年龄</div>
        <select class="" name="age">
          <option value="age01">0-17</option>
          <option value="age02">18-25</option>
          <option value="age03">26-30</option>
          <option value="age04">31-35</option>
          <option value="age05">36-40</option>
          <option value="age06">41-45</option>
        </select>
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

    <div class="img_box_06">
      <img src="/images/activity/0013/06_01.jpg" alt="" class="img_01">
    </div>

    <div class="img_box_07">
      <img src="/images/activity/0013/07_01.jpg?v=20191210" alt="" class="img_01">
    </div>
  </div>

  <div class="to_top">
    立即测算保费
  </div>
</body>
<script type="text/javascript">
		(function (root) {
		    var ksscript = document.createElement('script');
		    ksscript.type = 'text/javascript';
		    ksscript.src = 'https://static.yximgs.com/udata/pkg/ks-ad-trace-sdk/ks-trace.2.0.0.beta.js';
		    var s = document.getElementsByTagName('script')[0];
		    s.parentNode.insertBefore(ksscript, s);
		})(window);
</script>
<script src="/js/activity/common/index.js"></script>
<script src="/js/activity/common/form1.js?v=20191110"></script>
<script src="/js/activity/common/form2.js?v=20191110"></script>
<script src="/js/common/insuCommon.js"></script>
</html>