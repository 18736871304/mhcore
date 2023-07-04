<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en" style="font-size: calc(100vw/18.75);">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>阳光车险</title>
    <link rel="stylesheet" href="../../css/hengqin/infos.css?v=20180518_21">
    <link rel="stylesheet" href="../../css/car/car-index.css?v=201807168">
    <script src="http://res.wx.qq.com/open/js/jweixin-1.2.0.js?v=180428"></script>
    <script src=" ../../js/hengqin/jquery-1.10.1.min.js?v=20180504"></script>
    <script src=" ../../js/hengqin/mobiscroll-2.13.2.full.min.js?v=20180504" type="text/javascript"></script>
    <script src=" ../../js/hengqin/iscroll.js?v=20180504" type="text/javascript"></script>
    <script src=" ../../js/hengqin/iosSelect.js?v=20180504" type="text/javascript"></script>
    <script src=" ../../js/hengqin/checkFn.js?v=20180504"></script>
    <script src="../../js/common/insuCommon.js?v=20180504"></script>
    <script src=" ../../js/car/suncar/sun_01.js?v=2180518_68"></script>
    <script src=" ../../js/car/suncar/chengshi.js?v=2180618_68"></script>
    <script type="text/javascript">
		var provinces=[
			/* {"id":"33","codeValue":"33","value":"安徽省","parentId":"0","cpID":"皖"},
			{"id":"01","codeValue":"01","value":"北京市","parentId":"0","cpID":"京"},
			{"id":"05","codeValue":"05","value":"重庆市","parentId":"0","cpID":"渝"},              
            {"id":"31","codeValue":"31","value":"大连市","parentId":"0","cpID":"辽"},
			{"id":"35","codeValue":"35","value":"福建省","parentId":"0","cpID":"闽"},
			{"id":"32","codeValue":"32","value":"甘肃省","parentId":"0","cpID":"甘"},
			{"id":"08","codeValue":"08","value":"广东省","parentId":"0","cpID":"粤"},
			{"id":"17","codeValue":"17","value":"广西市","parentId":"0","cpID":"桂"},
			{"id":"20","codeValue":"20","value":"贵州省","parentId":"0","cpID":"贵"},
			{"id":"16","codeValue":"16","value":"海南省","parentId":"0","cpID":"琼"},
            {"id":"15","codeValue":"15","value":"河北省","parentId":"0","cpID":"冀"},*/
            {"id":"06","codeValue":"06","value":"河南省","parentId":"0","cpID":"豫"},
            /*{"id":"04","codeValue":"04","value":"黑龙江省","parentId":"0","cpID":"黑"},
            {"id":"26","codeValue":"26","value":"湖北省","parentId":"0","cpID":"鄂"},
            {"id":"18","codeValue":"18","value":"湖南省","parentId":"0","cpID":"湘"},
            {"id":"27","codeValue":"27","value":"吉林省","parentId":"0","cpID":"吉"},
            {"id":"03","codeValue":"03","value":"江苏省","parentId":"0","cpID":"苏"},
            {"id":"34","codeValue":"34","value":"江西省","parentId":"0","cpID":"赣"},
            {"id":"12","codeValue":"12","value":"辽宁省","parentId":"0","cpID":"辽"},
            {"id":"36","codeValue":"36","value":"内蒙古","parentId":"0","cpID":"蒙"},
            {"id":"29","codeValue":"29","value":"宁波市","parentId":"0","cpID":"浙"},
            {"id":"38","codeValue":"38","value":"宁夏市","parentId":"0","cpID":"宁"},
            {"id":"11","codeValue":"11","value":"青岛市","parentId":"0","cpID":"鲁"},
            {"id":"23","codeValue":"23","value":"青海省","parentId":"0","cpID":"青"},
            {"id":"02","codeValue":"02","value":"山东省","parentId":"0","cpID":"鲁"}, */
			{"id":"30","codeValue":"30","value":"山西省","parentId":"0","cpID":"晋"}, 
			{"id":"25","codeValue":"25","value":"陕西省","parentId":"0","cpID":"陕"},
			{"id":"07","codeValue":"07","value":"上海市","parentId":"0","cpID":"沪"},
			/* {"id":"09","codeValue":"09","value":"深圳市","parentId":"0","cpID":"粤"}, */
			{"id":"21","codeValue":"21","value":"四川省","parentId":"0","cpID":"川"}
			/* {"id":"10","codeValue":"10","value":"天津市","parentId":"0","cpID":"津"},
			{"id":"39","codeValue":"39","value":"西藏","parentId":"0","cpID":"藏"},
			{"id":"37","codeValue":"37","value":"厦门市","parentId":"0","cpID":"闽"},
			{"id":"28","codeValue":"28","value":"新疆省","parentId":"0","cpID":"新"},
			{"id":"24","codeValue":"24","value":"云南省","parentId":"0","cpID":"云"}, 
			{"id":"19","codeValue":"18","value":"浙江省","parentId":"0","cpID":"浙"} */
			 
		];
	</script>
