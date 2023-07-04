<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no"/>
    <meta name="format-detection" content="telephone=no">
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="apple-mobile-web-app-status-bar-style" content="black"/>
    <meta name="description" content=""/>
    <meta name="keywords" content=""/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="../../css/activity/vaccine/style2.css?v=1">
    <script type="text/javascript" src="../../js/hengqin/jquery-1.10.1.min.js"></script>
    <script type="text/javascript" src="../../js/jquery/flexible.js"></script>
     <script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js?v=180428"></script>
      <script src=" ../../js/common/insuCommon.js"></script>
      

</head>
<body>
<div class="mask" style="display: none;">
    <div class="pop">
        <span class="warn"></span >
        <a class="pop-sure">确定</ a>
    </div>
</div>
		
<div class="wrap">
    <div class="banner1_01"></div>
    <div class="big_02 pr">
        <div class="my_box abs">
            <p class="my_box_p fs40">咨询保险报价</p>
            <div class="shuru">
                <div class="shuru1 clearfix">
                    <p class="fl fs32">姓名:</p>
                    <input type="text" class="my_input fr fs32" id="visitname" placeholder="请输入姓名">
                </div>
                <div class="shuru1 clearfix">
                    <p class="fl fs32">手机:</p>
                    <input type="text" class="my_input fr fs32" id="mobileNum" placeholder="请输入手机号">
                </div>
                <div class="shuru1 clearfix" style="border-bottom: 0;">
                    <div class="butten fl fs28" id="getA">获取验证码</div>
                    <div class="innput_box">
                        <input type="text" class="my_input fr fs32" id="checkno" style="width:4rem;" placeholder="请输入验证码">
                    </div>
                </div>
            </div>
            <div class="tijiao fs32" id="getprice">马上获取报价</div>
            <div class="logo"></div>
            <div class="tianjia fs28">查看更多保险公司+</div>
        </div>
    </div>
	<input type="hidden" name="source" id = "source" value = '${source}' >
</div>
</body>
<script type="text/javascript">
$(function(){
	$('.pop-sure').on("click",function(){
		$('.mask').css("display","none");
	});
	var countdown=60; 
	function sendemail()
	{
		var obj = $("#getA");
		settime(obj);
	}
	//点击获取验证码
	$("#getA").on("click",function(){
		var mobile = $("#mobileNum").val();
		if(!validatemobile(mobile))
		{
			return false;	
		}
		
		$("#getA").css("background","#e1e1e1");
		
		sendemail();
		
		sendRequest("../../user/checkno.do?mobilenumber="+mobile+"&type="+$("#source").val(),null,function (data) 
		{
	  },function(){});
	})
	function settime(obj) 
	{  
		if (countdown == 0) 
	    {
			obj.css("pointer-events","auto");
	    	//obj.attr('disabled',false);  
	        obj.html("验证码获取");
	        $("#getA").css("background","#749afc");
	        countdown =60; 
	        return;
	    } 
	    else
	    {
	    	obj.css("pointer-events","none");//控制点击
	        //obj.attr('disabled',true);
	        obj.html("重新发送(" + countdown + ")");
	        countdown--; 
	    } 
		setTimeout(function() 
		{ 
	    settime(obj) 
	    },1000) 
	}
	//点击立即领取逻辑
	$("#getprice").on("click",function(){
		var mobile = $("#mobileNum").val();
		if(!checknotnull($("#visitname"),"请输入姓名！"))
		{
			return false;
		}
		if(!validatemobile(mobile))
		{
			return false;	
		}
		if(!checknotnull($("#checkno"),"请填写验证码！如还有问题，请联系客服"))
		{
			return false;
		}
		//$("#backUrl").val('${backUrl}');
		var transdata = 
		{
			"visitname":$("#visitname").val(),
			"mobile":$("#mobileNum").val(),
			"checkno":$("#checkno").val(),
			"source":$("#source").val()
		};
		sendRequest("../activity/advisoryIn.do",transdata,function (data) 
		{
			var obj = JSON.parse(data);
	    	console.log(obj);
	    	$(".pop").show();
	        $(".mask").show();
	        $(".pop span").text(obj.message);
		},
		function(){});
				
	});


	//微信分享
	var jsstr = ${jsstr};
	wx.config(jsstr);
	var source = '${source}';
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
	        link: pyqlink+source, // 分享链接
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
	        link: hylink+source, // 分享链接
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
})


</script>
</html>