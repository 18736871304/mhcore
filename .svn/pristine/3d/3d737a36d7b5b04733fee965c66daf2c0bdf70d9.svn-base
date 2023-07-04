$(function () {
    //显示隐藏订单详情
    $(".order").on("click", function () {
        if ($(this).find("span").hasClass("hideOrder")) {
            $(".info").slideDown();
            $(this).find("span").removeClass("hideOrder").addClass("showOrder").text("隐藏订单详情 ");
        } else {
            $(".info").slideUp();
            $(this).find("span").removeClass("showOrder").addClass("hideOrder").text("显示订单详情 ");
        }
    });
    //滚动到一定位置固定
    $(window).scroll(function (event) {
        var headerHeight = $(".header").height(),
            scrollTop = $(window).scrollTop(),
            orderHeight = $(".order").height();
        if (scrollTop > headerHeight) {
            $(".order").addClass("orderFixed borBot1");
            $(".info").addClass("paddingTop");
        } else {
            $(".order").removeClass("orderFixed borBot1");
            $(".info").removeClass("paddingTop");
        }
    });
    
    /** 验证码 **/
	$(".gainCode").on("click", function() {
		
		sendRequest("../../life/hq/sendSmsCode.do",{"orderNo":$("#orderNo").val()},function(data)
		        {
		        	var obj = JSON.parse(data);
		            console.log(obj);
		            $("#serialNo").val(obj.serialNo);
	            	$(".pop").show();
	            	$(".mask").show();
	            	$(".pop span").text(obj.msg);
		        },function(){})
		
	});
    
    //支付方式选择
    $(".payMethod").each(function () {
        $(this).on("click", function () {
            $(this).find("i").removeClass("unCheckBox").addClass("checkBox");
            $(this).siblings("dl").find("i").removeClass("checkBox").addClass("unCheckBox");
            $(this).find("i").siblings("input").prop("checked",true);
        })
    });
    $("input[name='payType']").each(function(){
        if($(this).prop("checked")){
            $(this).siblings("i").removeClass("unCheckBox").addClass("checkBox");
            console.log($(this).val())
        }else{
            $(this).siblings("i").removeClass("checkBox").addClass("unCheckBox");
        }
    });
    //是否阅读投保声明
    $("#whetherCheck").on("click", function () {
        if ($(this).hasClass("unCheckBox")) {
            $(this).removeClass("unCheckBox").addClass("checkBox");
        } else {
            $(this).removeClass("checkBox").addClass("unCheckBox");
        }
    });
    //弹窗
    $(".pop-sure").on("click",function(){
        $(".pop").hide();
        $(".mask").hide();
    });

    //关闭二维码
    $(".closeQrcodeBtn").click(function(){
    	$(".qrcodeMask").hide();
    	$(".qrcodeMask canvas").remove();
    	clearInterval(window.timer);
    })

    //点击立即支付时校验是否勾选
    $(".insureBtn").on("click", function () 
    {
        // if($("#serialNo").val()==null || $("#serialNo").val()== ""){
    		// $(".pop").show();
         //    $(".mask").show();
         //    $(".pop span").text("请点击获取验证码");
		// 	return;
        // }
        // if($("#smscode").val()==null || $("#smscode").val()=="")
		// {
		// 	$(".pop").show();
         //    $(".mask").show();
         //    $(".pop span").text("请输入验证码");
		// 	return;
		// }
        var repayjson = $("#repayjson").val();

        if (!$("#whetherCheck").hasClass("checkBox")) 
        {
            $(".pop").show().find("span").html("请认真阅读《银行转账授权声明书》并勾选同意上述协议规定！");
            $(".mask").show();
            return;
        }

        WeixinJSBridge.invoke('getBrandWCPayRequest',repayjson,function(res)
        {

            if(res.err_msg == 'get_brand_wcpay_request:ok')
            {
                window.location.href = "../../life/hezhong/pageback.do?orderNo="+$("#orderNo").val();
            }
            else
            {
                $(".pop").show();
                $(".mask").show();
                $(".pop span").text("没有支付成功，请重试");
            }
        });

    });
    //承保按钮
    $(".gainCodeOne").click(function() {
        sendRequest("../../life/hz/underwriting.do",
            {"orderNo":$("#orderNo").val(),
            "sumprem":$("#sumprem").val(),
            "insuame":$("#insuame").val(),
            "insuidno":$("#insuidno").val()},
            function (data) {
                console.log(data);
                var obj = JSON.parse(data);
                if(obj.code == 0){
                    // var orderNo = obj.orderNo;
                    // var riskcode= obj.riskcode;
                    // window.location.href = "../../life/common/policy_success.do?orderNo="+$("#orderNo").val();
                }else{
                    $(".pop").show();
                    $(".mask").show();
                    $(".pop span").text(obj.msg);
                }
        },function(){});
    });
    //点击修改回退
    $(".modify").on("click", function () {
    	goBack();
    });
});

//历史回退
function goBack() {
	window.location.href = "../../life/ab/modifycontract.do?orderNo="+$("#orderNo").val();
}
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
