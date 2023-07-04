<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en" style="font-size: calc(100vw/18.75);">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>被保险人个人健康告知书</title>
    <link rel="stylesheet" href="../../css/hengqin/infos.css?v=20180504">
    <script src=" ../../js/hengqin/jquery-1.10.1.min.js?v=20180504"></script>
    <script src=" ../../js/hengqin/mobiscroll-2.13.2.full.min.js?v=20180504" type="text/javascript"></script>
    <script src=" ../../js/hengqin/iscroll.js?v=20180504" type="text/javascript"></script>
    <script src=" ../../js/hengqin/iosSelect.js?v=20180504" type="text/javascript"></script>
    <script src=" ../../js/hengqin/checkFn.js?v=20180504"></script>
    <script src=" ../../js/anxin/insuranceInformation.js?v=20180504"></script>
<script type="text/javascript">
var provinces=[
				{'id':'110000','codeValue':'110000','value':'北京市','parentId':'0'},
				{'id':'120000','codeValue':'120000','value':'天津市','parentId':'0'},
				{'id':'130000','codeValue':'130000','value':'河北省','parentId':'0'},
				{'id':'140000','codeValue':'140000','value':'山西省','parentId':'0'},
				{'id':'150000','codeValue':'150000','value':'内蒙古自治区','parentId':'0'},
				{'id':'210000','codeValue':'210000','value':'辽宁省','parentId':'0'},
				{'id':'220000','codeValue':'220000','value':'吉林省','parentId':'0'},
				{'id':'230000','codeValue':'230000','value':'黑龙江省','parentId':'0'},
				{'id':'310000','codeValue':'310000','value':'上海市','parentId':'0'},
				{'id':'320000','codeValue':'320000','value':'江苏省','parentId':'0'},
				{'id':'330000','codeValue':'330000','value':'浙江省','parentId':'0'},
				{'id':'340000','codeValue':'340000','value':'安徽省','parentId':'0'},
				{'id':'350000','codeValue':'350000','value':'福建省','parentId':'0'},
				{'id':'360000','codeValue':'360000','value':'江西省','parentId':'0'},
				{'id':'370000','codeValue':'370000','value':'山东省','parentId':'0'},
				{'id':'410000','codeValue':'410000','value':'河南省','parentId':'0'},
				{'id':'420000','codeValue':'420000','value':'湖北省','parentId':'0'},
				{'id':'430000','codeValue':'430000','value':'湖南省','parentId':'0'},
				{'id':'440000','codeValue':'440000','value':'广东省','parentId':'0'},
				{'id':'450000','codeValue':'450000','value':'广西壮族自治区','parentId':'0'},
				{'id':'460000','codeValue':'460000','value':'海南省','parentId':'0'},
				{'id':'500000','codeValue':'500000','value':'重庆市','parentId':'0'},
				{'id':'510000','codeValue':'510000','value':'四川省','parentId':'0'},
				{'id':'520000','codeValue':'520000','value':'贵州省','parentId':'0'},
				{'id':'530000','codeValue':'530000','value':'云南省','parentId':'0'},
				{'id':'540000','codeValue':'540000','value':'西藏自治区','parentId':'0'},
				{'id':'610000','codeValue':'610000','value':'陕西省','parentId':'0'},
				{'id':'620000','codeValue':'620000','value':'甘肃省','parentId':'0'},
				{'id':'630000','codeValue':'630000','value':'青海省','parentId':'0'},
				{'id':'640000','codeValue':'640000','value':'宁夏回族自治区','parentId':'0'},
				{'id':'650000','codeValue':'650000','value':'新疆维吾尔自治区','parentId':'0'}
              ]