<script type="text/javascript">

$(function () 
{
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
	
})

</script>
</head>
<style>
	.infoSec .borBot1 dt{
		font-size: 0.87rem;
	}
	.info .infoList p{
		font-size: 0.99rem;
	}
	.arrow{
	     width: 0.75rem;
	    height: 0.75rem;
	    display: inline-block;
	    background: url(../../images/anbang/arrow.png);
	    background-size: 100%;
	    -webkit-background-size: 100%;
	    position: absolute;
	   	top: 0.9rem;
	    left: 8.5rem;
	}
	.arrow1{
	    width: 0.75rem;
	    height: 0.75rem;
	    display: inline-block;
	    background: url(../../images/anbang/arrow.png);
	    background-size: 100%;
	    -webkit-background-size: 100%;
	    position: absolute;
	    top: 0.85rem;
	    right: 0;
	}
	.abs_input{
		width: 32%;
	    position: absolute;
	    top: 0.72rem;
	    left: 10.46rem;
	    text-align: left;
	    padding-right: 0;
	    z-index: 10;
	}
	.abs_input1{
		text-align: left;
	    z-index: 100;
	    position: absolute;
	    left: 5.2rem;
	    top: 0.72rem;
	}
	.short_input{
		width: 5.6rem;
		height: 1.1rem;
		font-size: 0.84rem;
		line-height: 1.1rem;
		/* margin-left: 2.65rem; */
	    position: absolute;
	    left: 10.6rem;
	    top: 0.72rem;
	}
