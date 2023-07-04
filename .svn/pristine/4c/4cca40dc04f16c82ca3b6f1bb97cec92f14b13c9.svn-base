<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en" style="font-size: calc(100vw/18.75);">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>确认并支付</title>
    <!-- 
    <link rel="icon" href="https://www.dahuobaoxian.com/order/shopping/images/favicon.ico">
     -->
     
    <link rel="stylesheet" href="../../css/hengqin/payment.css?v=20180504_01">
    <script src="../../js/hengqin/jquery-1.10.1.min.js?v=180504"></script>
    <script src="../../js/fuxinglhjk/payment.js?v=2018080603"></script>
</head>
<body style="">
    <header class="header bgColor">
        <h3 class="pl pr">${riskname}</h3>
        
        <div class="headerDetails pl pr  w100">
            <dl class="insureDetails">
            	<span class="headerLeft">投保单号：${proposalprtno}</span><span class="headerRight"></span>
            </dl>
            <dl class="insureDetails">
            	<span class="headerLeft">投保人：${appntname}</span><span class="headerRight"></span>
            </dl>
            <dl class="insureDetails">
                <span class="headerLeft">保险期限：${insuyear}</span><span class="headerRight"></span>
            </dl>
            <dl class="insureDetails">
            	<span class="headerLeft">应缴保费：${sumprem} 元</span><span class="headerRight"></span>
            </dl>
        </div>
    </header>
    <div class="order txtC bgColor">
        <span class="hideOrder">显示订单详情 </span>
    </div>
    <article class="info">
        <!--投保人信息-->
        
        <c:if test="${riskcode=='110084'}">
        <section class="pl pr bgColor">
	        <p class="borBot1 secTitle">保障详情</p>
	        <div class="orderDetails w100">
	            <dl>
	                <span class="orderLeft">一般医疗保险金：200万</span><span class="orderRight"></span>
	            </dl>
                <dl>
                    <span class="orderLeft">特定疾病医疗保险金：400万</span><span class="orderRight"></span>
                </dl>
                <dl>
                    <span class="orderLeft">甲类及按甲类管理的乙类法定传染病危重型疾病保险金：
	                    <c:if test="${productcode=='01'}">
	                    	1万
	                    </c:if>
                    	<c:if test="${productcode=='02'}">
	                    	1.5万
	                    </c:if>
                    </span><span class="orderRight"></span>
                </dl>
                <dl>
                    <span class="orderLeft">少儿一般意外住院津贴医疗保险金：
                    	<c:if test="${aliascode=='N'}">
	                    	不投保
	                    </c:if>
	                    <c:if test="${aliascode=='Y'}">
	                    	7.3万
	                    </c:if>
                    </span><span class="orderRight"></span>
                </dl>
                <dl>
                    <span class="orderLeft">少儿接种意外住院津贴医疗保险金：
                    	<c:if test="${aliascode=='N'}">
	                    	不投保
	                    </c:if>
	                    <c:if test="${aliascode=='Y'}">
	                    	7.3万
	                    </c:if>
                    </span><span class="orderRight"></span>
                </dl>
	            <dl>
                    <span class="orderLeft">少儿特定疾病保险金：
                    	<c:if test="${aliascode=='N'}">
	                    	不投保
	                    </c:if>
	                    <c:if test="${aliascode=='Y'}">
	                    	<c:if test="${productcode=='01'}">
	                    		1万
	                    	</c:if>
	                    	<c:if test="${productcode=='02'}">
	                    		1.5万
	                    	</c:if>
	                    </c:if>
                    </span><span class="orderRight"></span>
                </dl>
            </div>
	    </section>
        </c:if>
	    <section class="pl pr bgColor">
	        <p class="borBot1 secTitle">投保人信息</p>
	        <div class="orderDetails w100">
	            <dl>
	                <span class="orderLeft">姓名：${appntname}</span><span class="orderRight"></span>
	            </dl>
                <dl>
                    <span class="orderLeft">性别：${appntsex}</span><span class="orderRight"></span>
                </dl>
                <dl>
                    <span class="orderLeft">生日：${appntbirthday}</span><span class="orderRight"></span>
                </dl>
                <dl>
                    <span class="orderLeft">证件类型：${appntidtype}</span><span class="orderRight"></span>
                </dl>
                <dl>
                    <span class="orderLeft">证件号码：${appntidno}</span><span class="orderRight"></span>
                </dl>
	            <dl>
                    <span class="orderLeft">邮箱：${appntemail}</span><span class="orderRight"></span>
                </dl>
                 <dl>
                    <span class="orderLeft">手机：${appntmobile}</span><span class="orderRight"></span>
                </dl>
                 <dl>
                    <span class="orderLeft">地址：${appntaddress}</span><span class="orderRight"></span>
                </dl>
            </div>
	    </section>
	    
        <!--被保人信息-->
        <section class="pl pr pt pb bgColor">
            <p class="borBot1 secTitle">被保人信息</p>
            <div class="orderDetails w100">
                <dl>
                    <span class="orderLeft">姓名：${insuame}</span><span class="orderRight"></span>
                </dl>
                <dl>
                    <span class="orderLeft">性别：${insusex}</span><span class="orderRight"></span>
                </dl>
                <dl>
                    <span class="orderLeft">生日：${insubirthday}</span><span class="orderRight"></span>
                </dl>
                <dl>
                    <span class="orderLeft">证件类型：${insuidtype}</span><span class="orderRight"></span>
                </dl>
                <dl>
                    <span class="orderLeft">证件号码：${insuidno}</span><span class="orderRight"></span>
                </dl>
                 <dl>
                    <span class="orderLeft">邮箱：${insuemail}</span><span class="orderRight"></span>
                </dl>
                 <dl>
                    <span class="orderLeft">手机：${insumobile}</span><span class="orderRight"></span>
                </dl>
                 <dl>
                    <span class="orderLeft">地址：${insuaddress}</span><span class="orderRight"></span>
                </dl>
                <!-- 
                <dl>
                    <span class="orderLeft">身高：${height} CM</span><span class="orderRight"></span>
                </dl>
                <dl>
                    <span class="orderLeft">体重：${weight} KG</span><span class="orderRight"></span>
                </dl>
                 -->
            </div>
        </section>
	    
        <!--其他信息-->
        <section class="pl pr pt pb bgColor" style="display: none;">
            <p class="borBot1 secTitle">其他信息</p>
            <div class="orderDetails w100">
                <dl>
                    <span class="orderLeft policyType">保单类型：</span><span class="orderRight">电子保单(理赔时只需要提供身份证即可)</span>
                </dl>
            </div>
        </section>
    </article>
    <!--支付方式-->
    <section class="borBot1 bgColor">
	    <form id="payTypeForm" action="" method="post">
	        <input type="hidden" name="orderNo" id="orderNo" value="${orderNo}">
	        <input type="hidden" name="insOrganCode" id="insOrganCode" value=${insOrganCode}>
	        <input type="hidden" name="message" id="message" value=${message}>
	        <p class="pl borTop1 payTitle">支付方式</p>
	        <div class="pl pr borTop1 borBot1 largePay">
	            <dl class="clearfix infoDl borBot1 w100 depositCard payMethod">
	                <dt class="w60 l-float"><span class="payicon nocard"></span>储蓄卡支付</dt>
	                <dd class="w40 r-float choose">
	                </dd>
	            </dl>
	        </div>
		</form>
    </section>
    <!--勾选同意-->
    <section class="infoList">
        <div class="ml whetherRead pr">
            <i id="whetherCheck" class="unCheckBox whetherCheck"></i>
            <span>我已认真阅读
				<a href="<%=request.getContextPath()%>/contract/fuxinglhjk/fuxing-payment.pdf">《银行转账授权声明书》</a>并同意上述协议规定。
			</span>
        </div>
    </section>

    <!--支付按钮-->
