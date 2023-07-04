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
    	window.location.href = "../../life/fxlhjk/toldinfo01.do?riskcode="+$("#riskCode").val()
    	+"&productplan="+$("#productplan").val()
    });
    
    $(".coincidence").click(function()
    {
    	if($("#riskCode").val()=="110048")
    	{
    		window.location.href = "../../life/fxlhjk/nc_fuxing_jbb_03.do?payendyear="+$("#payendyear").val()
			+"&insuyear="+$("#insuyear").val()
			+"&amnt="+$("#amnt").val()
			+"&prem="+$("#prem").val()
			+"&ishuomian="+$("#ishuomian").val()
			+"&iszl="+$("#iszl").val()
    	}
    	else if($("#riskCode").val()=="110025")
    	{
    		window.location.href = "../../life/fxlhjk/nc_fuxing_klysc_03.do?payendyear="+$("#payendyear").val()
			+"&insuyear="+$("#insuyear").val()
			+"&amnt="+$("#amnt").val()
			+"&prem="+$("#prem").val()
			+"&ishuomian="+$("#ishuomian").val()
    	}
    	else if($("#riskCode").val()=="110058")
    	{
    		window.location.href = "../../life/fxlhjk/nc_fuxing_klys2009_03.do?payendyear="+$("#payendyear").val()
			+"&insuyear="+$("#insuyear").val()
			+"&amnt="+$("#amnt").val()
			+"&prem="+$("#prem").val()
			+"&issecond="+$("#issecond").val()
    	}
    	else if($("#riskCode").val()=="110049")
    	{
    		window.location.href = "../../life/fxlhjk/nc_fuxing_ysyh_03.do?prem="+$("#prem").val();
    	}
    	else if($("#riskCode").val()=="110068")
    	{
    		window.location.href = "../../life/fxlhjk/nc_fuxing_cybao_03.do?prem="+$("#prem").val()
    		+"&productplan="+$("#productplan").val()
    		+"&hassocialinsurance="+$("#hassocialinsurance").val()
    	}
    	else if($("#riskCode").val()=="110084")
    	{
    		if($("#productplan").val()=="01")
    		{
    			window.location.href = "../../life/fxlhjk/nc_fuxing_cybao2020_03.do?prem="+$("#prem").val()
        		+"&hassocialinsurance="+$("#hassocialinsurance").val()
        		+"&isshaoer="+$("#isshaoer").val()
    		}
    		else
    		{
    			window.location.href = "../../life/fxlhjk/nc_fuxing_cybao2020_plus_03.do?prem="+$("#prem").val()
        		+"&hassocialinsurance="+$("#hassocialinsurance").val()
        		+"&isshaoer="+$("#isshaoer").val()
    		}
    	}
    	else
    	{
    		window.location.href = "../../life/fxlhjk/nc_fuxing_klysc_03.do?payendyear="+$("#payendyear").val()
			+"&insuyear="+$("#insuyear").val()
			+"&amnt="+$("#amnt").val()
			+"&prem="+$("#prem").val()
			+"&ishuomian="+$("#ishuomian").val()	
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