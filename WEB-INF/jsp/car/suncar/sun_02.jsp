<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en" style="font-size: calc(100vw/18.75);">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>阳光车险</title>
    <link rel="stylesheet" href="../../css/hengqin/infos.css?v=20180718_01">
    <link rel="stylesheet" href="../../css/car/car-index.css?v=20180717">
    <link rel="stylesheet" href="../../css/car/car_search.css?v=20180718_18">
    <script src=" ../../js/hengqin/jquery-1.10.1.min.js?v=2180719_01"></script>
    <script src=" ../../js/hengqin/mobiscroll-2.13.2.full.min.js?v=2180719_01" type="text/javascript"></script>
    <script src=" ../../js/hengqin/iscroll.js?v=2180719_06" type="text/javascript"></script>
    <script src=" ../../js/hengqin/iosSelect.js?v=2180719_01" type="text/javascript"></script>
    <script src="../../js/common/insuCommon.js?v=2180719_01"></script>
	<script src=" ../../js/car/suncar/checkFn.js?v=2180719_05"></script>
	<script src=" ../../js/car/suncar/sun_02.js?v=2180725_09"></script>
	<script src=" ../../js/car/suncar/chengshi2.js?v=2180618_09"></script>
	<style>
		.loading .sk-circle {
		    margin: 0 auto;
		    width: 8rem;
		    height: 3rem;
		    position: relative;
		    top: 20%;
		}
		.img{
			width:100%;
		}
		.infoSec .infoDl dt {
			font-size: 0.87rem;
		}
		.infoSec .borBot1 dt {
			font-size: 0.87rem;
		}
		 .zhanshi{
		 	font-size: 0.87rem;
		 }
		.info .infoList p{
			font-size: 0.99rem;
		}
	</style>
<script type="text/javascript">
/* var provinces=[{"id":"110000","codeValue":"110000","value":"北京市","parentId":"0"},
	   			{"id":"130000","codeValue":"130000","value":"河北省","parentId":"0"},
	   			{"id":"210000","codeValue":"210000","value":"辽宁省","parentId":"0"},
	   			{"id":"230000","codeValue":"230000","value":"黑龙江省","parentId":"0"},
	   			{"id":"310000","codeValue":"310000","value":"上海市","parentId":"0"},
	   			{"id":"320000","codeValue":"320000","value":"江苏省","parentId":"0"},
	   			{"id":"330000","codeValue":"330000","value":"浙江省","parentId":"0"},
	   			{"id":"340000","codeValue":"340000","value":"安徽省","parentId":"0"},
	   			{"id":"350000","codeValue":"350000","value":"福建省","parentId":"0"},
	   			{"id":"370000","codeValue":"370000","value":"山东省","parentId":"0"},
	   			{"id":"420000","codeValue":"420000","value":"湖北省","parentId":"0"},
	   			{"id":"440000","codeValue":"440000","value":"广东省","parentId":"0"},
	   			{"id":"510000","codeValue":"510000","value":"四川省","parentId":"0"},
	   			{"id":"610000","codeValue":"610000","value":"陕西省","parentId":"0"}
	   		];  */
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

var vehicleName_typein = "";
var brand_typein = "";
var family_typein = "";
var enginedesc_typein = "";
var gearboxtype_typein = "";

var pageno = "1";

$(function () 
{
	$("#vehicleModelName").on("click",function(){
		$("#search-con-warp").show();
		$(".yingchang").hide(); 
	})
		
	$("select").each(function () {
	    $(this).scroller('destroy').scroller($.extend({preset: 'select'}, {
	        theme: "android-ics light",
	        lang: "zh",
	        display: 'bottom',
	        rtl: true,
	        inputClass: 'tmp',
	        onSelect: function () {
	            if ($(this).find("option:selected").text()=="请选择"){
	                $(this).siblings(".tmp").css("color","#999999");
	            }else{
	                $(this).siblings(".tmp").css("color","#222222");
	            }
	        }
	    }));
	});
	
	$(".tmp").each(function(){
	    if($(this).val()=="请选择"){
	        $(this).css("color","#999999");
	    }else{
	        $(this).css("color","#222222");
	    }
	});
	
	$('.pop-sure').click(function(){
		$('.mask').css("display","none");
	});

    var currYear = (new Date()).getFullYear();

    function addDay(dayNumber, date) {
        date = date ? date : new Date();
        var ms = dayNumber * (1000 * 60 * 60 * 24);
        var newDate = new Date(date.getTime() + ms);
        return newDate;
    }

    var dateObj =
        {
            theme: 'android-ics light', //皮肤样式
            display: 'bottom', //显示方式
            rtl:true,
            mode: 'scroller', //日期选择模式
            lang:'zh',
            dateFormat: 'yyyy-mm-dd',
            dateOrder: 'ddmmyy',
            startYear:currYear - 80, //开始年份
            endYear:currYear + 30, //结束年份
//            minDate: addDay(1)
        };

    $("#firstRegisterDate").scroller('destroy').scroller($.extend({preset : 'date'}, dateObj));
    $("#specialCarDate").scroller('destroy').scroller($.extend({preset : 'date'}, dateObj));
})

