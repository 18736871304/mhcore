<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta content="yes" name="apple-mobile-web-app-capable">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<meta name="format-detection" content="telephone=no, email=no">
	<meta name="viewport"
		  content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, viewport-fit=cover">
	<title>个人保障方案</title>
	<link rel="stylesheet" href="/css/common/lcl/lib/weui.min.css">
	<link rel="stylesheet" href="/css/common/lcl/common.css">
	<link rel="stylesheet" href="/fonts/lcl/iconfont.css">
	<link rel="stylesheet" href="/css/insureplan/viewplan.css?v=20191204_01">
</head>
<body>
<input style="display:none" id="planid" value="${planid}">
<div class="view-plan" id="viewplan">
	<div class="viewplan-content">
		<div class="viewplan-section-box">
			<div class="viewplan-banner">
				<div class="banner-img">
					<img src="/images/insureplan/viewplan_banner.png">
				</div>
				<div class="banner-info-box">
					<div class="banner-info-wraper">
						<div class="banner-info">
							<div class="banner-info-title">姓名</div>
							<div class="banner-info-content" id="uname"></div>
						</div>
						<div class="banner-info">
							<div class="banner-info-title">性别</div>
							<div class="banner-info-content" id="gender"></div>
						</div>
						<div class="banner-info">
							<div class="banner-info-title">年龄</div>
							<div class="banner-info-content" id="age"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="viewplan-section" id="yiwaibaozhangSection" style="display: none">
				<div class="viewplan-section-title" style="justify-content: space-between;">
					<div class="title-text">意外保障</div>
					<div class="title-logo">
						<img id="yiwaibaozhangImg" src="">
					</div>
				</div>
				<div class="viewplan-section-expense-list">
					<ul id="yiwaibaozhangbaozhangBox">
						
					</ul>
					<div class="expense-total">
						<span id="yiwaibaozhangTotal">98元</span>
						<i id="yiwaibaozhangExplain" class="iconfont iconjieshi rate-dialog" style="color: #dc220d;display: none;"></i>
					</div>
				</div>
			</div>
			<div class="viewplan-section" id="xiaobingbaozhangSection" style="display: none">
				<div class="viewplan-section-title" style="justify-content: space-between;">
					<div class="title-text">医疗保障</div>
					<div class="title-logo">
						<img id="xiaobingbaozhangImg" src="">
					</div>
				</div>
				<div class="viewplan-section-expense-list">
					<ul id="xiaobingbaozhangBox">
						
					</ul>
					<div class="expense-total">
						<span id="xiaobingbaozhangTotal">98元</span>
						<i id="xiaobingbaozhangExplain" class="iconfont iconjieshi ylrate-dialog" style="color: #dc220d;display: none;"></i>
					</div>
				</div>
			</div>
			<div class="viewplan-section" id="dabingbaozhangSection" style="display: none">
				<div class="viewplan-section-title" style="justify-content: space-between;">
					<div class="title-text">重疾保障</div>
					<div class="title-logo">
						<img id="dabingbaozhangImg" src="">
					</div>
				</div>
				<div class="viewplan-section-expense-list">
					<ul id="dabingbaozhangBox">
						
					</ul>
					<div class="expense-total">
						<span id="dabingbaozhangTotal">5100元</span>
						<i id="dabingbaozhangExplain" class="iconfont iconjieshi rate-dialog" style="color: #dc220d;display: none;"></i>
					</div>
				</div>
			</div>
			<div class="viewplan-section" id="dabingbuchongSection" style="display: none">
				<div class="viewplan-section-title" style="justify-content: space-between;">
					<div class="title-text">重疾补充</div>
					<div class="title-logo">
						<img id="dabingbuchongImg" src="">
					</div>
				</div>
				<div class="viewplan-section-expense-list">
					<ul id="dabingbuchongBox">
					</ul>
					<div class="expense-total">
						<span id="dabingbuchongTotal">0元</span>
						<i id="dabingbuchongExplain" class="iconfont iconjieshi dbbc_rate-dialog" style="color: #dc220d;display: none;"></i>
					</div>
				</div>
			</div>
			
			<div class="viewplan-section" id="shengubaozhangSection" style="display: none">
                <div class="viewplan-section-title" style="justify-content: space-between;">
                    <div class="title-text">身故保障</div>
                    <div class="title-logo">
                        <img id="shengubaozhangImg" src="">
                    </div>
                </div>
                <div class="viewplan-section-expense-list">
                    <ul id="shengubaozhangBox">
                    </ul>
                    <div class="expense-total">
                        <span id="shengubaozhangTotal">0元</span>
                        <i id="shengubaozhangExplain" class="iconfont iconjieshi rate-dialog" style="color: #dc220d;display: none;"></i>
                    </div>
                </div>
            </div>
			
			<div class="viewplan-section">
				<div class="viewplan-section-know-about-box">
					<div class="know-about-wraper">
						<div class="know-about-border-box">
							<div class="know-about-border know-about-border-left-top"></div>
							<div class="know-about-border know-about-border-left-bottom"></div>
							<div class="know-about-border know-about-border-right-top"></div>
							<div class="know-about-border know-about-border-right-bottom"></div>
						</div>
						<div class="know-about-img">
							<img src="/images/insureplan/wenhao.png">
						</div>
						<div class="know-about-text">
							你需要知道的那些事儿
						</div>
					</div>
				</div>
			</div>
			<div class="viewplan-section">
				<div class="viewplan-section-about">
					<div class="viewplan-section-title">
						<span>关于保险分类</span>
					</div>
					<div class="viewplan-section-about-content" id="treeImg">
						<div class="tree-box">
							<div class="tree">
								<div class="tree-root">
									<div class="tree-son-box tree-root-son">
										<span>保险分类</span>
										<div class="tree-vertical-line bg-red line-down"></div>
									</div>
								</div>
								<div class="tree-long-line">
								</div>
								<div class="tree-son-list son1">
									<div class="tree-son-box tree-parent">
										<div class="tree-vertical-line bg-red"></div>
										<div class="tree-vertical-line line-down"></div>
										<span class="tree-son-title">意外险</span>
										<span class="icon-box"><i class="iconfont iconjieshi"></i></span>
										<div class="tips tips1 ">
											<div class="tips-text">
												被保人因遭受意外伤害造成身故、伤残、医疗等为给付保险金条件的人身保险，一般百元以内。
											</div>
										</div>
										<div class="tree-son-branch yiwaixian">
											<div class="tree-son-list son2">
												<div class="tree-son-long-line"></div>
												<div class="tree-son-box">
													<div class="tree-vertical-line tree-vertical-line-long bg-black"></div>
													<span class="tree-son-title">综合意外险</span>
												</div>
												<div class="tree-son-box">
													<div class="tree-vertical-line bg-black"></div>
													<span class="tree-son-title">专项意外险</span>
												</div>
											</div>
										</div>
									</div>
									<div class="tree-son-box tree-parent">
										<div class="tree-vertical-line bg-red"></div>
										<span class="tree-son-title">医疗险</span>
										<span><i class="iconfont iconjieshi"></i></span>
										<div class="tips tips2 ">
											<div class="tips-text">
												交一年保障一年，采用自然费率，属于事后报销型，凭发票报销必须且合理的医疗费用。
											</div>
										</div>
										<div class="tree-son-branch yiliaoxian hide">
											<div class="tree-son-list son2">
												<div class="tree-son-long-line"></div>
												<div class="tree-son-box">
													<div class="tree-vertical-line bg-black"></div>
													<span class="tree-son-title">住院医疗险</span>
												</div>
												<div class="tree-son-box">
													<div class="tree-vertical-line tree-vertical-line-long bg-black"></div>
													<span class="tree-son-title">百万医疗险</span>
												</div>
												<div class="tree-son-box">
													<div class="tree-vertical-line bg-black"></div>
													<span class="tree-son-title">中端医疗险</span>
												</div>
												<div class="tree-son-box">
													<div class="tree-vertical-line bg-black"></div>
													<span class="tree-son-title">高端医疗险</span>
												</div>
											</div>
										</div>
									</div>
									<div class="tree-son-box tree-parent">
										<div class="tree-vertical-line bg-red"></div>
										<span class="tree-son-title">重疾险</span>
										<span><i class="iconfont iconjieshi"></i></span>
										<div class="tips tips3 ">
											<div class="tips-text">
												一般为长期合同，采用均衡费率，属于提前给付型，凭确诊书申请理赔，保险公司按照合同约定赔付相应的保额。
											</div>
										</div>
										<div class="tree-son-branch zhongjixian hide">
											<div class="tree-son-list son2">
												<div class="tree-son-long-line"></div>
												<div class="tree-son-box">
													<div class="tree-vertical-line bg-black"></div>
													<span class="tree-son-title">消费型</span>
												</div>
												<div class="tree-son-box">
													<div class="tree-vertical-line tree-vertical-line-long bg-black"></div>
													<span class="tree-son-title">储蓄型</span>
												</div>
												<div class="tree-son-box">
													<div class="tree-vertical-line bg-black"></div>
													<span class="tree-son-title">返还型</span>
												</div>
											</div>
										</div>
									</div>
									<div class="tree-son-box tree-parent">
										<div class="tree-vertical-line bg-red"></div>
										<span class="tree-son-title">人寿险</span>
										<span><i class="iconfont iconjieshi"></i></span>
										<div class="tips tips4 ">
											<div class="tips-text">
												以被保人的寿命为保险标的，且以被保人的生存或死亡为给付保险金条件的人身保险。
											</div>
										</div>
										<div class="tree-son-branch zhongjixian hide">
											<div class="tree-son-list son2">
												<div class="tree-son-long-line"></div>
												<div class="tree-son-box">
													<div class="tree-vertical-line bg-black"></div>
													<span class="tree-son-title">定期寿险</span>
												</div>
												<div class="tree-son-box">
													<div class="tree-vertical-line tree-vertical-line-long bg-black"></div>
													<span class="tree-son-title">终身寿险</span>
												</div>
											</div>
										</div>
									</div>
									<div class="tree-son-box tree-parent">
										<div class="tree-vertical-line bg-red"></div>
										<span class="tree-son-title">年金险</span>
										<span><i class="iconfont iconjieshi"></i></span>
										<div class="tips tips4 ">
											<div class="tips-text">
												指以被保险人生存为给付保险金条件，并按照约定的时间，分期给付生存保险金的人身保险。
											</div>
										</div>
										<div class="tree-son-branch nianjinxian hide">
											<div class="tree-son-list son2">
												<div class="tree-son-long-line"></div>
												<div class="tree-son-box">
													<div class="tree-vertical-line bg-black"></div>
													<span class="tree-son-title">收益确定型</span>
												</div>
												<div class="tree-son-box">
													<div class="tree-vertical-line bg-black"></div>
													<span class="tree-son-title">收益保底型</span>
												</div>
												<div class="tree-son-box">
													<div class="tree-vertical-line tree-vertical-line-long bg-black"></div>
													<span class="tree-son-title">收益浮动型</span>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="viewplan-section">
				<div class="viewplan-section-about">
					<div class="viewplan-section-title">
						<span>关于疾病种类</span>
						<span class="viewplan-section-title-tips" id="typeOfDisease">疾病种类</span>
					</div>
					<div class="viewplan-section-about-content">
						<div class="charts-wraper">
							<div class="charts-content" id = 'risk03img04'>
								<img src="">
							</div>
						</div>
						<div class="text">
							<p>
								中国保监会和中国医师协会在2006年发布<span
									style="color: #282828;font-weight: 400;">《重大疾病保险的疾病定义使用规范》</span>，
								统一了重疾险产品中最常见的25种疾病定义，占据所有重疾险理赔的<span style="color: #dc220d">98%</span>以上，
								额外增加的疾病种类对发生率影响很小。
							</p>
							<p>
								极早期恶性肿瘤或恶性病变、不典型心肌梗塞、轻微脑中风后遗症等7种高发轻症占据轻症理赔的<span style="color: #dc220d">99%</span>以上。
							</p>
						</div>
					</div>
				</div>
			</div>
			<div class="viewplan-section">
				<div class="viewplan-section-insurance-tips-box" id="rulesTab">
					<div class="page rules-tab">
						<div class="page__bd" style="height: 100%;">
							<div class="weui-tab">
								<div class="weui-navbar">
									<div class="weui-navbar__item weui-bar__item_on" data-type="beAbleTo">
										保什么
									</div>
									<div class="weui-navbar__item" data-type="shouldNot">
										不保什么
									</div>
									<div class="weui-navbar__item" data-type="rules">
										投保规则
									</div>
								</div>
								<div class="weui-tab__panel">
									<div class="tab-table-box">
										<div class="tab-table-content">