</style>
<body style="">
    <a href="#" class="banner"> <img src="../../images/car/ygcxzz_01.png" />
	</a>
    <article class="info" style="margin-top: 0rem;">
        <form id="fm" name="fm" method="post" action = "../../car/sunCar/car01save.do">
        	<input type="hidden" class="personInfo" id="productNo" value="suncar">
        	<input type="hidden" id="mainPrice" value="100">
            <section class="infoList product">
                <p class="ml">车辆信息</p>
                <div class="infoSec pl pr bgColor borTop1 borBot1 ">
			        <dl class="clearfix borBot1 dlSec hasArrow">
			        	<dt class="w30 l-float">投保城市</dt>
                            <dd class="w70 l-float ">
                                <input type="hidden" name="citycode" id = "citycode">
                                <input type="text" class="chosen txtR pr abs_input1" style="text-align: left;" readonly=""  id="insuredArea" value="">
                                <input type="text" class="chosen txtR pr abs_input" readonly="" id="my_insuredArea" value="">                           
                                <i class="arrow"></i> 
                                <i class="arrow1"></i>
                               <!--  <input class="textfield txtR mySelf" readonly=""> -->
                            </dd>
                            <span class="errorMsg"></span>
			        </dl>
			        
			        <dl class="clearfix borBot1 dlSec hasArrow">
				        <dt class="w30 l-float">车牌号码</dt>
				        <div class="numcard">
		                    <em id="licenseNoPlat" style="color: rgb(47, 47, 47);font-size: 0.84rem">沪</em>
		                    <em id="licenseNoPlat1" style="color: rgb(47, 47, 47);font-size: 0.84rem;margin-left: 0.7rem;">A</em>
		                    <input type="hidden" id="licenseNoPlat_hide" value="沪">
		                   <!--  <img src="//wximg.sinosig.com/carappimg/sinosigapp/ncar/common/img/arrow.png" id="licenseNo_img">	 -->		                   	 	                   
		                   	<input id="plateno" style="" type="url" placeholder="未上牌不用填" maxlength="6" class="short_input " onkeyup="this.value=this.value.toUpperCase();">		          
		                    <input type="hidden" id="licenseNo_hide" name="licenseNo_hide" value="">
		                    <i class="arrow" ></i>
		                   	<i class="arrow1" ></i> 
		                </div>
				        <!-- <dd class="w65 l-float txtR hasArrow">
					        <input maxlength="8" type="text" class="textfield txtR personInfo" id="plateno" name="plateno" value="" placeholder="请输入车牌号码">
						</dd> -->
		                <span class="errorMsg" style="    top: 1.5rem;"></span>
			        </dl>
			        
					<dl class="clearfix borBot1 dlSec hasArrow">
				        <dt class="w30 l-float">车主姓名</dt>
	                    <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
	                  	    <input type="text" class="textfield txtR personInfo" id="carowner" name="carowner" value="" placeholder="请输入车主姓名">
	                    </dd>
                	    <span class="errorMsg" style="    width: 28%;"></span>
			        </dl>
			        
			        <dl class="clearfix infoDl borBot1 dlSec hasArrow">
	                  <dt class="w30 l-float">手机号码</dt>
	                  <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
	                  		<input type="tel" class="textfield txtR personInfo" id="mobile" name="mobile" value="" placeholder="请输入手机号码">
	                  </dd>
	                  <span class="errorMsg"style="    width: 36%;"></span>
	                </dl>
			    </div>
            </section>
        </form>
        <!--投保按钮-->
        <div class="bgColor fixedBox w100">
            <dl class="clearfix infoDl w100">
				<dd class="w100 r-float">
				    <div class="insureBtn txtC" id="sureToSave">下一步</div>
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
    <div class="zimu" style="bottom: -9.7rem; display: none;">
        <ul>
            <li>A</li>
            <li>B</li>
            <li>C</li>
            <li>D</li>
            <li>E</li>
            <li>F</li>
            <li>G</li>
            <li>H</li>
            <li>I</li>
            <li>J</li>
            <li>K</li>
            <li>L</li>
            <li>M</li>
            <li>N</li>
            <li>O</li>
            <li>P</li>
            <li>Q</li>
            <li>R</li>
            <li>S</li>
            <li>T</li>
            <li>U</li>
            <li>V</li>
            <li>W</li>
            <li>X</li>
            <li>Y</li>
            <li>Z</li>
        </ul>
    </div>
    <div class="cutname" style="bottom: -7.2rem;">
        <ul>
            <li>京</li>
            <li>津</li>
            <li>冀</li>
            <li>晋</li>
            <li>蒙</li>
            <li>辽</li>
            <li>吉</li>
            <li>黑</li>
            <li>沪</li>
            <li>苏</li>
            <li>浙</li>
            <li>皖</li>
            <li>闽</li>
            <li>赣</li>
            <li>鲁</li>
            <li>豫</li>
            <li>鄂</li>
            <li>湘</li>
            <li>粤</li>
            <li>桂</li>
            <li>琼</li>
            <li>川</li>
            <li>贵</li>
            <li>云</li>
            <li>渝</li>
            <li>藏</li>
            <li>陕</li>
            <li>甘</li>
            <li>青</li>
            <li>宁</li>
            <li>新</li>
        </ul>
    </div>
    <div class="backBg2" style=" display: none;"></div>
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
</body>
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
        alert(res.errMsg);
    });
</script>
</html>