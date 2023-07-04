$(function () 
{
	 $("#LifetimeOrRegularasis01").on("click", function (){
    	insuyearChange();
    });
    
	//下拉选择样式
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
	$("select.appntOccupation").each(function () {
	    $(this).scroller('destroy').scroller($.extend({preset: 'select'}, {
	        theme: "android-ics light",
	        lang: "zh",
	        display: 'bottom',
	        rtl: true,
	        inputClass: 'tmp',
	        onSelect: function () {
	            if ($(this).find("option:selected").text() == "请选择") {
	                $(this).siblings(".tmp").css("color","#999999");
	                $(".occupationReadonly").val("");
	            } else {
	                $(this).siblings(".tmp").css("color","#222222");
	                $(".occupationReadonly").val($(this).find("option:selected").text());
	                $(this).parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
	            }
	        }
	    }));
	    if ($(this).find("option:selected").text() == "请选择") {
	        $(this).siblings(".tmp").css("color","#999999");
	    } else {
	        $(this).siblings(".tmp").css("color","#222222");
	    }
	});
	$("select.occupation").each(function () {
	    $(this).scroller('destroy').scroller($.extend({preset: 'select'}, {
	        theme: "android-ics light",
	        lang: "zh",
	        display: 'bottom',
	        rtl: true,
	        inputClass: 'tmp',
	        onSelect: function () {
	            if ($(this).find("option:selected").text() != "请选择") {
	                $(this).siblings(".tmp").css("color","#222222");
	                $(this).parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
	            }else {
	                $(this).siblings(".tmp").css("color","#999999");
	            }
	        }
	    }));
	    if ($(this).find("option:selected").text() != "请选择") {
	        $(this).siblings(".tmp").css("color","#222222");
	    }else {
	        $(this).siblings(".tmp").css("color","#999999");
	    }
	});
    //地区
    setTimeout(function(){
    	getArea("appntArea");
	    getArea("insuredArea");
	    getArea("insuredArea1");
	    getArea("insuredArea2");
	    getArea("insuredArea3");
	    getArea("insuredArea4");
	    getArea("insuredArea5");
	    getArea("insuredArea6");
	    getArea("insuredArea7");
	    getArea("insuredArea8");
	    getArea("insuredArea9");
    },0);
    
    //改变银行发送数据
    $("#accountBank").change(function(){
        //$("#bankArea").val("");
        if($(this).find("option:selected").text() == "请选择"){
    		return;
    	};
    });
    //默认一加载就判断显示哪个
    if ($("#cardType").find("option:selected").text() == "身份证") {
        $(".birthday").hide();
        $(".birthdayReadonly").show();
        $(".sex").hide();
        $(".sexReadonly").show();
    } else {
        $(".birthday").show().css("display", "inline-block");
        $(".birthdayReadonly").hide();
        $(".sex").show().css("display", "inline-block");
        $(".sexReadonly").hide();
    }
    
    $("input[type = checkbox]").each(function () {
        if ($(this).prop("checked")) {
        	$(this).val("on");
            $(this).removeClass("unCheckBox").addClass("checkBox");
            $(this).parent().siblings("span").find("input[type = text]").hide();
        } else {
        	$(this).val("off");
            $(this).removeClass("checkBox").addClass("unCheckBox");
            $(this).parent().siblings("span").find("input[type = text]").show();
        }
    });
    
    $("#cardType").change(function(){
		if ($("#cardType").find("option:selected").text() == "身份证") {
			$(".yingchang1").show();
			$(".yingchang2").hide();
			$(".sex").hide();
			$(".xingbie").hide();
			
		}else{
			$(".yingchang2").show();
			$(".yingchang1").hide();
			$(".sex").show().css("display", "inline-block");
			$(".xingbie").show();
		}
		
    });
    
    if ($("input[type = radio]").prop("checked")) 
    {
        $("input[type = radio]").siblings("#switch").removeClass("turnOn").addClass("turnOff");
        $(".insured").show();
        if ($("#relation").find("option:selected").text() == "本人") {
            $(".insured .mySelf").show().siblings().hide();
            $(".insured .errorMsg").hide();
            $("#insuredCheckbox").val($("#checkbox").val());
        } else {
            $(".insured .mySelf").hide().siblings().show();
            if ($("#insuredCardType").find("option:selected").text() == "身份证") {
                $(".insuredBirthday").hide();
                $(".insuredBirthdayReadonly").show();
                $(".insuredSex").hide();
                $(".insuredSexReadonly").show();
            }else {
                $(".insuredBirthday").show().css("display", "inline-block");
                $(".insuredBirthdayReadonly").hide();
                $(".insuredSex").show();
                $(".insuredSexReadonly").hide();
            }
        }
    } else {
        $("input[type = radio]").siblings("#switch").removeClass("turnOff").addClass("turnOn");
        $(".insured").hide();
        $("#insuredCheckbox").val($("#checkbox").val());
    }
    
    $("#scrollTop>div>dl .occupationReadonly").hide();
    $("#scrollTop>div>dl .mySelf").hide();
    
    //投保人被保人证件有效期是否长期--切换
    $("input[type = checkbox]").each(function () {
        $(this).on("click", function () {
            if ($(this).hasClass("unCheckBox")) {
            	$(this).val("on");
                $(this).removeClass("unCheckBox").addClass("checkBox").prop("checked",true);
                $(this).parent().siblings("span").find("input[type = text]").hide().val("");
                $(this).parent().parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
            } else {
            	$(this).val("off");
                $(this).removeClass("checkBox").addClass("unCheckBox").prop("checked",false);
                $(this).parent().siblings("span").find("input[type = text]").show();
                $(this).parent().parent().siblings(".errorMsg").css("display", "inline-block").text("请输入有效期或选择长期！");
            }
        });
    });
    //投被保人是否一致的按钮控制
    var arr=[],nums=0;
    if($("#switch").hasClass("turnOn")){
    	$(".my_yingchang").hide();
/*    	$(".newxian").hide();*/
    	
    }
 
    $("#switch").on("click", function () {
    	
    	 if ($(this).hasClass("turnOff")) { 
    		 $(".my_yingchang").hide();
    		$(".newxian").addClass("hide");
    		  arr=[],nums=0;num=0;
    		  $(".newxian").find(".errorMsg").text("").hide();
    		  $(".newxian").find("input").val("");    		  
    		  $(".newxian").find("#insuredCardType1_dummy,#insuredCardType2_dummy,#insuredCardType3_dummy,#insuredCardType4_dummy,#insuredCardType5_dummy,#insuredCardType6_dummy,#insuredCardType7_dummy,#insuredCardType8_dummy,#insuredCardType9_dummy").val("身份证");
    		  $(".newxian").find("#relation1_dummy,#relation2_dummy,#relation3_dummy,#relation4_dummy,#relation5_dummy,#relation6_dummy,#relation7_dummy,#relation8_dummy,#relation9_dummy").val("父母");
    		  $(".newxian").find("#insuredSex1_dummy,#insuredSex2_dummy,#insuredSex3_dummy,#insuredSex4_dummy,#insuredSex5_dummy,#insuredSex6_dummy,#insuredSex7_dummy,#insuredSex8_dummy,#insuredSex9_dummy").val("女");
    	 }
    	
        if ($(this).hasClass("turnOn")) {
        	$(".my_yingchang").show();
        	$(this).removeClass("turnOn").addClass("turnOff").siblings("input").prop("checked",true);
            $("#relation").find("option").each(function(){
            	if ($(this).text() == "本人") {
            		$(this).prop("selected", true).siblings("option").prop("selected",false);
            		$(this).parent().siblings("input").val("本人");
                    $("#insuredCheckbox").val($("#checkbox").val());
                    
            	}
            });
            
            $(".insured").slideDown();
            $("#isSelf").val("0");
            //关闭开关后就将投保人的信息赋给被保人相应项
            $("#insuredName").siblings(".mySelf").val($("#policyName").val());
            $("#insuredCardType").siblings(".mySelf").val($("#cardType").find("option:selected").text());
            $("#insuredIdNo").siblings(".mySelf").val($("#idNo").val());
            $("#insuredArea").siblings(".mySelf").val($("#appntArea").val());
            $("#insuredAddress").siblings(".mySelf").val($("#address").val());
            $("#insuredZipCode").siblings(".mySelf").val($("#postalCode").val());
            $("#insuredMobile").siblings(".mySelf").val($("#tel").val());
            $("#insuredEmail").siblings(".mySelf").val($("#email").val());
            if ($(".appntOccupation").length > 0) {
            	if ($(".appntOccupation")[0].tagName == "INPUT"){
                    if ($(".appntOccupation").val() != "请选择") {
                        $(".occupationReadonly").val($(".appntOccupation").val());
                    }
                } else if ($(".appntOccupation")[0].tagName == "SELECT") {
                    if ($(".appntOccupation").find("option:selected").text() != "请选择") {
                        $(".occupationReadonly").val($(".appntOccupation").find("option:selected").text());
                    }
                }
            }
            if ($("#checkbox").hasClass("checkBox")) {
                $("#insuredCheckbox").parent().siblings(".mySelf").val($("#checkbox").parent().siblings("span").find("label").text());
            } else {
                $("#insuredCheckbox").parent().siblings(".mySelf").val($("#idDate").val());
            }
            if ($("#cardType").find("option:selected").text() == "身份证") {
                $(".insuredBirthdayReadonly").siblings(".mySelf").val($(".birthdayReadonly").val());
                $(".insuredSexReadonly").siblings(".mySelf").val($(".sexReadonly").val());
            } else {
                $(".insuredBirthdayReadonly").siblings(".mySelf").val($("#birthday").val());
                $(".insuredSexReadonly").siblings(".mySelf").val($("#sex").find("option:selected").text());
            }
            if ($("#relation").find("option:selected").text() == "本人") {
                $(".insured .mySelf").show().siblings().hide();
                $(".insured .errorMsg").hide();
            } else {
                $(".insured .mySelf").hide().siblings().show();
                if ($("#insuredCardType").find("option:selected").text() == "身份证") {
                    $(".insuredBirthday").hide();
                    $(".insuredBirthdayReadonly").show();
                    $(".insuredSex").hide();
                    $(".insuredSexReadonly").show();
                }else {
                    $(".insuredBirthday").show().css("display", "inline-block");
                    $(".insuredBirthdayReadonly").hide();
                    $(".insuredSex").show();
                    $(".insuredSexReadonly").hide();
                }
            }
        } else {
            $(this).removeClass("turnOff").addClass("turnOn").siblings("input").prop("checked",false);
            $("#insuredCheckbox").val($("#checkbox").val());
            $(".insured").slideUp();
            $("#isSelf").val("1");
        }
    });
    
    
    
    
    
    
    
   
    $(".shanchu").on("click",function(){
    	$(".backBg").show();
        var index = $(".newxian").index($(this).parents(".newxian"));
        $(this).parents(".newxian").addClass("hide");
        $(this).parents(".newxian").find("input").val("");
        $(this).parents().find("#insuredCardType"+(index+1)+"_dummy").val("身份证");
        $(this).parents().find("#relation"+(index+1)+"_dummy").val("父母");
        $(this).parents().find("#insuredSex"+(index+1)+"_dummy").val("女");
        $(this).parents().find(".errorMsg").text("").hide();
        $(".tianjia").removeClass("hide");
        $(".jili").css("margin-bottom","0");
        arr.push(index);
        num--;     
        calPrice();
    });
    $(".tianjia").on("click",function(){
    	$(".backBg").show();            
        if(nums == 9 && arr.length==0){
            $(".tianjia").addClass("hide");
        }
        if(nums < 9 &&arr.length == 0){	  
            $(".newxian").eq(nums).removeClass("hide");
            nums++;
            num++;
            if(nums == 9){
                $(".tianjia").addClass("hide");
                $(".jili").css("margin-bottom","3.4rem");
            }
        }
        if(arr.length!=0){
            $(".newxian").eq(arr[0]).removeClass("hide");
            num++;
            arr.shift();
        }
        calPrice();
    });
    
    
    
    
    
    
    //勾选同意
    $("#whetherCheck").on("click", function () {
        if ($(this).hasClass("unCheckBox")) {
            $(this).removeClass("unCheckBox").addClass("checkBox");
        } else {
            $(this).removeClass("checkBox").addClass("unCheckBox");
        }
    });
    
    $("#insuredCardType").change(function(){
		if ($("#insuredCardType").find("option:selected").text() == "身份证") {
			$(".yingchang4").hide();
			$(".yingchang3").show();
			$(".xingbie2").hide();
		}else{
			$(".yingchang4").show();
			$(".yingchang3").hide();
			$(".xingbie2").show();
		}
		
    });
   $("#insuredCardType1").change(function(){
		if ($("#insuredCardType1").find("option:selected").text() == "身份证") {
			$(".insuredBirthday11").hide();
			$(".beibao1").css("display","none");
			$(".beiabo_xb1").hide();
			/*$(".dingwei").css("top","21.8rem")*/
		}else{
			$(".insuredBirthday11").show().css("display", "inline-block");
			$(".beibao1").css("display","block");
			$(".beiabo_xb1").show();
			/*$(".dingwei").css("top","26.5rem")*/
		}
		
    });
   $("#insuredCardType2").change(function(){
		if ($("#insuredCardType2").find("option:selected").text() == "身份证") {
			$(".insuredBirthday22").hide();
			$(".beibao2").css("display","none");
			$(".beiabo_xb2").hide();
		}else{
			$(".insuredBirthday22").show().css("display", "inline-block");
			$(".beibao2").css("display","block");
			$(".beiabo_xb2").show();
		}
		
   });
   $("#insuredCardType3").change(function(){
		if ($("#insuredCardType3").find("option:selected").text() == "身份证") {
			$(".insuredBirthday3").hide();
			$(".beibao3").css("display","none");
			$(".beiabo_xb3").hide();
		}else{
			$(".insuredBirthday3").show().css("display", "inline-block");
			$(".beibao3").css("display","block");
			$(".beiabo_xb3").show();
		}
		
  });
   $("#insuredCardType4").change(function(){
		if ($("#insuredCardType4").find("option:selected").text() == "身份证") {
			$(".insuredBirthday4").hide();
			$(".beibao4").css("display","none");
			$(".beiabo_xb4").hide();
		}else{
			$(".insuredBirthday4").show().css("display", "inline-block");
			$(".beibao4").css("display","block");
			$(".beiabo_xb4").show();
		}
		
 });
   $("#insuredCardType5").change(function(){
		if ($("#insuredCardType5").find("option:selected").text() == "身份证") {
			$(".insuredBirthday5").hide();
			$(".beibao5").css("display","none");
			$(".beiabo_xb5").hide();
		}else{
			$(".insuredBirthday5").show().css("display", "inline-block");
			$(".beibao5").css("display","block");
			$(".beiabo_xb5").show();
		}
		
 });
   $("#insuredCardType6").change(function(){
		if ($("#insuredCardType6").find("option:selected").text() == "身份证") {
			$(".insuredBirthday6").hide();
			$(".beibao6").css("display","none");
			$(".beiabo_xb6").hide();
		}else{
			$(".insuredBirthday6").show().css("display", "inline-block");
			$(".beibao6").css("display","block");
			$(".beiabo_xb6").show();
		}
		
 });
   $("#insuredCardType7").change(function(){
		if ($("#insuredCardType7").find("option:selected").text() == "身份证") {
			$(".insuredBirthday7").hide();
			$(".beibao7").css("display","none");
			$(".beiabo_xb7").hide();
		}else{
			$(".insuredBirthday7").show().css("display", "inline-block");
			$(".beibao7").css("display","block");
			$(".beiabo_xb7").show();
		}
		
 });
   $("#insuredCardType8").change(function(){
		if ($("#insuredCardType8").find("option:selected").text() == "身份证") {
			$(".insuredBirthday8").hide();
			$(".beibao8").css("display","none");
			$(".beiabo_xb8").hide();
		}else{
			$(".insuredBirthday8").show().css("display", "inline-block");
			$(".beibao8").css("display","block");
			$(".beiabo_xb8").show();
		}
		
 });
   $("#insuredCardType9").change(function(){
		if ($("#insuredCardType9").find("option:selected").text() == "身份证") {
			$(".insuredBirthday9").hide();
			$(".beibao9").css("display","none");
			$(".beiabo_xb9").hide();
		}else{
			$(".insuredBirthday9").show().css("display", "inline-block");
			$(".beibao9").css("display","block");
			$(".beiabo_xb9").show();
		}
		
 });
    //当被保人为本人时，相应信息显示并只读,否则显示输入框
    $("#relation").on("change", function () {
        if ($("#relation").find("option:selected").text() == "本人") {
            $("#insuredCheckbox").val($("#checkbox").val());
            $(".insured .mySelf").show().siblings().hide();
            $(".insured .errorMsg").hide();
            if ($(".appntOccupation").length > 0) {
            	if ($(".appntOccupation")[0].tagName == "INPUT"){
                    if ($(".appntOccupation").val() != "请选择") {
                        $(".occupationReadonly").val($(".appntOccupation").val());
                    }
                } else if ($(".appntOccupation")[0].tagName == "SELECT") {
                    if ($(".appntOccupation").find("option:selected").text() != "请选择") {
                        $(".occupationReadonly").val($(".appntOccupation").find("option:selected").text());
                    }
                }
            }
        } else {
            $(".insured .mySelf").hide().siblings().show();
            if ($("#insuredCardType").find("option:selected").text() == "身份证") {
                $(".insuredBirthday").hide();
                $(".insuredBirthdayReadonly").show();
                $(".insuredSex").hide();
                $(".insuredSexReadonly").show();
            }else {
                $(".insuredBirthday").show().css("display", "inline-block");
                $(".insuredBirthdayReadonly").hide();
                $(".insuredSex").show();
                $(".insuredSexReadonly").hide();
            }
            if ($("#insuredCheckbox").hasClass("unCheckBox")) {
            	$("#insuredCheckbox").val("off");
            }else{

            	$("#insuredCheckbox").val("on");
            }
        }
    });
    //被保人为本人时，改变输入框状态将投保人信息赋值给被保人对应项
    $("#cardType").on("change", function () {
        $("#birthday").val("");
        $("#idNo").focus();
        //清空年龄的错误信息提示
        $("#birthday").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
        $("#insuredCardType").siblings(".mySelf").val($(this).find("option:selected").text());
        if ($("#cardType").find("option:selected").text() == "身份证") {
            $(".insuredBirthdayReadonly").siblings(".mySelf").val($(".birthdayReadonly").val());
            $(".insuredSexReadonly").siblings(".mySelf").val($(".sexReadonly").val());
        } else {
            $(".insuredBirthdayReadonly").siblings(".mySelf").val($("#birthday").val());
            $(".insuredSexReadonly").siblings(".mySelf").val($("#sex").find("option:selected").text());
        }
    });
    $("#idDate").on("change", function () {
        $(this).parent().parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
        $("#insuredCheckbox").parent().siblings(".mySelf").val($(this).val());
    });
    $("#checkbox").on("click", function () {
        if ($(this).hasClass("checkBox")) {
            $("#insuredCheckbox").parent().siblings(".mySelf").val($(this).parent().siblings("span").find("label").text());

            if ($("#switch").hasClass("turnOn")) {
            	$("#insuredCheckbox").val("on");
            }else if ($("#relation").find("option:selected").text() == "本人") {
            	$("#insuredCheckbox").val("on");
            }else if ($("#insuredCheckbox").hasClass("unCheckBox")) {
            	$("#insuredCheckbox").val("off");
            }else {
            	$("#insuredCheckbox").val("on");
            }
            
        } else {
            $("#insuredCheckbox").parent().siblings(".mySelf").val($("#idDate").val());
            if ($("#switch").hasClass("turnOn")) {
            	$("#insuredCheckbox").val("off");
            }else if ($("#relation").find("option:selected").text() == "本人") {
            	$("#insuredCheckbox").val("off");
            }else if ($("#insuredCheckbox").hasClass("unCheckBox")) {
            	$("#insuredCheckbox").val("off");
            }else {
            	$("#insuredCheckbox").val("on");
            }
        }
        
    });
    $("#birthday").on("change", function () {
        //年龄判断
        if (getAgeByBirthDay($("#birthday").val()) < 18) {
            $("#birthday").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("投保人年龄必须满18周岁！");
        } else {
            $(this).parent().parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
        }
        $(".insuredBirthdayReadonly").siblings(".mySelf").val($("#birthday").val());
    });
    $("#sex").on("change", function () {
        $(".insuredSexReadonly").siblings(".mySelf").val($("#sex").find("option:selected").text());
    });
    //改变下拉状态，错误提示信息消失
    /*$("#insuredIdDate").on("change", function () {
        $(this).parent().parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
    });*/
    $("#insuredBirthday,#insuredBirthday11,#insuredBirthday22,#insuredBirthday3,#insuredBirthday4,#insuredBirthday5,#insuredBirthday" +
    		",#insuredBirthday6,#insuredBirthday7,#insuredBirthday8,#insuredBirthday9").on("change", function () {
        $(this).parent().parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
    });

    $("#appntArea").on("touchend", function () {
        $("#appntArea").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
    });
    $("#insuredArea,#insuredArea1,#insuredArea2,#insuredArea3,#insuredArea4,#insuredArea5,#insuredArea6,#insuredArea7," +
    		"#insuredArea8,#insuredArea9").on("touchend", function () {
        $(this).parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
    });
    /*$("#accountBank").on("change", function () {
        $(this).parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
    });*/

    //改变证件类型，焦点移到证件号码输入框
    $("#insuredCardType").on("change", function () {
        $("#insuredBirthday").val("");
        $("#insuredIdNo").focus();
    });
    $("#insuredCardType1").on("change", function () {
        $("#insuredBirthday11").val("");
        $("#insuredIdNo1").focus();
    });
    $("#insuredCardType2").on("change", function () {
        $("#insuredBirthday22").val("");
        $("#insuredIdNo2").focus();
    });
    $("#insuredCardType3").on("change", function () {
        $("#insuredBirthday3").val("");
        $("#insuredIdNo3").focus();
    });
    $("#insuredCardType4").on("change", function () {
        $("#insuredBirthday4").val("");
        $("#insuredIdNo4").focus();
    });
    $("#insuredCardType5").on("change", function () {
        $("#insuredBirthday5").val("");
        $("#insuredIdNo5").focus();
    });
    $("#insuredCardType6").on("change", function () {
        $("#insuredBirthday6").val("");
        $("#insuredIdNo6").focus();
    });
    $("#insuredCardType7").on("change", function () {
        $("#insuredBirthday7").val("");
        $("#insuredIdNo7").focus();
    });
    $("#insuredCardType8").on("change", function () {
        $("#insuredBirthday8").val("");
        $("#insuredIdNo8").focus();
    });
    $("#insuredCardType9").on("change", function () {
        $("#insuredBirthday9").val("");
        $("#insuredIdNo9").focus();
    });
    //点击确定，弹窗消失
    $(".pop-sure").on("click", function () {
        $(".pop").hide();
        $(".mask").hide();
    });
    
    //新加
    $("#amnt").on("change",function(){
    	$("#bz_amnt").val($("#amnt_dummy").val());
    	calPrice();
    });
    
    $("#insuDay").on("change",function(){
    	calPrice();
    });
    //终止日期
    $("#insBeginDate").on("change",function(){
    	var days = $("#insuDay").find("option:selected").val();
    	var productNo = $("#productNo").val();
    	var d1 = $("#insBeginDate").val();
		var d2 = new Date(d1);
    	if(days == '1' && productNo == "al_ozy"){
    		d2.setFullYear(d2.getFullYear()+1); 
    		d2.setDate(d2.getDate()-1); 
    		$("#insEndDate").val(d2.getFullYear()+"-"+(d2.getMonth()+1)+"-"+d2.getDate());
    	}else if(days == '1' && productNo == "al_yly"){
    		d2.setFullYear(d2.getFullYear()+1); 
    		d2.setDate(d2.getDate()-1); 
    		$("#insEndDate").val(d2.getFullYear()+"-"+(d2.getMonth()+1)+"-"+d2.getDate());
    	}else{
    		d2 =+ d2 + 1000*60*60*24*(days-1);
    		d2 = new Date(d2);
    	}
    	if($("#insBeginDate").val()!=null && $("#insBeginDate").val()!=""){
    		if(parseInt(d2.getMonth())<9 && parseInt(d2.getDate())<=10){
    			$("#insEndDate").val(d2.getFullYear()+"-0"+(d2.getMonth()+1)+"-0"+d2.getDate());
    		}else if(parseInt(d2.getMonth())<9 && parseInt(d2.getDate())>=10){
    			$("#insEndDate").val(d2.getFullYear()+"-0"+(d2.getMonth()+1)+"-"+d2.getDate());
    		}else if(parseInt(d2.getMonth())>=9 && parseInt(d2.getDate())<10){
    			$("#insEndDate").val(d2.getFullYear()+"-"+(d2.getMonth()+1)+"-0"+d2.getDate());
    		}else{
    			$("#insEndDate").val(d2.getFullYear()+"-"+(d2.getMonth()+1)+"-"+d2.getDate());
    		}
    	}
    });
    
    $("#insuDay").on("change",function(){
    	var days = $("#insuDay").find("option:selected").val();
    	var productNo = $("#productNo").val();
    	var d1 = $("#insBeginDate").val();
		var d2 = new Date(d1);
    	if(days == '1' && productNo == "al_ozy"){
    		d2.setFullYear(d2.getFullYear()+1); 
    		d2.setDate(d2.getDate()-1); 
    		$("#insEndDate").val(d2.getFullYear()+"-"+(d2.getMonth()+1)+"-"+d2.getDate());
    	}else if(days == '1' && productNo == "al_yly"){
    		d2.setFullYear(d2.getFullYear()+1); 
    		d2.setDate(d2.getDate()-1); 
    		$("#insEndDate").val(d2.getFullYear()+"-"+(d2.getMonth()+1)+"-"+d2.getDate());
    	}else{
    		d2 =+ d2 + 1000*60*60*24*(days-1);
    		d2 = new Date(d2);
    	}
    	if($("#insBeginDate").val()!=null && $("#insBeginDate").val()!=""){
    		if(parseInt(d2.getMonth())<9 && parseInt(d2.getDate())<=10){
    			$("#insEndDate").val(d2.getFullYear()+"-0"+(d2.getMonth()+1)+"-0"+d2.getDate());
    		}else if(parseInt(d2.getMonth())<9 && parseInt(d2.getDate())>=10){
    			$("#insEndDate").val(d2.getFullYear()+"-0"+(d2.getMonth()+1)+"-"+d2.getDate());
    		}else if(parseInt(d2.getMonth())>=9 && parseInt(d2.getDate())<10){
    			$("#insEndDate").val(d2.getFullYear()+"-"+(d2.getMonth()+1)+"-0"+d2.getDate());
    		}else{
    			$("#insEndDate").val(d2.getFullYear()+"-"+(d2.getMonth()+1)+"-"+d2.getDate());
    		}
    	}
    });
    
    /***************************投保人信息校验**************************/
    $(".numInput").on("blur",function(){
    	checkNum($(this));
    });
    
    /***************************投保人信息校验**************************/
        //姓名校验
    $("#policyName").on("blur", function () 
    {
        checkName($(this));
        if (checkName($(this))) 
        {
            $("#accountName").val($(this).val()).parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
        }
        else 
        {
            $("#accountName").val("");
        }
        $("#insuredName").siblings(".mySelf").val($(this).val());
    });
    //证件号码校验
    $("#idNo").on("blur", function () 
    {
        $(this).val($(this).val().toUpperCase());
        //身份证校验
        if ($("#cardType").find("option:selected").text() == "身份证") {
            checkID($(this));
            if (checkID($(this))) 
            {
                //带出生日和性别
                $(".birthdayReadonly").val(getBirthdayByIDCard($(this).val().trim()));
                $("#birthday").val(getBirthdayByIDCard($(this).val().trim()));
                $(".sexReadonly").val(getSexByIDCard($(this).val().trim()) == "1" ? "男" : "女");
                getSexByIDCard($(this).val().trim()) == "1" ? $("#sex").find("option").eq(0).prop("selected",true):$("#sex").find("option").eq(1).prop("selected",true);
              //年龄判断
                if (getAgeByBirthDay($(".birthdayReadonly").val()) < 18) {
                    $("#idNo").parent().siblings(".errorMsg").css("display", "inline-block").text("年龄必须满18周岁！");
                    return;
                } else {
                    $("#idNo").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
                }
            }
            else 
            {
                //身份证错误时清空生日和性别
                $(".birthdayReadonly").val("");
                $("#birthday").val("");
                $(".sexReadonly").val("");
            }
            $(".insuredBirthdayReadonly").siblings(".mySelf").val($(".birthdayReadonly").val());
            $(".insuredSexReadonly").siblings(".mySelf").val($(".sexReadonly").val());
        }
        //护照或其他证件校验
        else {
            $(".birthdayReadonly").val("");
            $(".sexReadonly").val("");
            checkOtherId($(this));
        }
        $("#insuredIdNo").siblings(".mySelf").val($(this).val());
    });
    //手机号码校验
    $("#tel").on("blur", function () {
        checkTel($(this));
        $("#insuredMobile").siblings(".mySelf").val($(this).val());
    });
    //电子邮箱校验
    $("#email").on("blur", function () {
        checkEmail($(this));
        $("#insuredEmail").siblings(".mySelf").val($(this).val());
    });
    //详细地址校验
    $("#address").on("blur", function () {
        checkAddress($(this));
        $("#insuredAddress").siblings(".mySelf").val($(this).val());
    });
    //邮政编码校验
    $("#postalCode").on("blur", function () {
        checkPostalCode($(this));
        $("#insuredZipCode").siblings(".mySelf").val($(this).val());
    });

    /***************************被保人信息校验**************************/
        //姓名校验
    $("#insuredName,#insuredName1,#insuredName2,#insuredName3,#insuredName4,#insuredName5," +
    		"#insuredName6,#insuredName7,#insuredName8,#insuredName9").on("blur", function () {
        checkName($(this));
    });
    //证件号码校验
    $("#insuredIdNo").on("blur", function () {
        $(this).val($(this).val().toUpperCase());
        //身份证校验
        if ($("#insuredCardType").find("option:selected").text() == "身份证") {
            checkID($(this));
            if (checkID($(this))) {
                //带出生日和性别
                $(".insuredBirthdayReadonly").val(getBirthdayByIDCard($(this).val().trim()));
                $("#insuredBirthday").val(getBirthdayByIDCard($(this).val().trim()));
                $(".insuredSexReadonly").val(getSexByIDCard($(this).val().trim()) == "1" ? "男" : "女");
                getSexByIDCard($(this).val().trim()) == "1" ? $("#insuredSex").find("option").eq(0).prop("selected",true):$("#insuredSex").find("option").eq(1).prop("selected",true);
                //年龄校验
                if (getAgeByBirthDay($("#insuredBirthday").val()) > 90 || getDayByBirthDay($("#insuredBirthday").val()) < 60) {
                    $("#insuredIdNo").parent().siblings(".errorMsg").css("display", "inline-block").text("被保险人年龄应在60天-90周岁！");
                    return;
                } else {
                	$("#insuredIdNo").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
                }
            } else {
                //身份证错误时清空生日和性别
                $(".insuredBirthdayReadonly").val("");
                $("#insuredBirthday").val("");
                $(".insuredSexReadonly").val("");
            }
        }
        //护照或其他证件校验
        else {
            $(".insuredBirthdayReadonly").val("");
            $(".insuredSexReadonly").val("");
            checkOtherId($(this));
        }
    });
    $("#insuredIdNo1").on("blur", function () {
        $(this).val($(this).val().toUpperCase());
        //身份证校验
        if ($("#insuredCardType1").find("option:selected").text() == "身份证") {
            checkID($(this));
            if (checkID($(this))) {
                //带出生日和性别
                $(".insuredBirthdayReadonly1").val(getBirthdayByIDCard($(this).val().trim()));
                $("#insuredBirthday11").val(getBirthdayByIDCard($(this).val().trim()));
                $(".insuredSexReadonly1").val(getSexByIDCard($(this).val().trim()) == "1" ? "男" : "女");
                getSexByIDCard($(this).val().trim()) == "1" ? $("#insuredSex1").find("option").eq(0).prop("selected",true):$("#insuredSex1").find("option").eq(1).prop("selected",true);
                //年龄校验
                if (getAgeByBirthDay($("#insuredBirthday11").val()) > 90 || getDayByBirthDay($("#insuredBirthday11").val()) < 60) {
                    $("#insuredIdNo1").parent().siblings(".errorMsg").css("display", "inline-block").text("被保险人年龄应在60天-90周岁！");
                    return;
                } else {
                	$("#insuredIdNo1").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
                }
            } else {
                //身份证错误时清空生日和性别
                $(".insuredBirthdayReadonly1").val("");
                $("#insuredBirthday11").val("");
                $(".insuredSexReadonly1").val("");
            }
        }
        //护照或其他证件校验
        else {
            $(".insuredBirthdayReadonly1").val("");
            $(".insuredSexReadonly1").val("");
            checkOtherId($(this));
        }
    });
    $("#insuredIdNo2").on("blur", function () {
        $(this).val($(this).val().toUpperCase());
        //身份证校验
        if ($("#insuredCardType2").find("option:selected").text() == "身份证") {
            checkID($(this));
            if (checkID($(this))) {
                //带出生日和性别
                $(".insuredBirthdayReadonly2").val(getBirthdayByIDCard($(this).val().trim()));
                $("#insuredBirthday22").val(getBirthdayByIDCard($(this).val().trim()));
                $(".insuredSexReadonly2").val(getSexByIDCard($(this).val().trim()) == "1" ? "男" : "女");
                getSexByIDCard($(this).val().trim()) == "1" ? $("#insuredSex2").find("option").eq(0).prop("selected",true):$("#insuredSex2").find("option").eq(1).prop("selected",true);
                //年龄校验
                if (getAgeByBirthDay($("#insuredBirthday22").val()) > 90 || getDayByBirthDay($("#insuredBirthday22").val()) < 60) {
                    $("#insuredIdNo2").parent().siblings(".errorMsg").css("display", "inline-block").text("被保险人年龄应在60天-90周岁！");
                    return;
                } else {
                	$("#insuredIdNo2").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
                }
            } else {
                //身份证错误时清空生日和性别
                $(".insuredBirthdayReadonly2").val("");
                $("#insuredBirthday22").val("");
                $(".insuredSexReadonly2").val("");
            }
        }
        //护照或其他证件校验
        else {
            $(".insuredBirthdayReadonly2").val("");
            $(".insuredSexReadonly2").val("");
            checkOtherId($(this));
        }
    });
    $("#insuredIdNo3").on("blur", function () {
        $(this).val($(this).val().toUpperCase());
        //身份证校验
        if ($("#insuredCardType3").find("option:selected").text() == "身份证") {
            checkID($(this));
            if (checkID($(this))) {
                //带出生日和性别
                $(".insuredBirthdayReadonly3").val(getBirthdayByIDCard($(this).val().trim()));
                $("#insuredBirthday3").val(getBirthdayByIDCard($(this).val().trim()));
                $(".insuredSexReadonly3").val(getSexByIDCard($(this).val().trim()) == "1" ? "男" : "女");
                getSexByIDCard($(this).val().trim()) == "1" ? $("#insuredSex3").find("option").eq(0).prop("selected",true):$("#insuredSex3").find("option").eq(1).prop("selected",true);
                //年龄校验
                if (getAgeByBirthDay($("#insuredBirthday3").val()) > 90 || getDayByBirthDay($("#insuredBirthday3").val()) < 60) {
                    $("#insuredIdNo3").parent().siblings(".errorMsg").css("display", "inline-block").text("被保险人年龄应在60天-90周岁！");
                    return;
                } else {
                	$("#insuredIdNo3").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
                }
            } else {
                //身份证错误时清空生日和性别
                $(".insuredBirthdayReadonly3").val("");
                $("#insuredBirthday3").val("");
                $(".insuredSexReadonly3").val("");
            }
        }
        //护照或其他证件校验
        else {
            $(".insuredBirthdayReadonly3").val("");
            $(".insuredSexReadonly3").val("");
            checkOtherId($(this));
        }
    });
    $("#insuredIdNo4").on("blur", function () {
        $(this).val($(this).val().toUpperCase());
        //身份证校验
        if ($("#insuredCardType4").find("option:selected").text() == "身份证") {
            checkID($(this));
            if (checkID($(this))) {
                //带出生日和性别
                $(".insuredBirthdayReadonly4").val(getBirthdayByIDCard($(this).val().trim()));
                $("#insuredBirthday4").val(getBirthdayByIDCard($(this).val().trim()));
                $(".insuredSexReadonly4").val(getSexByIDCard($(this).val().trim()) == "1" ? "男" : "女");
                getSexByIDCard($(this).val().trim()) == "1" ? $("#insuredSex4").find("option").eq(0).prop("selected",true):$("#insuredSex4").find("option").eq(1).prop("selected",true);
                //年龄校验
                if (getAgeByBirthDay($("#insuredBirthday4").val()) > 90 || getDayByBirthDay($("#insuredBirthday4").val()) < 60) {
                    $("#insuredIdNo4").parent().siblings(".errorMsg").css("display", "inline-block").text("被保险人年龄应在60天-90周岁！");
                    return;
                } else {
                	$("#insuredIdNo4").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
                }
            } else {
                //身份证错误时清空生日和性别
                $(".insuredBirthdayReadonly4").val("");
                $("#insuredBirthday4").val("");
                $(".insuredSexReadonly4").val("");
            }
        }
        //护照或其他证件校验
        else {
            $(".insuredBirthdayReadonly4").val("");
            $(".insuredSexReadonly4").val("");
            checkOtherId($(this));
        }
    });
    $("#insuredIdNo5").on("blur", function () {
        $(this).val($(this).val().toUpperCase());
        //身份证校验
        if ($("#insuredCardType5").find("option:selected").text() == "身份证") {
            checkID($(this));
            if (checkID($(this))) {
                //带出生日和性别
                $(".insuredBirthdayReadonly5").val(getBirthdayByIDCard($(this).val().trim()));
                $("#insuredBirthday5").val(getBirthdayByIDCard($(this).val().trim()));
                $(".insuredSexReadonly5").val(getSexByIDCard($(this).val().trim()) == "1" ? "男" : "女");
                getSexByIDCard($(this).val().trim()) == "1" ? $("#insuredSex5").find("option").eq(0).prop("selected",true):$("#insuredSex5").find("option").eq(1).prop("selected",true);
                //年龄校验
                if (getAgeByBirthDay($("#insuredBirthday5").val()) > 90 || getDayByBirthDay($("#insuredBirthday5").val()) < 60) {
                    $("#insuredIdNo5").parent().siblings(".errorMsg").css("display", "inline-block").text("被保险人年龄应在60天-90周岁！");
                    return;
                } else {
                	$("#insuredIdNo5").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
                }
            } else {
                //身份证错误时清空生日和性别
                $(".insuredBirthdayReadonly5").val("");
                $("#insuredBirthday5").val("");
                $(".insuredSexReadonly5").val("");
            }
        }
        //护照或其他证件校验
        else {
            $(".insuredBirthdayReadonly5").val("");
            $(".insuredSexReadonly5").val("");
            checkOtherId($(this));
        }
    });
    $("#insuredIdNo6").on("blur", function () {
        $(this).val($(this).val().toUpperCase());
        //身份证校验
        if ($("#insuredCardType6").find("option:selected").text() == "身份证") {
            checkID($(this));
            if (checkID($(this))) {
                //带出生日和性别
                $(".insuredBirthdayReadonly6").val(getBirthdayByIDCard($(this).val().trim()));
                $("#insuredBirthday6").val(getBirthdayByIDCard($(this).val().trim()));
                $(".insuredSexReadonly6").val(getSexByIDCard($(this).val().trim()) == "1" ? "男" : "女");
                getSexByIDCard($(this).val().trim()) == "1" ? $("#insuredSex6").find("option").eq(0).prop("selected",true):$("#insuredSex6").find("option").eq(1).prop("selected",true);
                //年龄校验
                if (getAgeByBirthDay($("#insuredBirthday6").val()) > 90 || getDayByBirthDay($("#insuredBirthday6").val()) < 60) {
                    $("#insuredIdNo6").parent().siblings(".errorMsg").css("display", "inline-block").text("被保险人年龄应在60天-90周岁！");
                    return;
                } else {
                	$("#insuredIdNo6").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
                }
            } else {
                //身份证错误时清空生日和性别
                $(".insuredBirthdayReadonly6").val("");
                $("#insuredBirthday6").val("");
                $(".insuredSexReadonly6").val("");
            }
        }
        //护照或其他证件校验
        else {
            $(".insuredBirthdayReadonly6").val("");
            $(".insuredSexReadonly6").val("");
            checkOtherId($(this));
        }
    });
    $("#insuredIdNo7").on("blur", function () {
        $(this).val($(this).val().toUpperCase());
        //身份证校验
        if ($("#insuredCardType7").find("option:selected").text() == "身份证") {
            checkID($(this));
            if (checkID($(this))) {
                //带出生日和性别
                $(".insuredBirthdayReadonly7").val(getBirthdayByIDCard($(this).val().trim()));
                $("#insuredBirthday7").val(getBirthdayByIDCard($(this).val().trim()));
                $(".insuredSexReadonly7").val(getSexByIDCard($(this).val().trim()) == "1" ? "男" : "女");
                getSexByIDCard($(this).val().trim()) == "1" ? $("#insuredSex7").find("option").eq(0).prop("selected",true):$("#insuredSex7").find("option").eq(1).prop("selected",true);
                //年龄校验
                if (getAgeByBirthDay($("#insuredBirthday7").val()) > 90 || getDayByBirthDay($("#insuredBirthday7").val()) < 60) {
                    $("#insuredIdNo7").parent().siblings(".errorMsg").css("display", "inline-block").text("被保险人年龄应在60天-90周岁！");
                    return;
                } else {
                	$("#insuredIdNo7").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
                }
            } else {
                //身份证错误时清空生日和性别
                $(".insuredBirthdayReadonly7").val("");
                $("#insuredBirthday7").val("");
                $(".insuredSexReadonly7").val("");
            }
        }
        //护照或其他证件校验
        else {
            $(".insuredBirthdayReadonly7").val("");
            $(".insuredSexReadonly7").val("");
            checkOtherId($(this));
        }
    });
    $("#insuredIdNo8").on("blur", function () {
        $(this).val($(this).val().toUpperCase());
        //身份证校验
        if ($("#insuredCardType8").find("option:selected").text() == "身份证") {
            checkID($(this));
            if (checkID($(this))) {
                //带出生日和性别
                $(".insuredBirthdayReadonly8").val(getBirthdayByIDCard($(this).val().trim()));
                $("#insuredBirthday8").val(getBirthdayByIDCard($(this).val().trim()));
                $(".insuredSexReadonly8").val(getSexByIDCard($(this).val().trim()) == "1" ? "男" : "女");
                getSexByIDCard($(this).val().trim()) == "1" ? $("#insuredSex8").find("option").eq(0).prop("selected",true):$("#insuredSex8").find("option").eq(1).prop("selected",true);
                //年龄校验
                if (getAgeByBirthDay($("#insuredBirthday8").val()) > 90 || getDayByBirthDay($("#insuredBirthday8").val()) < 60) {
                    $("#insuredIdNo8").parent().siblings(".errorMsg").css("display", "inline-block").text("被保险人年龄应在60天-90周岁！");
                    return;
                } else {
                	$("#insuredIdNo8").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
                }
            } else {
                //身份证错误时清空生日和性别
                $(".insuredBirthdayReadonly8").val("");
                $("#insuredBirthday8").val("");
                $(".insuredSexReadonly8").val("");
            }
        }
        //护照或其他证件校验
        else {
            $(".insuredBirthdayReadonly8").val("");
            $(".insuredSexReadonly8").val("");
            checkOtherId($(this));
        }
    });
    $("#insuredIdNo9").on("blur", function () {
        $(this).val($(this).val().toUpperCase());
        //身份证校验
        if ($("#insuredCardType9").find("option:selected").text() == "身份证") {
            checkID($(this));
            if (checkID($(this))) {
                //带出生日和性别
                $(".insuredBirthdayReadonly9").val(getBirthdayByIDCard($(this).val().trim()));
                $("#insuredBirthday9").val(getBirthdayByIDCard($(this).val().trim()));
                $(".insuredSexReadonly9").val(getSexByIDCard($(this).val().trim()) == "1" ? "男" : "女");
                getSexByIDCard($(this).val().trim()) == "1" ? $("#insuredSex9").find("option").eq(0).prop("selected",true):$("#insuredSex9").find("option").eq(1).prop("selected",true);
                //年龄校验
                if (getAgeByBirthDay($("#insuredBirthday9").val()) > 90 || getDayByBirthDay($("#insuredBirthday9").val()) < 60) {
                    $("#insuredIdNo9").parent().siblings(".errorMsg").css("display", "inline-block").text("被保险人年龄应在60天-90周岁！");
                    return;
                } else {
                	$("#insuredIdNo9").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
                }
            } else {
                //身份证错误时清空生日和性别
                $(".insuredBirthdayReadonly9").val("");
                $("#insuredBirthday9").val("");
                $(".insuredSexReadonly9").val("");
            }
        }
        //护照或其他证件校验
        else {
            $(".insuredBirthdayReadonly9").val("");
            $(".insuredSexReadonly9").val("");
            checkOtherId($(this));
        }
    });
    //详细地址校验
    $("#insuredAddress,#insuredAddress1,#insuredAddress2,#insuredAddress3,#insuredAddress4,#insuredAddress5,#insuredAddress6," +
    		"#insuredAddress7,#insuredAddress8,#insuredAddress9").on("blur", function () {
        checkAddress($(this));
    });
    //手机号码校验
    $("#insuredMobile,#insuredMobile1,#insuredMobile2,#insuredMobile3,#insuredMobile4,#insuredMobile5,#insuredMobile6," +
    		"#insuredMobile7,#insuredMobile8,#insuredMobile9").on("blur", function () {
        checkTel($(this));
    });
    
    /***************************续缴账户信息校验**************************/
    if ($(".import").length>0) {
        $(".import").each(function(index, el) {
            if ($(this).val()) {
                $(this).data("value",$(this).val());
            };
        });
    };
    
    $(".getAmntDesc").change(function(e){
    	if($(this).hasClass("import")){
    		$(this).data("value",$(this).val());
    	}
    });
    
    $("#idNo").change(function(){
        $(this).val($(this).val().toUpperCase());
        //身份证校验
        if ($("#insuredCardType").find("option:selected").text() == "身份证") {
            checkID($(this));
            if (checkID($(this))) {
                //带出生日和性别
                $(".insuredBirthdayReadonly").val(getBirthdayByIDCard($(this).val().trim()));
                $("#insuredBirthday").val(getBirthdayByIDCard($(this).val().trim()));
                $(".insuredSexReadonly").val(getSexByIDCard($(this).val().trim()) == "1" ? "男" : "女");
                getSexByIDCard($(this).val().trim()) == "1" ? $("#insuredSex").find("option").eq(0).prop("selected",true):$("#insuredSex").find("option").eq(1).prop("selected",true);
                //年龄校验
                if (getAgeByBirthDay($("#insuredBirthday").val()) > 90 || getDayByBirthDay($("#insuredBirthday").val()) < 60) {
                    $("#insuredIdNo").parent().siblings(".errorMsg").css("display", "inline-block").text("被保险人年龄应在60天-90周岁！");
                    return;
                } else {
                	$("#insuredIdNo").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
                }
            } else {
                //身份证错误时清空生日和性别
                $(".insuredBirthdayReadonly").val("");
                $("#insuredBirthday").val("");
                $(".insuredSexReadonly").val("");
            }
        }
        //护照或其他证件校验
        else {
            $(".insuredBirthdayReadonly").val("");
            $(".insuredSexReadonly").val("");
            checkOtherId($(this));
        }
    });
   
    $("#occupation").change(function(){
		$("#occupation_dummy").val($("#occupation").find("option:selected").text());
	});
	
    //房屋信息校验
    $("#propertyAddress").on("blur", function () {
        checkAddress($(this));
    });
    
    $("#insBeginDate").on("change",function(){
    	if($("#insBeginDate").val()==null || $("#insBeginDate").val()==""){
       	 $("#insBeginDate").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("请选择起保日期！");
   	}else{
   		$("#insBeginDate").parent().parent().siblings(".errorMsg").text("").hide();
   	}
    });
    
    //自保件提示
    $(".forSelfUnsure").click(function(event) {
    	$(".forSelfMask").hide();
    });
    $(".forSelfSure").click(function(event) {
    	$(".forSelfMask").hide();
    	sendRequest(path +"/getSaveInfo",getData(),function (data) {
        	var obj = JSON.parse(data);
        	if(obj.code == 0){
        		var orderNo = obj.data.orderNo;
        		var returnPage = obj.data.returnPage;
        		window.location.href = path + returnPage + "?orderNo="+orderNo;
            }else{
            	$(".pop").show();
            	$(".mask").show();
            	$(".pop span").text(obj.msg);
            }
        },function(){});
    });
    $("#onelevel").change(function()
    	    {
    	        distwolevel("onelevel","twolevel","threelevel");

    	    })

    	    $("#onelevel02").change(function()
    	    {
    	        distwolevel("onelevel02","twolevel02","threelevel02");

    	    })

    	    $("#onelevel03").change(function()
    	    {
    	        distwolevel("onelevel03","twolevel03","threelevel03");

    	    })

    	    $("#onelevel04").change(function()
    	    {
    	        distwolevel("onelevel04","twolevel04","threelevel04");

    	    })

    	    $("#twolevel").change(function()
    	    {
    	        disthreelevel("twolevel","threelevel");
    	    })

    	    $("#twolevel02").change(function()
    	    {
    	        disthreelevel("twolevel02","threelevel02");
    	    })

    	    $("#twolevel03").change(function()
    	    {
    	        disthreelevel("twolevel03","threelevel03");
    	    })

    	    $("#twolevel04").change(function()
    	    {
    	        disthreelevel("twolevel04","threelevel04");
    	    })

    	    $("#threelevel").change(function()
    	    {
    	        $("#threelevel_dummy").val($("#threelevel").find("option:selected").text());
    	        $("#threelevel").parent().siblings(".errorMsg").css("display", "inline-block").text("");
    	    })

    	    $("#threelevel02").change(function()
    	    {
    	        $("#threelevel02_dummy").val($("#threelevel02").find("option:selected").text());
    	        $("#threelevel02").parent().siblings(".errorMsg").css("display", "inline-block").text("");
    	    })

    	    $("#threelevel03").change(function()
    	    {
    	        $("#threelevel03_dummy").val($("#threelevel03").find("option:selected").text());
    	        $("#threelevel03").parent().siblings(".errorMsg").css("display", "inline-block").text("");
    	    })

    	    $("#threelevel04").change(function()
    	    {
    	        $("#threelevel04_dummy").val($("#threelevel04").find("option:selected").text());
    	        $("#threelevel04").parent().siblings(".errorMsg").css("display", "inline-block").text("");
    	    });

    //发送数据
    $("#sureToSave").click(function() {
    	if(!checkAll()) return;
    	//自保件校验
    	var forSelfFlag = false;
    	if(!checkEmpty($("#memberIdCard").val())){
        	$(".idNo_compare").each(function(){
        		if(!forSelfFlag && $(this).val().trim() == $("#memberIdCard").val().trim()){
        			$(".forSelfMask").show();
        			forSelfFlag = true;
        		}
        	});
    	}
    	if(forSelfFlag) return;
    	//核保
	  	 sendRequest("../../life/anlian/newcontract_save.do",getData(),function (data) {
	       	console.log(data);
	       	var obj = JSON.parse(data);
	       	if(obj.code == 0){
	       		var orderNo = obj.orderNo;
	       		console.log(orderNo);
	       		window.location.href = "../../life/anlian/contractpay.do?orderNo="+orderNo+"&productNo="+$("#productNo").val();
	       		
	           }else{
	           	$(".pop").show();
	           	$(".mask").show();
	           	$(".pop span").text(obj.msg);
	           }
	       },function(){});
    	
    });
    //续期控制
    $(".premium").change(function(){
    	if($(this).data("type") == "FeeYear"){
    		if($(this).find("option:selected").val() == "0Y"){
        		$(".renewalSec").hide();
    		}else{
    			$(".renewalSec").show();
    		}
    	}
    });
    $(".premium").each(function(){
    	if($(this).data("type") == "FeeYear"){
    		if($(this).find("option:selected").val() == "0Y"){
        		$(".renewalSec").hide();
    		}else{
    			$(".renewalSec").show();
    		}
    	}
    });
    //授权弹窗
    $(".authorization").on("click", function () {
        $("html,body").css({"position":"fixed","top":"0","height":"100%"});
        $("#declareCover").fadeIn();
    });
    $("#declareCover .closeBtn").on("click", function () {
        $("html,body").css({"position":"relative","top":"0","height":"auto"});
        $("html body").scrollTop($("html body").height());
        $("#declareCover").fadeOut();
    });
    //进入页面清空开户行和开户所在第内容
    $("#bankArea").val("");
    $("#accountBank_dummy").val("");
    $("#cardNo").val("");
    $("#cardNoAgain").val("");
    $("#accountBank_dummy").attr("placeholder","请选择");
    $("#accountBank").find("option").each(function(){
    	if($(this).text()=="请选择"){
    		$(this).prop("selected",true);
    		$(this).siblings().prop("selected",false);
    	}
    });
    $(".autoRenewal").change(function(){
    	if($(this).val() == "N"){
    		$(this).addClass("personInfo");
    		$(this).siblings("input").removeClass("personInfo");
    		$(this).parent().parent().siblings().hide();
    		$(this).siblings("label").find("i").removeClass("renewalCheckBox");
    		$(this).prev().find("i").addClass("renewalCheckBox");
    		$(this).parent().siblings(".errorMsg").show();
    	}else{
    		$(this).addClass("personInfo");
    		$(this).siblings("input").removeClass("personInfo");
    		$(this).parent().parent().siblings().show();
    		$(this).siblings("label").find("i").removeClass("renewalCheckBox");
    		$(this).prev().find("i").addClass("renewalCheckBox");
    		$("html body").animate({"scrollTop":$("html body").height()+"px"},"swing");
    		$(this).parent().siblings(".errorMsg").hide();
    	}
    });
    $(".renewalIcon").click(function(){
    	$(this).parent().click();
    });
});

