<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html  style="font-size: calc(100vw/ 18.75);">
<head>
  	<meta charset="UTF-8">
	<title>IT专属团队</title>
	<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width">
	<meta name="format-detection" content="telephone=no" />
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta name="full-screen" content="yes">
	<meta name="x5-fullscreen" content="true">
	<link rel="stylesheet" type="text/css" href="../../css/activity/zhibozhuce/style.css?v=6">
	<script type="text/javascript" src="../../js/jquery/flexible.js"></script>
    <script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js?v=180428"></script>
    <script src="../../js/hengqin/jquery-1.10.1.min.js"></script>
   	<script src=" ../../js/common/insuCommon.js"></script>
</head>
<style>
	.yingy{
		box-shadow: 0px 0px 11px rgba(209,57,39,0.5);
		    
	}
	.yingy1{
	    box-shadow: box-shadow: inset 2px 2px 4px rgba(209,57,39,0.2);
	    outline:none;
		 border:1px solid rgba(209,57,39,1);
	       
	}
	.big_02 .my_input{
	 	z-index: 100;
	}
	.big_02 .my_div{
	 	z-index: 99;
	}
</style>
<body>
	<div class="mask">
	    <div class="pop">
	        <span class="warn">错误警告</span>
	    	<a class="pop-sure">确定</a>
	    </div>
	</div>
	<div class="wrap">
	<div class="big_02">
			<p class="my_box_p fs44 abs int">注册</p>
	        <input type="text" class="my_input int1 fs32 abs my_input" placeholder="请输入姓名" id="visitname" maxlength="50">
	        <div class="my_input int1 fs32 abs my_div" id="visitname1"></div>
	        
	        <input type="number" class="my_input int2 fs32 abs my_input" placeholder="请输入手机号" id="mobileNum" maxlength="20">
	         <div class="my_input int2 fs32 abs my_div" id="mobileNum1"></div>
	         
	        <input type="text" class="my_input fs32 int3 abs my_input" placeholder="请输入微信号" id="wx" maxlength="50">
	         <div class="my_input int3 fs32 abs my_div" id="wx1"></div>
	         
	        <input type="text" class="my_input fs32 int4 abs my_input" placeholder="备注" id="remark" maxlength="2000">
	         <div class="my_input int4 fs32 abs my_div" id="remark1"></div>
	         
	        <input type="text" class="my_input fs32 int5 abs my_input" placeholder="请输入员工号" id="workerNo" maxlength="20">
	         <div class="my_input int5 fs32 abs my_div" id="workerNo1"></div>
	         
	        <div class="register fs36 abs int6 bianhuan" id="goRegister">立即注册</div>	  
		</div>
        
	</div>
	   <input type="hidden" name="source" id = "source" value = '${source}' >
</body>
<script type="text/javascript">

 $("#visitname").focus(function(){
    $(this).addClass("yingy1");
    $("#visitname1").addClass("yingy");
});
$("#visitname").blur(function(){
    $(this).removeClass("yingy1");
    $("#visitname1").removeClass("yingy");
});

$("#mobileNum").focus(function(){
    $(this).addClass("yingy1");
    $("#mobileNum1").addClass("yingy");
});
$("#mobileNum").blur(function(){
    $(this).removeClass("yingy1");
    $("#mobileNum1").removeClass("yingy");
});

$("#wx").focus(function(){
    $(this).addClass("yingy1");
    $("#wx1").addClass("yingy");
});
$("#wx").blur(function(){
    $(this).removeClass("yingy1");
    $("#wx1").removeClass("yingy");
});

$("#remark").focus(function(){
    $(this).addClass("yingy1");
    $("#remark1").addClass("yingy");
});
$("#remark").blur(function(){
    $(this).removeClass("yingy1");
    $("#remark1").removeClass("yingy");
});

$("#workerNo").focus(function(){
    $(this).addClass("yingy1");
    $("#workerNo1").addClass("yingy");
});
$("#workerNo").blur(function(){
    $(this).removeClass("yingy1");
    $("#workerNo1").removeClass("yingy");
});



