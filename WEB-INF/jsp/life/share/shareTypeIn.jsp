<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en" style="font-size: calc(100vw/18.75);">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>分享信息录入</title>
    <link rel="stylesheet" href="../../css/hengqin/infos.css?v=20180504">
    <script src=" ../../js/hengqin/jquery-1.10.1.min.js?v=20180504"></script>
    <script src=" ../../js/hengqin/mobiscroll-2.13.2.full.min.js?v=20180504" type="text/javascript"></script>
    <script src=" ../../js/hengqin/iscroll.js?v=20180504" type="text/javascript"></script>
    <script src=" ../../js/hengqin/iosSelect.js?v=20180504" type="text/javascript"></script>
    <script src="../../js/common/insuCommon.js?v=20180504"></script>
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
	
	$("#sureToSave").on("click", function () 
	{
		var mobile = $("#mobile").val();
		
		if(!validatemobile(mobile))
		{
			return false;	
		}
		
		var data = 
		{
			"insorgancode":$("#insorgancode").find("option:selected").val(),
			//"insorganname":$("#insorgancode").find("option:selected").text(),
			"riskcode":$("#riskcode").find("option:selected").val(),
			//"riskname":$("#riskcode").find("option:selected").text(),
			"mobile":$("#mobile").val(),
			
		};
		
		console.log(data);
		
		sendRequest("../../life/common/ShareTypeIn.do",data,function (data) 
		{
			console.log(data);
        	var obj = JSON.parse(data);
			
        	if(obj.code == 0){
        		window.location.href = "../../life/common/shareInfoDis.do?shareid="+obj.shareid;
            }else{
            	$(".pop").show();
            	$(".mask").show();
            	$(".pop span").text(obj.msg);
            }
        },function(){});
		
	});
	
	$('.pop-sure').click(function(){
		$('.mask').css("display","none");
	});
	
	$("#insorgancode").change(function()
	{
		if($("#insorgancode").find("option:selected").val() == "hengqin")
    	{
    		$("#riskcode").html('');
    		$("#riskcode").append("<option value='14040'>金禧年年</option>");
    		$("#riskcode").append("<option value='34010'>宜家万能</option>");
    		$("#riskcode").append("<option value='10025'>优康宝</option>");
    		$("#riskcode").append("<option value='11010'>优爱宝</option>");
    		$("#riskcode").append("<option value='17040'>百万医疗</option>");
    		$("#riskcode").val("10025");
    		
    		$("#riskcode_dummy").val($("#riskcode").find("option:selected").text());
    	}
		else if($("#insorgancode").find("option:selected").val() == "anbang")
		{
			$("#riskcode").html('');
    		$("#riskcode").append("<option value='2140152'>健康之家</option>");
    		$("#riskcode").val("2140152");
    		
    		$("#riskcode_dummy").val($("#riskcode").find("option:selected").text());
		}
		else if($("#insorgancode").find("option:selected").val() == "anbangz")
		{
			$("#riskcode").html('');
    		$("#riskcode").append("<option value='L11158'>常青树</option>");
    		$("#riskcode").val("L11158");
    		
    		$("#riskcode_dummy").val($("#riskcode").find("option:selected").text());
		}
	})
})

</script>
</head>
<body style="">
    <header class="header w100 pl bgColor">
        <span>客户分享页面</span>
        <br/>
        <span>按照产品进行分享</span>
        <!-- 
        <img src="../../images/hengqin/hqLogo.png" />
         -->
    </header>
    <article class="info" style="margin-top: 5.2rem;">
        <form id="formId" name="formName" method="post">
            
            <section class="infoList product">
                <p class="ml">产品投保要素</p>
                <div class="infoSec pl pr bgColor borTop1 borBot1">
			        <dl class="clearfix borBot1 dlSec">
				        <dt class="w35 l-float">保险公司</dt>
				        <dd class="w65 l-float txtR hasArrow">
					        <select id = "insorgancode" class="premium txtR iFactor getPrice PaymentDeadline dw-hsel" tabindex="-1">
						        <option value="hengqin">横琴</option>
						        <option value="anbang">和谐健康</option>
						        <option value="anbangz">安邦人寿</option>
						    </select>
					        <i class="arrow"></i>
						</dd>
		                <span class="errorMsg"></span>
			        </dl>
					<dl class="clearfix borBot1 dlSec">
				        <dt class="w35 l-float">保险产品</dt>
					    <dd class="w65 l-float txtR hasArrow">
					        <select id = "riskcode" class="premium txtR iFactor getPrice PaymentDeadline dw-hsel" tabindex="-1">
								<option value="14040">金禧年年</option>
								<option value="34010">宜家万能</option>
								<option value="10025">优康保</option>
								<option value="11010">优爱保</option>
								<option value="17040">百万医疗</option>
						    </select>
					        <i class="arrow"></i>
						</dd>
			            <span class="errorMsg"></span>
			        </dl>
			        <dl class="clearfix borBot1 dlSec">
				        <dt class="w35 l-float">客户手机号码</dt>
						<dd class="w65 l-float txtR hasArrow pr" style="box-sizing: border-box;">
						    <input id = "mobile" type="text" value = "" class="only txtR iFactor getPrice numInput import" 
						     style="text-overflow: unset;width: 100%;">
						</dd>
				        <span class="errorMsg"></span>
			        </dl>
			    </div>
            </section>
        </form>
        <!--投保按钮-->
        <div class="bgColor fixedBox w100">
            <dl class="clearfix infoDl w100">
	            <dd class="w100 l-float">
				    <div class="insureBtn txtC" id="sureToSave">生成分享信息</div>
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
</html>