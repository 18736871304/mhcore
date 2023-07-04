<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en" style="font-size: calc(100vw/18.75);">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>确认并支付</title>
     <link rel="stylesheet" href="../../css/car/sun_04.css?v=20180815">
    <link rel="stylesheet" href="../../css/hengqin/infos.css?v=20180518_01"> 
    <script src="../../js/hengqin/jquery-1.10.1.min.js?v=180504"></script>
    <script src=" ../../js/hengqin/mobiscroll-2.13.2.full.min.js?v=2180719_01" type="text/javascript"></script>
    <script src=" ../../js/hengqin/iscroll.js?v=2180719_01" type="text/javascript"></script>
    <script src=" ../../js/hengqin/iosSelect.js?v=2180719_01" type="text/javascript"></script>   
    <script src="../../js/car/suncar/chengshi2.js?v=2180618_09"></script>
    <script src=" ../../js/car/suncar/checkFn.js?v=2180719_06"></script>
    <script src=" ../../js/car/suncar/sun_04.js?v=2180725_09"></script>
</head>
<script type="text/javascript">
var provinces=[{"id":"11","codeValue":"11","value":"北京","parentId":"0"},
	   			{"id":"12","codeValue":"12","value":"天津","parentId":"0"},
	   			{"id":"13","codeValue":"13","value":"河北省","parentId":"0"},
	   			{"id":"14","codeValue":"14","value":"山西省","parentId":"0"},
	   			{"id":"15","codeValue":"15","value":"内蒙古自治区","parentId":"0"},
	   			{"id":"21","codeValue":"21","value":"辽宁省","parentId":"0"},
	   			{"id":"22","codeValue":"22","value":"吉林省","parentId":"0"},
	   			{"id":"23","codeValue":"23","value":"黑龙江省","parentId":"0"},
	   			{"id":"31","codeValue":"31","value":"上海市","parentId":"0"},
	   			{"id":"32","codeValue":"32","value":"江苏省","parentId":"0"},
	   			{"id":"33","codeValue":"33","value":"浙江省","parentId":"0"},
	   			{"id":"34","codeValue":"34","value":"安徽省","parentId":"0"},
	   			{"id":"35","codeValue":"35","value":"福建省","parentId":"0"},
	   		    {"id":"36","codeValue":"36","value":"江西省","parentId":"0"},
   				{"id":"37","codeValue":"37","value":"山东省","parentId":"0"},
   				{"id":"41","codeValue":"41","value":"河南省","parentId":"0"},
   				{"id":"42","codeValue":"42","value":"湖北省","parentId":"0"},
   				{"id":"43","codeValue":"43","value":"湖南省","parentId":"0"},
   				{"id":"44","codeValue":"44","value":"广东省","parentId":"0"},
   				{"id":"45","codeValue":"45","value":"广西壮族自治区","parentId":"0"},
   				{"id":"46","codeValue":"46","value":"海南省","parentId":"0"},
	   			{"id":"50","codeValue":"50","value":"重庆市","parentId":"0"},
	   			{"id":"51","codeValue":"51","value":"四川省","parentId":"0"},
	   			{"id":"52","codeValue":"52","value":"贵州省","parentId":"0"},
	   			{"id":"53","codeValue":"53","value":"云南省","parentId":"0"},
	   			{"id":"54","codeValue":"54","value":"西藏自治区","parentId":"0"},
	   			{"id":"61","codeValue":"61","value":"陕西省","parentId":"0"},
	   			{"id":"62","codeValue":"62","value":"甘肃省","parentId":"0"},
	   			{"id":"63","codeValue":"63","value":"青海省","parentId":"0"},
	   			{"id":"64","codeValue":"64","value":"宁夏回族自治区","parentId":"0"},
	   			{"id":"65","codeValue":"65","value":"新疆维吾尔自治区","parentId":"0"}
	   			
	   		]; 
