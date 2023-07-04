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

    /*
    $(".whetherRead a").on("click", function () {
        $("html,body").css({"position":"fixed","top":"0","height":"100%"});
        $(".cover .declareContent h2").text($(this).text());
        $("#declareCover .declare_"+$(this).data("declare")).show();
        $("#declareCover .declare_"+$(this).data("declare")).siblings(".declareContent").hide();
        $("#declareCover").fadeIn();
    });
    $("#declareCover .closeBtn").on("click", function () {
        $("html,body").css({"position":"relative","top":"0","height":"auto"});
        $("html body").scrollTop($("html body").height());
        $("#declareCover").fadeOut();
    });
    */
    //关闭二维码
    $(".closeQrcodeBtn").click(function(){
    	$(".qrcodeMask").hide();
    	$(".qrcodeMask canvas").remove();
    	clearInterval(window.timer);
    })
    /*$("#noticeLink").on("click", function () {
        $("html,body").css({"position":"fixed","top":"0","height":"100%"});
        $("#noticeCover").fadeIn();
    });
    $("#noticeCover .closeBtn").on("click", function () {
        $("html,body").css({"position":"relative","top":"0","height":"auto"});
        $("html body").scrollTop($("html body").height());
        $("#noticeCover").fadeOut();
    });
    $("#tipBookLink").on("click", function () {
        $("html,body").css({"position":"fixed","top":"0","height":"100%"});
        $("#tipBookCover").fadeIn();
    });
    $("#tipBookCover .closeBtn").on("click", function () {
        $("html,body").css({"position":"relative","top":"0","height":"auto"});
        $("html body").scrollTop($("html body").height());
        $("#tipBookCover").fadeOut();
    });*/
    //点击立即支付时校验是否勾选
    $(".insureBtn").on("click", function () 
    {
        if (!$("#whetherCheck").hasClass("checkBox")) 
        {
            $(".pop").show().find("span").html("请认真阅读《扣款知情通知书》并勾选同意上述协议规定！");
            $(".mask").show();
            return;
        }
        
        sendRequest("../../life/abz/contractpay_save.do",{"orderNo":$("#orderNo").val()},function(data)
        {
        	var obj = JSON.parse(data);
            console.log(obj);
            if(obj.code == 0){
            	//var orderNo = obj.orderNo;
            	//window.location.href = "../../life/common/queryList.do";
            	window.location.href = "../../life/common/policy_success.do?orderNo="+$("#orderNo").val();
            }else{
            	$(".pop").show();
            	$(".mask").show();
            	$(".pop span").text(obj.msg);
            }
        },function(){})
        
        //提交form表单
        //$(".loading").show();
        //$("#payTypeForm").submit();
    });
    //点击修改回退
    $(".modify").on("click", function () {
    	goBack();
    });
});

//历史回退
function goBack() {
	window.location.href = "../../life/abz/modifycontract.do?orderNo="+$("#orderNo").val();
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
