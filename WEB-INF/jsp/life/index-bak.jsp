<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport">
	<meta content="yes" name="apple-mobile-web-app-capable">
	<meta content="black" name="apple-mobile-web-app-status-bar-style">
	<meta content="telephone=no" name="format-detection">
	<title>美华保险服务</title>
	<link rel="stylesheet" href="./css/life/box.css?v=180428">
	<script src="./js/jquery/jquery-3.6.0.min.js"></script>
	<script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js?v=20180227"></script>
</head>
<body>

<!--     banner -->
    <div class="index-banner"><img src="./images/life/banner.jpg" alt=""></div>
<!--     分类导航 -->
<div class="vux-tab vux-tab-wrapper">
<a href="#" class="vux-tab-item vux-center vux-tab-selected" type="lc" style="border: none; ">
	<div class="tab-item-cell"><i class="tab-item-icon tab-item-icon-1"></i>
	        理财
        </div> <!----></a>
        <a href="#" class="vux-tab-item vux-center" type="se" style="border: none;">
        	<div class="tab-item-cell"><i class="tab-item-icon tab-item-icon-2"></i>
	        少儿
        </div> <!----></a>
        <a href="#" class="vux-tab-item vux-center" type="cr" style="border: none;">
        	<div class="tab-item-cell"><i class="tab-item-icon tab-item-icon-3"></i>
	        成人
        </div> <!----></a>
        <a href="#" class="vux-tab-item vux-center" type="lr" style="border: none;">
        	<div class="tab-item-cell"><i class="tab-item-icon tab-item-icon-4"></i>
	        老人
        </div> <!----></a>
        <a href="#" class="vux-tab-item vux-center" type="qt" style="border: none;">
        	<div class="tab-item-cell"><i class="tab-item-icon tab-item-icon-5"></i>
	        其他
        </div> <!----></a> <div class="vux-tab-ink-bar vux-tab-ink-bar-transition-backward" style="display: block; height: 3px; background-color: rgb(0, 177, 255); left: 0%; right: 80%;"><!----></div></div>
	<div class="product_list">
		
		<div class="product_list_item" type="lc-cr-se">
		<a href = './life/hq/nc_hq_yjwn_01.do' target='_self'>	
			<img src="./images/life/yjwn.jpg" class="product_img"> 
			<div class="product_info">
				<div class="product_name">
					<p class="left">宜家万能账户</p>
					<p class="right product_price">
						10.00
						<span data-v-526f3737="" class="unit">元/年</span>
						<span data-v-526f3737="" class="price-start">起</span>
					</p>
				</div>
				<div class="product_desc">享受日计息月复利，现行结算利率为5.5%，让我们一起把爱的积累变成一种习惯</div>
			</div>
		</a>
		</div>
		
		<div class="product_list_item hidden" type="cr-se">
		<a href = './life/hq/nc_hq_ykb_01.do' target='_self'>	
			<img src="./images/life/youkangbao.jpg" class="product_img"> 
			<div class="product_info">
				<div class="product_name">
					<p class="left">优康保终身重疾险</p>
					<p class="right product_price">
						305.00
						<span data-v-526f3737="" class="unit">元/年</span>
						<span data-v-526f3737="" class="price-start">起</span>
					</p>
				</div>
				<div class="product_desc">保百病，赔6次，人人必备的终身重疾险，还能有电话医生提供健康咨询</div>
			</div>
		</a>
		</div>
		
		<div class="product_list_item" type="lc-cr">
		<a href = './life/xintai/dis_qwrs_01.do' target='_self'>	
			<img src="./images/life/qwrs.jpg" class="product_img"> 
			<div class="product_info">
				<div class="product_name">
					<p class="left">千万人生养老年金保险</p>
					<p class="right product_price">
						1000.00
						<span data-v-526f3737="" class="unit">元/年</span>
						<span data-v-526f3737="" class="price-start">起</span>
					</p>
				</div>
				<div class="product_desc">全网首款针对品质养老的专款专用产品，简单、安全、稳定，符合老年人的领取习惯</div>
			</div>
		</a>
		</div>
		
		<div class="product_list_item  hidden" type="cr">
		<a href = './life/hq/nc_hq_yab_01.do' target='_self'>
			<img src="./images/life/youaibao.jpg" class="product_img">
			<div class="product_info">
				<div class="product_name">
					<p class="left">优爱宝终身寿险</p>
					<p class="right product_price">
						135.00
						<span data-v-526f3737="" class="unit">元/年</span>
						<span data-v-526f3737="" class="price-start">起</span>
					</p>
				</div>
				<div class="product_desc">免体检，百万保额，良心打造的旗舰产品，一款真正逼疯精算师的爆款产品</div>
			</div>
		</a>
		</div>
		
		<div class="product_list_item  hidden" type="cr-se">
		<a href = './life/hq/nc_hq_bwyl_01.do' target='_self'>
			<img src="./images/life/bwyl.jpg" class="product_img">
			<div class="product_info">
				<div class="product_name">
					<p class="left">尊享人生百万医疗险</p>
					<p class="right product_price">
						136.00
						<span data-v-526f3737="" class="unit">元/年</span>
						<span data-v-526f3737="" class="price-start">起</span>
					</p>
				</div>
				<div class="product_desc">免体检的百万医疗险，各种费用都报销，还能有电话医生提供健康咨询</div>
			</div>
		</a>
		</div>
		
		<div class="product_list_item" type="lc-cr-se">
		<a href = './life/hq/nc_hq_jxnn_01.do' target='_self'>	
			<img src="./images/life/jxnn.jpg?v=20180303" class="product_img"> 
			<div class="product_info">
				<div class="product_name">
					<p class="left">金禧年年年金保险</p>
					<p class="right product_price">
						1000.00
						<span data-v-526f3737="" class="unit">元/年</span>
						<span data-v-526f3737="" class="price-start">起</span>
					</p>
				</div>
				<div class="product_desc">活到老，领到老，灵活存取，可以用作父母的养老金以及子女的教育金</div>
			</div>
		</a>
		</div>
		
		<div class="product_list_item hidden" type="cr">
		<a href = './life/ab/dis_risk02.do' target='_self'>
			<img src="./images/life/jiankangzhijia.png" class="product_img">
			<div class="product_info">
				<div class="product_name">
					<p class="left">健康之家终身重疾险</p>
					<p class="right product_price">
						390.00
						<span data-v-526f3737="" class="unit">元/年</span>
						<span data-v-526f3737="" class="price-start">起</span>
					</p>
				</div>
				<div class="product_desc">癌症心脑血管等疾病，双倍给付保险金，7重保障，全面守护您的健康</div>
			</div>
		</a>
		</div>
		
		<div class="product_list_item hidden" type="cr">
		<a href = './life/sunlife/dis_wddf01.do' target='_self'>
			<img src="./images/life/ibao.png" class="product_img">
			<div class="product_info">
				<div class="product_name">
					<p class="left">阳光i保终身重大疾病保险</p>
					<p class="right product_price">
						401.00
						<span data-v-526f3737="" class="unit">元/年</span>
						<span data-v-526f3737="" class="price-start">起</span>
					</p>
				</div>
				<div class="product_desc"></div>
			</div>
		</a>
		</div>
		
		<div class="product_list_item hidden" type="cr-se">
		<a href = './life/hongkang/dis_jkys_01.do' target='_self'>
			<img src="./images/life/jkys.jpg" class="product_img">
			<div class="product_info">
				<div class="product_name">
					<p class="left">健康一生终身重疾险</p>
					<p class="right product_price">
						1000.00
						<span data-v-526f3737="" class="unit">元/年</span>
						<span data-v-526f3737="" class="price-start">起</span>
					</p>
				</div>
				<div class="product_desc">50种重疾+15种轻症全面保障，消费类保险无强制储蓄，贴心疾病保障卫士</div>
			</div>
		</a>
		</div>
		
		
		<!-- 
		<div class="product_list_item">
		<a href = './life/ab/newcontract.do' target='_self'>
			<img src="./images/life/jiankangjiujiu.png" class="product_img">
			<div class="product_info">
				<div class="product_name">
					<p class="left">和谐健康久久终身(定期)疾病保险</p>
					<p class="right product_price">
						190.00
						<span data-v-526f3737="" class="unit">元/年</span>
						<span data-v-526f3737="" class="price-start">起</span>
					</p>
				</div>
				<div class="product_desc">出生满28天至50周岁 | 保障期间灵活</div>
			</div>
		</a>
		</div>
		 -->
		
		<div class="product_list_item hidden" type="cr-se">
		<a href = './life/abz/dis_cqs.do' target='_self'>
			<img src="./images/life/cqs.png" class="product_img">
			<div class="product_info">
				<div class="product_name">
					<p class="left">长青树终身重疾险</p>
					<p class="right product_price">
						74.70
						<span data-v-526f3737="" class="unit">元/年</span>
						<span data-v-526f3737="" class="price-start">起</span>
					</p>
				</div>
				<div class="product_desc">身故全残疾病终末期全面保，轻症额外赔付5次，为幸福保驾护航，让您安悦一生</div>
			</div>
		</a>
		</div>
		
		<!-- 
		<div class="product_list_item">
		<a href = './life/abz/dis_sel.do' target='_self'>
			<img src="./images/life/sel.jpg" class="product_img">
			<div class="product_info">
				<div class="product_name">
					<p class="left">安邦随e乐两全保险(万能型)</p>
					<p class="right product_price">
						10000.00
						<span data-v-526f3737="" class="unit">元/年</span>
						<span data-v-526f3737="" class="price-start">起</span>
					</p>
				</div>
				<div class="product_desc">10周岁—70周岁 | 趸交| 保险期限:10年</div>
			</div>
		</a>
		</div>
		 -->
	</div>