</script>
    <script>
        $(function () {
        	var currYear = (new Date()).getFullYear();
            function addDay(dayNumber, date) {
                date = date ? date : new Date();
                var ms = dayNumber * (1000 * 60 * 60 * 24);
                var newDate = new Date(date.getTime() + ms);
                return newDate;
            }
            var birthdayObj = {
                theme: 'android-ics light', //皮肤样式
                display: 'bottom', //显示方式
                rtl:true,
                mode: 'scroller', //日期选择模式
                lang:'zh',
                dateFormat: 'yyyy-mm-dd',
                dateOrder: 'ddmmyy',
                startYear:currYear - 150, //开始年份
                endYear:currYear, //结束年份
                maxDate: addDay(0),
                onSelect:function(){
                	if($(this).attr("id") == "birthday"){
                		if($("#cardType").find("option:selected").text() != "身份证" && $("#isSelf").val() == 1){
                    		calPrice();
                    	}
                	}else if($(this).attr("id") == "insuredBirthday"){
                		if($("#insuredCardType").find("option:selected").text() != "身份证" && $("#isSelf").val() == 0){
                    		calPrice();
                    	}
                	}
                }
            };
            // 出生日期
            $(".birthdayChoose").scroller('destroy').scroller($.extend({preset : 'date'}, birthdayObj));
            $(".insuredBirthdayChoose").scroller('destroy').scroller($.extend({preset : 'date'}, birthdayObj));
            var dateObj = {
                theme: 'android-ics light', //皮肤样式
                display: 'bottom', //显示方式
                rtl:true,
                mode: 'scroller', //日期选择模式
                lang:'zh',
                dateFormat: 'yyyy-mm-dd',
                dateOrder: 'ddmmyy',
                startYear:currYear - 80, //开始年份
                endYear:currYear + 30, //结束年份
                minDate: addDay(1)
            };
            // 证件有效期
            $("#idDate").scroller('destroy').scroller($.extend({preset : 'date'}, dateObj));
            $("#insuredIdDate").scroller('destroy').scroller($.extend({preset : 'date'}, dateObj));
            
            var startDateObj = {
                    theme: 'android-ics light', //皮肤样式
                    display: 'bottom', //显示方式
                    rtl:true,
                    mode: 'scroller', //日期选择模式
                    lang:'zh',
                    dateFormat: 'yyyy-mm-dd',
                    dateOrder: 'ddmmyy',
                    startYear:currYear - 80, //开始年份
                    endYear:currYear + 30, //结束年份
                    minDate: addDay($("#earlyDayInt").val()),
                    maxDate: addDay($("#lateDayInt").val())
                };
                // 起保日期
                $("#startTime").scroller('destroy').scroller($.extend({preset : 'date'}, startDateObj));
        });
    </script>
