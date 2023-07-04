$(function(){

    $("input[type = checkbox]").each(function () {
        $(this).on("click", function () {
            if ($(this).hasClass("unCheckBox")) {
                $(this).val("on");
                $(this).removeClass("unCheckBox").addClass("checkBox").prop("checked",true);
                $(this).parent().siblings("span").find("input[type = text]").hide().val("");
                // $(this).parent().parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
            } else {
                $(this).val("off");
                $(this).removeClass("checkBox").addClass("unCheckBox").prop("checked",false);
                $(this).parent().siblings("span").find("input[type = text]").show();
                // $(this).parent().parent().siblings(".errorMsg").css("display", "inline-block").text("请输入有效期或选择长期！");
            }
        });
    });

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
    //交强险点选
    $("#jqx_checkboxs").on("click", function () {
        if ($(this).hasClass("unCheckBox")) {
            $(".jqx").slideUp();
        }else{
            $(".jqx").slideDown();
        }
        reButton();
    });
    //车主、投保人、被保人修改
    $("#jqx_checkboxs1").on("click", function () {
        if ($(this).hasClass("unCheckBox")) {
            $(".jqx1").slideUp();
        }else{
            $(".jqx1").slideDown();
        }
    });
    //投保人
    $("#jqx_checkboxs2").on("click", function () {
        if ($(this).hasClass("unCheckBox")) {        	
        	$(".jqx2").slideDown();
        }else{
        	$(".jqx2").slideUp();
        	$("#appntName").val($("#ownerName").val());
        	$("#appntId").val($("#ownerIdNo").val());
        	$("#appntMobile").val($("#ownerMobile").val());
        }
    });
    //被保险人
    $("#jqx_checkboxs3").on("click", function () {
        if ($(this).hasClass("unCheckBox")) {
        	$(".jqx3").slideDown();
        }else{
        	 $(".jqx3").slideUp();
        	 $("#insuredName").val($("#ownerName").val());
         	$("#insuredIdNo").val($("#ownerIdNo").val());
         	$("#insuredMobile").val($("#ownerMobile").val());
        }
    });
    //商业险点选
    $("#syx_checkboxs").on("click", function () {
        if ($(this).hasClass("unCheckBox")) {
            $(".syz").slideUp();
        }else{
            $(".syz").slideDown();
        }
        reButton();
    });
    //机动车损失险点选
    $("#cov_200").on("click", function () {
        if ($(this).hasClass("unCheckBox")) {
            $("#cov_200_v").hide();
            $("#cov_200_v_none").show();
        }else{
            $("#cov_200_v").show();
            $("#cov_200_v_none").hide();
        }
        reButton();
    });
    //全车盗抢险点选
    $("#cov_500").on("click", function () {
        if ($(this).hasClass("unCheckBox")) {
            $("#cov_500_v").hide();
            $("#cov_500_v_none").show();
        }else{
            $("#cov_500_v").show();
            $("#cov_500_v_none").hide();
        }
        reButton();
    });
    //自燃损失险
    $("#cov_310").on("click", function () {
        if ($(this).hasClass("unCheckBox")) {
            $("#cov_310_v").html("不投保");
        }else{
            $("#cov_310_v").html("投保");
        }
        reButton();
    });
    //指定专修厂
    $("#cov_321").on("click", function () {
        if ($(this).hasClass("unCheckBox")) {
            $("#cov_321_v").html("不投保");
        }else{
            $("#cov_321_v").html("投保");
        }
        reButton();
    });
    //发动机涉水险
    $("#cov_291").on("click", function () {
        if ($(this).hasClass("unCheckBox")) {
            $("#cov_291_v").html("不投保");
        }else{
            $("#cov_291_v").html("投保");
        }
        reButton();
    });
    //精神损害险
    $("#cov_640").on("click", function () {
        if ($(this).hasClass("unCheckBox")) {
            $("#cov_640_v").html("不投保");
        }else{
            $("#cov_640_v").html("投保");
        }
        reButton();
    });
    //无法找到第三方险
    $("#cov_733").on("click", function () {
        if ($(this).hasClass("unCheckBox")) {
            $("#cov_733_v").html("不投保");
        }else{
            $("#cov_733_v").html("投保");
        }
        reButton();
    });
    //修理期间费用补偿险
    $("#cov_734").on("click", function () {
        if ($(this).hasClass("unCheckBox")) {
            $("#cov_734_v").html("不投保");
            $("#xlq_bcx").hide();
        }else{
            $("#cov_734_v").html("投保");
        }
        reButton();
    });
    //新增设备损失险
    $("#cov_650").on("click", function () {
        if ($(this).hasClass("unCheckBox")) {
            $("#cov_650_v").html("不投保");
            $("#xzsb_ssx").hide();
        }else{
            $("#cov_650_v").html("投保");
        }
        reButton();
    });
    //机动车第三者责任保险法定节假日限额翻倍险
    $("#cov_666").on("click", function () {
        if ($(this).hasClass("unCheckBox")) {
            $("#cov_666_v").html("不投保");
        }else{
            $("#cov_666_v").html("投保");
        }
        reButton();
    });
    //修理期间费用补偿险编辑效果
    $("#xlq").on("click", function () {
        $("#xlq_bcx").show();
        reButton();
    });
    //新增设备损失险编辑效果
    $("#xzsb").on("click", function () {
        $("#xzsb_ssx").show();
        reButton();
    });
  //电子邮箱校验
    $("#appntMail").on("blur", function () {
        checkEmail($(this));
        if (checkEmail($(this))){
            $("#appntMail").val($(this).val()).parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
        }
        else{
            $("#appntMail").val($(this).val());
        }
    });
    $("#invoiceTitle").on("blur", function () {
    	checkEasy($(this));
    	if (checkEasy($(this))){
            $("#invoiceTitle").val($(this).val()).parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
        }
        else{
            $("#invoiceTitle").val($(this).val());
        }
	    
    });
    //确认报价
    $("#sureToSave").on("click", function (){
    	 if(!checktiao()) return;
         fm.submit();
        if(checktiao()){
        	 document.getElementById("fm").action = "../../car/sunCar/sun_04.do";
             $('#fm').submit();
             $(".loading").show();
         }
      
       
    })

    //重新报价
    $("#sureReSave").on("click", function (){
        // if(!checkAll()) return;
        // fm.submit();
        document.getElementById("fm").action = "../../car/sunCar/sun_03.do";
        $('#fm').submit();
        toButton();
    })

});
function checktiao() {
    var flag = true;
    //注册登记日期
    if ($("#insudate").length>0) {
        if (!checkEasy($("#insudate"))) {
            flag = false;
        }
    }
    
    
    //发票抬头
    if ($("#invoiceTitle").length>0) {
        if (!checkEasy($("#invoiceTitle"))) {
            flag = false;
        }
    }
    //邮箱
    if(!checkEmail($("#appntMail"))){
        flag = false;
    }
    if (!flag) return;

    return true;
}

function reButton(){
    $("#toSave").hide();
    $("#reSave").show();
}

function toButton(){
    $("#reSave").hide();
    $("#toSave").show();
}