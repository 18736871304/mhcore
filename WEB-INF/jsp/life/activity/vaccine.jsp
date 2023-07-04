<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html  style="font-size: calc(100vw/ 18.75);">

	<head>
		<meta charset="UTF-8">
		<title>疫苗险免费送</title>
		<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width">
		<meta name="format-detection" content="telephone=no" />
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta name="full-screen" content="yes">
		<meta name="x5-fullscreen" content="true">
        <link rel="stylesheet" href="../../css/activity/vaccine/public.css" />
        <link rel="stylesheet" href="../../css/activity/vaccine/long-css.css?v=9" />
        <link rel="stylesheet" href="../..//css/activity/vaccine/iosSelect.css" />
        <link rel="stylesheet" href="../..//css/activity/vaccine/style.css" />
        <script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js?v=180428"></script>
        <script src="../../js/hengqin/jquery-1.10.1.min.js"></script>
    	 <script src=" ../../js/common/insuCommon.js"></script>
    	<style type="text/css">
    		.mask{
    position: fixed;
    top: 0;
    left: 0;
    background: rgba(0, 0, 0, 0.5);
    width: 100%;
    height: 100%;
    z-index: 10000;
    display: none;
}
.pop {
    width: 12rem;
    border-radius: 5px;
    position: fixed;
    z-index: 5;
    left: 50%;
    margin-left: -6rem;
    top: 40%;
    margin-top: -75px;
    background: #fff;
    border: 1px solid #e2e2e2;
}
.pop span {
    max-height: 8rem;
    overflow-y: scroll;
    display: block;
    line-height: 160%;
    text-align: center;
    font-size: 0.65rem;
    padding: 1.4rem 0.6rem;
    color: #222;
}
.pop-sure {
    color: #dc220d;
    text-align: center;
    height: 43px;
    line-height: 43px;
    border-top: 0.025rem solid #e2e2e2;
    display: block;
    font-size: 0.8rem;
}
    	
    	</style>
	</head>

	<body>
	<div class="mask">
		    <div class="pop">
		        <span class="warn">错误警告</span>
		    	<a class="pop-sure">确定</a>
		    </div>
		</div>
		<div class="sum usercenter">
        	<div class="img-top">
            	<img src="../../images/activity/vaccine/topimg.png?v=2">
            </div>
            <div class="dxyz box">
            	<div class="kuang box">
                    <div class="sjh box">
                    	<input type="text" class="ys" id = "mobileNum" placeholder="手机号">
                    </div>
                    <div class="yzm">
                    <input type="button" class="fasn" id="getA" onclick="getmsg();" value="发送验证码">				
                    </div>
                </div>
                <div class="dxyzm box">
                	<input type="text" class="ys"id="checkno"  placeholder="短信验证码">
                </div>
                <div class="mflq box">
                	<a href="javascript:volid(0);" onclick="getinfo();">免费领取</a>
                </div>
                <div class="guiz box">
                	<span class="line"></span>
                    <span class="txt"><b>活动规则</b></span>
                    <span class="line"></span>
                </div>
                <div class="guiz-wz">
                	<p>1.&nbsp;本活动为美华保险推出、安联保险承保;</p>
                    <p>2.&nbsp;每个手机号只能领取1次，可领取保额10万元的安联少儿疫苗险一份;</p>
                    <p>3.&nbsp;疫苗险适龄：30天-17周岁;</p>
                    <p>4.&nbsp;进口疫苗无限额、不限品种，为市场上性价比最高的疫苗险产品</p>
                </div>
            </div>
           <input type="hidden" name="source" id = "source" value = '${source}' >
          
		</div>
	</body>
<script type="text/javascript">
var countdown=60; 
function sendemail()
{
	var obj = $("#getA");
	settime(obj);
}

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

//点击获取验证码
function getmsg(){
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
}
function settime(obj) 
{  
	if (countdown == 0) 
    {
    	obj.attr('disabled',false);  
        obj.val("验证码获取");
        $("#getA").css("background","#fb235d");
        countdown = 60; 
        return;
    } 
    else
    {
        obj.attr('disabled',true);
        obj.val("重新发送(" + countdown + ")");
        countdown--; 
    } 
	setTimeout(function() 
	{ 
    settime(obj) 
    },1000) 
}

//点击立即领取逻辑
function getinfo(){

	var mobile = $("#mobileNum").val();
	
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
		"mobile":$("#mobileNum").val(),
		"checkno":$("#checkno").val(),
		"source":$("#source").val()
	};
	sendRequest("../activity/vaccineIn.do",transdata,function (data) 
	{
		var obj = JSON.parse(data);
    	console.log(obj);
    	$(".pop").show();
        $(".mask").show();
        $(".pop span").text(obj.message);
	},
	function(){});
			
}

$('.pop-sure').click(function(){
	$('.mask').css("display","none");
});
</script>
</html>