/***************************提交校验方法**************************/
function checkAll() {
    var flag = true;
    //投保额度校验
    if ($(".numInput").length>0) {
    	$(".numInput").each(function(){
        	if (!checkNum($(this))) {
        		flag = false;
        	}
    	});
    }
    
    if($("#insBeginDate").val()==null || $("#insBeginDate").val()==""){
    	 $("#insBeginDate").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("请选择起保日期！");
    	flag = false;
	}else{
		$("#insBeginDate").parent().parent().siblings(".errorMsg").text("").hide();
	}
//投保人信息
    //姓名校验
    if ($("#policyName").length>0) {
        if (!checkName($("#policyName"))) {
            flag = false;
        }
    }
    //证件号码校验
    if ($("#idNo").length>0) {
   	 if (!($("#cardType").find("option:selected").text() == "身份证" ? checkID($("#idNo")) : checkOtherId($("#idNo")))) {
            flag = false;
        }
       if (!($("#cardType").find("option:selected").text() == "身份证")) {
       	if (getAgeByBirthDay($("#birthday").val()) < 18) {
               //年龄判断
               $("#birthday").parent().siblings(".errorMsg").css("display", "inline-block").text("年龄必须满18周岁！");
               flag = false;
           } else {
               $("#birthday").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
           }
       } else if (getAgeByBirthDay($(".birthdayReadonly").val()) < 18) {
           //年龄判断
           $("#idNo").parent().siblings(".errorMsg").css("display", "inline-block").text("年龄必须满18周岁！");
           flag = false;
       } else if($("#idNo").val().trim()==""){
       	$("#idNo").parent().siblings(".errorMsg").css("display", "inline-block").text("请输入证件号！");
           flag = false;
       } else {
           $("#idNo").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
       }
   }
    //证件有效期
    if ($("#idDate").length>0) {
        if ($("#checkbox").hasClass("unCheckBox") && $("#idDate").val() == "") {
            $("#idDate").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("请输入有效期或选择长期！");
            flag = false;
        } else {
            $("#idDate").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
        }
    }
    //出生日期校验
    if ($("#birthday").length>0) {
        if (!($("#cardType").find("option:selected").text() == "身份证")) {
            if ($("#birthday").val() == "") {
                $("#birthday").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("请选择出生日期！");
                flag = false;
            } else if (getAgeByBirthDay($("#birthday").val()) < 18) {
                //年龄判断
                $("#birthday").parent().siblings(".errorMsg").css("display", "inline-block").text("年龄必须满18周岁！");
                flag = false;
            } else {
                $("#birthday").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
            }
        } else if ($("#idNo").val().trim() == "" || getAgeByBirthDay($(".birthdayReadonly").val()) < 18) {
            //年龄判断
            $("#idNo").parent().siblings(".errorMsg").css("display", "inline-block").text("年龄必须满18周岁！");
            flag = false;
        } else if($("#idNo").val().trim()==""){
        	$("#idNo").parent().siblings(".errorMsg").css("display", "inline-block").text("请输入证件号！");
            flag = false;
        }else {
            $("#idNo").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
        }
    }
    
    //手机号码校验
    if ($("#tel").length>0) {
    	if (!checkTel($("#tel"))) {
    		flag = false;
    	}
    }
    //电子邮箱校验
    if ($("#email").length>0) {
        if (!checkEmail($("#email"))) {
            flag = false;
        }
    }
    //通讯地址校验
    if ($("#appntArea").length>0) {
        if ($("#appntArea").val() == "") {
            $("#appntArea").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择通讯地址！");
            flag = false;
        } else {
            $("#appntArea").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
        }
    }
    //详细地址校验
    if ($("#address").length>0) {
        if (!checkAddress($("#address"))) {
            flag = false;
        }
    }
    //邮政编码校验
    if ($("#postalCode").length>0) {
        if (!checkPostalCode($("#postalCode"))) {
            flag = false;
        }
    }
    //被保人信息
    if ($("#switch").hasClass("turnOff")) {
    	if(!$(".yanzheng1").hasClass("hide")){
    		  if ($("#insuredName1").length>0) {
                  if (!checkName($("#insuredName1"))) {
                      flag = false;
                  }
              }
    		  
    		  //证件号码校验
              if ($("#insuredIdNo1").length>0) {
                  if (!($("#insuredCardType1").find("option:selected").text() == "身份证" ? checkID($("#insuredIdNo1")) : checkOtherId($("#insuredIdNo1")))) {
                      flag = false;
                  }
                  if (!($("#insuredCardType1").find("option:selected").text() == "身份证")) {
                 	if (getAgeByBirthDay($("#insuredBirthday11").val()) > 90 || getDayByBirthDay($("#insuredBirthday11").val()) < 60) {
                      //年龄判断
                 		$("#insuredBirthday11").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("被保人年龄不在允许范围！");
                 	 	return;
  	             }
                 }else if($("#insuredIdNo1").val().trim()==""){
                 	$("#insuredIdNo1").parent().siblings(".errorMsg").css("display", "inline-block").text("请输入证件号！");
                     flag = false;
                 } else {
                     $("#insuredIdNo1").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
                 }
                  
              }
              //生日校验
              if ($("#insuredBirthday11").length>0) {
                  if (!($("#insuredBirthday11").find("option:selected").text() == "身份证")) {
                      if ($("#insuredBirthday11").val() == "") {
                          $("#insuredBirthday11").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("请选择出生日期！");
                          flag = false;
                      } else {
                          $("#insuredBirthday11").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
                      }
                  }else if (($("#insuredCardType1").find("option:selected").text() == "身份证")) {
                  	if ($("#insuredIdNo1").val().trim() == "") {
                  		$("#insuredIdNo1").parent().siblings(".errorMsg").css("display", "inline-block").text("请输入证件号！");
                          flag = false;
                      } else {
                      	$("#insuredIdNo1").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
                      }
                  }
                  
              }
              //手机号校验
              if ($("#insuredMobile1").length>0) {
                  if (!checkTel($("#insuredMobile1"))) {
                      flag = false;
                  }
              }
              
              if ($("#insuredArea1").length>0) {
                  if ($("#insuredArea1").val() == "") {
                      $("#insuredArea1").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择通讯地址！");
                      flag = false;
                  } else {
                      $("#insuredArea1").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
                  }
              }
              
              if ($("#insuredAddress1").length>0) {
                  if (!checkAddress($("#insuredAddress1"))) {
                      flag = false;
                  }
              }
        }
    	
    	if(!$(".yanzheng2").hasClass("hide")){
    		 if ($("#insuredName2").length>0) {
                 if (!checkName($("#insuredName2"))) {
                     flag = false;
                 }
             }
    		//证件号码校验
             if ($("#insuredIdNo2").length>0) {
                 if (!($("#insuredCardType").find("option:selected").text() == "身份证" ? checkID($("#insuredIdNo2")) : checkOtherId($("#insuredIdNo")))) {
                     flag = false;
                 }
                 if (!($("#insuredCardType2").find("option:selected").text() == "身份证")) {
                	if (getAgeByBirthDay($("#insuredBirthday22").val()) > 90 || getDayByBirthDay($("#insuredBirthday22").val()) < 60) {
                     //年龄判断
                		$("#insuredBirthday22").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("被保人年龄不在允许范围！");
                	 	return;
 	             }
                } else if($("#insuredIdNo2").val().trim()==""){
                	$("#insuredIdNo2").parent().siblings(".errorMsg").css("display", "inline-block").text("请输入证件号！");
                    flag = false;
                } else {
                    $("#insuredIdNo2").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
                }
                 
             }
             //生日校验
             if ($("#insuredBirthday22").length>0) {
                 if (!($("#insuredCardType2").find("option:selected").text() == "身份证")) {
                     if ($("#insuredBirthday22").val() == "") {
                         $("#insuredBirthday22").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("请选择出生日期！");
                         flag = false;
                     } else {
                         $("#insuredBirthday22").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
                     }
                 }else if (($("#insuredCardType2").find("option:selected").text() == "身份证")) {
                 	if ($("#insuredIdNo2").val().trim() == "") {
                 		$("#insuredIdNo2").parent().siblings(".errorMsg").css("display", "inline-block").text("请输入证件号！");
                         flag = false;
                     } else {
                     	$("#insuredIdNo2").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
                     }
                 }
                 
             }
             if ($("#insuredMobile2").length>0) {
                 if (!checkTel($("#insuredMobile2"))) {
                     flag = false;
                 }
             }
             
             if ($("#insuredArea2").length>0) {
                 if ($("#insuredArea2").val() == "") {
                     $("#insuredArea2").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择通讯地址！");
                     flag = false;
                 } else {
                     $("#insuredArea2").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
                 }
             }
             
             if ($("#insuredAddress2").length>0) {
                 if (!checkAddress($("#insuredAddress2"))) {
                     flag = false;
                 }
             }
    	}
    	if(!$(".yanzheng3").hasClass("hide")){
    		 if ($("#insuredName3").length>0) {
                 if (!checkName($("#insuredName3"))) {
                     flag = false;
                 }
             }
    		//证件号码校验
             if ($("#insuredIdNo3").length>0) {
                 if (!($("#insuredCardType3").find("option:selected").text() == "身份证" ? checkID($("#insuredIdNo3")) : checkOtherId($("#insuredIdNo3")))) {
                     flag = false;
                 }
                 if (!($("#insuredCardType3").find("option:selected").text() == "身份证")) {
                	if (getAgeByBirthDay($("#insuredBirthday3").val()) > 90 || getDayByBirthDay($("#insuredBirthday3").val()) < 60) {
                     //年龄判断
                		$("#insuredBirthday3").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("被保人年龄不在允许范围！");
                	 	return;
 	             }
                }  else if($("#insuredIdNo3").val().trim()==""){
                	$("#insuredIdNo3").parent().siblings(".errorMsg").css("display", "inline-block").text("请输入证件号！");
                    flag = false;
                } else {
                    $("#insuredIdNo3").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
                }
                 
             }
             //生日校验
             if ($("#insuredBirthday3").length>0) {
                 if (!($("#insuredCardType3").find("option:selected").text() == "身份证")) {
                     if ($("#insuredBirthday3").val() == "") {
                         $("#insuredBirthday3").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("请选择出生日期！");
                         flag = false;
                     } else {
                         $("#insuredBirthday3").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
                     }
                 }else if (($("#insuredCardType3").find("option:selected").text() == "身份证")) {
                 	if ($("#insuredIdNo3").val().trim() == "") {
                 		$("#insuredIdNo3").parent().siblings(".errorMsg").css("display", "inline-block").text("请输入证件号！");
                         flag = false;
                     } else {
                     	$("#insuredIdNo3").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
                     }
                 }
             }
             
             if ($("#insuredMobile3").length>0) {
                 if (!checkTel($("#insuredMobile3"))) {
                     flag = false;
                 }
             }
             
             if ($("#insuredArea3").length>0) {
                 if ($("#insuredArea3").val() == "") {
                     $("#insuredArea3").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择通讯地址！");
                     flag = false;
                 } else {
                     $("#insuredArea3").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
                 }
             }
             
             if ($("#insuredAddress3").length>0) {
                 if (!checkAddress($("#insuredAddress3"))) {
                     flag = false;
                 }
             }

    	}
		if(!$(".yanzheng4").hasClass("hide")){
			if ($("#insuredName4").length>0) {
                if (!checkName($("#insuredName4"))) {
                    flag = false;
                }
            }
			 //证件号码校验
            if ($("#insuredIdNo4").length>0) {
                if (!($("#insuredCardType4").find("option:selected").text() == "身份证" ? checkID($("#insuredIdNo4")) : checkOtherId($("#insuredIdNo4")))) {
                    flag = false;
                }
                if (!($("#insuredCardType4").find("option:selected").text() == "身份证")) {
               	if (getAgeByBirthDay($("#insuredBirthday4").val()) > 90 || getDayByBirthDay($("#insuredBirthday4").val()) < 60) {
                    //年龄判断
               		$("#insuredBirthday4").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("被保人年龄不在允许范围！");
               	 	return;
	             }
               }  else if($("#insuredIdNo4").val().trim()==""){
               	$("#insuredIdNo4").parent().siblings(".errorMsg").css("display", "inline-block").text("请输入证件号！");
                   flag = false;
               } else {
                   $("#insuredIdNo4").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
               }
                
            }
            //生日校验
            if ($("#insuredBirthday4").length>0) {
                if (!($("#insuredCardType4").find("option:selected").text() == "身份证")) {
                    if ($("#insuredBirthday4").val() == "") {
                        $("#insuredBirthday4").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("请选择出生日期！");
                        flag = false;
                    } else {
                        $("#insuredBirthday4").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
                    }
                }else if (($("#insuredCardType4").find("option:selected").text() == "身份证")) {
                	if ($("#insuredIdNo4").val().trim() == "") {
                		$("#insuredIdNo4").parent().siblings(".errorMsg").css("display", "inline-block").text("请输入证件号！");
                        flag = false;
                    } else {
                    	$("#insuredIdNo4").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
                    }
                }
                
            }
            
            if ($("#insuredMobile4").length>0) {
                if (!checkTel($("#insuredMobile4"))) {
                    flag = false;
                }
            }
            
            if ($("#insuredArea4").length>0) {
                if ($("#insuredArea4").val() == "") {
                    $("#insuredArea4").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择通讯地址！");
                    flag = false;
                } else {
                    $("#insuredArea4").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
                }
            }
            
            if ($("#insuredAddress4").length>0) {
                if (!checkAddress($("#insuredAddress4"))) {
                    flag = false;
                }
            }
		}
		if(!$(".yanzheng5").hasClass("hide")){
			if ($("#insuredName5").length>0) {
                if (!checkName($("#insuredName5"))) {
                    flag = false;
                }
            }
			//证件号码校验
            if ($("#insuredIdNo5").length>0) {
                if (!($("#insuredCardType5").find("option:selected").text() == "身份证" ? checkID($("#insuredIdNo5")) : checkOtherId($("#insuredIdNo5")))) {
                    flag = false;
                }
                if (!($("#insuredCardType5").find("option:selected").text() == "身份证")) {
               	if (getAgeByBirthDay($("#insuredBirthday5").val()) > 90 || getDayByBirthDay($("#insuredBirthday5").val()) < 60) {
                    //年龄判断
               		$("#insuredBirthday5").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("被保人年龄不在允许范围！");
               	 	return;
	             }
               }else if($("#insuredIdNo5").val().trim()==""){
               	$("#insuredIdNo5").parent().siblings(".errorMsg").css("display", "inline-block").text("请输入证件号！");
                   flag = false;
               } else {
                   $("#insuredIdNo5").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
               }
            }
            //生日校验
            if ($("#insuredBirthday5").length>0) {
                if (!($("#insuredCardType5").find("option:selected").text() == "身份证")) {
                    if ($("#insuredBirthday5").val() == "") {
                        $("#insuredBirthday5").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("请选择出生日期！");
                        flag = false;
                    } else {
                        $("#insuredBirthday5").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
                    }
                }else if (($("#insuredCardType5").find("option:selected").text() == "身份证")) {
                	if ($("#insuredIdNo5").val().trim() == "") {
                		$("#insuredIdNo5").parent().siblings(".errorMsg").css("display", "inline-block").text("请输入证件号！");
                        flag = false;
                    } else {
                    	$("#insuredIdNo5").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
                    }
                }
            }
            
            if ($("#insuredMobile5").length>0) {
                if (!checkTel($("#insuredMobile5"))) {
                    flag = false;
                }
            }
            
            if ($("#insuredArea5").length>0) {
                if ($("#insuredArea5").val() == "") {
                    $("#insuredArea5").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择通讯地址！");
                    flag = false;
                } else {
                    $("#insuredArea5").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
                }
            }
            
            if ($("#insuredAddress5").length>0) {
                if (!checkAddress($("#insuredAddress5"))) {
                    flag = false;
                }
            }
		}
		if(!$(".yanzheng6").hasClass("hide")){
			if ($("#insuredName6").length>0) {
                if (!checkName($("#insuredName6"))) {
                    flag = false;
                }
            }
			 //证件号码校验
            if ($("#insuredIdNo6").length>0) {
                if (!($("#insuredCardType6").find("option:selected").text() == "身份证" ? checkID($("#insuredIdNo6")) : checkOtherId($("#insuredIdNo6")))) {
                    flag = false;
                }
                if (!($("#insuredCardType6").find("option:selected").text() == "身份证")) {
               	if (getAgeByBirthDay($("#insuredBirthday6").val()) > 90 || getDayByBirthDay($("#insuredBirthday6").val()) < 60) {
                    //年龄判断
               		$("#insuredBirthday6").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("被保人年龄不在允许范围！");
               	 	return;
	             }
               }  else if($("#insuredIdNo6").val().trim()==""){
               	$("#insuredIdNo6").parent().siblings(".errorMsg").css("display", "inline-block").text("请输入证件号！");
                   flag = false;
               } else {
                   $("#insuredIdNo6").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
               }
                
            }
            //生日校验
            if ($("#insuredBirthday6").length>0) {
                if (!($("#insuredCardType6").find("option:selected").text() == "身份证")) {
                    if ($("#insuredBirthday6").val() == "") {
                        $("#insuredBirthday6").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("请选择出生日期！");
                        flag = false;
                    } else {
                        $("#insuredBirthday6").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
                    }
                }else if (($("#insuredCardType6").find("option:selected").text() == "身份证")) {
                	if ($("#insuredIdNo6").val().trim() == "") {
                		$("#insuredIdNo6").parent().siblings(".errorMsg").css("display", "inline-block").text("请输入证件号！");
                        flag = false;
                    } else {
                    	$("#insuredIdNo6").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
                    }
                }
            }
            
            if ($("#insuredMobile6").length>0) {
                if (!checkTel($("#insuredMobile6"))) {
                    flag = false;
                }
            }
            
            if ($("#insuredArea6").length>0) {
                if ($("#insuredArea6").val() == "") {
                    $("#insuredArea6").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择通讯地址！");
                    flag = false;
                } else {
                    $("#insuredArea6").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
                }
            }
            
            if ($("#insuredAddress6").length>0) {
                if (!checkAddress($("#insuredAddress6"))) {
                    flag = false;
                }
            }
		}
		if(!$(".yanzheng7").hasClass("hide")){
			 if ($("#insuredName7").length>0) {
	                if (!checkName($("#insuredName7"))) {
	                    flag = false;
	                }
	            }
			 //证件号码校验
            if ($("#insuredIdNo7").length>0) {
                if (!($("#insuredCardType7").find("option:selected").text() == "身份证" ? checkID($("#insuredIdNo7")) : checkOtherId($("#insuredIdNo7")))) {
                    flag = false;
                }
                if (!($("#insuredCardType7").find("option:selected").text() == "身份证")) {
               	if (getAgeByBirthDay($("#insuredBirthday7").val()) > 90 || getDayByBirthDay($("#insuredBirthday7").val()) < 60) {
                    //年龄判断
               		$("#insuredBirthday7").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("被保人年龄不在允许范围！");
               	 	return;
	             }
               }  else if($("#insuredIdNo7").val().trim()==""){
               	$("#insuredIdNo7").parent().siblings(".errorMsg").css("display", "inline-block").text("请输入证件号！");
                   flag = false;
               } else {
                   $("#insuredIdNo7").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
               }
                
            }
            //生日校验
            if ($("#insuredBirthday7").length>0) {
                if (!($("#insuredCardType7").find("option:selected").text() == "身份证")) {
                    if ($("#insuredBirthday7").val() == "") {
                        $("#insuredBirthday7").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("请选择出生日期！");
                        flag = false;
                    } else {
                        $("#insuredBirthday7").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
                    }
                }else if (($("#insuredCardType7").find("option:selected").text() == "身份证")) {
                	if ($("#insuredIdNo7").val().trim() == "") {
                		$("#insuredIdNo7").parent().siblings(".errorMsg").css("display", "inline-block").text("请输入证件号！");
                        flag = false;
                    } else {
                    	$("#insuredIdNo7").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
                    }
                }
            }
            
            if ($("#insuredMobile7").length>0) {
                if (!checkTel($("#insuredMobile7"))) {
                    flag = false;
                }
            }
            
            if ($("#insuredArea7").length>0) {
                if ($("#insuredArea7").val() == "") {
                    $("#insuredArea7").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择通讯地址！");
                    flag = false;
                } else {
                    $("#insuredArea7").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
                }
            }
            
            if ($("#insuredAddress7").length>0) {
                if (!checkAddress($("#insuredAddress7"))) {
                    flag = false;
                }
            }
		}
		if(!$(".yanzheng8").hasClass("hide")){
			 if ($("#insuredName8").length>0) {
	                if (!checkName($("#insuredName8"))) {
	                    flag = false;
	                }
	            }
			//证件号码校验
            if ($("#insuredIdNo8").length>0) {
                if (!($("#insuredCardType8").find("option:selected").text() == "身份证" ? checkID($("#insuredIdNo8")) : checkOtherId($("#insuredIdNo8")))) {
                    flag = false;
                }
                if (!($("#insuredCardType8").find("option:selected").text() == "身份证")) {
               	if (getAgeByBirthDay($("#insuredBirthday8").val()) > 90 || getDayByBirthDay($("#insuredBirthday8").val()) < 60) {
                    //年龄判断
               		$("#insuredBirthday8").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("被保人年龄不在允许范围！");
               	 	return;
	             }
               } else if($("#insuredIdNo8").val().trim()==""){
               	$("#insuredIdNo8").parent().siblings(".errorMsg").css("display", "inline-block").text("请输入证件号！");
                   flag = false;
               } else {
                   $("#insuredIdNo8").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
               }
                
            }
            //生日校验
            if ($("#insuredBirthday8").length>0) {
                if (!($("#insuredCardType8").find("option:selected").text() == "身份证")) {
                    if ($("#insuredBirthday8").val() == "") {
                        $("#insuredBirthday8").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("请选择出生日期！");
                        flag = false;
                    } else {
                        $("#insuredBirthday8").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
                    }
                }else if (($("#insuredCardType8").find("option:selected").text() == "身份证")) {
                	if ($("#insuredIdNo8").val().trim() == "") {
                		$("#insuredIdNo8").parent().siblings(".errorMsg").css("display", "inline-block").text("请输入证件号！");
                        flag = false;
                    } else {
                    	$("#insuredIdNo8").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
                    }
                }
            }
            
            if ($("#insuredMobile8").length>0) {
                if (!checkTel($("#insuredMobile8"))) {
                    flag = false;
                }
            }
            
            if ($("#insuredArea8").length>0) {
                if ($("#insuredArea8").val() == "") {
                    $("#insuredArea8").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择通讯地址！");
                    flag = false;
                } else {
                    $("#insuredArea8").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
                }
            }
            
            if ($("#insuredAddress8").length>0) {
                if (!checkAddress($("#insuredAddress8"))) {
                    flag = false;
                }
            }

		}
		if(!$(".yanzheng9").hasClass("hide")){
			 if ($("#insuredName9").length>0) {
	                if (!checkName($("#insuredName9"))) {
	                    flag = false;
	                }
	            }
			//证件号码校验
            if ($("#insuredIdNo9").length>0) {
                if (!($("#insuredCardType9").find("option:selected").text() == "身份证" ? checkID($("#insuredIdNo9")) : checkOtherId($("#insuredIdNo9")))) {
                    flag = false;
                }
                if (!($("#insuredCardType9").find("option:selected").text() == "身份证")) {
               	if (getAgeByBirthDay($("#insuredBirthday9").val()) > 90 || getDayByBirthDay($("#insuredBirthday9").val()) < 60) {
                    //年龄判断
               		$("#insuredBirthday9").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("被保人年龄不在允许范围！");
               	 	return;
	             }
               } else if($("#insuredIdNo9").val().trim()==""){
               	$("#insuredIdNo9").parent().siblings(".errorMsg").css("display", "inline-block").text("请输入证件号！");
                   flag = false;
               } else {
                   $("#insuredIdNo9").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
               }
                
            }
            //生日校验
            if ($("#insuredBirthday9").length>0) {
                if (!($("#insuredCardType9").find("option:selected").text() == "身份证")) {
                    if ($("#insuredBirthday9").val() == "") {
                        $("#insuredBirthday9").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("请选择出生日期！");
                        flag = false;
                    } else {
                        $("#insuredBirthday9").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
                    }
                }else if (($("#insuredCardType9").find("option:selected").text() == "身份证")) {
                	if ($("#insuredIdNo9").val().trim() == "") {
                		$("#insuredIdNo9").parent().siblings(".errorMsg").css("display", "inline-block").text("请输入证件号！");
                        flag = false;
                    } else {
                    	$("#insuredIdNo9").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
                    }
                }
            }
            
            if ($("#insuredMobile9").length>0) {
                if (!checkTel($("#insuredMobile9"))) {
                    flag = false;
                }
            }
            
            if ($("#insuredArea9").length>0) {
                if ($("#insuredArea9").val() == "") {
                    $("#insuredArea9").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择通讯地址！");
                    flag = false;
                } else {
                    $("#insuredArea9").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
                }
            }
            
            if ($("#insuredAddress9").length>0) {
                if (!checkAddress($("#insuredAddress9"))) {
                    flag = false;
                }
            }
		}
		
        if ($("#relation").find("option:selected").text() != "本人") {
            //姓名校验
            if ($("#insuredName").length>0) {
                if (!checkName($("#insuredName"))) {
                    flag = false;
                }
            }
            //关系校验
            if ($("#relation").length>0) {
                if ($("#relation").find("option:selected").text() == "请选择") {
                    $("#relation").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择投被保人关系！");
                    flag = false;
                } else {
                    $("#relation").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
                }
            }
            //证件号码校验
            if ($("#insuredIdNo").length>0) {
                if (!($("#insuredCardType").find("option:selected").text() == "身份证" ? checkID($("#insuredIdNo")) : checkOtherId($("#insuredIdNo")))) {
                    flag = false;
                }
                if (!($("#insuredCardType").find("option:selected").text() == "身份证")) {
               	if (getAgeByBirthDay($("#insuredBirthday").val()) > 90 || getDayByBirthDay($("#insuredBirthday").val()) < 60) {
                    //年龄判断
               		$("#insuredBirthday").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("被保人年龄不在允许范围！");
               	 	return;
	             }
               } else if($("#insuredIdNo").val().trim()==""){
               	$("#insuredIdNo").parent().siblings(".errorMsg").css("display", "inline-block").text("请输入证件号！");
                   flag = false;
               } else {
                   $("#insuredIdNo").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
               }
            }
            //出生日期校验
            if ($("#insuredBirthday").length>0) {
                if (!($("#insuredCardType").find("option:selected").text() == "身份证")) {
                    if ($("#insuredBirthday").val() == "") {
                        $("#insuredBirthday").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("请选择出生日期！");
                        flag = false;
                    } else {
                        $("#insuredBirthday").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
                    }
                }else if (($("#insuredCardType").find("option:selected").text() == "身份证")) {
                	if ($("#insuredIdNo").val().trim() == "") {
                		$("#insuredIdNo").parent().siblings(".errorMsg").css("display", "inline-block").text("请输入证件号！");
                        flag = false;
                    } else {
                    	$("#insuredIdNo").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
                    }
                }
            }
            //手机号码校验
            if ($("#insuredMobile").length>0) {
                if (!checkTel($("#insuredMobile"))) {
                    flag = false;
                }
            }
            //通讯地址校验
            if ($("#insuredArea").length>0) {
                if ($("#insuredArea").val() == "") {
                    $("#insuredArea").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择通讯地址！");
                    flag = false;
                } else {
                    $("#insuredArea").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
                }
            }
            //详细地址校验
            if ($("#insuredAddress").length>0) {
                if (!checkAddress($("#insuredAddress"))) {
                    flag = false;
                }
            }
            
        }
    }
    //通讯地址校验
    if ($("#scrollTop>div>dl #insuredArea").length>0) {
        if ($("#scrollTop>div>dl #insuredArea").val() == "") {
            $("#scrollTop>div>dl #insuredArea").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择通讯地址！");
            flag = false;
        } else {
            $("#scrollTop>div>dl #insuredArea").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
        }
    }
    //详细地址校验
    if ($("#scrollTop>div>dl #insuredAddress").length>0) {
        if (!checkAddress($("#scrollTop>div>dl #insuredAddress"))) {
            flag = false;
        }
    }
    //手机号码校验
    if ($("#scrollTop>div>dl #insuredMobile").length>0) {
        if (!checkPostalCode($("#scrollTop>div>dl #insuredMobile"))) {
            flag = false;
        }
    }
    //社保情况校验
    if ($("#insuredSocialSecurity").length>0) {
        if ($("#insuredSocialSecurity").find("option:selected").text() == "请选择") {
            $("#insuredSocialSecurity").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择开户行！");
            flag = false;
        } else {
            $("#insuredSocialSecurity").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
        }
    }
    //房屋信息
    //坐落地址校验
    if ($("#propertyArea").length>0) {
        if ($("#propertyArea").val() == "") {
            $("#propertyArea").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择通讯地址！");
            flag = false;
        } else {
            $("#propertyArea").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
        }
    }
    //详细地址校验
    if ($("#propertyAddress").length>0) {
        if (!checkAddress($("#propertyAddress"))) {
            flag = false;
        }
    }
    //续缴账户信息
    if($(".PaymentDeadline").length>0){
    	if($(".PaymentDeadline").find("option:selected").val() != "0Y"){
    		checkBank();
    	}
    }
    //是否续保
    if($(".checkRenewal").length>0){
    	if($('input:radio[name="renewalBank.isRenewed"]').length>0){
        	if($('input:radio[name="renewalBank.isRenewed"]:checked').val() == "Y" && $(".PaymentDeadline").find("option:selected").val() != "0Y"){
        		checkBank();
        	}
    	}else{
    		if($(".PaymentDeadline").find("option:selected").val() != "0Y"){
        		checkBank();
        	}
    	}
    }
    //银行校验
    function checkBank(){}
    //勾选阅读校验
    if ($("#whetherCheck").length>0) {
	    if (!$("#whetherCheck").hasClass("checkBox")) {
	        $(".pop").show().find("span").text("请阅读并同意相关条款");
	        $(".mask").show();
	        flag = false;
	    }
    }
    
    if(flag){//新加
    	if(!$("#switch").hasClass("turnOff")){
    		flag = checkAgeAgain(flag);
    	}else if( $("#relation").find("option:selected").val() == "00"){
    		flag = checkAgeAgain(flag);
    	}
    }
    
    if (!flag) return;
    
    var birth = "";
    if($("#switch").hasClass("turnOn")){
    	if($("#cardType").find("option:selected").text() == "身份证"){
    		birth = $('.birthdayReadonly').val();
    	}else{
    		birth = $('#birthday').val();
    	}
    }else{
    	if($("#relation").find("option:selected").text() == "本人"){
    		birth = $('#insuredBirthday2').val();
    	}else{
    		if($("#insuredCardType").find("option:selected").text() == "身份证"){
    			birth = $('#insuredBirthday1').val();
    		}else{
    			birth = $('#insuredBirthday').val();
    		}
    	}
    }
    var amntage = getAgeByBirthDay(birth);
    var amntageDays=getDayByBirthDay(birth);
   
    return true;
}

