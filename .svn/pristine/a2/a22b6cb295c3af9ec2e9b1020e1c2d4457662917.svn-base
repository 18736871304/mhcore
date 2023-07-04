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
    <title>家庭保障方案</title>
    <link rel="stylesheet" href="/css/common/lcl/lib/weui.min.css">
    <link rel="stylesheet" href="/css/common/lcl/common.css">
    <link rel="stylesheet" href="/fonts/lcl/iconfont.css">
    <link rel="stylesheet" href="/css/insureplan/familyplan.css?v=20200402_001">
</head>
<body>
<input style="display:none" id="planid" value="${planid}">
<div class="view-plan" id="viewplan">
    <div class="viewplan-content">
        <div class="viewplan-section-box">
            <div class="viewplan-banner">
                <div class="banner-img">
                    <img src="/images/insureplan/family_banner.jpg">
                </div>
                <div class="banner-info-box">
                    <div class="banner-info-wraper">
                        <div class="banner-info">
                            <div class="banner-info-title">投保人姓名</div>
                            <div class="banner-info-content" id="uname"></div>
                        </div>
                        <div class="banner-info">
                            <div class="banner-info-title">保障家人</div>
                            <div class="banner-info-content" id="guaranteeNumber"></div>
                        </div>
                        <div class="banner-info">
                            <div class="banner-info-title">首年保费</div>
                            <div class="banner-info-content" id="firstYearMoney"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="viewplan-section">
                <div class="viewplan-section-title">
                    <span>我们的承诺</span>
                </div>
                <div class="viewplan-section-insurance-supplement-box">
                    <div class="page">
                        <div class="page__bd" style="height: 100%;padding: 15px 0 25px 0;    text-align: center;">
                           <div class="promise-line1">
                               有人问，为什么我们敢于承诺
                           </div>
                            <div class="promise-line2">
                                <div class="item-box">
                                    <div class="promise-text-img">
                                        <img src="/images/insureplan/shen.png">
                                    </div>
                                    <div class="promise-text-middle">责任全面</div>
                                    <div class="promise-text-bottom">
                                        <p>包含高发疾病</p>
                                        <p>不含隐性条款</p>
                                    </div>
                                </div>
                                <div class="item-box">
                                    <div class="promise-text-img">
                                        <img src="/images/insureplan/mian.png">
                                    </div>
                                    <div class="promise-text-middle">豁免权利</div>
                                    <div class="promise-text-bottom">
                                        <p>越多越好</p>
                                        <p>最大化杠杆利用率</p>
                                    </div>
                                </div>
                                <div class="item-box">
                                    <div class="promise-text-img">
                                        <img src="/images/insureplan/gao.png">
                                    </div>
                                    <div class="promise-text-middle">性价比高</div>
                                    <div class="promise-text-bottom">
                                        <p>抗击通货膨胀</p>
                                        <p>1 次解决 1 辈子所有事</p>
                                    </div>
                                </div>
                            </div>
                            <div class="promise-line3">
                                <div class="desc">因为“IPM6+1”严选模式层层把关，产品足够好！</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="viewplan-tab">
                <div class="tab-wrap">
                    <ul class="tab-ul" id="familyTab">

                    </ul>
                </div>
            </div>
            <div class="viewplan-section" style="margin-top: 5px;">
                <div class="viewplan-section-insurance-type-box" id="yiwaibaozhangSection" style="display: none">
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
                <div class="viewplan-section-insurance-type-box" id="yiliaobaozhangSection" style="display: none">
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
                            <span id="yiliaobaozhangTotal">98元</span>
                            <i id="xiaobingbaozhangExplain" class="iconfont iconjieshi ylrate-dialog" style="color: #dc220d;display: none;"></i>
                        </div>
                    </div>
                </div>
                <div class="viewplan-section-insurance-type-box" id="zhongjibaozhangSection" style="display: none">
                    <div class="viewplan-section-title" style="justify-content: space-between;">
                        <div class="title-text">
                        	重疾保障
                        </div>
                        <div class="more_desp zj_disease_dialog" id="more_desp">更多</div>
                        <div class="title-logo">
                            <img id="dabingbaozhangImg" src="">
                        </div>
                    </div>
                    <div class="viewplan-section-expense-list">
                        <ul id="dabingbaozhangBox">
                        </ul>
                        <div class="expense-total">
                            <span id="zhongjibaozhangTotal">0元</span>
                            <i id="dabingbaozhangExplain" class="iconfont iconjieshi rate-dialog" style="color: #dc220d;display: none;"></i>
                        </div>
                    </div>
                </div>
                <div class="viewplan-section-insurance-type-box" id="dabingbuchongSection" style="display: none">
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
							<span id="dabingbuchongTotal"></span>
							<i id="dabingbuchongExplain" class="iconfont iconjieshi dbbc_rate-dialog" style="color: #dc220d;display: none;"></i>
						</div>
					</div>
				</div>
                <div class="viewplan-section-insurance-type-box" id="shengubaozhangSection" style="display: none">
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
                <div class="viewplan-section-insurance-type-box" id="zongbaofeiSection" style="display: none">
                    <div class="viewplan-section-title" style="justify-content: space-between;">
                        <div class="title-text">总保费</div>
                        <div class="title-logo">
                            <span id="zongbaofeiTotal" style="color: #363636;">0元</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="viewplan-section">
                <div class="viewplan-section-title">
                    <span>常见问题</span>
                </div>
                <div class="viewplan-section-insurance-supplement-box">
                    <div class="page">
                        <div class="page__bd" style="height: 100%;padding: 10px 0 18px 0;">
                            <div id="accordion" class="accordion">
                                <div class="accordion-item">
                                    <div class="accordion-title">
                                        <span><img src="/images/insureplan/question_icon.png">配置保险为什么要先保障后理财？</span>
                                        <span><img src="/images/insureplan/down_angle.png"></span>
                                    </div>
                                    <div class="accordion-detail">
                                        保险种类分两类，一种是保障类保险，另一种是理财类保险，即具备一定的投资储蓄功能的保险。保险的保障意义主要体现在人身风险防范上，很多客户偏好储蓄投资类保险，却忽略家庭的人身风险保障！
                                        人是家庭的根本，有了家庭成员整个家庭才能够存在，所以在购买保险时应该先满足家庭成员的人身保障，再进行家庭财产的规划和投资。只有在家庭成员的生命安全得到保障时，财富规划才有意义！
                                    </div>
                                </div>
                                <div class="accordion-item">
                                    <div class="accordion-title">
                                        <span><img src="/images/insureplan/question_icon.png">配置保险为什么要先大人后小孩？</span>
                                        <span><img src="/images/insureplan/down_angle.png"></span>
                                    </div>
                                    <div class="accordion-detail">
                                        很多家长买保险进入一个误区：只给孩子买或优先给孩子买，自己却是保险“裸奔”！理性来讲，中短期内孩子对于家庭其实算是“负资产”，成年之前都没办法
                                        给家庭贡献收入。父母才是孩子的第一保险！
                                        此外，家庭收入创造上来说经济支柱是“强者”，但是从家庭角度却是风险的一个“软肋”。经济支柱的保障比年迈父母、小孩的重要。家庭保障，必须优先完善经济支柱的保险，因为他们是保证家庭正常运作的人。
                                    </div>
                                </div>
                                <div class="accordion-item">
                                    <div class="accordion-title">
                                        <span><img src="/images/insureplan/question_icon.png">配置保险的正确顺序是什么？</span>
                                        <span><img src="/images/insureplan/down_angle.png"></span>
                                    </div>
                                    <div class="accordion-detail">
                                        保险优先考虑保障类，需求来看无非“四大天王”：意外、重疾、医疗、寿险。
                                        意外险：意外险是最基本的保障，且意外险保费也便宜。有车一族家庭又需要经常开车的，可以购买百万畅行类意外险，高额身价，出行无忧！
                                        健康险：重疾险保费较高，视家庭经济情况来定。经济较宽裕的可以选择夫妻互保，百万医疗险作为重疾险的补充；如资金有限，可以先给支柱充足投保，也可选择百万医疗险和消费型的重疾险作为过渡保障。
                                        寿险：不少家庭存在房贷负债压力，因此很有必要补充房屋主贷人的寿险保额来达到高额的风险保障，帮助承担未来的家庭责任。
                                    </div>
                                </div>
                                <div class="accordion-item">
                                    <div class="accordion-title">
                                        <span><img src="/images/insureplan/question_icon.png">配置保险为什么要先保额后保全？</span>
                                        <span><img src="/images/insureplan/down_angle.png"></span>
                                    </div>
                                    <div class="accordion-detail">
                                        保险条款繁多，产品众多，不同险种一定有它核心的对比参数，也一定有它不重要的对比参数，这些都在影响我们的选择。所以，选择一款保险，到底关键是对比什么？如何才能不花冤枉钱？就需要知道每一款产品的关键条款和要素，这样才能根据我们的实际情况，挑选到最适合我们的保险。
                                        随着通货膨胀，医疗费用以平均2.6%的速度逐年递增，现在的30万元，30年以后只有14万元，因此，我们建议，对于关键条款的取舍，趁着年龄小，保费低，在预算充足的情况下，先保额再保全。
                                    </div>
                                </div>
                                <div class="accordion-item">
                                    <div class="accordion-title">
                                        <span><img src="/images/insureplan/question_icon.png">配置保险为什么要先产品后公司？</span>
                                        <span><img src="/images/insureplan/down_angle.png"></span>
                                    </div>
                                    <div class="accordion-detail">
                                        先举个例子，2008年美国次贷危机，美国政府在国家经济最困难的时候，就是2008年9月16日晚，拒绝了美国第四大银行雷曼兄弟的求救，任其破产，第二天却拯救了AIG友邦保险集团。放弃救银行，而选择救保险公司的本质，就是保险是一个国家最后一道安全防线。
                                        中国也是，银行可以破产，但是《保险法》第八十九条早已明确规定：“经营有人寿保险业务的保险公司，除分立、合并外，不得解散。”所以，选择一款符合自己需求、保障全面的保险合同（保障责任及条款）是最重要的，毕竟最终的兑付是按合同来的。
                                    </div>
                                </div>
                            </div>
                        </div>
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
                            <div class="text-line1">
                                其他人还在了解什么？
                            </div>
                            <div class="text-line2" id="jiatingbaodanpeizhi">
                                家庭保单配置样板间 ＋
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="viewplan-section">
                <div class="viewplan-section-title">
                    <span>我们是谁</span>
                </div>
                <div class="viewplan-section-insurance-supplement-box">
                    <div class="page">
                        <div class="page__bd" style="height: 100%;padding: 25px 15px;    text-align: center;">
                            <img src="/images/insureplan/whoweare.jpg">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer">
            <div class="footer-logo">
                <img src="/images/insureplan/meihua_logo_gray.png">
            </div>
        </div>
    </div>
</div>
<script src="/js/common/lcl/lib/jquery1.12.4.min.js"></script>
<script src="/js/common/lcl/lib/jquery-weui.min.js"></script>
<script src="https://cdn.bootcss.com/echarts/4.3.0/echarts.min.js"></script>
<script src="/js/insureplan/familyplan.js?v=20200329_005"></script>
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