</script>
<body style="">
    <header class="header11 borTop11 bgColor">
        <h3 class="pl1 pr1 wenzi">阳光车险</h3>
        <input type="text" hidden="hidden" id="syProposalNo" value="${syProposalNo}">
        <input type="text" hidden="hidden" id="jqProposalNo" value="${jqProposalNo}">
        <input type="text" hidden="hidden" id="insranceName" value="${cab.name}">
        <input type="text" hidden="hidden" id="orderid" value="${orderid}">
        <div class="headerDetails pl1 pr1 w100">
            <dl class="insureDetails">
            	<span class="headerLeft">投保单号：${syProposalNo}</span><span class="headerRight"></span>
            </dl>
            <dl class="insureDetails">
            	<span class="headerLeft">投保人：${cab.name}</span><span class="headerRight"></span>
            </dl>
            <%----%>
            <%--<dl class="insureDetails">--%>
                <%--<span class="headerLeft">保险期限：1年</span><span class="headerRight"></span>--%>
            <%--</dl>           --%>
            <dl class="insureDetails">
            	<span class="headerLeft">应缴保费：${totalPremium} 元</span><span class="headerRight"></span>
            </dl>
        </div>
    </header>
    <div class="order txtC bgColor">
        <span class="hideOrder">显示订单详情 </span>
    </div>
    <article class="myinfo">
        <!--投保人信息-->
	    <section class="pl1 pr1 bgColor">
	        <p class="borBot11 secTitle">投保人信息</p>
	        <div class="orderDetails w100">
	            <dl>
	                <span class="orderLeft">姓名：${cab.name}</span><span class="orderRight"></span>
	            </dl>
                <dl>
                    <span class="orderLeft">证件号码：${cab.idno}</span><span class="orderRight"></span>
                </dl>	            
                 <dl>
                    <span class="orderLeft">手机：${cab.phone}</span><span class="orderRight"></span>
                </dl>
            </div>
	    </section>
	    
        <!--被保人信息-->
        <section class="pl1 pr1 pt bgColor">
            <p class="borBot11 secTitle">被保人信息</p>
            <div class="orderDetails w100">
                <dl>
                    <span class="orderLeft">姓名：${cib.name}</span><span class="orderRight"></span>
                </dl>
                
                <dl>
                    <span class="orderLeft">证件号码：${cib.idno}</span><span class="orderRight"></span>
                </dl>
                <dl>
                    <span class="orderLeft">手机：${cib.mobile}</span><span class="orderRight"></span>
                </dl>
            </div>
        </section>
	    <!--投保信息-->
        <section class="pl1 pr1 pt bgColor">
            <p class="borBot11 secTitle">投保信息</p>
            <div class="orderDetails w100">
                <dl>
                    <span class="orderLeft">车牌号：${ccb.licenseNo}</span><span class="orderRight"></span>
                </dl>
                
                <dl>
                    <span class="orderLeft">发动机号：${ccb.engineNo}</span><span class="orderRight"></span>
                </dl>
                <dl>
                    <span class="orderLeft">车架号：${ccb.frameNo}</span><span class="orderRight"></span>
                </dl>
                <dl>
                    <span class="orderLeft">厂牌型号：${ccb.vehicleName}</span><span class="orderRight"></span>
                </dl>
                <dl>
                    <span class="orderLeft">登记日期：${ccb.registerDate}</span><span class="orderRight"></span>
                </dl>
            </div>
        </section>
         <!--商业险信息-->
       <!--  <section class="pl1 pr1 pt bgColor">
            <p class="borBot11 secTitle">商业险信息</p>
            <div class="orderDetails w100 my_border">
            	<dl>
                    <span class="orderLeft">险种/保费(元)</span><span class="fr">保额</span>
                </dl> -->
                <%--<dl>--%>
                    <%--<span class="orderLeft">机动车损车险：冀G12321</span><span class="fr">123123123</span>--%>
                <%--</dl>--%>
                <%----%>
                <%--<dl>--%>
                    <%--<span class="orderLeft">第三者责任险：Q2345569</span><span class="fr">50万元</span>--%>
                <%--</dl>--%>
                <%--<dl>--%>
                    <%--<span class="orderLeft">司机责任险：29</span><span class="fr">1万/没做</span>--%>
                <%--</dl>--%>
                <%--<dl>--%>
                    <%--<span class="orderLeft">乘客责任险：50</span><span class="fr">1万/没做</span>--%>
                <%--</dl>--%>
                <%--<dl>--%>
                    <%--<span class="orderLeft">全车盗抢险：2018</span><span class="fr">222222</span>--%>
                <%--</dl>--%>
                <%--<dl>--%>
                    <%--<span class="orderLeft">玻璃破碎险：50</span><span class="fr">国产</span>--%>
                <%--</dl>--%>
                <%--<dl>--%>
                    <%--<span class="orderLeft">不计免赔</span>--%>
                <%--</dl>--%>
                 <%--<dl>--%>
                    <%--<span class="orderLeft">不计免赔-车损：50</span><span class="fr">投保</span>--%>
                <%--</dl>--%>
                <%--<dl>--%>
                    <%--<span class="orderLeft">不计免赔-三者：50</span><span class="fr">投保</span>--%>
                <%--</dl>--%>
                <%--<dl>--%>
                    <%--<span class="orderLeft">不计免赔-司机：50</span><span class="fr">投保</span>--%>
                <%--</dl>--%>
                <%--<dl>--%>
                    <%--<span class="orderLeft">不计免赔-乘客：50</span><span class="fr">投保</span>--%>
                <%--</dl>--%>
                <%--<dl>--%>
                    <%--<span class="orderLeft">不计免赔-盗抢：50</span><span class="fr">投保</span>--%>
                <%--</dl>--%>
                <%--&lt;%&ndash;<dl class="clearfix">&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<span class="orderLeft"></span><span class="fr">至：二十四小时止</span>&ndash;%&gt;--%>
                <%--&lt;%&ndash;</dl>&ndash;%&gt;--%>
                <%--<dl  class="clearfix">--%>
                    <%--<span class="orderLeft">随车行李险：50</span><span class="fr"></span>--%>
                <%--</dl>--%>
          <!--   </div>
        </section> -->
        
    </article>
    <header class="header11 borTop11 bgColor my_top">
	        <h3 class="pl1 pr1 wenzi">收件人信息</h3>	        
	        <div class="headerDetails pl1 pr1 w100">
	            <dl class="insureDetails clearfix">
	            	<dt class="w30 l-float">收件人姓名:</dt>
	                 <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
	               	    <input type="text" class="textfield txtR personInfo" style="font-size: 0.7rem;" id="policyName" name="policyName" value="" placeholder="请输入车主姓名">
	                 </dd>
                	 <span class="errorMsg"></span>
	            </dl>
	            <dl class="insureDetails clearfix">
	            	<dt class="w30 l-float">收件人电话:</dt>
	                 <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
	               	    <input type="text" class="textfield txtR personInfo" style="font-size: 0.7rem;" id="tel" name="tel" value="" placeholder="请输入车主电话">
	                 </dd>
                	 <span class="errorMsg"></span>
	            </dl>
	            
	             <dl class="insureDetails clearfix">
	                	<dt class="l-float" style="width: 30%;">通讯地址</dt>
	                    <dd class="w65 l-float txtR hasArrow" style="width: 70%;">
		                  	<input type="hidden" name="" id="" value="3">
		                    <input type="hidden" class="personInfo" id="appntProvince" name="applicant.appntProvince" value="">
		                    <input type="hidden" class="personInfo" id="appntCity" name="applicant.appntCity" value="">
		                    <input type="hidden" class="personInfo" id="appntCounty" name="applicant.appntCounty" value="">
		                    <input type="text" class="chosen pr" style="font-size: 0.7rem;margin-top: 0.4rem" readonly="" placeholder="请选择" id="appntArea" name="appntArea" value="">
		                    <i class="arrow"></i>
	                    </dd>
                    <span class="errorMsg"></span>
                 </dl>          
	            <dl class="insureDetails clearfix">
	            	<dt class="w30 l-float">详细地址:</dt>
	                 <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
	               	    <input type="text" class="textfield txtR personInfo" style="font-size: 0.7rem;" id="address" name="address" value="" placeholder="请输入车主详细地址">
	                 </dd>
                	 <span class="errorMsg"></span>
	            </dl>
	            <%--<dl class="insureDetails clearfix">--%>
	            	<%--<span class="headerLeft">被保人身份证地址：同收件人</span><span class="choose"><input type="checkbox" checked="checked"  id="jqx_checkboxs2" class="personInfo unCheckBox" value="on"></span>--%>
	            <%--</dl>--%>
				<%--<div class="jqx2" style="display: none;">--%>
					<%--<div class="my_dizhi borBot111">--%>
						<%--<dl class=" clearfix">--%>
						<%--<dt class="w30 l-float">联系人手机号:</dt>--%>
		                 <%--<dd class="w65 l-float txtR pr" style="box-sizing: border-box;">--%>
		               	   <%--<input type="text" class="textfield txtR personInfo" style="font-size: 0.7rem;" id="tel1" name="carowner" value="" placeholder="请输入车主电话">--%>
		                 <%--</dd>--%>
	                	 <%--<span class="errorMsg"></span>									--%>
						<%--</dl>--%>
					<%--</div>--%>
				<%--</div>	            --%>
	        </div>
	    </header>
	    <%--<header class="header11 borTop11 bgColor my_top ">--%>
	        <%--<h3 class="pl1 pr1 wenzi ">手机验证</h3>--%>
	        <%--<div class="clearfix pl1 pr1 my_phone">--%>
				<%--<input type="text" class="myinput fl" placeholder="请输入手机号码">--%>
				<%--<p class="fr my_phone_p">获取验证码</p>--%>
			<%--</div>--%>
	    <%--</header>--%>
	    <%--<header class="header11 borTop11 bgColor my_top dibu">--%>
	    <%--<span class="choose"><input type="checkbox" checked="checked1" id="jqx_checkboxs2" class="personInfo checkBox11" value="on"></span>--%>
				<%--<p class="fr dibu_p">我已认真阅读<span>《特别约定》</span><span>《商业险特被约定》</span><span>《浮 动告知单》</span><span>《车险条款》</span><span>《偿付能力及风险综合评级结果 披露告知书》</span>并同意上述规定</p>--%>
	    <%--</header>--%>
        <!--其他信息-->
    <section class="infoList">
        <div class="ml whetherRead">
            <i id="whetherCheck" class="checkBox"></i>
            <span >我已查看并同意
		            <a href="<%=request.getContextPath()%>/contract/car/sunCar/suncarZYGZ.docx">页面展示（重要告知）</a>
		            <a href="<%=request.getContextPath()%>/contract/car/sunCar/suncarTL_2014.docx">《中国保险行业协会机动车综合商业保险示范条款(2014版）》</a></span>
        </div>
    </section>
        
    <!--勾选同意-->
    <section class="infoList">
        <div class="ml whetherRead pr">            
        </div>
    </section>

    <!--支付按钮-->
    <div class="pl1 bgColor fixedBox w100 hq-productBottom">
    	<input type="hidden" name="orderNo" id="orderNo" value=${orderNo}>
        <dl class="clearfix w100">
            <dt class="w65 l-float font16" style="padding-left: 2.3rem;text-align:center;position: relative;box-sizing: border-box;">
            	<p class="kf_p"><img src="../../images/hengqin/bwyl/red_kf.png?v=20180402" alt="" style="width: 1.5rem;"></p>
            	<span class="insurePrice" id="insurePrice" style="color:#333333">${totalPremium}</span>元
            </dt>
            <dd class="w35 l-float">
                <div class="insureBtn txtC" id="carEnd">立即支付</div>
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

/* var sumprem = '${sumprem}'; */

$(function () 
{
    $(function ()
    {
        /* var sumprem = '${sumprem}';
        var repayjson = ${repayjson}; */

        $(function ()
        {
            /* $("#insurePrice").html(Number(sumprem).toFixed(2)+'<span style="font-size:0.65rem">元</span>'); */

            //显示隐藏订单详情
            $(".order").on("click", function () {
                if ($(this).find("span").hasClass("hideOrder")) {
                    $(".myinfo").slideDown();
                    $(this).find("span").removeClass("hideOrder").addClass("showOrder").text("隐藏订单详情");
                } else {
                    $(".myinfo").slideUp();
                    $(this).find("span").removeClass("showOrder").addClass("hideOrder").text("显示订单详情");
                }
            });

            //弹窗
            $(".pop-sure").on("click",function(){
                $(".pop").hide();
                $(".mask").hide();
            });
            
         $("input[type = checkbox]").each(function () {
                $(this).on("click", function () {
                    if ($(this).hasClass("unCheckBox")) {
                        $(this).val("on");
                        $(this).removeClass("unCheckBox").addClass("checkBox").prop("checked",true);
                        $(this).parent().siblings("span").find("input[type = text]").hide().val("");
                        // $(this).parent().parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
                    } else {
                        $(this).val("off");
                        $(this).removeClass("checkBox").addClass("unCheckBox").prop("checked",false);
                        $(this).parent().siblings("span").find("input[type = text]").show();
                        // $(this).parent().parent().siblings(".errorMsg").css("display", "inline-block").text("请输入有效期或选择长期！");
                    }
                });
            }); 

            
            //投保人
            $("#jqx_checkboxs2").on("click", function () {
                if ($(this).hasClass("unCheckBox")) {
                    $(".jqx2").slideUp();
                }else{
                    $(".jqx2").slideDown();
                }
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
})
</script>
</html>