function getAges(){
	var birth = "";
    if($("#switch").hasClass("turnOn")){
    	if($("#cardType").find("option:selected").text() == "身份证"){
    		birth = $('.birthdayReadonly').val();
    	}else{
    		birth = $('#birthday').val();
    	}
    }else{
    	if($("#relation").find("option:selected").text() == "本人"){
    		birth = $('#insuredBirthday2').val();
    	}else{
    		if($("#insuredCardType").find("option:selected").text() == "身份证"){
    			birth = $('#insuredBirthday1').val();
    		}else{
    			birth = $('#insuredBirthday').val();
    		}
    	}
    }
   return getAgeByBirthDay(birth);
}

//根据生日获取年龄
function getAgeByBirthDay(birth){
    var returnAge = "";
    var aDate = new Date();
    var nowYear = aDate.getFullYear();
    var nowMonth = (aDate.getMonth()+1) < 10 ? '0'+(aDate.getMonth()+1) : (aDate.getMonth()+1);
    var nowDay = (aDate.getDate()) < 10 ? '0'+aDate.getDate() : aDate.getDate();

    var birthYear = birth.split("-")[0];
    var birthMonth = birth.split("-")[1];
    var birthDay = birth.split("-")[2];
    if(nowYear == birthYear){
        returnAge = 0;// 同年 则为0岁
    } else {
        var ageDiff = nowYear - birthYear ; // 年之差
        if (ageDiff > 0){
            if (nowMonth == birthMonth){
                var dayDiff = nowDay - birthDay;// 日之差
                if (dayDiff < 0) {
                    returnAge = ageDiff - 1;
                } else {
                    returnAge = ageDiff ;
                }
            } else {
                var monthDiff = nowMonth - birthMonth;// 月之差
                if (monthDiff < 0) {
                    returnAge = ageDiff - 1;
                } else {
                    returnAge = ageDiff ;
                }
            }
        }
    }
    return returnAge;
}