</body>
<script>
//tab

		var reuserid = '${reuserid}';
		var jsstr = ${jsstr};
		wx.config(jsstr);
	
		wx.ready(function () {	//朋友圈
	    	wx.onMenuShareTimeline({
		        title: '第三只眼看保险', // 分享标题
		        link: 'http://insure.meihualife.com/index.do?reuserid='+reuserid, // 分享链接
		        imgUrl: 'http://insure.meihualife.com/images/life/meihua-wx.jpg',
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
		        title: '第三只眼看保险', // 分享标题
		        desc: '美华保险站在您的角度思考问题，让您买的明白，买的正确，买的便宜。', // 分享描述
		        link: 'http://insure.meihualife.com/index?reuserid='+reuserid, // 分享链接
		        imgUrl: 'http://insure.meihualife.com/images/life/meihua-wx.jpg',
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


$('.vux-tab-item').click(function(){
	$(this).addClass('vux-tab-selected').siblings().removeClass('vux-tab-selected');
	var _this=this;
	$('.product_list_item').each(function(i,item){
		console.log($(_this).attr('type'))
		if($(item).attr('type').indexOf($(_this).attr('type'))>-1){
			$(item).show()
		}else{
			$(item).hide()
		}
	})
	
})
//tab结束
function hqrisk(riskcode)
{
	var transdata = 
	{
		"riskcode":riskcode
	};
	
	sendRequest('./life/hq/dis_risk.do',transdata,function (data) 
	{
	   	console.log(data);
	},
	function(){});
}

function sendRequest(url, data, success, error) 
{
    $.ajax({
        url: url,
        type: "post",
        async: true,
        data: data ? data : {},
        beforeSend:function(){
        },
        success: function (data) {
            if (success) {
                success(data);
            }
        },
        error: function (data) {
            if (error) {
                error(data);
            }
        },
        complete:function(){
        }
    });
}
</script>
</html>