</head>
<body style="">
    <header class="header w100 borTop1 borBot1 pl bgColor">
        <span>安心e生·无忧百万医疗险</span><br/>
        <span>本产品由安心保险有限公司承保</span>
        <img src="../../images/logo/anxin.png" />
    </header>
    <article class="info" style="margin-top: 5.2rem">
        <form id="formId" name="formName" method="post">
            <input type="text" style="display:none" id="lateDayInt" name="lateDayInt" value="365">
            <input type="text" style="display:none" id="earlyDayInt" name="earlyDayInt" value="1">
           	<input type="text" style="display:none" class="personInfo" id="insOrganCode" value="anxin">
            <input type="text" style="display:none" class="personInfo" id="productNo" name="orderProduct.productCode" value="07P002_bwylPlus">
            <input type="text" style="display:none" class="personInfo" id="aliasname" value="bwylPlus">
            <input type="hidden" name="socialInsuFlag" id="socialInsuFlag" value="${socialInsuFlag}">
            <section class="infoList">
            	<p class="ml">被保险人个人健康告知书</p>
            	<div class="infoSec pl pr bgColor borTop1 borBot1">
	            	<dl class="clearfix borBot1 dlSec">
				        <dt class="w75 l-float">被保险人是否目前吸烟或曾经吸烟</dt>
					    <dd class="w25 l-float txtR hasArrow">
					        <select id ="isSmoke" class="premium txtR iFactor getDesc dw-hsel personInfo" tabindex="-1">
								<option value="N">否</option>
								<option value="Y">是</option>
						    </select>
					        <i class="arrow"></i>
						</dd>
			            <span class="errorMsg"></span>
				    </dl>
			   <!--  style="display: none;" -->
			   <div id="showSmokeDesc" style="display: none;">
			    <dl class="clearfix infoDl borBot1 dlSec">
					<dt class="w40 l-float">
					每日吸烟量<span class="space"></span>
					</dt>
					<dd class="w60 l-float txtR pr" style="box-sizing: border-box;">
					 <input type="text" class="textfield txtR personInfo" id="smokeamount" name="smokeamount" value="" placeholder="单位：支/天">
					</dd>
					<span class="errorMsg"></span>
				</dl>
				<dl class="clearfix infoDl borBot1 dlSec">
					<dt class="w40 l-float">
						吸烟年限<span class="space"></span>
					</dt>
					<dd class="w60 l-float txtR pr" style="box-sizing: border-box;">
						<input type="text" class="textfield txtR personInfo" id="smokeyear" name="smokeyear" value="" placeholder="单位：年">
					</dd>
					<span class="errorMsg"></span>
				</dl>
				</div>
		     	<dl class="clearfix borBot1 dlSec bottom-0">
			        <dt class="w75 l-float">被保险人是否目前饮酒或曾经饮酒</dt>
					<dd class="w25 l-float txtR hasArrow pr" style="box-sizing: border-box;">
					     <select id = "isDrink" class="premium txtR iFactor getDesc dw-hsel personInfo " tabindex="-1">
							<option value="N">否</option>
							<option value="Y">是</option>
						 </select>
						 <i class="arrow"></i>
					</dd>
			        <span class="errorMsg"></span>
		        </dl>
				<div id="showDrinkDesc" style="display: none;">
				<dl class="clearfix borBot1 dlSec">
			        <dt class="w40 l-float">酒的种类</dt>
					<dd class="w60 l-float txtR hasArrow pr" style="box-sizing: border-box;">
					     <select id = "beer" class="premium txtR iFactor dw-hsel" tabindex="-1">
							<option value="beer">啤酒</option>
						 </select>
						 <i class="arrow"></i>
					</dd>
			        <span class="errorMsg"></span>
		        </dl>
		        <dl class="clearfix infoDl borBot1 dlSec">
					<dt class="w40 l-float">
					 每日饮酒量<span class="space"></span>
					</dt>
					<dd class="w60 l-float txtR pr" style="box-sizing: border-box;">
					 <input type="text" class="textfield txtR personInfo" id="beearAmount" name="beearAmount" value="" placeholder="单位：两（50g）/天">
					</dd>
					<span class="errorMsg"></span>
				</dl>
				<dl class="clearfix infoDl borBot1 dlSec">
					<dt class="w40 l-float">
						饮酒年限<span class="space"></span>
					</dt>
					<dd class="w60 l-float txtR pr" style="box-sizing: border-box;">
						<input type="text" class="textfield txtR personInfo" id="beerYear" name="beerYear" value="" placeholder="单位：年">
					</dd>
					<span class="errorMsg"></span>
				</dl>
				<dl class="clearfix borBot1 dlSec">
			        <dt class="w40 l-float">酒的种类</dt>
					<dd class="w60 l-float txtR hasArrow pr" style="box-sizing: border-box;">
					     <select id = "wine" class="premium txtR iFactor  dw-hsel" tabindex="-1">
							<option value="wine">葡萄酒</option>
						 </select>
						 <i class="arrow"></i>
					</dd>
			        <span class="errorMsg"></span>
		        </dl>
		        <dl class="clearfix infoDl borBot1 dlSec">
					<dt class="w40 l-float">
					 每日饮酒量<span class="space"></span>
					</dt>
					<dd class="w60 l-float txtR pr" style="box-sizing: border-box;">
					 <input type="text" class="textfield txtR personInfo" id="wineAmount" name="wineAmount" value="" placeholder="单位：两（50g）/天">
					</dd>
					<span class="errorMsg"></span>
				</dl>
				<dl class="clearfix infoDl borBot1 dlSec">
					<dt class="w40 l-float">
						饮酒年限<span class="space"></span>
					</dt>
					<dd class="w60 l-float txtR pr" style="box-sizing: border-box;">
						<input type="text" class="textfield txtR personInfo" id="wineYear" name="wineYear" value="" placeholder="单位：年">
					</dd>
					<span class="errorMsg"></span>
				</dl>
				<dl class="clearfix borBot1 dlSec">
			        <dt class="w40 l-float">酒的种类</dt>
					<dd class="w60 l-float txtR hasArrow pr" style="box-sizing: border-box;">
					     <select id = "yellowWine" class="premium txtR iFactor  dw-hsel" tabindex="-1">
							<option value="yellowWine">黄酒</option>
						 </select>
						 <i class="arrow"></i>
					</dd>
			        <span class="errorMsg"></span>
		        </dl>
		        <dl class="clearfix infoDl borBot1 dlSec">
					<dt class="w40 l-float">
					 每日饮酒量<span class="space"></span>
					</dt>
					<dd class="w60 l-float txtR pr" style="box-sizing: border-box;">
					 <input type="text" class="textfield txtR personInfo" id="yellowWineAmount" name="yellowWineAmount" value="" placeholder="单位：两（50g）/天">
					</dd>
					<span class="errorMsg"></span>
				</dl>
				<dl class="clearfix infoDl borBot1 dlSec">
					<dt class="w40 l-float">
						饮酒年限<span class="space"></span>
					</dt>
					<dd class="w60 l-float txtR pr" style="box-sizing: border-box;">
						<input type="text" class="textfield txtR personInfo" id="yellowWineYear" name="yellowWineYear" value="" placeholder="单位：年">
					</dd>
					<span class="errorMsg"></span>
				</dl>
				<dl class="clearfix borBot1 dlSec">
			        <dt class="w40 l-float">酒的种类</dt>
					<dd class="w60 l-float txtR hasArrow pr" style="box-sizing: border-box;">
					     <select id = "liquor" class="premium txtR iFactor  dw-hsel" tabindex="-1">
							<option value="liquor">白酒或洋酒</option>
						 </select>
						 <i class="arrow"></i>
					</dd>
			        <span class="errorMsg"></span>
		        </dl>
		        <dl class="clearfix infoDl borBot1 dlSec">
					<dt class="w40 l-float">
					 每日饮酒量<span class="space"></span>
					</dt>
					<dd class="w60 l-float txtR pr" style="box-sizing: border-box;">
					 <input type="text" class="textfield txtR personInfo" id="liquorAmount" name="liquorAmount" value="" placeholder="单位：两（50g）/天">
					</dd>
					<span class="errorMsg"></span>
				</dl>
				<dl class="clearfix infoDl borBot1 dlSec">
					<dt class="w40 l-float">
						饮酒年限<span class="space"></span>
					</dt>
					<dd class="w60 l-float txtR pr" style="box-sizing: border-box;">
						<input type="text" class="textfield txtR personInfo" id="liquorYear" name="liquorYear" value="" placeholder="单位：年">
					</dd>
					<span class="errorMsg"></span>
				</dl>
				</div>
    		</div>
    		</section>
        </form>
        <!--投保按钮-->
        <div class="pl bgColor borTop1 borBot1 fixedBox w100" >
            <dl class="clearfix infoDl w100">
	            <dt class="w65 l-float font16" style="text-align:center;padding-left: 2.3rem;position: relative;box-sizing: border-box;">
				<p class="kf_p"><img src="../../images/hengqin/bwyl/red_kf.png?v=20180402" alt="" style="width: 1.5rem;"></p>
            	<input type="text" style="display:none" readonly="" class="insurePrice w70" id="insurePrice" value="${insurePrice}">
            	<span readonly="" class="insurePrice" id="disprice" >${insurePrice}</span><span id = "priceunit">元/年</span>
            	</dt>
				<dd class="w35 l-float">
				    <div class="insureBtn txtC" id="sureSave">下一步</div>
				</dd>
            </dl>
        </div>
    </article>
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
    <!--弹窗-->
    <div class="mask">
        <div class="pop repeat">
            <span>失败提示</span>
            <a class="pop-sure">确定</a>
        </div>
    </div>
    <div class="forSelfMask">
        <div class="forSelfPop forSelfRepeat">
            <p>是否确认投保？</p>
            <span>说明：根据相关规定，您作为投保人或被保险人购买产品将无法获得平台推广费和推荐奖励。</span>
            <div class="forSelfBtn">
                <a href="javascript:void(0);" class="forSelfUnsure">取消</a>
                <a href="javascript:void(0);" class="forSelfSure">确定</a>
            </div>
        </div>
    </div>
    </article>