function checkAgeAgain(flag){//新加
	//年龄判断
    if (!($("#cardType").find("option:selected").text() == "身份证")) {
    	if (getAgeByBirthDay($("#birthday").val()) > 90) {
            $("#idNo").parent().siblings(".errorMsg").css("display", "inline-block").text("被保人年龄不能超过90岁！");
            flag = false;
        } else {
            $("#idNo").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
        }
    } else if (getAgeByBirthDay($(".birthdayReadonly").val()) > 90) {
        $("#idNo").parent().siblings(".errorMsg").css("display", "inline-block").text("被保人年龄不能超过90岁！");
        flag = false;
    } else {
        $("#idNo").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
    }
    
    return flag;
}


//拼接传到后台的信息
function getData(){
	
	var data = 
	{
		"insurePrice":$("#mainPrice").val(), //总保费
		"amnt":$("#amnt").val(),
		"sex":$("#sex").val(),
		"appntArea":$("#appntArea").val(),
		"insuredArea":$("#insuredArea").val(),
		"productNo":$("#productNo").val(),
		"insEndDate":$("#insEndDate").val(),
		"ages":getAges(),
		"ages1":getAgeByBirthDay($('#insuredBirthday11').val()),
		"ages2":getAgeByBirthDay($('#insuredBirthday22').val()),
		"ages3":getAgeByBirthDay($('#insuredBirthday3').val()),
		"ages4":getAgeByBirthDay($('#insuredBirthday4').val()),
		"ages5":getAgeByBirthDay($('#insuredBirthday5').val()),
		"ages6":getAgeByBirthDay($('#insuredBirthday6').val()),
		"ages7":getAgeByBirthDay($('#insuredBirthday7').val()),
		"ages8":getAgeByBirthDay($('#insuredBirthday8').val()),
		"ages9":getAgeByBirthDay($('#insuredBirthday9').val()),
		"insuDay":$("#insuDay").val()
	};
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
    
    var allData = $.extend(data, oObj);
    
    console.log(allData);
    
    return allData;
}