$('body').height($('body')[0].clientHeight);
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
function yanz(){
	var mobile = $("#mobileNum").val(); 
	if(!checknotnulla($("#visitname")))
	{
		return false;
	}
	if(!validatemobilea(mobile))
	{
		return false;	
	} 
	if(!checknotnulla($("#wx")))
	{
		return false;
	}
	if(!checknotnulla($("#remark")))
	{
		return false;
	}
	if(!checknotnulla($("#workerNo")))
	{
		return false;
	}
	return true;
}
$("#visitname").on("blur",function(){
	if(!yanz()){
		$('.register').removeClass("bianhuan1");
		$('.register').addClass("bianhuan");
	}else{
		$('.register').removeClass("bianhuan");
		$('.register').addClass("bianhuan1");
	}
})
 $("#mobileNum").on("blur",function(){
	if(!yanz()){
		$('.register').removeClass("bianhuan1");
		$('.register').addClass("bianhuan");
	}else{
		$('.register').removeClass("bianhuan");
		$('.register').addClass("bianhuan1");
	}
}) 
$("#wx").on("blur",function(){
	if(!yanz()){
		$('.register').removeClass("bianhuan1");
		$('.register').addClass("bianhuan");
	}else{
		$('.register').removeClass("bianhuan");
		$('.register').addClass("bianhuan1");
	}
})
$("#remark").on("blur",function(){
	if(!yanz()){
		$('.register').removeClass("bianhuan1");
		$('.register').addClass("bianhuan");
	}else{
		$('.register').removeClass("bianhuan");
		$('.register').addClass("bianhuan1");
	}
})
$("#workerNo").on("blur",function(){
	if(!yanz()){
		$('.register').removeClass("bianhuan1");
		$('.register').addClass("bianhuan");
	}else{
		$('.register').removeClass("bianhuan");
		$('.register').addClass("bianhuan1");
	}
})

$("#goRegister").on("click",function(){

	var mobile = $("#mobileNum").val();
	if(!checknotnull($("#visitname"),"请输入姓名！"))
	{
		return false;
	}
	if(!validatemobile(mobile))
	{
		return false;	
	}
	if(!checknotnull($("#wx"),"请输入微信号！"))
	{
		return false;
	}
	if(!checknotnull($("#workerNo"),"请输入员工号！"))
	{
		return false;
	}
	var transdata = 
	{
		"visitname":$("#visitname").val(),
		"mobile":$("#mobileNum").val(),
		"wx":$("#wx").val(),
		"remark":$("#remark").val(),
		"workerno":$("#workerNo").val(),
		"source":$("#source").val()
	};
	sendRequest("../activity/registerIn.do",transdata,function (data) 
	{
		var obj = JSON.parse(data);
    	console.log(obj);
    	$(".pop").show();
        $(".mask").show();
        $(".pop span").text(obj.message);
	},
	function(){});
			
});
function checknotnulla(checkid,checkstr)
{	
	if(checkid.val()==""||checkid.val()==null)
	{
		/* $(".pop").show();
		$(".mask").show();
		$(".pop span").text(checkstr); */
		return false;
	}
	return true;
}
function validatemobilea(mobile)
{
	if(mobile==null||mobile=="")
    {
	  /*  $(".pop").show();
       $(".mask").show();
       $(".pop span").text("请输入手机号码！"); */
       return false;
    }
	
    if(mobile.length==0)
    {
      /*  $(".pop").show();
	   $(".mask").show();
	   $(".pop span").text("请输入手机号码！"); */
       return false;
    }
    
    if(mobile.length!=11)
    {
    	/* $(".pop").show();
		$(".mask").show();
		$(".pop span").text("请输入有效的手机号码！"); */
        return false;
    }
    
    var myreg = /^0?1[3|4|5|7|8][0-9]\d{8}$/;
    if(!myreg.test(mobile))
    {
    	/* $(".pop").show();
		$(".mask").show();
		$(".pop span").text("请输入有效的手机号码！"); */
        return false;
    }
    return true;
}

$('.pop-sure').click(function(){
	$('.mask').css("display","none");
});
</script>
</html>