<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en" style="font-size: calc(100vw/18.75);">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>核保信息</title>
    <link rel="stylesheet" href="../../css/hezhong/infos.css?v=20180518_01">
    <script src=" ../../js/hengqin/jquery-1.10.1.min.js?v=20180504"></script>
    <script src=" ../../js/hengqin/mobiscroll-2.13.2.full.min.js?v=20180504" type="text/javascript"></script>
    <script src=" ../../js/hengqin/iscroll.js?v=20180504" type="text/javascript"></script>
    <script src=" ../../js/hengqin/iosSelect.js?v=20180504" type="text/javascript"></script>
    <script src=" ../../js/hengqin/checkFn.js?v=20180504"></script>
    <script src="../../js/common/insuCommon.js?v=20180504"></script>
    <script src=" ../../js/zhongan_h/insureuw.js?v=2180517_02"></script>
<script type="text/javascript">

var insplan = '${insplan}';
var isextend = '${isextend}';

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
<body style="">
    <header class="header w100 pl bgColor">
        <span>尊享e生2020版</span>
        <br/>
        <span>本产品由众安在线财产保险股份有限公司承保</span>
        <img src="../../images/zhongan/zhongan.png"/>
    </header>
    <article class="info" style="margin-top: 5.2rem;">
        <form id="formId" name="formName" method="post">
        	<input type="hidden" id="sumprem" value="">
        	<section class="infoList product">
        	<p class="ml">产品投保要素</p>
                <div class="infoSec pl pr bgColor borTop1 borBot1">
                	<dl class="clearfix borBot1 dlSec">
				        <dt class="w35 l-float">投保计划</dt>
				        <dd class="w65 l-float txtR hasArrow">
					        <select id = "insplan" class="premium txtR personInfo iFactor getPrice PaymentDeadline dw-hsel" tabindex="-1">
						        <option value="">尊享e生2020版</option>
						    </select>
					        <i class="arrow"></i>
						</dd>
		                <span class="errorMsg"></span>
			        </dl>
                </div>
            </section>
        	
            <section class="infoList product">
                <p class="ml">投保人信息</p>
                <div class="infoSec pl pr bgColor borTop1 borBot1">
			        <dl class="clearfix borBot1 dlSec">
				        <dt class="w55 l-float">姓名</dt>
				        <dd class="w40 l-float txtR pr hasArrow">
					        <input type="text" class="textfield txtR personInfo" id="policyName" value="" placeholder="请输入投保人姓名">
						</dd>
		                <span class="errorMsg"></span>
			        </dl>
			        
					<dl class="clearfix borBot1 dlSec">
				        <dt class="w55 l-float">证件类型</dt>
	                	<dd class="w40 l-float txtR pr hasArrow">
	                		<select id="cardType" class="cardType txtR personInfo  dw-hsel" onchange="changeCardType(this.value)" tabindex="-1">
	                  	        <option value="1">身份证</option>
	                        </select>
	                        <i class="arrow"></i>
	                    </dd>
	                      <span class="errorMsg"></span>
			        </dl>
			        
			        <dl class="clearfix infoDl borBot1 dlSec" style="display: none;">
	                	<dt class="w35 l-float">出生日期</dt>
	                    <dd class="w65 l-float txtR hasArrow">
	                  	<span class="birthday" id="birthdayChoose" style="display: none;">
	                  		<input type="text" class="textfield txtR personInfo birthdayChoose" readonly="" id="birthday" value="" placeholder="请选择">
	                   		<i class="arrow"></i>
	                    </span>
	                        <input type="text" class="textfield txtR birthdayReadonly personInfo" id = "birthdayReadonly" readonly="" value="">
	                    </dd>
	                        <span class="errorMsg"></span>
	                </dl>
	                
	                <dl class="clearfix infoDl borBot1 dlSec" style="display: none;">
	                	<dt class="w35 l-float">性别</dt>
	                    <dd class="w65 l-float txtR hasArrow">
	                  	    <input type="text" style="display:none" name="applicant.appntSexName" id="applicantSex" value="">
	                            <div class="sex" id="sexChoose" style="display: none;">
		                            <select id="sex" class="sex txtR personInfo dw-hsel" tabindex="-1" style="display: none;">
		                    	        <option value="1">男</option>
		                    	        <option value="2" selected="">女</option>
		                            </select>
		                            <i class="arrow"></i>
	                            </div>
	                        <input type="text" class="textfield txtR sexReadonly personInfo" value="" readonly="">
	                    </dd>
	                        <span class="errorMsg"></span>
	                </dl>
	                
	                <dl class="clearfix borBot1 dlSec">
				        <dt class="w35 l-float">证件号码</dt>
	                    <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
	                  	    <input type="text" class="textfield txtR personInfo idNo_compare" id="idNo" value="" placeholder="请输入证件号码">
	                    </dd>
                	    <span class="errorMsg"></span>
			        </dl>
			    </div>
            </section>
            
            <section class="infoList" id="scrollTop">
	            <p class="ml">被保人信息一</p>
	            <div class="infoSec pl pr bgColor borTop1 borBot1">
                    <dl class="clearfix infoDl dlSec bottom-1" id = "isyizhi">
			            <dt class="w40 l-float">与投保人一致</dt>
			            <dd class="w60 l-float txtR hasArrow">
				            <i id="switch" class="turnOn" ></i>
				            <input type="radio" id = 'switchradio' style="display: none;">
							<input type="text" style="display:none" class="personInfo getPrice" name="isSelf" value="1" id="isSelf">
			            </dd>
			            <input type="radio" style="display: none;">
						<input type="text" style="display:none" class="personInfo getPrice" name="isSelf" value="1" id="isSelf">
		            </dl>
		            
		            <div class="insured" style="display:'';">
		            	<dl class="clearfix infoDl borTop1 dlSec">
                            <dt class="w55 l-float">投保人是被保人的</dt>
                            <dd class="w40 l-float txtR pr hasArrow">
                                <select id="relation" name="" class="cardType txtR personInfo getPrice dw-hsel" tabindex="-1">
                                    <option value="00">本人</option>
                                    <option value="01">父母</option>
                                    <option value="02">配偶</option>
                                    <option value="03">子女</option>
                                </select> 
                                    <i class="arrow"></i>
                            </dd>
                                <span class="errorMsg"></span>
                        </dl>
                        <dl class="clearfix infoDl borTop1 dlSec">
                            <dt class="w35 l-float">姓名</dt>
                            <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="text" class="textfield txtR personInfo" id="insuredName" value="" placeholder="请输入被保人姓名">
                                <input class="textfield txtR mySelf" readonly="">
                            </dd>
                                <span class="errorMsg"></span>
                        </dl>
                        <dl class="clearfix infoDl borTop1 dlSec">
                            <dt class="w55 l-float">证件类型</dt>
                            <dd class="w40 l-float txtR pr hasArrow">
                            	<select id="insuredCardType" class="cardType txtR personInfo dw-hsel" onchange="changeInsuredCardType(this.value)" tabindex="-1">
                                    <option value="0">身份证</option>
                                </select>
                                <i class="arrow"></i> 
                                <input class="textfield txtR mySelf" readonly="">
                            </dd>
                                <span class="errorMsg"></span>
                        </dl>
                        <dl class="clearfix infoDl borTop1 dlSec">
                            <dt class="w35 l-float">证件号码</dt>
                            <dd class="w65 l-float txtR pr" style="box-sizing: border-box;">
                                <input type="text" class="textfield txtR personInfo idNo_compare" id="insuredIdNo" value="" placeholder="请输入证件号码">
                                <input class="textfield txtR mySelf idNo_compare" readonly="">
                            </dd>
                                <span class="errorMsg"></span>
                        </dl>
                        
                        <dl class="clearfix infoDl borBot1 dlSec" style="display: none;">
	                        <dt class="w35 l-float">出生日期</dt>
	                        <dd class="w65 l-float txtR hasArrow">
	                            <span class="insuredBirthday" id="insuredBirthdayChoose">
	                                <input type="text" class="textfield txtR personInfo insuredBirthdayChoose" readonly="" id="insuredBirthday" value="" placeholder="请选择">
	                                <i class="arrow"></i> 
	                            </span> 
	                            <input type="text" class="textfield txtR insuredBirthdayReadonly personInfo" id="insuredBirthday1" value="" readonly=""> 
	                            <input class="textfield txtR mySelf" value="" id="insuredBirthday2" readonly="">
	                        </dd>
	                        <span class="errorMsg"></span>
	                    </dl>
	                    <dl class="clearfix infoDl borBot1 dlSec" style="display: none;">
	                        <dt class="w35 l-float">性别</dt>
	                        <dd class="w65 l-float txtR hasArrow">
	                            <div class="insuredSex" id="insuredSexChoose">
	                                <select id="insuredSex" class="sex txtR personInfo dw-hsel" tabindex="-1" style="display: none;">
	                                    <option value="1">男</option>
	                                    <option value="2" selected="">女</option>
	                                </select> 
	                                <i class="arrow"></i>
	                            </div>
	                            <input type="text" class="textfield txtR insuredSexReadonly personInfo" id="insuredSex1" value="" readonly="">
	                            <input class="textfield txtR mySelf" id="insuredSex2" value="" readonly="">
	                        </dd>
	                        <span class="errorMsg"></span>
	                    </dl>
		            </div>
		            
		            
		        </div>
            </section>
            
            <div id = "addinsured_div">
            
	        </div>
	        
	        <section class="infoList" id="addinsured_model" style="top : 0.5rem">
	        	<div class="infoSec pl pr bgColor borTop1 borBot1">
	        	</div>
	        	<div class="clearfix infoDl dingwei fl">
                      <div class="zengjia" id="addinsured_button" style="font-size: 0.9rem;text-align: center; background:#fff;line-height: 2.1rem;">增加</div>                        
                </div>
	        </section>
        </form>
        <!--投保按钮-->
        <div class="bgColor fixedBox w100">
            <dl class="clearfix infoDl w100">
				<dd class="w100 r-float">
				    <div class="insureBtn txtC" id="sureToSave">智能核保</div>
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
</body>
</html>