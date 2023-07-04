<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no"/>
    <meta name="format-detection" content="telephone=no">
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="apple-mobile-web-app-status-bar-style" content="black"/>
    <meta name="description" content=""/>
    <meta name="keywords" content=""/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="../../css/planrisk/style.css?a=1">
    <link rel="stylesheet" type="text/css" href="../../css/planrisk/sure.css?a=8">
   
</head>
<style>
input.tmp {
	width: 91%;
	color: #222222;
}
.my_libiao1{
 width: 100%;
    background: #ffffff;
    margin: 0 auto;
        padding: 0;
}
</style>
<body>
<div class="wrap" style="background: #f0efef;">
    <div class="bigbox pr canping1 canping">
    	<input type="text" style="display:none" class="personInfo" id="insuredage" value="${insuredage }">
        <input type="text" style="display:none" class="personInfo" id="insuredsex" value="${insuredsex }">
        <%-- <input type="text" style="display:none" class="personInfo" id="payendyear" value="${payendyear}"> --%>
        <input type="text" style="display:none" class="personInfo" id="amnt" value="${amnt}">
        <div class="can_p fs36">产品一</div>
        <div class="libiao1">
            <dl class="clearfix libiao border_b1 my_border">
                <dt class=" fl fs34 ">保险公司</dt>
                <dd class="fr">
                    <select class="personInfo getriskcode1" id="insorgancode1" tabindex="-1">
                        <option>请选择</option>
                        <option value="hongkang">弘康人寿</option>
                        <option value="anbangz">安邦</option>
                        <option value="sunlife">阳光人寿</option>
                        <option value="pingan">平安</option>
                        <option value="hengqin">横琴人寿</option>
                        <option value="xintai">信泰人寿</option>
                        <option value="ruihua">瑞华人寿</option>
                    </select>
                    <i class="arrow"></i>
                </dd>
                <span class="errorMsg"></span>
            </dl>
            <div class ="hao1 canpin">
	            <dl class="clearfix libiao my_color">
	                <dt class=" fl fs34">产品选择</dt>
	                <dd class="fr">
	                    <select class="personInfo" id="riskcode1" tabindex="-1">
	                    </select>
	                    <i class="arrow"></i>
	                </dd>
	                <span class="errorMsg"></span>
	            </dl>	       
	            <dl class="clearfix libiao my_color">
	                <dt class=" fl fs34">保障期限</dt>
	                <dd class="fr">	                 	
	                    <select  class="personInfo hide2 canpin" id="insureyear1" tabindex="-1">
	                       
	                    </select>
	                    <i class="arrow"></i>
	                </dd>
	                <span class="errorMsg"></span>
	            </dl>
	            <dl class="clearfix libiao my_color">
	                <dt class=" fl fs34">缴费年限</dt>
	                <dd class="fr">
	                    <select  class="my_payendyear personInfo" id="payendyear1" tabindex="-1">
	                    	                        
	                    </select>
	                    <i class="arrow"></i>
	                </dd>
	                <span class="errorMsg"></span>
	            </dl>
	            <dl class="clearfix libiao libiaoxian my_border">
	                <dt class=" fl fs34">其他</dt>
	                <dd class="fr">
	                   <input type="text" id="other1" class="my_input personInfo" maxlength="25" placeholder="最多输入25个字">
	                </dd>
	                <span class="errorMsg"></span>
	            </dl>
	            <dl class="clearfix libiao my_libiao1 my_border canpin">
	                <dt class=" fl fs34">保费</dt>
	                <dd class="fr">
	                   <input type="text" id="prem1" class="my_input personInfo" placeholder="请输入">
	                </dd>
	                <span class="errorMsg"></span>
	            </dl>	           
	        </div>    
	         <div class="zhezhao abs" style="display: none">
	            <div class="delect fs32 abs">删除</div>
	        </div>
        </div>
    </div>
    <div class="bigbox pr canping2 canping">
        <div class="can_p fs36 ">产品二</div>
        <div class="libiao1">
            <dl class="clearfix libiao border_b2 my_border">
                <dt class=" fl fs34">保险公司</dt>
                <dd class="fr">
                    <select class="personInfo getriskcode2" id="insorgancode2" tabindex="-1">
                        <option>请选择</option>
                        <option value="hongkang">弘康人寿</option>
                        <option value="anbangz">安邦</option>
                        <option value="sunlife">阳光人寿</option>
                        <option value="pingan">平安</option>
                        <option value="hengqin">横琴人寿</option>
                        <option value="xintai">信泰人寿</option>
                        <option value="ruihua">瑞华人寿</option>
                    </select>
                    <i class="arrow"></i>
                </dd>
                <span class="errorMsg"></span>
            </dl>
            <div class ="hao2 canpin">
	            <dl class="clearfix libiao my_color">
	                <dt class=" fl fs34">产品选择</dt>
	                <dd class="fr">
	                    <select  class="personInfo" id="riskcode2" tabindex="-1">
	                       
	                    </select>
	                    <i class="arrow"></i>
	                </dd>
	                <span class="errorMsg"></span>
	            </dl>
	            <dl class="clearfix libiao my_color">
	                <dt class=" fl fs34">保障期限</dt>
	                <dd class="fr">
	                    <select  class="personInfo" id="insureyear2" tabindex="-1">
	                       
	                    </select>
	                    <i class="arrow"></i>
	                </dd>
	                <span class="errorMsg"></span>
	            </dl>
	            <dl class="clearfix libiao my_color">
	                <dt class=" fl fs34">缴费年限</dt>
	                <dd class="fr">
	                    <select  class="my_payendyear2 personInfo" id="payendyear2" tabindex="-1">
	                    </select>
	                    <i class="arrow"></i>
	                </dd>
	                <span class="errorMsg" style="right: -0.35rem;"></span>
	            </dl>
	            <dl class="clearfix libiao libiaoxian2 my_border">
	                <dt class=" fl fs34">其他</dt>
	                <dd class="fr">
	                   <input type="text" id="other2" class="my_input personInfo" maxlength="25" placeholder="最多输入25个字">
	                </dd>
	                <span class="errorMsg"></span>
	            </dl>
	            <dl class="clearfix libiao my_libiao2 my_border canpin">
	                <dt class=" fl fs34">保费</dt>
	                <dd class="fr">
	                   <input type="text" id="prem2" class="my_input personInfo" placeholder="请输入">
	                </dd>
	                <span class="errorMsg"></span>
	            </dl>
	        </div>
	         <div class="zhezhao abs" style="display: none">
	            <div class="delect fs32 abs">删除</div>
	        </div>
        </div>       
    </div>
    <div class="bigbox pr canping3 canpin">
        <div class="can_p fs36">产品三</div>
        <div class="libiao1">
            <dl class="clearfix libiao border_b3 my_border">
                <dt class=" fl fs34">保险公司</dt>
                <dd class="fr">
                    <select class="personInfo getriskcode3" id="insorgancode3" tabindex="-1">
                        <option>请选择</option>
                        <option value="hongkang">弘康人寿</option>
                        <option value="anbangz">安邦</option>
                        <option value="sunlife">阳光人寿</option>
                        <option value="pingan">平安</option>
                        <option value="hengqin">横琴人寿</option>
                        <option value="xintai">信泰人寿</option>
                        <option value="ruihua">瑞华人寿</option>
                    </select>
                    <i class="arrow"></i>
                </dd>
                <span class="errorMsg"></span>
            </dl>
            <div class ="hao3 canpin">
	            <dl class="clearfix libiao my_color">
	                <dt class=" fl fs34">产品选择</dt>
	                <dd class="fr">
	                    <select  class="personInfo" id="riskcode3" tabindex="-1">
	                       
	                    </select>
	                    <i class="arrow"></i>
	                </dd>
	                <span class="errorMsg"></span>
	            </dl>
	            <dl class="clearfix libiao my_color">
	                <dt class=" fl fs34">保障期限</dt>
	                <dd class="fr">
	                    <select  class="personInfo" id="insureyear3" tabindex="-1">
	                       
	                    </select>
	                    <i class="arrow"></i>
	                </dd>
	                <span class="errorMsg"></span>
	            </dl>
	            <dl class="clearfix libiao my_color">
	                <dt class=" fl fs34">缴费年限</dt>
	                <dd class="fr">
	                    <select  class="my_payendyear3 personInfo" id="payendyear3" tabindex="-1">
	                        
	                    </select>
	                    <i class="arrow"></i>
	                </dd>
	                <span class="errorMsg" style="right: -0.35rem;"></span>
	            </dl>
	            <dl class="clearfix libiao libiaoxian3 my_border" >
	                <dt class=" fl fs34">其他</dt>
	                <dd class="fr">
	                   <input type="text" id="other3" class="my_input personInfo" maxlength="25" placeholder="最多输入25个字">
	                </dd>
	                <span class="errorMsg"></span>
	            </dl>
	            <dl class="clearfix libiao my_libiao3 my_border canpin">
	                <dt class=" fl fs34">保费</dt>
	                <dd class="fr">
	                   <input type="text" id="prem3" class="my_input personInfo" placeholder="请输入">
	                </dd>
	                <span class="errorMsg"></span>
	            </dl>	           
	        </div>
	         <div class="zhezhao abs" style="display: none">
	            <div class="delect fs32 abs">删除</div>
	        </div>
        </div>
    </div>
    <div class="bigbox pr canping4 canpin" >
        <div class="can_p fs36">产品四</div>
        <div class="libiao1">
            <dl class="clearfix libiao border_b4 my_border">
                <dt class=" fl fs34">保险公司</dt>
                <dd class="fr">
                    <select class="personInfo getriskcode4" id="insorgancode4" tabindex="-1">
                        <option>请选择</option>
                        <option value="hongkang">弘康人寿</option>
                        <option value="anbangz">安邦</option>
                        <option value="sunlife">阳光人寿</option>
                        <option value="pingan">平安</option>
                        <option value="hengqin">横琴人寿</option>
                        <option value="xintai">信泰人寿</option>
                        <option value="ruihua">瑞华人寿</option>
                    </select>
                    <i class="arrow"></i>
                </dd>
                <span class="errorMsg"></span>
            </dl>
            <div class ="hao4 canpin">
            <dl class="clearfix libiao my_color">
                <dt class=" fl fs34">产品选择</dt>
                <dd class="fr">
                    <select  class="personInfo" id="riskcode4" tabindex="-1">
                       	<option value="">请选择</option>
                       	<option value="511502">健康一生</option>
                       	<option value="L11158">长青树</option>
                        <option value="WDDF">i保</option>
                        <option value="pinganfu2018">平安福2018</option>
                        <option value="16050">优康保</option>
                        <option value="13F00150">百万健康</option>
                        <option value="HT1001">瑞华</option>
                    </select>
                    <i class="arrow"></i>
                </dd>
                <span class="errorMsg"></span>
            </dl>
            <dl class="clearfix libiao my_color">
                <dt class=" fl fs34">保障期限</dt>
                <dd class="fr">
                    <select  class="personInfo" id="insureyear4" tabindex="-1">
                        >
                    </select>
                    <i class="arrow"></i>
                </dd>
                <span class="errorMsg"></span>
            </dl>
            <dl class="clearfix libiao my_color">
                <dt class=" fl fs34">缴费年限</dt>
                <dd class="fr">
                    <select  class="my_payendyear4 personInfo" id="payendyear4" tabindex="-1">
                       
                    </select>
                    <i class="arrow"></i>
                </dd>
                <span class="errorMsg" style="right: -0.35rem;"></span>
            </dl>
            <dl class="clearfix libiao libiaoxian4 my_border">
                <dt class=" fl fs34">其他</dt>
                <dd class="fr">
                   <input type="text" id="other4" class="my_input personInfo" maxlength="25" placeholder="最多输入25个字">
                </dd>
                <span class="errorMsg"></span>
            </dl>
            <dl class="clearfix libiao my_libiao4 my_border canpin">
                <dt class=" fl fs34">保费</dt>
                <dd class="fr">
                   <input type="text" id="prem4" class="my_input personInfo" placeholder="请输入">
                </dd>
                <span class="errorMsg"></span>
            </dl>            
        </div>
        <div class="zhezhao abs" style="display: none">
	            <div class="delect fs32 abs">删除</div>
	        </div>
        </div>
    </div>
    <div class="bigbox" style="margin-bottom: 1.3rem;">
        <div class="add fs34">增加</div>
    </div>
    <div class="queding fs34 next02">产品确认</div>