//ajax
function sendRequest(url, data, success, error) {
    $.ajax({
        url: url,
        type: "post",
        async: true,
        data: data ? data : {},
        beforeSend:function(){
           $(".loading").show();  //先注释
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
//计算价格ajax
function sendPriceRequest(url, data, success, error) {
    $.ajax({
        url: url,
        type: "post",
        async: true,
        data: data ? data : {},
        beforeSend:function(){
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
        }
    });
}

//计算保费
function calPrice(){
	/*
	 * 各种校验，校验通过了，才进行保费计算
	 */
	if($("#amnt").val()==null||$("#amnt").val()==""){
		return;
	}
	if($("#insuDay").find("option:selected").val()==null ||$("#insuDay").find("option:selected").val()==""){
		return;
	}
	
	/*if($("#insBeginDate").val()==null || $("#insBeginDate").val()==""){
	   	 return;
	}*/
	
	sendPriceRequest("../../life/anlian/getprice02.do",{"amnt":$("#amnt").val(),"insuDay":$("#insuDay").find("option:selected").val(),
		"productNo":$("#productNo").val()},function (data){
    	var obj = JSON.parse(data);
    	console.log(obj);
    	if(obj.code == 0){
    		if(num ==0){
    			console.log(num);
        		$("#mainPrice").val(obj.insurePrice); 
        		$("#insurePrice").html(Number(obj.insurePrice).toFixed(2));
    		}else{
    			console.log(num);
    			$("#mainPrice").val(obj.insurePrice*(num+1)); 
    			$("#insurePrice").html(Number(obj.insurePrice*(num+1)).toFixed(2));
    		}
    		$(".backBg").hide();
    	}else{
    		$(".backBg").hide();
    	}
    	
    },function(){});
	
}
//选择投保人身份证时自动获取生日和性别
function changeCardType(cardVal) {
    var cardType = $("#cardType").find("option:selected").text();
    if (cardType == "身份证") {
        $(".birthday").hide();
        $(".birthdayReadonly").show();
        $(".sex").hide();
        $(".sexReadonly").show();
    } else {
        $(".birthday").show().css("display", "inline-block");
        $(".birthdayReadonly").hide();
        $(".sex").show().css("display", "inline-block");
        $(".sexReadonly").hide();
    }
}
//选择被保人身份证时自动获取生日和性别
function changeInsuredCardType(cardVal) {
    var cardType = $("#insuredCardType").find("option:selected").text();
    if (cardType == "身份证") {
        $(".insuredBirthday").hide();
        $(".insuredBirthdayReadonly").show();
        $(".insuredSex").hide();
        $(".insuredSexReadonly").show();
    } else {
        $(".insuredBirthday").show().css("display", "inline-block");
        $(".insuredBirthdayReadonly").hide();
        $(".insuredSex").show().css("display", "inline-block");
        $(".insuredSexReadonly").hide();
    }
}

//地区三级联动
function getArea(id){
    //ajax请求 默认发同步请求
    sendAreaRequest = function (url, data, success, error) {
        $.ajax({
            url: url,
            type: "post",
            async: false,//发送同步请求
            data: data ? data : {},
            success: function (data) {
                if (success) {
                    success(data);
                }
            },
            error: function (data) {
                if (error) {
                    error(data);
                }
            }
        });
    };
    //初始获取省数据
    var iosProvinces = provinces;
    //这个对象处理关于市的读取
    this.citysObject = {
        selectedOneLevelId: {},
        iosCitys: [],
        refreshCitys: function (oneLevelId) {
            var _this = this;
            if (!(this.selectedOneLevelId[oneLevelId])) {
                this.selectedOneLevelId[oneLevelId] = true;
                //通过省id请求市
                sendAreaRequest("../../life/common/getPlace.do", {
                    productNo : $("#productNo").val(),
                    parentId : oneLevelId,
                    placeType: 'city'
                }, function (successData) {
                	
                	//console.log(successData);
                	
                    var data =  JSON.parse(successData).data;
                    
                    for (var i = 0; i < data.length; i++) {
                        _this.iosCitys.push({
                            id: data[i].id,
                            value: data[i].codeName,
                            parentId:data[i].parentId,
                            codeValue:data[i].codeValue
                        });
                    }
                }, function (errorData) {});
            }
        }
    };
    //这个对象处理关于区的读取
    this.countysObject = {
        selectedTwoLevelId: {},
        iosCountys: [],
        refreshCountys: function (oneLevelId, twoLevelId) {
            var _this = this;
            if (!(this.selectedTwoLevelId[twoLevelId])) {
                this.selectedTwoLevelId[twoLevelId] = true;
                //通过市id请求区
                sendAreaRequest("../../life/common/getPlace.do", {
                    productNo : $("#productNo").val(),
                    parentId : twoLevelId,
                    placeType: 'country'
                }, function (successData) {
                	//console.log(successData);
                    var data =  JSON.parse(successData).data;
                    for (var i = 0; i < data.length; i++) {
                        _this.iosCountys.push({
                            id: data[i].id,
                            value: data[i].codeName,
                            parentId:data[i].parentId,
                            codeValue:data[i].codeValue
                        });
                    }
                }, function (errorData){});
            }
        }
    };
    var that = this;
    $("#"+id).on("click", function () {
        var oneLevelId = $("#newCar_price_lable").attr('data-province-code');
        var twoLevelId = $("#newCar_price_lable").attr('data-city-code');
        var threeLevelId = $("#newCar_price_lable").attr('data-district-code');
        var $this=$(this);
        if ($this.siblings("input")[0].value == 2){
            var iosSelect = new IosSelect(2,
                [iosProvinces, that.citysObject.iosCitys],
                {
                    itemHeight: 36,itemShowCount: 5,
                    oneTwoRelation: 1,//第一列和第二列是否通过parentId关联
                    oneLevelId: oneLevelId,//默认选中的第一列是哪个ID
                    twoLevelId: twoLevelId, //默认选中的第二列是哪个ID
                    callback: function (selectOneObj, selectTwoObj, selectThreeObj) {
                        //先配置选择好的省市区Id,下次打开的时候默认选中之前选中好的省市区
                        $("#newCar_price_lable").attr('data-province-code', selectOneObj.id);
                        $("#newCar_price_lable").attr('data-city-code', selectTwoObj.id);
                        //把 “请选择行驶区域” 改为选好的省市区
                        $("#"+id).val(selectOneObj.value + ' ' + selectTwoObj.value);
                        $this.siblings("input")[1].value = selectOneObj.codevalue;
                        $this.siblings("input")[2].value = selectTwoObj.codevalue;
                        $("#insuredArea").siblings(".mySelf").val($("#appntArea").val());
                    }
                });
        }else{
            var iosSelect = new IosSelect(3,
                [iosProvinces, that.citysObject.iosCitys, that.countysObject.iosCountys],
                {
                    itemHeight: 36,itemShowCount: 5,
                    oneTwoRelation: 1,//第一列和第二列是否通过parentId关联
                    twoThreeRelation: 1,//第二列和第三列是否通过parentId关联
                    oneLevelId: oneLevelId,//默认选中的第一列是哪个ID
                    twoLevelId: twoLevelId, //默认选中的第二列是哪个ID
                    threeLevelId: threeLevelId,
                    callback: function (selectOneObj, selectTwoObj, selectThreeObj) {
                        //先配置选择好的省市区Id,下次打开的时候默认选中之前选中好的省市区
                        $("#newCar_price_lable").attr('data-province-code', selectOneObj.id);
                        $("#newCar_price_lable").attr('data-city-code', selectTwoObj.id);
                        $("#newCar_price_lable").attr('data-district-code', selectThreeObj.id);
                        //把 “请选择行驶区域” 改为选好的省市区
                        $("#"+id).val(selectOneObj.value + ' ' + selectTwoObj.value + ' ' + selectThreeObj.value);
                        $this.siblings("input")[1].value = selectOneObj.codevalue;
                        $this.siblings("input")[2].value = selectTwoObj.codevalue;
                        $this.siblings("input")[3].value = selectThreeObj.codevalue;
                        $("#insuredArea").siblings(".mySelf").val($("#appntArea").val());
                    }
                });
        }
        $(".iosselect-box").on("touchmove",function(e){ 
            e.preventDefault();  
        });
    });
}
//省市联动   
function getCity(id){}
//银行地区
function getBankArea(id,bankCode){}
function getSubBank(url,data,success,error){
	$.ajax({
        url: url,
        type: "post",
        async: false,//发送同步请求
        data: data ? data : {},
        success: function (data) {
            if (success) {
                success(data);
            }
        },
        error: function (data) {
            if (error) {
                error(data);
            }
        }
    });
}
//计算对象长度
function getPropertyCount(o){  
   var n, count = 0;  
   for(n in o){  
      if(o.hasOwnProperty(n)){  
         count++;  
      }  
   }  
   return count;  
}
function distwolevel(onelevel,twolevel,threelevel)
{
    sendRequest("../../life/xintai/get_twolevel.do",{"onelevel":$("#"+onelevel+"").find("option:selected").val()},function (data)
    {
        console.log(data);
        var obj = JSON.parse(data);
        if(obj.code == 0)
        {
            $("#"+twolevel+"").html('');

            $("#"+threelevel+"").html('')
            $("#"+threelevel+"").val('');
            $("#"+threelevel+"_dummy").val($("#"+threelevel+"").find("option:selected").text());

            for(var i=0;i<obj.twoList.length;i++)
            {
                $("#"+twolevel+"").append("<option value='"+obj.twoList[i]+"'>"+obj.twoList[i]+"</option>");
            }

            $("#"+twolevel+"").val(obj.twoList[0]);
            $("#"+twolevel+"_dummy").val($("#"+twolevel+"").find("option:selected").text());
        }
        else
        {
            $(".pop").show();
            $(".mask").show();
            $(".pop span").text("网络出错！");
        }
    },function(){});
}

function disthreelevel(twolevel,threelevel)
{
    $("#"+twolevel+"_dummy").val($("#"+twolevel+"").find("option:selected").text());

    sendRequest("../../life/xintai/get_threelevel.do",{"twolevel":$("#"+twolevel+"").find("option:selected").val()},function (data)
    {
        console.log(data);
        var obj = JSON.parse(data);
        if(obj.code == 0)
        {
            $("#"+threelevel+"").html('');

            for(var i=0;i<obj.threeList.length;i++)
            {
                $("#"+threelevel+"").append("<option value='"+obj.threeList[i].jobcode+"'>"+obj.threeList[i].jobname+"</option>");
            }

            $("#"+threelevel+"").val(obj.threeList[0].jobcode);
            $("#"+threelevel+"_dummy").val($("#"+threelevel+"").find("option:selected").text());

            $("#"+threelevel+"").parent().siblings(".errorMsg").css("display", "inline-block").text("");
        }
        else
        {
            $(".pop").show();
            $(".mask").show();
            $(".pop span").text("网络出错！");
        }
    },function(){});
}

//checkbox选择去掉input盒子下面的边框
$(function(){
	$('#switch').on('click',function(){
		$(this).hasClass('turnOn')?$(this).parents('.dlSec').addClass('bottom-0'):$(this).parents('.dlSec').removeClass('bottom-0')
	})
});

//checkbox选择去掉input盒子下面的边框-end