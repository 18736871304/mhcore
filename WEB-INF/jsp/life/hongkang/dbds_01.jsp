<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>大白定期寿险</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<link rel="stylesheet" href="../../css/hengqin/index.css?v=180428">
	<script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js?v=180428"></script>
    <script src=" ../../js/hengqin/jquery-1.10.1.min.js?v=180428"></script>
    <script src=" ../../js/hengqin/sjMain.js?v=180428"></script>
    <script src=" ../../js/common/insuCommon.js?v=180428"></script>
    <script src=" ../../js/common/intention.js?v=180428"></script>
    <style type="text/css">
    	#nav1,#nav2,#nav3,#nav4{
    		padding: 0;
    	}
		#nav1 img,#nav2 img,#nav3 img,#nav4 img{
			display: block;
			width: 100%;
			margin: auto;
		}
		.footer_go{
			width: 100%;
		}
		a.kefu:hover {color:white;} a.kefu:visited {color:white;} a.kefu:link {color:white;} a.kefu {color:white;}
		
		.recommend_wrapper{
			position: absolute;
			left: 0;
			bottom: 1.5rem;
			width: 100%;
			overflow: hidden;
			padding: 0 0.75rem;
		}
		.recommend_wrapper a{
			display: block;
			width: 5.75rem;
			height: 4.5rem;
			float: left;
		}
    </style>
</head>
<body>
	<div class="index_wrapper">
		<div class="main_wrapper">
			<div class="banner_wrapper">
				<img src="../../images/hongkang/dbds/dbdqsx_01.png"  alt="">
				<div class="banner_desc">
					<p><span class="left">投保年龄</span><span class="right">20-50周岁</span></p>
					<p><span class="left">保障期限</span><span class="right">最高报至70周岁</span></p>
					<p><span class="left">最高保障</span><span class="right">100万</span></p>
				</div>
			</div>
			<div class="product_wrapper">
				<div id="nav">
					<div class="product_nav">
						<a href="javascript:;" class="active_nav"><span>产品介绍</span></a>
						<a href="javascript:;"><span>投保案例</span></a>
						<a href="javascript:;"><span>理赔流程</span></a>
						<a href="javascript:;"><span>承保公司</span></a>
					</div>
				</div>
				<div id="nav1" class="product_desc">
					<img src="../../images/hongkang/dbds/dbdqsx_02.png" alt="">
				</div>
				<div id="nav2" class="product_desc">
					<img src="../../images/hongkang/dbds/dbdqsx_03.png" alt="">
				</div>
				<div id="nav3" class="product_desc">
					<img src="../../images/hongkang/dbds/dbdqsx_04.png" alt="">
					<div class="recommend_wrapper">
						<a href="../../contract/hongkang/hk-lpxz.pdf"></a>
						<a href="../../contract/hongkang/dbds/hk-dbds.pdf"></a>
					</div>
				</div>
				<div id="nav4" class="product_desc">
					<img src="../../images/hongkang/dbds/dbdqsx_05.png" alt="">
				</div>
			</div>
			<!-- <div class="recommend_wrapper">
				<p><a href="../../contract/hengqin/lptk.pdf"><span class="left">理赔须知</span><span class="right">查看</span></a></p>
				<p><a href="../../contract/hengqin/jxnn/insuranceClauses.pdf"><span class="left">保险条款</span><span class="right">查看</span></a></p>
				<p><a href="../../contract/hengqin/jxnn/disclosure.pdf"><span class="left">信息披露</span><span class="right">查看</span></a></p>
			</div> -->
			<div class="pl bgColor fixedBox w100 hq-productBottom">
		            <dl class="clearfix infoDl w100">
			            <dt class="w65 l-float  font16" style="text-align:center;padding-left: 2.3rem;position: relative;">
			            	<p class="kf_p"><img src="../../images/hengqin/bwyl/red_kf.png?v=20180402" alt="" style="width: 1.5rem;"></p>
				            <span readonly="" class="insurePrice" id="insurePrice" >30.00</span><span>元/年起</span>
				            <input type="hidden" value = '30.00' id = 'insurePrice_trans'>
			            </dt>
						<dd class="w35 r-float">
						    <div class="insureBtn txtC footer_go" id = "kefu">立即投保</div>
						</dd>
		            </dl>
		    </div>
			<div class="consult-wrap">
			  <div class="content-wrap step1">
  			    <a href="javascript:;" class="close-con-wrap"></a>
			    <h3>请输入手机号</h3>
			    <div class="padding-wrap">
				    <input type="tel" maxlength="11" placeholder="请输入手机号" id = "mobile" class="telNumber">
				    <div class="tips">提示：稍后会有一对一客服为您服务</div>
				    <a href="javascript:;" class="confirm-btn">确定</a>
			    </div>
			  </div>
			  <div class="content-wrap step2" style="display:none">
  			    <a href="javascript:;" class="close-con-wrap"></a>
			    <h3>提示</h3>
				<img src="../../images/hongkang/jkys/succese-consult.png" alt="">
 			    <div class="txt">稍后会有一对一客服为您服务</div>		
			  </div>
			</div>
		</div>
	</div>
		<%@ include file="/WEB-INF/common/insure_include.jsp"%>
	<script>

	   //点击立即咨询框，逻辑
	   $("#kefu").on('click',function(){
		   $('.consult-wrap').show();
	   })
	   $('.close-con-wrap').on('click',function(){
		   $('.consult-wrap').hide();
		   $('.step1').show().siblings().hide();
	   })
	   $('.content-wrap').on('click',function(e){
		   e.stopPropagation()
	   })
	   $('.consult-wrap').on('click',function(){
		   $('.consult-wrap').hide();
	   })
	   
	   $('.confirm-btn').on('click',function()
	   {
		   var mobile = $("#mobile").val();
		   
		   intentionInsert(mobile,'511301','hongkang');
	   })
	   
	   //点击立即咨询框，逻辑end
	 
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
	        link: pyqlink+'&shareid='+shareid+'&reuserid='+reuserid, // 分享链接
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
	        link: hylink+'&shareid='+shareid+'&reuserid='+reuserid, // 分享链接
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
	  //alert(res.errMsg);
	});
		
	</script>
</body>
</html>