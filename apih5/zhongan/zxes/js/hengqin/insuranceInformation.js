function amntBlur(element) {
		var amnt = $.trim(element.value);
		var amntTemp = "";
		var flag = true;
		// 先校验是不是100的整数倍
		if(amnt=="")
    	{
    		$(".pop").show();
        	$(".mask").show();
        	$(".pop span").text("尊敬的客户，请填写保费。");
        	return;
    	}
		
		if(amnt>=1000 && amnt%1000 ==0){
			amntTemp = amnt;
		}else{
			element.value = "";
			flag = false;
			$(".pop").show();
        	$(".mask").show();
        	$(".pop span").text("尊敬的客户，本产品的保费必须大于3000,投保金额必须是1000的整数倍。");
		}
		
		/*
		if("1000Y"==$("#payendyear").val()){
			
			if(amnt>=3000 && amnt%1000 ==0){
				amntTemp = amnt;
			}else{
				element.value = "";
				flag = false;
				$(".pop").show();
	        	$(".mask").show();
	        	$(".pop span").text("尊敬的客户，本产品的保费必须大于3000,投保金额必须是1000的整数倍。");
			}
		}else{
			if(/^[1-9]\d*000$/.test(amnt)){
				amntTemp = amnt;
			}else{
				element.value = "";
				flag = false;
				$(".pop").show();
				$(".mask").show();
				$(".pop span").text("尊敬的客户，本产品的保费必须大于1000,投保金额必须是1000的整数倍。");
			}
		}
		*/
		if(flag){
			console.log(Number(amntTemp).toFixed(2))
			$("#insurePrice").val(Number(amntTemp).toFixed(2)+' 元');
			$("#mainPrice").val(Number(amntTemp).toFixed(2)+' 元');
		}else{
			$("#insurePrice").text("0");
		}
		
	}
function yJamntBlur(element) {
	var amnt = $.trim(element.value);
	var amntTemp = "";
	var flag = true;
	if(amnt=="")
	{
		$(".pop").show();
    	$(".mask").show();
    	$(".pop span").text("尊敬的客户，请填写保费。");
    	return;
	}
	/*
	if(/^[1-9]\d*0$/.test(amnt)){
		
		if(parseInt(amnt) <= 1990){
			amntTemp = amnt;
		}else{
			element.value = "";
			flag = false;
			$(".pop").show();
        	$(".mask").show();
        	$(".pop span").text("尊敬的客户，您的购买保费超过最高购买上限，请重新输入!");
		}
	}else{
		element.value = "";
		flag = false;
		$(".pop").show();
    	$(".mask").show();
    	$(".pop span").text("尊敬的客户，本产品的保费必须大于10,投保金额必须是10的整数倍。");
	}
	*/
	if(flag){
		$("#insurePrice").text(amntTemp);
		$("#mainPrice").text(amntTemp);
	}else{
		$("#insurePrice").text("0");
	}
	
}
function ykbamntBlur(element) {
	
	var amnt = $.trim(element.value);
	var amntTemp = "";
	var flag = true;
		if(amnt=="")
		{
			$(".pop").show();
	    	$(".mask").show();
	    	$(".pop span").text("尊敬的客户，请填写保额。");
	    	return;
		}
	
		if( amnt>=50000 && amnt%10000 ==0){
			amntTemp = amnt;
		}else{
			element.value = "";
			flag = false;
			$(".pop").show();
			$(".mask").show();
			$(".pop span").text("尊敬的客户，本产品的保费必须大于50000,投保金额必须是10000的整数倍。");
		}
		if(flag){
			$("#insurePrice").text(amntTemp);
			$("#mainPrice").text(amntTemp);
		}else{
			$("#insurePrice").text("0");
		}
	
}
//上传图片
function setImg01(obj){//用于进行图片上传，返回地址
    var f=$(obj).val();
    if(f == null || f ==undefined || f == ''){
        return false;
    }
    if(!/\.(?:png|jpg|jpeg|bmp|gif|PNG|JPG|BMP|GIF)$/.test(f))
    {
        alert("类型必须是图片(.png|jpg|jpeg|bmp|gif|PNG|JPG|BMP|GIF)");
        $(obj).val('');
        return false;
    }
    var data = new FormData();
    $.each($(obj)[0].files,function(i,file){
        data.append('file', file);
    });
    data.append('ztype','01');
    $.ajax({
        type: "POST",
        url: "../../life/hq/nc_hq_uploadFile02.do",
        data: data,
        beforeSend:function(){
        	$(".loading").show();
        },
        complete:function(){
        	$(".loading").hide();
        },
        cache: false,
        contentType: false,    //不可缺
        processData: false,    //不可缺
        dataType:"json",
        success: function(suc) {
        	var jsondata = $.parseJSON(suc);
            if(jsondata.code==0){
                    $("#thumbUrl01").val(jsondata.url);//将地址存储好
                    $("#fileno01").val(jsondata.fileno);
                    $("#thumburlShow01").attr("src",jsondata.message);//显示图片
                    console.log(jsondata.message)
                }else{
                	$("#url").val("");
                	$(obj).val('');
                	$(".pop").show();
                	$(".mask").show();
                	$(".pop span").text("上传失败");
            }
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
        	$(".pop").show();
        	$(".mask").show();
        	$(".pop span").text("上传失败");
            $("#url").val("");
            $(obj).val('');
        }
    });
}

//上传图片
function setImg02(obj){//用于进行图片上传，返回地址
    var f=$(obj).val();
    if(f == null || f ==undefined || f == ''){
        return false;
    }
    if(!/\.(?:png|jpg|jpeg|bmp|gif|PNG|JPG|BMP|GIF)$/.test(f))
    {
        alert("类型必须是图片(.png|jpg|jpeg|bmp|gif|PNG|JPG|BMP|GIF)");
        $(obj).val('');
        return false;
    }
    var data = new FormData();
    $.each($(obj)[0].files,function(i,file){
        data.append('file', file);
    });
    data.append('ztype','02');
    $.ajax({
        type: "POST",
        url: "../../life/hq/nc_hq_uploadFile02.do",
        data: data,
        beforeSend:function(){
        	$(".loading").show();
        },
        complete:function(){
        	$(".loading").hide();
        },
        cache: false,
        contentType: false,    //不可缺
        processData: false,    //不可缺
        dataType:"json",
        success: function(suc) {
        	var jsondata = $.parseJSON(suc);
            if(jsondata.code==0){
                    $("#thumbUrl02").val(jsondata.url);//将地址存储好
                    $("#fileno02").val(jsondata.fileno);
                    $("#thumburlShow02").attr("src",jsondata.message);//显示图片     
                    console.log(jsondata.message)
                }else{
                	$(".pop").show();
                	$(".mask").show();
                	$(".pop span").text("上传失败");
	                $("#url").val("");
	                $(obj).val('');
            }
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
        	$(".pop").show();
        	$(".mask").show();
        	$(".pop span").text("上传失败");
            $("#url").val("");
            $(obj).val('');
        }
    });
}
//下一步 
$(".mod-btn").click(function() {
	window.location.href = "../../life/hq/nc_hq_jxnn.do"
})