<!--     <div class="pl bgColor fixedBox w100 hq-productBottom"> -->
<!--         <dl class="clearfix w100"> -->
<!--             <dt class="w65 l-float"></dt> -->
<!--             <dd class="w35 l-float"> -->
<!--                 <div class="insureBtn txtC">立即支付</div> -->
<!--             </dd> -->
<!--         </dl> -->
<!--     </div> -->
    <div class="pl bgColor fixedBox w100 hq-productBottom">
		            <dl class="clearfix  w100">
						<dt class="w65 l-float font16" style="padding-left: 2.3rem;text-align:center;position: relative;box-sizing: border-box;">
			            	<p class="kf_p"><img src="../../images/hengqin/bwyl/red_kf.png?v=20180402" alt="" style="width: 1.5rem;"></p>
							<span class="insurePrice" id="insurePrice" style="color:#333333">${sumprem}<span>
						</dt>
						<dd class="w35 r-float">
                <div class="insureBtn txtC">立即支付</div>
						</dd>
		            </dl>
		        </div>
    <!--加载动画-->
    <div class="loading">
        <div class="sk-circle">
            <div class="sk-circle1 sk-child"></div>
            <div class="sk-circle2 sk-child"></div>
            <div class="sk-circle3 sk-child"></div>
            <div class="sk-circle4 sk-child"></div>
            <div class="sk-circle5 sk-child"></div>
            <div class="sk-circle6 sk-child"></div>
            <div class="sk-circle7 sk-child"></div>
            <div class="sk-circle8 sk-child"></div>
            <div class="sk-circle9 sk-child"></div>
            <div class="sk-circle10 sk-child"></div>
            <div class="sk-circle11 sk-child"></div>
            <div class="sk-circle12 sk-child"></div>
        </div>
    </div>
	<div class="payLoading">
	    <div class="sk-circle">
	        <div class="sk-circle1 sk-child"></div>
	        <div class="sk-circle2 sk-child"></div>
	        <div class="sk-circle3 sk-child"></div>
	        <div class="sk-circle4 sk-child"></div>
	        <div class="sk-circle5 sk-child"></div>
	        <div class="sk-circle6 sk-child"></div>
	        <div class="sk-circle7 sk-child"></div>
	        <div class="sk-circle8 sk-child"></div>
	        <div class="sk-circle9 sk-child"></div>
	        <div class="sk-circle10 sk-child"></div>
	        <div class="sk-circle11 sk-child"></div>
	        <div class="sk-circle12 sk-child"></div>
	    </div>
        <div class="sk-text">处理中...</div>
	</div>
    <!--弹窗-->
    <div class="mask">
        <div class="pop repeat">
            <span>对不起，您的核保未通过XXX</span>
            <a class="pop-sure">确定</a>
        </div>
    </div>
</body>
<script>

var sumprem = '${sumprem}';

$(function () 
{
	$("#insurePrice").html(Number(sumprem).toFixed(2)+'<span style="font-size:0.65rem">元</span>');	
})
	var wait=60;
	function time(o) {
		if (wait == 0) {
		   	o.removeAttribute("disabled");
		   	$('#dd').html("获取验证码");
		   	$('#dd').show();
		   	$('#yc').hide();
		   	wait = 60;
	  	}else{
	  		$('#dd').hide();
			$('#yc').show();
		   	o.setAttribute("disabled", true);
			$('#yc').html( wait + "s");
			wait--;
		setTimeout(function() {
				time(o)
		},1000)
	  }
	 }
	
	document.getElementById("dd").onclick=function(){time(this);}
</script>
</html>