</div>
<div class="backBg2"></div>
 	<script type="text/javascript" src="../../js/planrisk/jquery-2.1.4.js"></script>
    <script type="text/javascript" src="../../js/planrisk/flexible.js"></script>
    <script type="text/javascript" src="../../js/planrisk/mobiscroll-2.13.2.full.min.js"></script>
    <script type="text/javascript" src="../../js/planrisk/iscroll.js"></script>
    <script type="text/javascript" src="../../js/planrisk/iosSelect.js"></script>
    <script type="text/javascript" src="../../js/planrisk/checkFn.js"></script>
    <script type="text/javascript" src="../../js/planrisk/sure.js"></script>
    <script type="text/javascript" src="../../js/planrisk/planrisk.js?v=8"></script>
   <!--  <script type="text/javascript" src="../../js/planrisk/xuanzhe.js?v=4"></script> -->
</body>
<script>
    var timeOutEvent = 0;
    var arr=[],num=1;
    var index = '';
    $(function(){
    	 $("#insorgancode1").change(function(){    		 
    		 $("#riskcode1_dummy").css("color","#222222");
    		 if ($("#insorgancode1").find("option:selected").text() == "请选择") {
    			 $("#riskcode1_dummy").val("请选择");
    			 $("#riskcode1_dummy").css("color","#999999");
    		 }
    		 if ($("#insorgancode1").find("option:selected").text() == "平安") {
    			 $(".my_libiao1").removeClass("canpin"); 
     			$(".libiaoxian").removeClass("my_border");
    		 }else{
    			$(".my_libiao1").addClass("canpin");
    			$(".libiaoxian").addClass("my_border");
    			
    		}
        }) 
        
        
       	 $("#riskcode1").change(function(){
   		 $("#riskcode1_dummy").css("color","#222222");
   		 
   		if ($("#riskcode1").find("option:selected").text() == "平安福2018") {
   			$(".my_libiao1").removeClass("canpin");; 
   			$(".libiaoxian").removeClass("my_border");
   		}else{
   			$(".my_libiao1").addClass("canpin");
   			$(".libiaoxian").addClass("my_border");
   		}
        })
    	
         $("#insorgancode2").change(function(){
    		 $("#riskcode2_dummy").css("color","#222222");
    		 if ($("#insorgancode2").find("option:selected").text() == "请选择") {
    			 $("#riskcode2_dummy").val("请选择");
    			 $("#riskcode2_dummy").css("color","#999999");
    		 }
    		 if ($("#insorgancode2").find("option:selected").text() == "平安") {
    			 $(".my_libiao2").removeClass("canpin");; 
     			$(".libiaoxian2").removeClass("my_border");
    		 }else{
    			$(".my_libiao2").addClass("canpin");
    			$(".libiaoxian2").addClass("my_border");
    		}
        })
        
    	$("#riskcode2").change(function(){
    		$("input.tmp").css("color","#222222");
    		if ($("#riskcode2").find("option:selected").text() == "平安福2018") {
    			$(".my_libiao2").removeClass("canpin");;  
    			$(".libiaoxian2").removeClass("my_border");
    		}else{
    			$(".my_libiao2").addClass("canpin");
    			$(".libiaoxian2").addClass("my_border");
    		}
    		
        })
         $("#insorgancode3").change(function(){
    		 $("#riskcode3_dummy").css("color","#222222");
    		 if ($("#insorgancode3").find("option:selected").text() == "请选择") {
    			 $("#riskcode3_dummy").val("请选择");
    			 $("#riskcode3_dummy").css("color","#999999");
    		 }
    		 if ($("#insorgancode3").find("option:selected").text() == "平安") {
    			 $(".my_libiao3").removeClass("canpin");; 
     			$(".libiaoxian3").removeClass("my_border");
    		 }else{
    			$(".my_libiao3").addClass("canpin");
    			$(".libiaoxian3").addClass("my_border");
    		}
        })
         $("#insorgancode4").change(function(){
    		 $("#riskcode4_dummy").css("color","#222222");
    		 if ($("#insorgancode4").find("option:selected").text() == "请选择") {
    			 $("#riskcode4_dummy").val("请选择");
    			 $("#riskcode4_dummy").css("color","#999999");
    		 }
    		 if ($("#insorgancode4").find("option:selected").text() == "平安") {
    			 $(".my_libiao4").removeClass("canpin");
     			$(".libiaoxian4").removeClass("my_border");
    		 }else{
    			$(".my_libiao4").addClass("canpin");
    			$(".libiaoxian4").addClass("my_border");
    		}
        })
     
        $("#riskcode3").change(function(){
    		if ($("#riskcode3").find("option:selected").text() == "平安福2018") {
    			$(".my_libiao3").removeClass("canpin");;  
    			$(".libiaoxian3").removeClass("my_border");
    		}else{
    			$(".my_libiao3").addClass("canpin");
    			$(".libiaoxian3").addClass("my_border");
    		}
    		
        })
        $("#riskcode4").change(function(){
    		if ($("#riskcode4").find("option:selected").text() == "平安福2018") {
    			$(".my_libiao4").removeClass("canpin");;  
    			$(".libiaoxian4").removeClass("my_border");
    		}else{
    			$(".my_libiao4").addClass("canpin");
    			$(".libiaoxian4").addClass("my_border");
    		}
    		
        })
    	
    	$(".add").on("click",function(){
    		console.log(num,arr);
    		if(num>0){
                if(!$(".canping1").hasClass("canping")){
                	$(".canping1").removeClass("canpin");
                    $(".canping1").addClass("canping");
                     num--;
                     if(num==0){
    					 arr=[];
    				}  
    				if(num==0&&$(".canping4").hasClass("canping")&&$(".canping3").hasClass("canping")&&$(".canping2").hasClass("canping")&&$(".canping1").hasClass("canping")){
    					 $(".add").hide();
    				}
                   return false;
                }else if(!$(".canping2").hasClass("canping")&&$(".canping1").hasClass("canping")){
                	$(".canping2").removeClass("canpin");
                    $(".canping2").addClass("canping");
                      num--; 
                      if(num==0){
     					 arr=[];
     				}  
     				if(num==0&&$(".canping4").hasClass("canping")&&$(".canping3").hasClass("canping")&&$(".canping2").hasClass("canping")&&$(".canping1").hasClass("canping")){
     					 $(".add").hide();
     				}
    				return false;
                }else if(!$(".canping3").hasClass("canping")&&$(".canping2").hasClass("canping")&&$(".canping1").hasClass("canping")){
                	$(".canping3").removeClass("canpin");
                    $(".canping3").addClass("canping");
                     num--;
    				if(num==0){
    					 arr=[];
    				}  
    				if(num==0&&$(".canping4").hasClass("canping")&&$(".canping3").hasClass("canping")&&$(".canping2").hasClass("canping")&&$(".canping1").hasClass("canping")){
    					 $(".add").hide();
    				}
    				return false;
                }else if(!$(".canping4").hasClass("canping")&&$(".canping3").hasClass("canping")&&$(".canping2").hasClass("canping")&&$(".canping1").hasClass("canping")){
                	$(".canping4").removeClass("canpin");
                    $(".canping4").addClass("canping");
                    $(".add").hide();		
                }
	
	    		}else if(num==0){
	    			if($(".canping3").hasClass("canping")&& !$(".canping4").hasClass("canping")){
	    				$(".canping4").removeClass("canpin");
	        			$(".canping4").addClass("canping");
	        			$(".add").hide();
	        		}
	                if(!$(".canping3").hasClass("canping")){
	                	$(".canping3").removeClass("canpin");
	                    $(".canping3").addClass("canping");
	                }
	    		}
    		})
//shanchu
        $('.can_p').on({
            touchstart:function(e){
                console.log($(this));
                index = $(this).parents().index();
                   // 将当前元素的索引作为参数进行传递
                timeOutEvent = setTimeout("longPress("+index+")",1000);
                 e.preventDefault(); 
            },
            /*  touchmove:function(){
                clearTimeout(timeOutEvent);
                timeOutEvent = 0;
            }, */ 
            touchend:function(){
                clearTimeout(timeOutEvent);
                if(timeOutEvent!=0){
                     /* alert('你这是点击，不是长按');  */  
                }
                return false;
            } 
        });
    });
   
    var ts=0;
    function longPress(t){
    	ts=t;
        timeOutEvent = 0;
        $(".zhezhao").eq(t).show();
        $(".backBg2").show();
        $(".backBg2").on("click",function () {
            $(".backBg2").hide();
            $(".zhezhao").hide();
        })
    }
    
    $(".delect").on("click",function () {
    	$(this).parent().parent().parent().find("input").val("");  
    	$(this).parent().parent().parent().find("#insorgancode"+(index+1)+"_dummy").val("请选择");
    	$(this).parent().parent().parent().find("#insorgancode"+(index+1)+"_dummy").css("color","#999999");
    	$(this).parent().parent().parent().find("#insorgancode"+(index+1)).val("");
    	$(this).parent().parent().parent().find("#riskcode"+(index+1)).val("");
    	$(this).parent().parent().parent().find("#insureyear"+(index+1)).val("");
    	$(this).parent().parent().parent().find("#payendyear"+(index+1)).val("");
    	$(this).parent().parent().parent().find(".my_libiao"+(index+1)).addClass("canpin");
    	$(this).parent().parent().parent().find(".hao"+(index+1)).addClass("canpin"); 
    	$(this).parent().parent().parent().find(".border_b"+(index+1)).addClass("my_border");
        $('.wrap .bigbox').eq(ts).removeClass("canping");
        $('.wrap .bigbox').eq(ts).addClass("canpin");
        $(".backBg2").hide();
        $(".zhezhao").hide();
        $(".add").show();
        arr.push(ts);
        num++;
        console.log(num,arr);
    })
	/* $(".next").on("click", function () {
		
		window.location.href = "./planrisk_step03.do"
	}) */

</script>
</html>
