<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<html lang="en" style="font-size: calc(100vw/18.75);">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>确认并支付</title>
    <!-- 
    <link rel="icon" href="https://www.dahuobaoxian.com/order/shopping/images/favicon.ico">
     -->
    <link rel="stylesheet" href="../../css/hengqin/payment.css?v=20180509">
    <script src="../../js/hengqin/jquery-1.10.1.min.js?v=180504"></script>
    <script src="../../js/zhongan/payment.js?v=180504"></script>
</head>
<body style="">
    <header class="header bgColor">
        <h3 class="pl pr">${riskname}</h3>
        
        <div class="headerDetails pl pr  w100">
            <dl class="insureDetails">
            	<span class="headerLeft">订单号：${orderNo}</span><span class="headerRight"></span>
            </dl>
            <dl class="insureDetails">
            	<span class="headerLeft">投保人：${appntname}</span><span class="headerRight"></span>
            </dl>
            <dl class="insureDetails">
                <span class="headerLeft">保险期限：${insuyear}</span><span class="headerRight"></span>
            </dl>
            <dl class="insureDetails">
            	<span class="headerLeft">应缴费用：${sumprem} 元</span><span class="headerRight"></span>
            </dl>
        </div>
    </header>
    <div class="order txtC bgColor">
        <span class="hideOrder">显示订单详情 </span>
    </div>
    <article class="info">
        
        <!--投保人信息-->
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
                    <span class="orderLeft">证件类型：身份证</span><span class="orderRight"></span>
                </dl>
                <dl>
                    <span class="orderLeft">证件号码：${appntidno}</span><span class="orderRight"></span>
                </dl>
            </div>
	    </section>
	    
        <!--被保人信息-->
        <section class="pl pr pt bgColor">
            <p class="borBot1 secTitle">被保人信息</p>
            <div class="orderDetails w100">
            <c:forEach items="${tinsList}" var="insList" varStatus = "status">
                <dl>
                    <span class="orderLeft">姓名：${insList.name}</span><span class="orderRight"></span>
                </dl>
                <dl>
                    <span class="orderLeft">性别：${insList.sex}</span><span class="orderRight"></span>
                </dl>
                <dl>
                    <span class="orderLeft">生日：${insList.birthday}</span><span class="orderRight"></span>
                </dl>
                <dl>
                    <span class="orderLeft">证件类型：身份证</span><span class="orderRight"></span>
                </dl>
                <dl>
                    <span class="orderLeft">证件号码：${insList.idno}</span><span class="orderRight"></span>
                </dl>
                <dl>
                    <span class="orderLeft">职业：${insList.jobcode}</span><span class="orderRight"></span>
                </dl>
                <c:if test="${status.count!=fn:length(tinsList)}">
                <br>
                </c:if>
           	</c:forEach>
            </div>
        </section>
	    
        <!--其他信息-->
        <section class="pl pr pt bgColor">
            <p class="borBot1 secTitle">其他信息</p>
            <div class="orderDetails w100">
                <dl>
                    <span class="orderLeft policyType">保单类型：</span><span class="orderRight">电子保单(理赔时只需要提供身份证即可)</span>
                </dl>
            </div>
        </section>
    </article>

    <!--勾选同意-->
    <section class="infoList">
        <div class="ml whetherRead pr">
            
        </div>
    </section>


    <!--支付按钮-->
    <div class="pl bgColor fixedBox w100 hq-productBottom">
    	<input type="hidden" name="orderNo" id="orderNo" value=${orderNo}>
        <dl class="clearfix w100">
            <dt class="w65 l-float font16" style="padding-left: 2.3rem;text-align:center;position: relative;box-sizing: border-box;">
            	<p class="kf_p"><img src="../../images/hengqin/bwyl/red_kf.png?v=20180402" alt="" style="width: 1.5rem;"></p>
            	<span class="insurePrice" id="insurePrice" style="color:#333333">${sumprem}<span>元</dt>
            <dd class="w35 l-float">
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
	var sumprem = '${sumprem}';
	var repayjson = ${repayjson};

	$(function () 
	{
		$("#insurePrice").html(Number(sumprem).toFixed(2)+'<span style="font-size:0.65rem">元</span>');

		//显示隐藏订单详情
	    $(".order").on("click", function () {
	        if ($(this).find("span").hasClass("hideOrder")) {
	            $(".info").slideDown();
	            $(this).find("span").removeClass("hideOrder").addClass("showOrder").text("隐藏订单详情");
	        } else {
	            $(".info").slideUp();
	            $(this).find("span").removeClass("showOrder").addClass("hideOrder").text("显示订单详情");
	        }
	    });
	    
	    $(".insureBtn").on("click", function () 
	    {
	    	
	    	WeixinJSBridge.invoke('getBrandWCPayRequest',repayjson,function(res)
	    	{
	    		//alert(repayjson);
	    		//alert(JSON.stringify(res));
	    		
		    	if(res.err_msg == 'get_brand_wcpay_request:ok')
		    	{
		    		window.location.href = "../../life/zhongan/pageback.do?orderNo="+$("#orderNo").val();
		    	}
		    	else
		    	{
		    		$(".pop").show();
	    	        $(".mask").show();
	    	        $(".pop span").text("没有支付成功，请重试");
		    	}
	   		});
	    });
	    
	    //弹窗
	    $(".pop-sure").on("click",function(){
	        $(".pop").hide();
	        $(".mask").hide();
	    });
	})

	function sendRequest(url, data, success, error) {
	  $.ajax({
	      url: url,
	      type: "post",
	      async: true,
	      data: data ? data : {},
	      beforeSend:function(){
	      	$(".loading").show();
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
	      	$(".loading").hide();
	      }
	  });
	}	
})
</script>
</html>