<!--											<ul id="tabDetail"></ul>-->
											<div id="tabDetail">
												<img src=''>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="viewplan-section viewplan-section-supplement" id='aboutdbbc' style="display:none">
				<div class="viewplan-section-title">
					<span>关于重疾补充</span>
				</div>
				<div class="viewplan-section-about-content">
					<div class="charts-wraper">
						<div class="charts-content">
							<img src="/images/insureplan/dabingbuchong.jpg">
						</div>
					</div>
					<div class="text">
						<p>
							超赔特色：保费最低仅需<span style="color: #dc220d">6元</span>起，终身即享<span
								style="color: #dc220d">300万</span>重疾超额赔付，突破医保限制，一辈子解决重疾所有事儿。
						</p>
						<p>
							对标医院：中华人民共和国境内（港、澳、台地区除外）合法经营的<span style="color: #282828;font-weight: 400;">二级及二级以上</span>公立医院，北京市平谷区、密云县、怀柔区所有医院除外，且不包括特需医疗、外宾/干部/联合病房、国际医疗中心、VIP部、联合医院等。
						</p>
					</div>
				</div>
			</div>
			<div class="viewplan-section">
				<div class="viewplan-section-title">
					<span>关于理赔场景</span>
				</div>
				<div class="viewplan-section-insurance-supplement-box" id="scenesTab">
					<div class="page">
						<div class="page__bd" style="height: 100%;">
							<div class="weui-tab">
								<div class="weui-navbar">
									<div class="weui-navbar__item weui-navbar__item__scenes tab-active" data-scenestype="a"
										 data-hasclick="yes">
										<span class="scenes-title">A情景</span>
										<span class="scenes-title-desc">健康无忧</span>
									</div>
									<div class="weui-navbar__item weui-navbar__item__scenes tab-no-click" data-scenestype="b"
										 data-hasclick="no">
										<span class="scenes-title">B情景</span>
										<span class="scenes-title-desc">不幸患病</span>
									</div>
									<div class="weui-navbar__item weui-navbar__item__scenes tab-no-click" data-scenestype="c"
										 data-hasclick="no">
										<span class="scenes-title">C情景</span>
										<span class="scenes-title-desc">不幸身故</span>
									</div>
								</div>
								<div class="scene-desc" id="sceneDesc">
									有病理赔，无病储蓄，不仅保大病还可以增值
								</div>
								<div class="scene-desc-sub" id="sceneDescSub">
								</div>
								<div class="weui-tab__panel">
									<div id="panelContent"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="viewplan-section" id="ourPromise">
				<div class="viewplan-section-title">
					<span>我们的承诺</span>
				</div>
				<div class="viewplan-section-insurance-supplement-box">
					<div class="page">
						<div class="page__bd" style="height: 100%;padding: 25px 15px;    text-align: center;">
							<img src="/images/insureplan/womendechengnuo.png">
							<img id="signButton" src="/images/insureplan/anniu.png" style="width: 140px;margin-top: 25px;">
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="footer">
			<div class="footer-logo">
				<img src="/images/insureplan/meihua_logo_white.png">
			</div>
		</div>
	</div>
</div>
<script src="/js/common/lcl/lib/jquery1.12.4.min.js"></script>
<script src="/js/common/lcl/lib/jquery-weui.min.js"></script>
<script src="https://cdn.bootcss.com/echarts/4.3.0/echarts.min.js"></script>
<script src="/js/insureplan/viewplan.js?v=20200331_01"></script>
<script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js?v=20191213_01"></script>
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
	
		var planid = '${planid}';
	
		wx.ready(function () {	//朋友圈
		   	wx.onMenuShareTimeline({
		        title: pyqtitle, // 分享标题
		        link: pyqlink+'&planid='+planid, // 分享链接
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
		        link: pyqlink+'&planid='+planid, // 分享链接
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
</body>
</html>