</body>

<script type="text/javascript">

		$(".getDesc").change(function(e){
			
		   if($("#isSmoke").find("option:selected").val() == "Y"){
			   $("#showSmokeDesc").show();
			}else{
				$("#showSmokeDesc").hide();
			}
			if($("#isDrink").find("option:selected").val() == "Y"){
				$("#showDrinkDesc").show();
			}else{
				$("#showDrinkDesc").hide();
			}
			
		});
		
		function getData(){
			
		    var oObj = {};
		    $(".personInfo").each(function(index, el){
		        if(el.tagName == "SELECT"){
		            oObj[el.id] = $(this).find("option:selected").val();
		        }else if(el.tagName == "INPUT"){
		        	if(el.classList.toString().indexOf("occ") > -1){
		        		oObj[el.id] = $(this).data("occcode");
		        	}else{
		                oObj[el.id] = $(this).val();
		        	}
		        }
		    });
		    console.log(oObj);
		    return oObj;
		}
		
	$("#sureSave").click(function() {
	    
		if($("#isSmoke").find("option:selected").val() == "Y"){
			if(""== $("#smokeamount").val() || null == $("#smokeamount").val() 
					|| ""== $("#smokeyear").val() || null == $("#smokeyear").val()  ){
				$("#smokeamount").val(0);
				$("#smokeyear").val(0);
			}
		}
		if($("#isDrink").find("option:selected").val() == "Y"){
			if(""== $("#beearAmount").val() || null == $("#beearAmount").val() 
					|| ""== $("#beerYear").val() || null == $("#smokeyear").val()
					|| ""== $("#wineAmount").val() || null == $("#wineAmount").val()
					|| ""== $("#wineYear").val() || null == $("#wineYear").val()
					|| ""== $("#yellowWineAmount").val() || null == $("#yellowWineAmount").val()
					|| ""== $("#yellowWineYear").val() || null == $("#yellowWineYear").val()
					|| ""== $("#liquorAmount").val() || null == $("#liquorAmount").val()
					|| ""== $("#liquorYear").val() || null == $("#liquorYear").val()){
				$("#beearAmount").val(0);
				$("#beerYear").val(0);
				$("#wineAmount").val(0);
				$("#wineYear").val(0);
				$("#yellowWineAmount").val(0);
				$("#yellowWineYear").val(0);
				$("#liquorAmount").val(0);
				$("#liquorYear").val(0);
			}
		}
		sendPriceRequest("../../life/anxin/save_healthInformations.do",getData(),function (data) 
			{
				console.log(data);
		    	var obj = JSON.parse(data);
		    	console.log(obj);
		    		console.log(obj.code);
		    	if(obj.code == "0")
		    	{
		    		var assesserialno=obj.assesserialno;
					window.location.href = "../../life/anxin/nc_ax_bwylPlus.do?assesserialno="+assesserialno+"&socialInsuFlag="+
							$('#socialInsuFlag').val()+"&insurePrice="+$('#insurePrice').val()
		    	}
		    	else
		    	{
		    		$(".pop").show();
		            $(".mask").show();
		            $(".pop span").text(obj.msg);
		    	}
		    },function(){});
	});
	
	$(function(){
		$('#isDrink').on('change',function(){
			$("#isDrink").find("option:selected").val() == "Y"?$(this).parents('.dlSec').removeClass('bottom-0'):$(this).parents('.dlSec').addClass('bottom-0')
		})
	});
/*
	var reuserid = '${reuserid}';
	var jsstr = ${jsstr};
	wx.config(jsstr);

	wx.ready(function () 
	{	//朋友圈
    wx.onMenuShareTimeline({
        title: '横琴金禧年年年金保险', // 分享标题
        link: 'http://insure.meihualife.com/life/hq/nc_hq_jxnn.do?reuserid='+reuserid, // 分享链接
        imgUrl: 'http://insure.meihualife.com/images/anbang/risk02/310101011.png',
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
        title: '横琴金禧年年年金保险', // 分享标题
        desc: '横琴金禧年年年金保险', // 分享描述
        link: 'http://insure.meihualife.com/life/hq/nc_hq_jxnn.do?reuserid='+reuserid, // 分享链接
        imgUrl: 'http://insure.meihualife.com/images/anbang/risk02/310101011.png',
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
*/

</script> 

</html>