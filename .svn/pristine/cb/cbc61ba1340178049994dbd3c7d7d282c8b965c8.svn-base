$(document).ready(function() {
	$(".btn button").click(function(){
		$(this).siblings("button").removeClass("active");
		$(this).addClass("active");
	});
	$(".pop-sure").on("click",function(){
        $(".pop").hide();
        $(".mask").hide();
    });
    $(".inconformity").click(function()
    {
    	$(".pop").show();
        $(".mask").show();
    	$(".pop span").text("对不起，您的健康状况不符合本产品的要求，不能投保本产品！");
    });
    
    $(".coincidence").click(function()
    {
    	if($("#riskCode").val()=="511505_yue")
    	{
    		window.location.href = "../../life/hongkang/nc_hongkang_dla_qj_yue_03.do?amnt="+$("#amnt").val()+"&prem="+$("#prem").val()
			+"&payendyear="+$("#payendyear").val()+"&insuyear="+$("#insuyear").val()+"&payintv="+$("#payintv").val()
			+"&iszjyl="+$("#iszjyl").val()+"&isexzl="+$("#isexzl").val()+"&isdbbjb="+$("#isdbbjb").val()
    	}
    	if($("#riskCode").val()=="511505_nian")
    	{
    		window.location.href = "../../life/hongkang/nc_hongkang_dla_qj_nian_03.do?amnt="+$("#amnt").val()+"&prem="+$("#prem").val()
			+"&payendyear="+$("#payendyear").val()+"&insuyear="+$("#insuyear").val()+"&payintv="+$("#payintv").val()
			+"&iszjyl="+$("#iszjyl").val()+"&isexzl="+$("#isexzl").val()+"&isdbbjb="+$("#isdbbjb").val()
    	}
    	else if($("#riskCode").val()=="hongkang000015_yue")
    	{
    		window.location.href = "../../life/hongkang/nc_hongkang_abz_yue_03.do?amnt="+$("#amnt").val()+"&prem="+$("#prem").val()
			+"&payendyear="+$("#payendyear").val()+"&insuyear="+$("#insuyear").val()+"&payintv="+$("#payintv").val()
			+"&isabzkx="+$("#isabzkx").val()
    	}
    	else if($("#riskCode").val()=="hongkang000015_nian")
    	{
    		window.location.href = "../../life/hongkang/nc_hongkang_abz_nian_03.do?amnt="+$("#amnt").val()+"&prem="+$("#prem").val()
			+"&payendyear="+$("#payendyear").val()+"&insuyear="+$("#insuyear").val()+"&payintv="+$("#payintv").val()
			+"&isabzkx="+$("#isabzkx").val()
    	}
    });
    
});
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