</script>
</head>
<body style="">
	<header class="header w100 pl bgColor">
        <span>阳光车险</span>
        <br/>
        <span>本产品由阳光财险有限公司承保</span>
        <img src="../../images/car/yangguang/yangguang.png"/>
    </header>
	
    <article class="info" style="margin-top: 5.2rem;">
        <form id="fm" name="fm" method="post" action = "../../car/sunCar/car02save.do">
        	<input type="hidden" class="personInfo" id="productNo" value="suncar">
        	<%--<input type="hidden" id="mainPrice" value="100">--%>
			<input type="text" hidden="hidden" class="personInfo" id="mobile" name="mobile" value="${mobile}">
			<input type="text" hidden="hidden" class="personInfo" id="plateno" name="plateno" value="${plateno}">
			<input type="text" hidden="hidden" class="personInfo" id="carowner" name="carowner" value="${carowner}">
			<input type="text" hidden="hidden" class="personInfo" id="orderid" name="orderid" value="${orderid}">
			<input type="text" hidden="hidden" class="personInfo" id="citycode" name="citycode" value="${citycode}">
            <section class="infoList product yingchang">
                <p class="ml">车辆信息</p>
                <div class="infoSec pl pr bgColor borTop1 borBot1">
                 <!-- <dl class="clearfix infoDl borBot1 dlSec">
	                	<dt class="w35 l-float">通讯地址</dt>
	                    <dd class="w65 l-float txtR hasArrow">
	                  	<input type="hidden" name="" id="" value="3">
	                    <input type="hidden" class="personInfo" id="appntProvince" name="applicant.appntProvince" value="">
	                    <input type="hidden" class="personInfo" id="appntCity" name="applicant.appntCity" value="">
	                    <input type="hidden" class="personInfo" id="appntCounty" name="applicant.appntCounty" value="">
	                    <input type="text" class="chosen txtR pr" readonly="" placeholder="请选择" id="appntArea" value="">
	                    <i class="arrow"></i>
                    </dd>
                    <span class="errorMsg"></span>
                 </dl> -->
					<dl class="clearfix infoDl borBot1 dlSec pr">
						<dt class="w35 l-float">车主</dt>
						<dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
							<c:if test="${vehicleInfo.ownerName.value==''}">
								<input readonly onfocus="this.blur()" type="tel" class="textfield txtR personInfo" id="ownerName" name="ownerName" value="" placeholder="请输入车主">
							</c:if>
							<c:if test="${vehicleInfo.ownerName.value!=''}">
								<input readonly onfocus="this.blur()" type="tel" class="textfield txtR personInfo" id="ownerName" name="ownerName" value="${vehicleInfo.ownerName.value}" readonly="readonly" placeholder="请输入车主">
							</c:if>
						</dd>
						<span class="errorMsg"></span>
					</dl>
					<dl class="clearfix infoDl borBot1 dlSec pr">
						<dt class="w35 l-float">车主身份证</dt>
						<dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
							<c:if test="${vehicleInfo.ownerIdNo.value==''}">
								<input maxlength="18" type="tel" class="textfield txtR personInfo" id="ownerIdNo" name="ownerIdNo" value="" placeholder="请输入身份证">
							</c:if>
							<c:if test="${vehicleInfo.ownerIdNo.value!=''}">
								<input maxlength="18" type="tel" class="textfield txtR personInfo" id="ownerIdNo" name="ownerIdNo" value="${vehicleInfo.ownerIdNo.value}" placeholder="请输入车主身份证">
							</c:if>
						</dd>
						<span class="errorMsg"></span>
					</dl>
					<dl class="clearfix infoDl borBot1 dlSec pr">
						<dt class="w35 l-float">发动机号</dt>
						<dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
							<c:if test="${vehicleInfo.engineNo.value==''}">
								<input type="text" class="textfield txtR personInfo" id="engineNo" name="engineNo" value="" placeholder="请输入发动机号">
							</c:if>
							<c:if test="${vehicleInfo.engineNo.value!=''}">
								<input type="text" class="textfield txtR personInfo" id="engineNo" name="engineNo" value="${vehicleInfo.engineNo.value}" placeholder="请输入发动机号">
							</c:if>
						</dd>
						<span class="errorMsg"></span>
					</dl>
					<dl class="clearfix infoDl borBot1 dlSec pr">
						<dt class="w35 l-float">车架号</dt>
						<dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
							<c:if test="${vehicleInfo.vehicleFrameNo.value==''}">
								<input type="text" class="textfield txtR personInfo" id="vehicleFrameNo" name="vehicleFrameNo" value="" placeholder="请输入车架号">
							</c:if>
							<c:if test="${vehicleInfo.vehicleFrameNo.value!=''}">
								<input type="text" class="textfield txtR personInfo" id="vehicleFrameNo" name="vehicleFrameNo" value="${vehicleInfo.vehicleFrameNo.value}" placeholder="请输入车架号">
							</c:if>
						</dd>
						<span class="errorMsg"></span>
					</dl>
					<dl class="clearfix infoDl borBot1 dlSec pr" hidden="hidden">
						<dt class="w35 l-float">是否续保数据</dt>
						<dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
							<c:if test="${vehicleInfo.renewalFlagPC.value==''}">
								<input type="tel" class="textfield txtR personInfo" id="renewalFlagPC" name="renewalFlagPC" value="" placeholder="请输入是否续保数据">
							</c:if>
							<c:if test="${vehicleInfo.renewalFlagPC.value!=''}">
								<input type="tel" class="textfield txtR personInfo" id="renewalFlagPC" name="renewalFlagPC" value="${vehicleInfo.renewalFlagPC.value}" placeholder="请输入是否续保数据">
							</c:if>
						</dd>
						<span class="errorMsg"></span>
					</dl>
					<dl class="clearfix infoDl borBot1 dlSec pr">
						<dt class="w35 l-float">注册登记日期</dt>
						<dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
							<c:if test="${vehicleInfo.firstRegisterDate.value==''}">
								<input type="tel" class="textfield txtR personInfo" id="firstRegisterDate" name="firstRegisterDate" value="" placeholder="请选择日期">
							</c:if>
							<c:if test="${vehicleInfo.firstRegisterDate.value!=''}">
								<input type="tel" class="textfield txtR personInfo" id="firstRegisterDate" name="firstRegisterDate" value="${vehicleInfo.firstRegisterDate.value}" placeholder="请输入注册登记日期">
							</c:if>
						</dd>
						<span class="errorMsg"></span>
						<i class="arrow"></i>
					</dl>
					<dl class="clearfix infoDl borBot1 dlSec pr">
						<dt class="w35 l-float">品牌型号</dt>
						<dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
							<c:if test="${vehicleInfo.vehicleModelName.value==''}">
								<input type="text" onfocus="this.blur();" class="textfield txtR personInfo" id="my_val" name="my_val" style="display: none;" >
								<input type="text" onfocus="this.blur();" class="textfield txtR personInfo" id="seats" name="seats" style="display: none;" >
								<input type="text" onfocus="this.blur();" class="textfield txtR personInfo" id="carName" name="carName" style="display: none;" >
								<input type="text" onfocus="this.blur();" class="textfield txtR personInfo" id="vehicleModelName" name="vehicleModelName" value="" placeholder="请输入品牌型号">
							</c:if>
							<c:if test="${vehicleInfo.vehicleModelName.value!=''}">
								<input type="text" class="textfield txtR personInfo" id="vehicleModelName" name="vehicleModelName" value="" placeholder="请输入品牌型号">
								<input type="text" onfocus="this.blur();" class="textfield txtR personInfo" id="my_val" name="my_val" style="display: none;" value="${vehicleInfo.vehicleId.value}">
								<input type="text" onfocus="this.blur();" class="textfield txtR personInfo" id="seats" name="seats" style="display: none;" value="${vehicleInfo.seats.value}">
								<input type="text" onfocus="this.blur();" class="textfield txtR personInfo" id="carName" name="carName" value="" style="display: none;" >
							</c:if>
						</dd>
						<span class="errorMsg"></span>
						<i class="arrow"></i>
					</dl>
					<div class="checkNo" style="display: none;">
						<dl class="clearfix infoDl borBot1 dlSec pr">
							<dt class="w30 l-float" style = "line-height: 1.5rem;">验证码</dt>
							<dd class="w70 l-float txtR pr" style="box-sizing: border-box;">
								<input type="text" class="textfield txtR personInfo" id="checkNo" name="checkNo" value="" placeholder="请输入验证码" style="width: 50%;float: left;line-height: 1.5rem;">
								<img src="http://wxopenapi.sinosig.com/Net/netCarInfoControl!getVerificationCodeForInterface.action?frameNo=LHGGK5859H8136202&engineNo=2143646&license=冀G1652G&agentCode=03512900">
							</dd>
							<div class="errorMsg1">对不起，验证码不能为空，请输入！</div>
						</dl>
					</div>
					<%--<dl class="clearfix infoDl borBot1 dlSec">--%>
						<%--<dt class="w35 l-float">指定查询地址</dt>--%>
						<%--<dd class="w65 l-float txtR pr" style="box-sizing: border-box;">--%>
							<%--<c:if test="${vehicleInfo.appointPlace.value==''}">--%>
								<%--<input type="tel" class="textfield txtR personInfo" id="appointPlace" name="appointPlace" value="" placeholder="请输入指定查询地址">--%>
							<%--</c:if>--%>
							<%--<c:if test="${vehicleInfo.appointPlace.value!=''}">--%>
								<%--<input type="tel" class="textfield txtR personInfo" id="appointPlace" name="appointPlace" value="${vehicleInfo.appointPlace.value}" placeholder="请输入指定查询地址">--%>
							<%--</c:if>--%>
						<%--</dd>--%>
						<%--<span class="errorMsg"></span>--%>
					<%--</dl>--%>
					<%--<dl class="clearfix infoDl borBot1 dlSec">--%>
						<%--<dt class="w35 l-float">是否使用OCR</dt>--%>
						<%--<dd class="w65 l-float txtR pr" style="box-sizing: border-box;">--%>
							<%--<c:if test="${vehicleInfo.isOcr.value==''}">--%>
								<%--<input type="tel" class="textfield txtR personInfo" id="isOcr" name="isOcr" value="" placeholder="请输入是否使用OCR">--%>
							<%--</c:if>--%>
							<%--<c:if test="${vehicleInfo.isOcr.value!=''}">--%>
								<%--<input type="tel" class="textfield txtR personInfo" id="isOcr" name="isOcr" value="${vehicleInfo.isOcr.value}" placeholder="请输入是否使用OCR">--%>
							<%--</c:if>--%>
						<%--</dd>--%>
						<%--<span class="errorMsg"></span>--%>
					<%--</dl>--%>
					<dl class="clearfix infoDl borBot1 dlSec bottom-0">
						<dt class="w35 l-float">是否过户车</dt>
						<dd class="w65 l-float txtR hasArrow">
							<i id="gh" class="turnOff"></i>
							<input type="radio" style="display: none;">
							<input type="text" style="display:none" class="personInfo getPrice" name="specialCarFlag" value="0" id="specialCarFlag">
						</dd>
						<input type="radio" style="display: none;">
						<input type="text" style="display:none" class="personInfo getPrice" name="specialCarFlag" value="0" id="specialCarFlag">
					</dl>
					<div class="gh_date" style="display: none;">
						<dl class="clearfix infoDl borBot1 dlSec bottom-0">
							<dt class="w35 l-float">过户日期</dt>
							<dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
								<c:if test="${vehicleInfo.specialCarDate.value==''}">
									<input type="tel" class="textfield txtR personInfo" id="specialCarDate" name="specialCarDate" value="" placeholder="请输入过户日期">
								</c:if>
								<c:if test="${vehicleInfo.specialCarDate.value!=''}">
									<input type="tel" class="textfield txtR personInfo" id="specialCarDate" name="specialCarDate" value="${vehicleInfo.specialCarDate.value}" placeholder="请输入过户日期">
								</c:if>
							</dd>
							<span class="errorMsg"></span>
						</dl>
					</div>
			    </div>
            </section>
        </form>
        <!--投保按钮-->
         <div class="fixedBox w100 my_next">
            <dl class="clearfix infoDl w100">
				<dd class="w100 r-float">
				    <div class="insureBtn txtC dianji" id="sureToSave">下一步</div>
				</dd>
            </dl>
        </div>
        
        <div class="fixedBox w100 my_sure">
            <dl class="clearfix infoDl w100">
				<dd class="w100 r-float">
				    <div class="insureBtn txtC dianji" id="sureGo">确定</div>
				</dd>
            </dl>
        </div>
    </article>
    
    <div class="search-con-warp" id = "search-con-warp">
		
		<div class="main_search active">
			<img class="logoIcon left close-sW-wrap" id = "close-sW-wrap" src="../../images/life/back.png?v=20180718" />
			<input class="serchInput" id = "serchInput" type="text" value = "" placeholder="搜索车辆品牌"/> 
			<a href="javascript:;" class="serchBtn" id = "serchBtn">搜索</a>
		</div>
		
		<div id = 'sousuo'>
			<div class="bg000" id="disa"><p class = "disfont">A</p></div>
			<div class="wanted-wrap">
				<ul class="list">
					<li class="item">奥迪</li>
					<li class="item">奥克斯</li>
					<li class="item">奥路卡</li>
					<li class="item">阿斯顿-马丁</li>
				</ul>
			</div>
			<div class="bg000" id="disb"><p class = "disfont">B</p></div>
			<div class="wanted-wrap">
				<ul class="list">
					<li class="item">保时捷</li>
					<li class="item">宝骏</li>
					<li class="item">宝马</li>
					<li class="item">北京奔驰</li>
					<li class="item">北京吉普</li>
					<li class="item">北京克莱斯勒</li>
					<li class="item">北京汽车</li>
					<li class="item">北京三菱</li>
					<li class="item">北京现代</li>
					<li class="item">北汽</li>
					<li class="item">北汽幻速</li>
					<li class="item">北汽坤宝</li>
					<li class="item">北汽威旺</li>
					<li class="item">本田</li>
					<li class="item">比速</li>
					<li class="item">比亚迪</li>
					<li class="item">标志</li>
					<li class="item">别克</li>
					<li class="item">宾利</li>
					<li class="item">&nbsp;</li>
				</ul>
			</div>
			
			<div class="bg000" id="disb"><p class = "disfont">C</p></div>
			<div class="wanted-wrap">
				<ul class="list">
					<li class="item">昌河</li>
					<li class="item">昌河铃木</li>
					<li class="item">长安</li>
					<li class="item">长安福特</li>
					<li class="item">长安铃木</li>
					<li class="item">长安马自达</li>
					<li class="item">长安沃尔沃</li>
					<li class="item">长安谛艾仕</li>
					<li class="item">长城</li>
					<li class="item">长丰</li>
					<li class="item">长丰三菱</li>
					<li class="item">长丰扬子</li>
				</ul>
				
			</div>
			
			
			<div class="bg000" id="disb"><p class = "disfont">D</p></div>
			<div class="wanted-wrap">
				<ul class="list">
					<li class="item">大迪</li>
					<li class="item">大众</li>
					<li class="item">道奇</li>
					<li class="item">东风</li>
		            <li class="item">东风本田</li>
		            <li class="item">东风标致</li>
		            <li class="item">东风风度</li>
		            <li class="item">东风风神</li>
		            <li class="item">东风风行</li>
		            <li class="item">东风日产</li>
		            <li class="item">东风雪铁龙</li>
		            <li class="item">东风英菲尼迪</li>
		            <li class="item">东风悦达起亚</li>
		            <li class="item">东南</li>
		            <li class="item">东南道奇</li>
		            <li class="item">东南克莱斯勒</li>
		            <li class="item">东南三菱</li>
			<li class="item">&nbsp;</li>
				</ul>
			</div>
			
			<div class="bg000" id="disb"><p class = "disfont">F</p></div>
			<div class="wanted-wrap">
				<ul class="list">
					<li class="item">法拉利</li>
					<li class="item">菲亚特</li>
					<li class="item">飞碟</li>
					<li class="item">丰田</li>
					<li class="item">福建奔驰</li>
					<li class="item">福汽启腾</li>
					<li class="item">福特</li>
					<li class="item">福田</li>
		            <li class="item">富迪</li>
					<li class="item">&nbsp;</li>
				</ul>
			</div>
			
			<div class="bg000" id="disb"><p class = "disfont">G</p></div>
			<div class="wanted-wrap">
				<ul class="list">
					<li class="item">观致</li>
					<li class="item">广汽本田</li>
					<li class="item">广汽本田理念</li>
					<li class="item">广汽乘用车</li>
					<li class="item">广汽菲亚特</li>
					<li class="item">广汽丰田</li>
					<li class="item">广汽三菱</li>					
					<li class="item">&nbsp;</li>
				</ul>
			</div>
			
			<div class="bg000" id="disb"><p class = "disfont">H</p></div>
			<div class="wanted-wrap">
				<ul class="list">
					<li class="item">哈飞</li>
					<li class="item">哈弗</li>
					<li class="item">海马</li>
					<li class="item">海南马自达</li>
					<li class="item">悍霸</li>
					<li class="item">悍马</li>
					<li class="item">华晨宝马</li>	
					<li class="item">华晨中华</li>
					<li class="item">华普</li>
					<li class="item">华颂</li>
					<li class="item">华泰</li>
					<li class="item">华泰现代</li>
					<li class="item">华翔富奇</li>
					<li class="item">黄海</li>					
					
				</ul>
			</div>
			<div class="bg000" id="disb"><p class = "disfont">J</p></div>
			<div class="wanted-wrap">
				<ul class="list">
					<li class="item">吉奥</li>
					<li class="item">吉利</li>
					<li class="item">吉利帝豪</li>
					<li class="item">吉普</li>
					<li class="item">江淮</li>
					<li class="item">江铃</li>
					<li class="item">江铃福特</li>	
					<li class="item">江南</li>
					<li class="item">捷豹</li>
					<li class="item">解放(一汽哈轻)</li>
					<li class="item">解放(一汽红塔)</li>
					<li class="item">解放(一汽吉林)</li>
					<li class="item">金杯</li>
					<li class="item">金旅</li>
					<li class="item">精灵Smart</li>
					<li class="item">俊风</li>						
					
					
				</ul>
			</div>
			
			
			<div class="bg000" id="disb"><p class = "disfont">k</p></div>
			<div class="wanted-wrap">
				<ul class="list">
					<li class="item">卡威</li>
					<li class="item">开瑞</li>
					<li class="item">凯迪拉克</li>
					<li class="item">凯翼</li>
					<li class="item">克莱斯勒</li>								
					<li class="item">&nbsp;</li>
					 
				</ul>
			</div>
			
			
			<div class="bg000" id="disb"><p class = "disfont">L</p></div>
			<div class="wanted-wrap">
				<ul class="list">
					<li class="item">兰博基尼</li>
					<li class="item">劳斯莱斯</li>
					<li class="item">雷克萨斯</li>
					<li class="item">雷诺</li>
					<li class="item">力帆(乘用车)</li>						
					<li class="item">力帆(重庆)</li>
					<li class="item">猎豹</li>
					<li class="item">林肯</li>
					<li class="item">铃木</li>
					<li class="item">路虎</li>
					<li class="item">陆风</li>							
					<li class="item">&nbsp;</li>					 
				</ul>
			</div>
			
			<div class="bg000" id="disb"><p class = "disfont">M</p></div>
			<div class="wanted-wrap">
				<ul class="list">
					<li class="item">MG名爵</li>
					<li class="item">玛莎拉蒂</li>
					<li class="item">马自达</li>
					<li class="item">梅赛德斯-奔驰</li>
					<li class="item">迷你</li>								
					<li class="item">&nbsp;</li>
				</ul>
			</div>
			
			
			<div class="bg000" id="disb"><p class = "disfont">N</p></div>
			<div class="wanted-wrap">
				<ul class="list">
					<li class="item">纳智捷</li>
					<li class="item">南京菲亚特</li>
					<li class="item">南京依维柯</li>
					<li class="item">南汽新雅途</li>							
					
				</ul>
			</div>
			
			
			<div class="bg000" id="disb"><p class = "disfont">O</p></div>
			<div class="wanted-wrap">
				<ul class="list">
					<li class="item">欧宝</li>
					<li class="item">讴歌</li>						
					
				</ul>
			</div>
			
			<div class="bg000" id="disb"><p class = "disfont">Q</p></div>
			<div class="wanted-wrap">
				<ul class="list">
					<li class="item">奇瑞</li>
					<li class="item">奇瑞捷豹</li>
					<li class="item">起亚</li>
					<li class="item">启辰</li>
					<li class="item">青年莲花</li>	
					<li class="item">全球鹰</li>								
				
					
				</ul>
			</div>
			
			
			
			
			<div class="bg000" id="disb"><p class = "disfont">R</p></div>
			<div class="wanted-wrap">
				<ul class="list">
					<li class="item">日产</li>
					<li class="item">荣威</li>
					<li class="item">瑞麒</li>
					<li class="item">&nbsp;</li>
				</ul>
			</div>
			
			
			<div class="bg000" id="disb"><p class = "disfont">S</p></div>
			<div class="wanted-wrap">
				<ul class="list">
					<li class="item">萨博</li>
					<li class="item">三菱</li>
					<li class="item">上海大众</li>
					<li class="item">上汽大众</li>
					<li class="item">上汽通用五菱</li>						
					<li class="item">上汽通用五菱雪佛兰</li>
					<li class="item">上汽通用雪佛兰</li>
					<li class="item">双环红星</li>
					<li class="item">双龙</li>
					<li class="item">斯巴鲁</li>
					<li class="item">斯柯达</li>	
					<li class="item">思铭</li>
					<li class="item">四川一汽丰田</li>							
					<li class="item">&nbsp;</li>					 
				</ul>
			</div>
			
			
			<div class="bg000" id="disb"><p class = "disfont">T</p></div>
			<div class="wanted-wrap">
				<ul class="list">
					<li class="item">特斯拉</li>
					<li class="item">天津达路</li>
					<li class="item">天津一汽</li>
					<li class="item">天津一汽丰田</li>
					<li class="item">天汽美亚</li>	
					<li class="item">通家福</li>								
				</ul>
			</div>
			
			
			<div class="bg000" id="disb"><p class = "disfont">W</p></div>
			<div class="wanted-wrap">
				<ul class="list">
					<li class="item">威麟</li>
					<li class="item">潍柴汽车</li>
					<li class="item">沃尔沃</li>
					<li class="item">沃尔沃亚太</li>							
				</ul>
			</div>
			<div class="bg000" id="disb"><p class = "disfont">X</p></div>
			<div class="wanted-wrap">
				<ul class="list">
					<li class="item">西雅特</li>
					<li class="item">夏利</li>
					<li class="item">现代</li>
					<li class="item">新凯</li>
					<li class="item">雪佛兰</li>
					<li class="item">雪铁龙</li>								
				</ul>
			</div>
			<div class="bg000" id="disb"><p class = "disfont">Y</p></div>
			<div class="wanted-wrap">
				<ul class="list">
					<li class="item">野马</li>
					<li class="item">一汽奥迪</li>
					<li class="item">一汽奔腾</li>
					<li class="item">一汽大发</li>
					<li class="item">一汽大众</li>						
					<li class="item">一汽红旗</li>
					<li class="item">一汽华利</li>
					<li class="item">一汽吉林</li>
					<li class="item">一汽马自达</li>
					<li class="item">一汽欧朗</li>
					<li class="item">英菲尼迪</li>	
					<li class="item">英伦</li>										 
				</ul>
			</div>
			<div class="bg000" id="disb"><p class = "disfont">Z</p></div>
			<div class="wanted-wrap">
				<ul class="list">
					<li class="item">郑州东风</li>
					<li class="item">郑州海马</li>
					<li class="item">郑州日产</li>
					<li class="item">中顺</li>
					<li class="item">中兴</li>
					<li class="item">众泰</li>	
					<li class="item">&nbsp;</li>
					<li class="item">&nbsp;</li>
					<li class="item1">&nbsp;</li>
					<li class="item1">&nbsp;</li>							
					
				</ul>
			</div>

		
		</div>
		
			
		<section class="infoList product" id = "searchtypein" style="display: none;">
        	
        	<div class="infoSec pl pr bgColor borTop1 borBot1">
			        
			        <dl class="clearfix borBot1 dlSec">
				        <dt class="w35 l-float">车辆品牌</dt>
				        <dd class="w65 l-float txtR hasArrow">
					        <select id="qbrand" class="cardType txtR personInfo  dw-hsel" tabindex="-1">
	                  	        <option value="0">请选择</option>
	                        </select>
	                        <i class="arrow1"></i>
						</dd>
		                <span class="errorMsg"></span>
			        </dl>
			        
			        <dl class="clearfix borBot1 dlSec">
				        <dt class="w35 l-float">车款</dt>
				        <dd class="w65 l-float txtR hasArrow">
					        <select id="qfamily" class="cardType txtR personInfo  dw-hsel" tabindex="-1">
	                  	        <option value="0">请选择</option>
	                        </select>
	                        <i class="arrow1"></i>
						</dd>
		                <span class="errorMsg"></span>
			        </dl>
			        
			        <dl class="clearfix borBot1 dlSec">
				        <dt class="w35 l-float">排气量</dt>
				        <dd class="w65 l-float txtR hasArrow">
					        <select id="qenginedesc" class="cardType txtR personInfo  dw-hsel" tabindex="-1">
	                  	        <option value="0">请选择</option>
	                        </select>
	                        <i class="arrow1"></i>
						</dd>
		                <span class="errorMsg"></span>
			        </dl>
			        
			        <dl class="clearfix borBot1 dlSec">
				        <dt class="w35 l-float">手动自动</dt>
				        <dd class="w65 l-float txtR hasArrow">
					        <select id="qgearboxtype" class="cardType txtR personInfo  dw-hsel" tabindex="-1">
	                  	        <option value="0">请选择</option>
	                        </select>
	                        <i class="arrow1"></i>
						</dd>
		                <span class="errorMsg"></span>
			        </dl>
			        
			        <dl class="clearfix borBot1 dlSec">
				        <dt class="w35 l-float">车辆型号</dt>
				        <dd class="w65 l-float txtR hasArrow">
				        <p value="0" class="zhanshi">请选择</p>
					       <!--  <select id="qvehicle" class="cardType txtR personInfo  dw-hsel" tabindex="-1">
	                  	        <option value="0">请选择</option>
	                        </select>  -->
	                        <i class="arrow1"></i>
						</dd>
		                <span class="errorMsg"></span>
			        </dl>
			       
	           </div>
	      </section>
		
	</div>
    
    <!--加载动画-->
    <div class="loading">
        <div class="sk-circle">
         <img alt="" class="img" src="../../images/car/guodu.gif">
           <!--  <div class="sk-circle1 sk-child"></div>
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
            <div class="sk-circle12 sk-child"></div> -->
        </div>
    </div>
    <!--弹窗-->
    <div class="mask" >
        <div class="pop repeat">
            <span>失败提示</span>
            <a class="pop-sure">确定</a>
        </div>
    </div>
    <div class="xinghao" style="display: none;">
    	<ul id="qvehicle">
    		<!-- <li class="pr">飞度HG7155DAC5轿车  CVT  2014款  LX舒适型  5座(参考价 ¥ 78800)<span class="abs zhuantai">选中状态</span></li>
    		<li class="pr">飞度HG7155DAC5轿车  CVT  2014款  LX舒适型  5座(参考价 ¥ 78800)<span class="abs zhuantai">选中状态</span></li>
    		<li class="pr">飞度HG7155DAC5轿车  CVT  2014款  LX舒适型  5座(参考价 ¥ 78800)<span class="abs">选中状态</span></li>
    		<li class="pr">飞度HG7155DAC5轿车  CVT  2014款  LX舒适型  5座(参考价 ¥ 78800)<span class="abs">选中状态</span></li>
    		<li class="pr">飞度HG7155DAC5轿车  CVT  2014款  LX舒适型  5座(参考价 ¥ 78800)<span class="abs">选中状态</span></li>
    		<li class="pr">飞度HG7155DAC5轿车  CVT  2014款  LX舒适型  5座(参考价 ¥ 78800)<span class="abs">选中状态</span></li>
    		<li class="pr">飞度HG7155DAC5轿车  CVT  2014款  LX舒适型  5座(参考价 ¥ 78800)<span class="abs">选中状态</span></li>
    		<li class="pr">飞度HG7155DAC5轿车  CVT  2014款  LX舒适型  5座(参考价 ¥ 78800)<span class="abs">选中状态</span></li>
    		<li class="pr">飞度HG7155DAC5轿车  CVT  2014款  LX舒适型  5座(参考价 ¥ 78800)<span class="abs">选中状态</span></li>
    		<li class="pr">飞度HG7155DAC5轿车  CVT  2014款  LX舒适型  5座(参考价 ¥ 78800)<span class="abs">选中状态</span></li> -->
    	</ul>
    	<div class="dianji1">
			<div class="quxiao yanse">取消</div>
			<div class="quding yanse">确定</div>
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
</body>
</html>