$(function () 
{
	//保险期限改变更换客户告知书
    function insuyearChange(){
		if($("#insuyear").val() != "106A" && $("#productNo").val() == "risk02"){
    		$("#LifetimeOrRegularasis").attr("href","../../contract/ab/risk02/productDetail.html?risk=regularasis");
    	}else if($("#insuyear").val() != "106A" && $("#productNo").val() == "risk01"){
    		$("#LifetimeOrRegularasis01").attr("href","../../contract/ab/risk01/productDetail.html?risk=regularasis");
    	}
	}
    $("#LifetimeOrRegularasis").on("click", function (){
    	insuyearChange();
    })
	 $("#LifetimeOrRegularasis01").on("click", function (){
    	insuyearChange();
    })
    
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
    //保障项目/额度显示隐藏
    $("#guarantee>p").on("click", function () {
        if ($(this).hasClass("hideGuarantee")) {
            $(this).siblings("div").show();
            $(this).removeClass("hideGuarantee").addClass("showGuarantee");
        } else {
            $(this).siblings("div").slideUp();
            $(this).removeClass("showGuarantee").addClass("hideGuarantee");
        }
        $("html body").animate({"scrollTop":$(this).offset().top+"px"},"swing");
    })
    //地区
    setTimeout(function(){
    	getArea("appntArea");
	    getArea("insuredArea");
	    //getArea("propertyArea");
    },0)
    
    //改变银行发送数据
    $("#accountBank").change(function(){
        //$("#bankArea").val("");
        if($(this).find("option:selected").text() == "请选择"){
    		return;
    	};
        //getBankArea("bankArea",$(this).find("option:selected").val());
    });
    //默认一加载就判断显示哪个
    
    if ($("#cardType").find("option:selected").text() == "身份证") {
        $(".birthday").hide();
        $(".birthdayReadonly").show();
        /*$(".sex").hide();*/
        $(".sexReadonly").show();
    } else {
        $(".birthday").show().css("display", "inline-block");
        $(".birthdayReadonly").hide();
        /*$(".sex").show().css("display", "inline-block");*/
        $(".sexReadonly").hide();
    }
    $("#cardType").change(function(){
		if ($("#cardType").find("option:selected").text() == "身份证" || $("#cardType").find("option:selected").text() == "临时身份证") {
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
		
    })
    
    $("input[type = checkbox]").each(function () {
        if ($(this).prop("checked")) {
        	//alert(123);
        	$(this).val("on");
            $(this).removeClass("unCheckBox").addClass("checkBox");
            $(this).parent().siblings("span").find("input[type = text]").hide();
        } else {
        	$(this).val("off");
            $(this).removeClass("checkBox").addClass("unCheckBox");
            $(this).parent().siblings("span").find("input[type = text]").show();
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
    $("#switch").on("click", function () {
        if ($(this).hasClass("turnOn")) {
        	
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
            if ($("#cardType").find("option:selected").text() == "身份证" || $("#cardType").find("option:selected").text() == "临时身份证") {
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
                if ($("#insuredCardType").find("option:selected").text() == "身份证" || $("#insuredCardType").find("option:selected").text() == "临时身份证") {
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
            calPrice();
        }
    });
    $("#insuredCardType").change(function(){
		if ($("#insuredCardType").find("option:selected").text() == "身份证" || $("#insuredCardType").find("option:selected").text() == "临时身份证") {
			$(".yingchang4").hide();
			$(".yingchang3").show();
			$(".xingbie2").hide();
		}else{
			$(".yingchang4").show();
			$(".yingchang3").hide();
			$(".xingbie2").show();
		}
		
    })
    //勾选同意
    $("#whetherCheck").on("click", function () {
        if ($(this).hasClass("unCheckBox")) {
            $(this).removeClass("unCheckBox").addClass("checkBox");
        } else {
            $(this).removeClass("checkBox").addClass("unCheckBox");
        }
    });
    //输入框弹出键盘时改变样式
    /*$("input").on("focus", function () {
        if (!$(this).prop("readonly")) {
            $(".fixedBox").css("position", "static");
            $(".header").css("position", "static");
            $(".info").css("marginTop", "0");
            //$(".whetherRead").css("marginBottom", "1.375rem");
        }
    }).on("blur", function () {
        $(".fixedBox").css({"position": "fixed", "bottom": "0"});
        $(".header").css({"position": "fixed", "top": "0"});
        $(".info").css("marginTop", "2.2rem");
        //$(".whetherRead").css("marginBottom", "3.575rem");
    });*/
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
//                        console.log($(".appntOccupation").find("option:selected").text())
                    }
                }
            }
        } else {
            $(".insured .mySelf").hide().siblings().show();
            if ($("#insuredCardType").find("option:selected").text() == "身份证" || $("#insuredCardType").find("option:selected").text() == "临时身份证") {
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
        if ($("#cardType").find("option:selected").text() == "身份证" || $("#cardType").find("option:selected").text() == "临时身份证") {
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
       /* if (getAgeByBirthDay($("#birthday").val()) < 18) {
            $("#idNo").parent().siblings(".errorMsg").css("display", "inline-block").text("年龄必须满18周岁！");
        } else {
            $(this).parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
        }*/
    	 if (getAgeByBirthDay1($("#birthday").val()) < 18) {
             $("#idNo").parent().siblings(".errorMsg").css("display", "inline-block").text("年龄必须满18周岁！");
         } else {
             $(this).parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
         }
        $(".insuredBirthdayReadonly").siblings(".mySelf").val($("#birthday").val());
    });
    $("#sex").on("change", function () {
        $(".insuredSexReadonly").siblings(".mySelf").val($("#sex").find("option:selected").text());
    });
    //改变下拉状态，错误提示信息消失
    $("#insuredIdDate").on("change", function () {
        $(this).parent().parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
    });
    $("#insuredBirthday").on("change", function () {
        $(this).parent().parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
    });
    $("#appntArea").on("touchend", function () {
        $("#appntArea").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
    });
    $("#insuredArea").on("touchend", function () {
        $("#insuredArea").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
    });
    
   /* $("#birthday").on("change", function () {
        if ($("#birthday").val() != "请选择") {
        	$("#birthday").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
        }
    });*/
    
    $("#cardType").on("change", function () {
        if ($("#cardType").find("option:selected").text() == "请选择") {
            $("#cardType").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择证件类型！");
        } else {
            $("#cardType").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
        }
    });
    
    $("#insuredCardType").on("change", function () {
        if ($("#insuredCardType").find("option:selected").text() == "请选择") {
            $("#insuredCardType").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择证件类型！");
        } else {
            $("#insuredCardType").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
        }
    });
    /*
    $("#propertyArea").on("touchend", function () {
        $("#propertyArea").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
    });
    
    $(".occ").on("click", function () {
        $(this).parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
    });
    $("#bankArea").on("click", function () {
        $(this).parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
    });
    
    $("#insuredSocialSecurity").on("change", function () {
        $(this).parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
    });
    */
    $("#accountBank").on("change", function () {
        $(this).parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
    });
    /*
    $("#accountSubBank").on("change", function () {
        $(this).parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
    });
    */

    //改变证件类型，焦点移到证件号码输入框
    $("#insuredCardType").on("change", function () {
        $("#insuredBirthday").val("");
        $("#insuredIdNo").focus();
    });
    //点击确定，弹窗消失
    $(".pop-sure").on("click", function () {
        $(".pop").hide();
        $(".mask").hide();
    });
    
    /***************************投保人信息校验**************************/
    $(".numInput").on("blur",function(){
    	checkNum($(this));
    })
    
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
        if ($("#cardType").find("option:selected").text() == "身份证" || $("#cardType").find("option:selected").text() == "临时身份证") {
            checkID($(this));
            if (checkID($(this))) 
            {
                //带出生日和性别
                $(".birthdayReadonly").val(getBirthdayByIDCard($(this).val().trim()));
                $("#birthday").val(getBirthdayByIDCard($(this).val().trim()));
                $(".sexReadonly").val(getSexByIDCard($(this).val().trim()) == "1" ? "男" : "女");
                getSexByIDCard($(this).val().trim()) == "1" ? $("#sex").find("option").eq(0).prop("selected",true):$("#sex").find("option").eq(1).prop("selected",true);
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
            //年龄判断
            if ($(".birthdayReadonly").val()== null || $(".birthdayReadonly").val() == "" || getAgeByBirthDay($(".birthdayReadonly").val()) < 18) {
                $("#idNo").parent().siblings(".errorMsg").css("display", "inline-block").text("身份证号不能为空,并且年龄必须满18周岁！");
            } else {
                $("#idNo").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
            }

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
    //E家安康
    /*
    $(".EInsuredName").on("blur", function () {
        checkName($(this));
    });
    $(".EInsuredIdNo").on("blur", function () {
        $(this).val($(this).val().toUpperCase());
        checkID($(this));
    });
    */
    
        //姓名校验
    $("#insuredName").on("blur", function () {
        checkName($(this));
    });
    //证件号码校验
    $("#insuredIdNo").on("blur", function () {
    	
        $(this).val($(this).val().toUpperCase());
        //身份证校验
        if ($("#insuredCardType").find("option:selected").text() == "身份证" || $("#insuredCardType").find("option:selected").text() == "临时身份证") {
            checkID($(this));
            if (checkID($(this))) {
                //带出生日和性别
                $(".insuredBirthdayReadonly").val(getBirthdayByIDCard($(this).val().trim()));
                $("#insuredBirthday").val(getBirthdayByIDCard($(this).val().trim()));
                $(".insuredSexReadonly").val(getSexByIDCard($(this).val().trim()) == "1" ? "男" : "女");
                getSexByIDCard($(this).val().trim()) == "1" ? $("#insuredSex").find("option").eq(0).prop("selected",true):$("#insuredSex").find("option").eq(1).prop("selected",true);
                
                calPrice();
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
        if($(".insuredBirthdayReadonly").val()!=''){
        	 if (getAgeByBirthDay($(".insuredBirthdayReadonly").val()) > 60 || getDayByBirthDay($(".insuredBirthdayReadonly").val()) < 28) {
                 $("#insuredBirthday").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("被保险人超投保年龄范围");
             } else {
             	$("#insuredBirthday").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
             }
        }
       
    });
    //身高校验
    $("#height").on("blur", function () {
        //checkHeight($(this));
    });
    //体重校验
    $("#weight").on("blur", function () {
        //checkWeight($(this));
    });
    //详细地址校验
    $("#insuredAddress").on("blur", function () {
        checkAddress($(this));
    });
    //邮政编码校验
    $("#insuredZipCode").on("blur", function () {
        checkPostalCode($(this));
    });
    //手机号码校验
    $("#insuredMobile").on("blur", function () {
        checkTel($(this));
    });
    /***************************续缴账户信息校验**************************/
        //开户名校验
    /*$("#accountName").on("blur", function () {
        checkName($(this));
    });*/
    //银行卡号校验
    $("#cardNo").on("blur", function () {
        checkCardNo($(this));
    });
    //再次输入银行卡号校验
    $("#cardNoAgain").on("blur", function () {
        checkCardNoAgain($(this),$("#cardNo"));
    });

    //计算保费
    $(".getPrice").change(function(e){
    	if($(this).hasClass("import")){
    		$(this).data("value",$(this).val())
//    		console.log($(this).data("value"))
    	}
    	calPrice();
    });
    if ($(".import").length>0) {
        $(".import").each(function(index, el) {
            if ($(this).val()) {
                $(this).data("value",$(this).val())
            };
        });
    };
    $("#idNo").change(function(){
    	//console.log($("#cardType").find("option:selected").text(),$("#insuredName").val());
        $(this).val($(this).val().toUpperCase());
    	if($("#cardType").find("option:selected").text() == "身份证" && ($("#isSelf").val() == 1 || $("#relation").find("option:selected").text() == "本人")
    			|| $("#cardType").find("option:selected").text() == "临时身份证" && ($("#isSelf").val() == 1 || $("#relation").find("option:selected").text() == "本人")){
    		checkID($(this));
            if (checkID($(this))) {
                //带出生日和性别
                $(".birthdayReadonly").val(getBirthdayByIDCard($(this).val().trim()));
                $("#birthday").val(getBirthdayByIDCard($(this).val().trim()));
                $(".sexReadonly").val(getSexByIDCard($(this).val().trim()) == "1" ? "男" : "女");
                getSexByIDCard($(this).val().trim()) == "1" ? $("#sex").find("option").eq(0).prop("selected",true):$("#sex").find("option").eq(1).prop("selected",true);
            } else {
                //身份证错误时清空生日和性别
                $(".birthdayReadonly").val("");
                $("#birthday").val("");
                $(".sexReadonly").val("");
                return;
            }
    		calPrice();
    	}
    });
    $("#insuredIdNo").change(function(){
        $(this).val($(this).val().toUpperCase());
    	if($("#insuredCardType").find("option:selected").text() == "身份证" && $("#isSelf").val() == 0){
    		checkID($(this));
            if (checkID($(this))) {
                //带出生日和性别
                $(".insuredBirthdayReadonly").val(getBirthdayByIDCard($(this).val().trim()));
                $("#insuredBirthday").val(getBirthdayByIDCard($(this).val().trim()));
                $(".insuredSexReadonly").val(getSexByIDCard($(this).val().trim()) == "1" ? "男" : "女");
                getSexByIDCard($(this).val().trim()) == "1" ? $("#insuredSex").find("option").eq(0).prop("selected",true):$("#insuredSex").find("option").eq(1).prop("selected",true);
            } else {
                //身份证错误时清空生日和性别
                $(".insuredBirthdayReadonly").val("");
                $("#insuredBirthday").val("");
                $(".insuredSexReadonly").val("");
                return;
            }
    		calPrice();
    	}
    });
    $("#sex").change(function(){
    	if($("#cardType").find("option:selected").text() != "身份证" && $("#isSelf").val() == 1 || $("#cardType").find("option:selected").text() != "临时身份证" && $("#isSelf").val() == 1){
    		calPrice();
    	}
    });
    $("#insuredSex").change(function(){
    	if($("#insuredCardType").find("option:selected").text() != "身份证" && $("#isSelf").val() == 0 || $("#cardType").find("option:selected").text() != "临时身份证" && $("#isSelf").val() == 1){
    		calPrice();
    	}
    });
    //房屋信息校验
    $("#propertyAddress").on("blur", function () {
        checkAddress($(this));
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
    
    //发送数据
    $("#sureToSave").click(function() {
//    	if($("#cardType_dummy").val()  =="请选择" ){
//    		$(".errorMsg11").css("display", "inline-block").text("请选择证件类型！")
//    	}else{
//    		$(".errorMsg11").css("display", "none").text("")
//    	}
    	
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
    	
        sendRequest("../../life/hq/newcontract_save.do",getData(),function (data) {
        	console.log(data);
        	var obj = JSON.parse(data);
        	if(obj.code == 0){
        		var orderNo = obj.orderNo;
        		var riskcode= obj.riskcode;
//        		console.log(orderNo);
        		//var returnPage = obj.data.returnPage;
        		window.location.href = "../../life/hq/contractpay.do?orderNo="+orderNo+"&riskcode="+riskcode;
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
    /*$("#bankArea").val("");
    $("#accountBank_dummy").val("");
    $("#cardNo").val("");
    $("#cardNoAgain").val("");
    $("#accountBank_dummy").attr("placeholder","请选择");
    $("#accountBank").find("option").each(function(){
    	if($(this).text()=="请选择"){
    		$(this).prop("selected",true);
    		$(this).siblings().prop("selected",false);
    	}
    });*/
    //是否续保
    if($(".checkRenewal").length>0 && $('input:radio[name="renewalBank.isRenewed"]').length>0){
    	$('input:radio[name="renewalBank.isRenewed"]:checked').prev().find("i").addClass("renewalCheckBox");
    	if($('input:radio[name="renewalBank.isRenewed"]:checked').val() == "N"){
    		$('input:radio[name="renewalBank.isRenewed"]:checked').parent().parent().siblings().hide();
    		$('input:radio[name="renewalBank.isRenewed"]:checked').siblings(".errorMsg").show();
    	}else{
    		$('input:radio[name="renewalBank.isRenewed"]:checked').siblings(".errorMsg").hide();
    	}
    	$('input:radio[name="renewalBank.isRenewed"]:checked').addClass("personInfo");
	}
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
    })
    $(".renewalIcon").click(function(){
    	$(this).parent().click();
    })
    //守护母婴医院
    $("#hospitalName").change(function(){
    	$("#hospitalAddress").val($(this).find("option:selected").data("address"));
    	if($(this).find("option:selected").val() == ""){
    		$(this).parent().siblings(".errorMsg").text("请选择约定医院！").show();
    	}else{
    		$(this).parent().siblings(".errorMsg").text("").hide();
    	}
    })
    //E家安康
    $("#personNum").change(function(){
    	personNumC()
    });
    if($("#productNo").val() == "410101020"){
    	personNumC();
    }
    function personNumC(){
    	for(var i = 0; i < $("#personNum").find("option:selected").val();i++){
    		$(".insured"+i).show();
    		$(".insured"+i).find("input,select").addClass("personInfo");
    	};
    	for(var j = $("#personNum").find("option:selected").val(); j < 8;j++){
    		$(".insured"+j).hide();
    		$(".insured"+j).find("input,select").removeClass("personInfo");
    	};
    }
    //是否续保
    /*
    if($(".checkRenewal").length>0){
    	if($("#accountBank").find("option:selected").val() != ""){
        	getBankArea("bankArea",$("#accountBank").find("option:selected").val());//通过省id请求市
    	}
    	if($("#accountBank").find("option:selected").val() != "" && $("#bankArea").siblings("input")[1].value != ""){
    		getSubBank(path +"/pay/getSubBankInfo",{
	        	bankCode:$("#accountBank").find("option:selected").val(),
	        	banksProvince:$("#bankArea").siblings("input")[1].value,
	        	banksCity:$("#bankArea").siblings("input")[2].value
	        },function(data){
	        	var obj = JSON.parse(data);
	        	$("#accountSubBank").html('<option value="">请选择</option>');
	        	var htm = "";
	        	for(var i = 0;i < obj.data.length;i++){
	        		if(obj.data[i].bankNo == $("#subBankCode").val()){
	        			htm += '<option selected value="'+obj.data[i].bankNo+'">'+obj.data[i].bankName+'</option>';
	        		}else{
		        		htm += '<option value="'+obj.data[i].bankNo+'">'+obj.data[i].bankName+'</option>';
	        		}
	        	}
	        	$("#accountSubBank").append(htm);
	        	$("#accountSubBank").scroller('destroy').scroller($.extend({preset: 'select'}, {
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
	        },function(){})
    	}
    }
    */
    
    
    /*
     * 新增
     */
    $("#payendyear").change(function()
    {
    	//alert($("#payendyear").get(1).selectedIndex);
    	//alert($("#ishuanmian").val());
    	
    	if($("#payendyear").find("option:selected").val() == "0Y")
    	{
    		$("#ishuanmian").html('');
    		$("#ishuanmian").append("<option value='N'>不投保</option>");
    		$("#ishuanmian").val("N");
    		
    		$("#ishuanmian_dummy").val($("#ishuanmian").find("option:selected").text());
    	}
    	else
    	{
    		$("#ishuanmian").html('');
    		$("#ishuanmian").append("<option value='Y'>投保</option>");
    		$("#ishuanmian").append("<option value='N'>不投保</option>");
    		
    		$("#ishuanmian").val("Y");
    		$("#ishuanmian_dummy").val($("#ishuanmian").find("option:selected").text());
    	}
    	
    	//alert($("#ishuanmian").val());
    	//alert($("#ishuanmian").get(0).selectedIndex);
		//alert($("#ishuanmian").find("option:selected").text());
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
    	})
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
        
    	if (!($("#cardType").find("option:selected").text() == "身份证") || !($("#cardType").find("option:selected").text() == "临时身份证")) {
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
        } else {
            $("#idNo").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
        }
    	
    	if (!($("#cardType").find("option:selected").text() == "身份证" ? checkID($("#idNo")) : checkOtherId($("#idNo")))) {
    		$("#idNo").parent().siblings(".errorMsg").css("display", "inline-block").text("您的证件号码不正确，请重新输入！");
            flag = false;
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
        if (!($("#cardType").find("option:selected").text() == "身份证") || !($("#cardType").find("option:selected").text() == "临时身份证")) {
            if ($("#birthday").val() == "") {
                $("#birthday").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("请选择出生日期！");
                flag = false;
            } else if (getAgeByBirthDay($("#birthday").val()) < 18) {
                //年龄判断
                $("#idNo").parent().siblings(".errorMsg").css("display", "inline-block").text("年龄必须满18周岁！");
                flag = false;
            } else {
                $("#idNo").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
            }
        } else if (getAgeByBirthDay($(".birthdayReadonly").val()) < 18) {
            //年龄判断
            $("#idNo").parent().siblings(".errorMsg").css("display", "inline-block").text("年龄必须满18周岁！");
            flag = false;
        } else {
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
    //职业校验
    if ($(".appntOccupation").length>0) {
        if ($(".appntOccupation")[0].tagName == "INPUT") {
            if ($(".appntOccupation").val() == "") {
                $(".appntOccupation").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择职业！");
                flag = false;
            } else {
                $(".appntOccupation").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
            }
        } else if ($(".appntOccupation")[0].tagName == "SELECT") {
        if ($(".appntOccupation").find("option:selected").text() == "请选择") {
                $(".appntOccupation").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择职业！");
                flag = false;
            } else {
                $(".appntOccupation").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
            }
        }
    }
    //证件类型
    if ($("#cardType").length>0) {
        if ($("#cardType").find("option:selected").text() == "请选择") {
                $("#cardType").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择证件类型！");
                flag = false;
            } else {
                $("#cardType").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
            }
    }
    
    if ($("#insuredCardType").length>0) {
        if ($("#insuredCardType").find("option:selected").text() == "请选择" && $("#relation").find("option:selected").text() != "本人") {
                $("#insuredCardType").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择证件类型！");
                flag = false;
            } else {
                $("#insuredCardType").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
            }
    }
    //被保人信息
    if ($("#switch").hasClass("turnOff")) {
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
                if (!($("#insuredCardType").find("option:selected").text() == "临时身份证" ? checkID($("#insuredIdNo")) : checkOtherId($("#insuredIdNo")))) {
                    flag = false;
                }
            }
            //证件有效期
            if ($("#insuredIdDate").length>0) {
                if ($("#insuredCheckbox").hasClass("unCheckBox") && $("#insuredIdDate").val() == "") {
                    $("#insuredIdDate").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("请输入有效期或选择长期！");
                    flag = false;
                } else {
                    $("#insuredIdDate").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
                }
            }
            //出生日期校验
            if ($("#insuredBirthday").length>0) {
                if (!($("#insuredCardType").find("option:selected").text() == "身份证") || !($("#insuredCardType").find("option:selected").text() == "临时身份证")) {
                    if ($("#insuredBirthday").val() == "") {
                        $("#insuredBirthday").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("请选择出生日期！");
                        flag = false;
                    } else {
                        $("#insuredBirthday").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
                    }
                }else if (($("#insuredCardType").find("option:selected").text() == "身份证") || ($("#insuredCardType").find("option:selected").text() == "临时身份证")) {
                	if ($("#insuredBirthday").val() == "") {
                        $("#insuredBirthday").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("请选择出生日期！");
                        flag = false;
                    } else {
                        $("#insuredBirthday").parent().parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
                    }
                }
                
            }
            //职业校验
            if ($(".occupation").length>0) {
                if ($(".occupation")[0].tagName == "INPUT") {
                    if ($(".occupation").val() == "") {
                        $(".occupation").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择职业！");
                        flag = false;
                    } else {
                        $(".occupation").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
                    }
                } else if ($(".occupation")[0].tagName == "SELECT") {
                    if ($(".occupation").find("option:selected").text() == "请选择") {
                        $(".occupation").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择职业！");
                        flag = false;
                    } else {
                        $(".occupation").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
                    }
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
            //邮政编码校验
            if ($("#insuredZipCode").length>0) {
                if (!checkPostalCode($("#insuredZipCode"))) {
                    flag = false;
                }
            }
            //手机号码校验
            if ($("#insuredMobile").length>0) {
                if (!checkTel($("#insuredMobile"))) {
                    flag = false;
                }
            }
            
        }
    }
    //身高校验
    /*
    if ($("#height").length>0) {
        if (!checkHeight($("#height"))) {
            flag = false;
        }
    }
    */
    //体重校验
    /*
    if ($("#weight").length>0) {
        if (!checkWeight($("#weight"))) {
            flag = false;
        }
    }
    */
    //职业校验
    if ($("#scrollTop>div>dl .occupation").length>0) {
        if ($("#scrollTop>div>dl .occupation")[0].tagName == "INPUT") {
            if ($("#scrollTop>div>dl .occupation").val() == "") {
                $("#scrollTop>div>dl .occupation").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择职业！");
                flag = false;
            } else {
                $("#scrollTop>div>dl .occupation").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
            }
        } else if ($("#scrollTop>div>dl .occupation")[0].tagName == "SELECT") {
            if ($("#scrollTop>div>dl .occupation").find("option:selected").text() == "请选择") {
                $("#scrollTop>div>dl .occupation").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择职业！");
                flag = false;
            } else {
                $("#scrollTop>div>dl .occupation").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
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
    //邮政编码校验
    if ($("#scrollTop>div>dl #insuredZipCode").length>0) {
        if (!checkPostalCode($("#scrollTop>div>dl #insuredZipCode"))) {
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
    function checkBank(){
    	//开户所在地校验
        if ($("#bankArea").length>0) {
            if ($("#bankArea").val() == "") {
                $("#bankArea").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择开户所在地！");
                flag = false;
            } else {
                $("#bankArea").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
            }
        }
        //开户行校验
        if ($("#accountBank").length>0) {
            if ($("#accountBank").find("option:selected").text() == "请选择") {
                $("#accountBank").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择开户行！");
                flag = false;
            } else {
                $("#accountBank").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
            }
        }
        //开户省校验
//        if ($("#bankProvince").length>0) {
//        	if ($("#bankProvince").find("option:selected").text() == "请选择") {
//        		$("#bankProvince").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择开户省！");
//        		flag = false;
//        	} else {
//        		$("#bankProvince").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
//        	}
//        }
      //开户支行校验
        if ($("#accountSubBank").length>0) {
            if ($("#accountSubBank").find("option:selected").text() == "请选择") {
                $("#accountSubBank").parent().siblings(".errorMsg").css("display", "inline-block").text("请选择开户支行！");
                flag = false;
            } else {
                $("#accountSubBank").parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
            }
        }
        //开户名校验
        if ($("#accountName").length>0) {
            if (!checkName($("#accountName"))) {
                flag = false;
            }
        }
        //银行卡号校验
        if ($("#cardNo").length>0) {
            if (!checkCardNo($("#cardNo"))) {
                flag = false;
            }
        }
        //再次输入银行卡号校验
        if ($("#cardNoAgain").length>0) {
            if (!checkCardNoAgain($("#cardNoAgain"), $("#cardNo"))) {
                flag = false;
            }
        }
    }
    //勾选阅读校验
    if ($("#whetherCheck").length>0) {
	    if (!$("#whetherCheck").hasClass("checkBox")) {
	        $(".pop").show().find("span").text("请阅读并同意相关条款");
	        $(".mask").show();
	        flag = false;
	    }
    }
    
    if (!flag) return;
   
    var birth = "";
    if($("#switch").hasClass("turnOn")){
    	if($("#cardType").find("option:selected").text() == "身份证" || $("#cardType").find("option:selected").text() == "临时身份证"){
    		birth = $('.birthdayReadonly').val();
    	}else{
    		birth = $('#birthday').val();
    	}
    }else{
    	if($("#relation").find("option:selected").text() == "本人"){
    		birth = $('#insuredBirthday2').val();
    	}else{
    		if($("#insuredCardType").find("option:selected").text() == "身份证" || $("#insuredCardType").find("option:selected").text() == "临时身份证"){
    			birth = $('#insuredBirthday1').val();
    		}else{
    			birth = $('#insuredBirthday').val();
    		}
    	}
    }
    var amntage = getAgeByBirthDay(birth);
    var amntageDays=getDayByBirthDay(birth);
    
    if($("#productNo").val() == "14040")
    {
    	if($("#prem").val()==null||$("#prem").val()=="")
		{
    		$(".pop").show();
        	$(".mask").show();
        	$(".pop span").text("尊敬的客户,请填写保费。");
			return;
		}
    	
    	if($("#payendyear").val() =="1000Y" && $("#insurePrice").val()<3000 && $("#insurePrice").val()%1000 !=0){
    		$(".pop").show();
        	$(".mask").show();
        	$(".pop span").text("尊敬的客户,金禧年年首投金额要大于3000元,超过部份须为1000元的整数倍。");
        	return;
    	}
    	
    	var getyear=$("#getyear").val();
    	
    	if(amntage>55 || amntageDays<28){
    		$(".pop").show();
        	$(".mask").show();
        	$(".pop span").text("尊敬的客户，被保险人投保年龄不能小于28天或者大于55周岁。");
        	return;
    	}
    	
    	if(amntage>=51 && amntage<=55 && getyear !=65 ){
    		$(".pop").show();
        	$(".mask").show();
        	$(".pop span").text("尊敬的客户，被保险人投保年龄为51-55周岁，祝寿金领取年龄只允许“选择65周岁后的首个保单周年日”。");
        	return;
		}else if(amntage>=45 && amntage<=50 && getyear==60 && $("#payendyear").val() !="1000Y"){
			$(".pop").show();
        	$(".mask").show();
        	$(".pop span").text("尊敬的客户，被保险人投保年龄为45-50周岁，祝寿金领取年龄选择“60周岁后的首个保单周年日”时，交费方式只允许选择趸交。");
        	return;
		}else if(amntage>=50 && amntage<=55 && getyear==65 && $("#payendyear").val() !="1000Y"){
			$(".pop").show();
        	$(".mask").show();
        	$(".pop span").text("尊敬的客户，被保险人投保年龄为51-55周岁，祝寿金领取年龄选择“65周岁后的首个保单周年日”时，交费方式只允许选择趸交。");
        	return;
		}
    }
    
    if($("#productNo").val() == "34010")
    {
    	
    	if($("#insurePrice").val()%10>0)
    	{
    		$(".pop").show();
        	$(".mask").show();
        	$(".pop span").text("尊敬的客户，本产品的保费必须是10的整数倍，请调整投保金额。");
        	return;
    	}
    	
		if(amntageDays <28 || amntage >65){
			$(".pop").show();
        	$(".mask").show();
        	$(".pop span").text("尊敬的客户，被保险人投保年龄不能小于28天或者大于65周岁。");
        	return;
		}
    	
//    	if($("#payendyear").find("option:selected").val()=="0Y")
//    	{
//    		if($("#mainPrice").val()<3000)
//    		{
//    			$(".pop").show();
//            	$(".mask").show();
//            	$(".pop span").text("尊敬的客户，趸交最低保费不得低于3000元，请降低保额投保。");
//            	return;
//    		}
//    	}
//    	else
//    	{
//    		if(($("#mainPrice").val()+$("#hmPrice").val())<500)
//    		{
//    			$(".pop").show();
//            	$(".mask").show();
//            	$(".pop span").text("尊敬的客户，期交最低保费不得低于500元，请降低保额投保。");
//            	return;
//    		}
//    	}
    }
    
    if($("#productNo").val() == "16050")
    {
    	
    	if($("#amnt").val()%10000 !=0)
    	{
    		$(".pop").show();
        	$(".mask").show();
        	$(".pop span").text("尊敬的客户，本产品的保费必须是10000的整数倍，请调整投保金额。");
        	return;
    	}
    	
		if(amntageDays <28 || amntage >55){
			$(".pop").show();
        	$(".mask").show();
        	$(".pop span").text("尊敬的客户，被保险人投保年龄不能小于28天或者大于55周岁。");
        	return;
		}
    	
    	if($("#payendyear").find("option:selected").val()=="30Y" && amntage >45)
    	{
			$(".pop").show();
        	$(".mask").show();
        	$(".pop span").text("尊敬的客户，缴费期限为30年交，年龄不能超过45。");
        	return;
    	}
    }
    
    if($("#productNo").val() == "11010")
    {
		if(amntageDays <28 || amntage >65){
			$(".pop").show();
        	$(".mask").show();
        	$(".pop span").text("尊敬的客户，被保险人投保年龄不能小于28天或者大于65周岁。");
        	return;
		}
		
		var amnt=$("#amnt").find("option:selected").val();
		
		if(amntage >=18 && amnt <100000){
			$(".pop").show();
        	$(".mask").show();
        	$(".pop span").text("尊敬的客户，最低保额：未成年人≥5万元，成年人≥10万元,请重新选择。");
        	return;
		}
		
		if(amntage < 18 && amnt <50000){
			$(".pop").show();
        	$(".mask").show();
        	$(".pop span").text("尊敬的客户，最低保额：未成年人≥5万元，成年人≥10万元,请重新选择。");
        	return;
		}
    	
    }
    
    if($("#productNo").val() == "12030")
    {
		if(amntage <18 || amntage >60){
			$(".pop").show();
        	$(".mask").show();
        	$(".pop span").text("尊敬的客户，被保险人投保年龄不能小于18或者大于60周岁。");
        	return;
		}
		
		var amnt=$("#amnt").find("option:selected").val();
		var payendyear=$("#payendyear").find("option:selected").val();
		var insuyear=$("#insuyear").find("option:selected").val();
    	var appntCity=$("#appntCity").val();
    	var appntProvince=$("#appntProvince").val();
//	    保险期间      20年期	30年期	至60周岁	至65周岁	至70周岁
//	交费期间
//	    趸交	18-50岁	18-40岁	18-50岁	18-55岁	18-60岁
//	 3年交	18-50岁	18-40岁	18-50岁	18-55岁	18-60岁
//	 5年交	18-50岁	18-40岁	18-50岁	18-55岁	18-60岁
//	 10年交	18-50岁	18-40岁	18-50岁	18-55岁	18-60岁
//	 20年交	18-50岁	18-40岁	18-40岁	18-45岁	18-50岁

		if(amntage >50 && "20Y"==insuyear || amntage >40 && "30Y"==insuyear || amntage >50 && "60Y"==insuyear && "20Y" !=payendyear
				|| amntage >55 && "65Y"==insuyear && "20Y" !=payendyear || amntage >60 && "70Y"==insuyear && "20Y" !=payendyear
				|| "20Y" ==payendyear && "60Y"==insuyear && amntage >40 || "20Y" ==payendyear && "65Y"==insuyear && amntage >45
				|| "20Y" ==payendyear && "70Y"==insuyear && amntage >50){
			
			$(".pop").show();
        	$(".mask").show();
        	$(".pop span").text("尊敬的客户，被保险人年龄不允许选择该交费期间/保险期间。");
        	return;
		}
		console.log(appntCity);
		//北上广深
		if(appntProvince=="110000" || appntProvince=="310000" || appntCity=="440300" || appntCity=="440100"){
			if(amntage>40 && amntage<51 && "1500000"==amnt || amntage>50 && amntage<61 && "1500000"==amnt || amntage>50 && amntage<61 && "1000000"==amnt){
				$(".pop").show();
	        	$(".mask").show();
	        	$(".pop span").text("尊敬的客户，请您降低保额。");
	        	return;
			}
		}//一线城市
		else if(appntCity=="320500" || appntCity=="370200" || appntCity=="210200" || appntCity=="441900" || appntCity=="330200" || appntCity=="120100" || appntCity=="370100" 
			 || appntCity=="500300" || appntCity=="130100" || appntCity=="140100" || appntCity=="210100" || appntCity=="220100" || appntCity=="230100" 
			 || appntCity=="320100" || appntCity=="330100" || appntCity=="340100" || appntCity=="350100" || appntCity=="360100"	|| appntCity=="410100" 
			 || appntCity=="420100" || appntCity=="430100" || appntCity=="460100" || appntCity=="510100"|| appntCity=="520100"|| appntCity=="530100"
			 || appntCity=="610100"|| appntCity=="620100"|| appntCity=="630100" || appntCity=="450100"|| appntCity=="150100"|| appntCity=="540100"
			 || appntCity=="640100" || appntCity=="650100"){
			
			if(amntage>=18 && amntage<41 && "1500000"==amnt || amntage>=41 && amntage<61 && "1500000"==amnt || amntage>=41 && amntage<61 && "1000000"==amnt ){
				$(".pop").show();
	        	$(".mask").show();
	        	$(".pop span").text("尊敬的客户，请您降低保额。");
	        	return;
			}
		}//其他
		else{
			if(amntage>=18 && amntage<51 && "1500000"==amnt || amntage>=18 && amntage<51 && "1000000"==amnt || amntage>=51 && amntage<61 && "300000"!=amnt ){
				$(".pop").show();
	        	$(".mask").show();
	        	$(".pop span").text("尊敬的客户，请您降低保额。");
	        	return;
			}
		}
    }

    
    
    //安悦一生校验
    if($("#productNo").val() == 110101017){
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
    	var age = getAgeByBirthDay(birth);
    	var appntProvince = $("#appntProvince").val();
    	var appfactMoney = $("#appfact_00000000000000006109").find("option:selected").val();
    	var shuMsg = "尊敬的客户，您所选择的保额已超过您所在地区的最高保额上限，请降低保额投保。";
    	if(appntProvince == 110000 || appntProvince == 310000 || appntProvince == 440000 || appntProvince == 330000 || appntProvince == 320000){
    		if(age>0 && age<17 && appfactMoney>300000){
    			$(".pop").show();
            	$(".mask").show();
            	$(".pop span").text(shuMsg);
            	return;
    		}else if(age>18 && age<40 && appfactMoney>410000){
    			$(".pop").show();
            	$(".mask").show();
            	$(".pop span").text(shuMsg);
            	return;
    		}else if(age>41 && age<50 && appfactMoney>250000){
    			$(".pop").show();
            	$(".mask").show();
            	$(".pop span").text(shuMsg);
            	return;
    		}else if(age>51 && age<55 && appfactMoney>80000){
    			$(".pop").show();
            	$(".mask").show();
            	$(".pop span").text(shuMsg);
            	return;
    		};
    		return true;
    	}else{
    		if(age>0 && age<17 && appfactMoney>300000){
    			$(".pop").show();
            	$(".mask").show();
            	$(".pop span").text(shuMsg);
            	return;
    		}else if(age>18 && age<40 && appfactMoney>330000){
    			$(".pop").show();
            	$(".mask").show();
            	$(".pop span").text(shuMsg);
            	return;
    		}else if(age>41 && age<50 && appfactMoney>160000){
    			$(".pop").show();
            	$(".mask").show();
            	$(".pop span").text(shuMsg);
            	return;
    		}else if(age>51 && age<55 && appfactMoney>40000){
    			$(".pop").show();
            	$(".mask").show();
            	$(".pop span").text(shuMsg);
            	return;
    		};
    		return true;
    	}
    }


    return true;
}

//拼接传到后台的信息
function getData(){
	
	/*
	var appFactorInfo=[];
    $(".iFactor").each(function(index, el){
        var obj = {};
        if(el.tagName == "SELECT"){
            obj.apptype = $(this).data("type");
            obj.appFactorCode = $(this).data("appfactorid");
            obj.isPremCalFacotor = $(this).data("ispremcal");
            obj.appValue = $(this).find("option:selected").val();
            obj.appShowValue = $(this).find("option:selected").text();
            obj.conjuncDutyCode = $(this).data("conjuncdutycode");
        }else if(el.tagName == "INPUT" || el.tagName == "TEXTAREA"){
            obj.apptype = $(this).data("type");
            obj.appFactorCode = $(this).data("appfactorid");
            obj.isPremCalFacotor = $(this).data("ispremcal");
            obj.appValue = $(this).data("value");
            obj.appShowValue = $(this).val();
            obj.conjuncDutyCode = $(this).data("conjuncdutycode");
        }
        appFactorInfo.push(obj);
    });
    var dutyInfo = [];
    $(".insurInfo").each(function(index, el){
        var obj = {};
        if(el.tagName == "SELECT"){
            obj.dutyNo = $(this).data("code");
            obj.amnt = $(this).find("option:selected").val();
            obj.showAmnt = $(this).find("option:selected").text();
            obj.prem = $(this).data("prem");
            obj.isPremCalFacotor = $(this).data("ispremcal");
        }else if(el.tagName == "INPUT" || el.tagName == "TEXTAREA"){
            obj.dutyNo = $(this).data("code");
            obj.amnt = $(this).data("value");
            obj.showAmnt = $(this).val();
            obj.prem = $(this).data("prem");
            obj.isPremCalFacotor = $(this).data("ispremcal");
        }
        dutyInfo.push(obj);
    });
    var data = {
        appFactorInfo:JSON.stringify(appFactorInfo),
        dutyInfo:JSON.stringify(dutyInfo)
    };
    */
    
	var data = 
	{
		"insurePrice":$("#insurePrice").val(),
		"amnt":$("#amnt").val(),
		"prem":$("#prem").val(),
		"age":getAgeByBirthDay($("#birthday").val()),
		"insuyear":$("#insuyear").find("option:selected").val(),
		"getyear":$("#getyear").find("option:selected").val(),
		"payendyear":$("#payendyear").find("option:selected").val()
		
//		"ishuanmian":$("#ishuanmian").find("option:selected").val()
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
    
    if ($("#insuredBirthday").val()!="" && $("#insuredBirthday").val()!=null) {
    	oObj["insuredAge"] = getAgeByBirthDay($("#insuredBirthday").val());
	}
    /*
    if ($("#insuredSex1").val()!="" && $("#insuredSex1").val()!=null) {
    	oObj["insuredSex"] = $("#insuredSex1").val();
	}
	*/
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
function calPrice()
{
	/*
	 * 各种校验，校验通过了，才进行保费计算
	 */
	if($("#productNo").val() == "16050" || $("#productNo").val() == "11010"){
		
		console.log($("#amnt").val())
		if($("#amnt").val()==null||$("#amnt").val()=="")
		{
			return;
		}
		
		if($("#relation").find("option:selected").val()==null ||$("#relation").find("option:selected").val()=="")
		{
			return;
		}
		if($("#relation").find("option:selected").val()=="00")
		{
			if($("#sex").val()==null||$("#sex").val()=="")
			{
				return;
			}
			
			if($("#birthday").val()==null||$("#birthday").val()=="")
			{
				return;
			}
		}else{
			if ($("#insuredBirthday").val()==null || $("#insuredBirthday").val()=="") 
			{
				return ;
			}
			if ($("#insuredSex").find("option:selected").val()==null
					|| $("#insuredSex").find("option:selected").val()=="") 
			{
				return ;
			}
		}
	}else if($("#productNo").val() == "14040" || $("#productNo").val() == "34010"){
		if($("#prem").val()==null||$("#prem").val()=="")
		{
			return;
		}
	}else{
	}
	
	if($("#insuyear").find("option:selected").val()==null
	 ||$("#insuyear").find("option:selected").val()=="")
	{
		return;
	}
	
	if($("#payendyear").find("option:selected").val()==null
	 ||$("#payendyear").find("option:selected").val()=="")
	{
		return;
	}
	
	
//	if($("#relation").find("option:selected").val()==null
//	 ||$("#relation").find("option:selected").val()=="")
//	{
//		return;
//	}
	
//	if($("#relation").find("option:selected").val()=="00")
//	{
//		if($("#sex").val()==null||$("#sex").val()=="")
//		{
//			return;
//		}
//		
//		if($("#birthday").val()==null||$("#birthday").val()=="")
//		{
//			return;
//		}
//	}
	console.log("getData()"+getData())
	sendPriceRequest("../../life/hq/getprice02.do",getData(),function (data) 
	{
    	var obj = JSON.parse(data);
    	console.log(obj);
    	if(obj.code == 0)
    	{
    		if ($("#productNo").val()=="16050" || $("#productNo").val()=="11010" || $("#productNo").val()=="12030") 
    		{
    			console.log(Number(obj.mainPrice).toFixed(2))
    			$("#mainPrice").val(obj.mainPrice);
        		
    			$("#insurePrice").html(Number(obj.insurePrice).toFixed(2));
				//$("#priceunit").html("元");
        		
    			$("#prem").val(Number(obj.mainPrice).toFixed(2));
			}
    		else if($("#productNo").val()=="17040")
			{
				$("#mainPrice").val(obj.mainPrice);
        		
				$("#insurePrice").html(Number(obj.insurePrice).toFixed(2));
				//$("#priceunit").html("元");
        		
				$("#prem").val(Number(obj.mainPrice).toFixed(2));
				$("#amnt").val(obj.amnt);
			}
			else
			{
				$("#mainPrice").val($("#prem").val());
//    		$("#hmPrice").val(obj.hmPrice);
				$("#amnt").val(obj.mainPrice);
				console.log($("#amnt").val());
				$("#insurePrice").html(Number(obj.insurePrice).toFixed(2));
				//$("#priceunit").html("元");
				$("#prem").val(Number(obj.shuru).toFixed(2));
			}
    		
    		var payendyear = $("#payendyear").find("option:selected").val();
			var paycount = 10;
			
			if(payendyear=="10Y")
			{
				paycount = 10;
			}
			else if(payendyear=="5Y")
			{
				paycount = 5;
			} 
			else if(payendyear=="15Y")
			{
				paycount = 15;
			} 
			else if(payendyear=="20Y")
			{
				paycount = 20;
			} 
			else if(payendyear=="30Y")
			{
				paycount = 30;
			} 
			else if(payendyear=="3Y")
			{
				paycount = 3;
			} 
			else
			{
				paycount = 1;
			}
			if (obj.insurePrice * paycount >=200000) {
				$("#ESView").show();
			}else{
				$("#ESView").hide();
			}
			
			if($("#productNo").val()=="14040")
    		{
				$("#amnt_dis").val(Number($('#prem').val()*paycount).toFixed(2));
    		}
			
//    		if($("#productNo").val()=="14040")
//    		{
//    			var payendyear = $("#payendyear").find("option:selected").val();
//    			
//    			var paycount = 10;
//    			
//    			if(payendyear=="10Y")
//    			{
//    				paycount = 10;
//    			}
//    			else if(payendyear=="5Y")
//    			{
//    				paycount = 5;
//    			} 
//    			else if(payendyear=="3Y")
//    			{
//    				paycount = 3;
//    			} 
//    			else
//    			{
//    				paycount = 1;
//    			}
//    			
//    			$("#amnt_dis").val(Number($('#prem').val()*paycount).toFixed(2));
//    			
//    			if (obj.insurePrice * paycount >=200000) {
//    				$("#ESView").show();
//				}else{
//					$("#ESView").hide();
//				}
//    		}
    	}
    	else
    	{
    		$(".pop").show();
            $(".mask").show();
            $(".pop span").text(obj.msg);
    	}
    },function(){});
	
	
	/*
	var getPriceUrl = path +"/prem/getProductPrem";
	if($("#productNo").val() == 410101020){
		getPriceUrl = path +"/prem/getGroupProductPrem";
	}
	sendPriceRequest(getPriceUrl,getData(),function (data) {
    	var obj = JSON.parse(data);
    	console.log(obj);
    	if(obj.code == 0){
    		$("#insurePrice").val(obj.data.totlePrem);
    		if($("#productNo").val() == 410101020){
    			for(var i in obj.data.insuredList){
    				$("."+i).find(".groupPrice").val(obj.data.insuredList[i]);
    			}
    		}
//    		if(obj.data.dutyFactorPremList){
//        		for(var i =0;i < obj.data.dutyFactorPremList.length;i++){
//        			 $(".infoList").find(".change_"+obj.data.dutyFactorPremList[i].dutyCode).val(obj.data.dutyFactorPremList[i].amnt)
//        		}
//    		}
    	}else{
    		if(obj.data.totlePrem != ""){
            	$(".pop").show();
            	$(".mask").show();
            	$(".pop span").text(obj.msg);
    		}
    	}
    },function(){});
    */
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
    /*sendAreaRequest(path + "/getAreaInfo", {
        productNo : $("#productNo").val(),
        parentId : "0"
    }, function (successData) {
        var data =  JSON.parse(successData).data;
        for (var i = 0; i < data.length; i++) {
            iosProvinces.push({
                id: data[i].id,
                value: data[i].codeName,
                parentId:data[i].parentId,
                codeValue:data[i].codeValue
            });
        }
    }, function (errorData) {});*/
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
                        })
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
    })
}
//银行地区
function getBankArea(id,bankCode){
    //ajax请求 默认发同步请求
	var comCode = $("#comCode").val();
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
    /*sendAreaRequest(path + "/pay/getBankAreaInfo", {
    	bankCode : bankCode,
        parentId : "0"
    }, function (successData) {
        var data =  JSON.parse(successData).data;
        for (var i = 0; i < data.length; i++) {
            iosProvinces.push({
            	id: data[i].areaNo,
                value: data[i].name,
                parentId:data[i].pAreaNo,
                codeValue:data[i].areaNo
            });
        }
    }, function (errorData) {});*/
    //这个对象处理关于市的读取
    this.cityObject = {
        selectedOneLevelId: {},
        iosCitys: [],
        refreshCitys: function (oneLevelId) {
            var _this = this;
            if (!(this.selectedOneLevelId[oneLevelId])) {
                this.selectedOneLevelId[oneLevelId] = true;
                //通过省id请求市
                sendAreaRequest(path + "/pay/getBankAreaInfo", {
                	bankCode : bankCode,
                    parentId : oneLevelId
                }, function (successData) {
                    var data =  JSON.parse(successData).data;
                    for (var i = 0; i < data.length; i++) {
                        _this.iosCitys.push({
                        	id: data[i].areaNo,
                            value: data[i].name,
                            parentId:data[i].pAreaNo,
                            codeValue:data[i].areaNo
                        });
                    }
                }, function (errorData) {});
            }
        }
    };
    //这个对象处理关于区的读取
    this.countyObject = {
        selectedTwoLevelId: {},
        iosCountys: [],
        refreshCountys: function (oneLevelId, twoLevelId) {
            var _this = this;
            if (!(this.selectedTwoLevelId[twoLevelId])) {
                this.selectedTwoLevelId[twoLevelId] = true;
                //通过市id请求区
                sendAreaRequest(path + "/pay/getBankAreaInfo", {
                	bankCode : bankCode,
                    parentId : twoLevelId
                }, function (successData) {
                    var data =  JSON.parse(successData).data;
                    for (var i = 0; i < data.length; i++) {
                        _this.iosCountys.push({
                        	id: data[i].areaNo,
                            value: data[i].name,
                            parentId:data[i].pAreaNo,
                            codeValue:data[i].areaNo
                        })
                    }
                }, function (errorData){});
            }
        }
    };
    var that = this;
    if(!window.num){
        window.num = 0;
    }
    var flag = num;
	num++;
    $("#"+id).on("click", function () {
    	if(flag < num-1){
    		return
    	};
        var oneLevelId = $("#newCar_price_lable").attr('data-province-code');
        var twoLevelId = $("#newCar_price_lable").attr('data-city-code');
        var threeLevelId = $("#newCar_price_lable").attr('data-district-code');
        var $this=$(this);
        if ($this.siblings("input")[0].value == 2){
            var iosSelect01 = new IosSelect01(2,
                [iosProvinces, that.cityObject.iosCitys],
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
                        getSubBank(path +"/pay/getSubBankInfo",{
                        	comCode:comCode,
                        	bankCode:bankCode,
                        	banksProvince:selectOneObj.codevalue,
                        	banksCity:selectTwoObj.codevalue
                        },function(data){
                        	var obj = JSON.parse(data);
                        	$("#accountSubBank").html('<option value="">请选择</option>');
                        	var htm = "";
                        	for(var i = 0;i < obj.data.length;i++){
                        		htm += '<option value="'+obj.data[i].bankNo+'">'+obj.data[i].bankName+'</option>';
                        	}
                        	$("#accountSubBank").append(htm);
                        	$("#accountSubBank").scroller('destroy').scroller($.extend({preset: 'select'}, {
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
                        },function(){})
                    }
                });
        }else{
            var iosSelect01 = new IosSelect01(3,
                [iosProvinces, that.cityObject.iosCitys, that.countyObject.iosCountys],
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
                    }
                });
        }
        $(".iosselect-box").on("touchmove",function(e){ 
            e.preventDefault();  
        });
    })
}
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
//checkbox选择去掉input盒子下面的边框
$(function(){
	$('#switch').on('click',function(){
		$(this).hasClass('turnOn')?$(this).parents('.dlSec').addClass('bottom-0'):$(this).parents('.dlSec').removeClass('bottom-0')
	})
});

//checkbox选择去掉input盒子下面的边框-end