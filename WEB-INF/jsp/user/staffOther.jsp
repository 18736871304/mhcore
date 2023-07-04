<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>授权分享直播页面</title>
    <link rel="stylesheet" href="../../css/user/staff/public.css?v=20180717">
    <script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js?v=180428"></script>
    <script src=" ../js/jquery/jquery-3.6.0.min.js"></script>
    <script src=" ../js/jquery/flexible.js"></script>
</head>
<style>
    .main {
        position: relative;
        width: 100%;
        min-height: 100%;
        box-sizing: border-box;
    }
    .loginBox .formBox {
        position: absolute;
        font-size: 0.6rem;
        width: 9.6rem;
        text-align: center;
        left: 50%;
        margin-left: -4.8rem;
        top: 50%;
        margin-top: -4rem;
    }
</style>
<body>
    <div class="main d_backFFF loginBox">
        <form class="">
            <div class="formBox d_boxSz">
                请直接点击本页面右上角进行分享
            </div>
        </form>
    </div>
</body>
<script>
    var jsstr = ${jsstr};
    wx.config(jsstr);

    var pyqtitle = '${pyqtitle}';
    var pyqlink = '${pyqlink}';
    var pyqimgurl = '${pyqimgurl}';

    var hytitle = '${hytitle}';
    var hydesc = '${hydesc}';
    var hylink = '${hylink}';
    var hyimgurl = '${hyimgurl}';

    var reuserid = '${reuserid}';
    var shareid = '${shareid}';

    wx.ready(function () {	//朋友圈
        wx.onMenuShareTimeline({
            title: pyqtitle, // 分享标题
            link: pyqlink+'&response_type=code&scope=snsapi_userinfo&state='+reuserid+'#wechat_redirect',
            imgUrl: pyqimgurl,
            success: function (res) {
                //alert(1);
            },
            cancel: function (res) {
                //alert(2);
            },
            fail: function (res) {

            }
        });
        //朋友
        wx.onMenuShareAppMessage({
            title: hytitle, // 分享标题
            desc: hydesc, // 分享描述
            link: hylink+'&response_type=code&scope=snsapi_userinfo&state='+reuserid+'#wechat_redirect',
            imgUrl: hyimgurl,
            type: '', // 分享类型,music、video或link，不填默认为link
            dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
            success: function () {
                // 用户确认分享后执行的回调函数
                //alert(2);
            },
            cancel: function () {
                // 用户取消分享后执行的回调函数
                //alert(4);
            }
        });
    });
    wx.error(function (res) {
        alert(res.errMsg);
    });
</script>
</html>
