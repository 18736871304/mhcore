$(document).ready(function() {
	$(".btn button").click(function(){
		$(this).siblings("button").removeClass("active");
		$(this).addClass("active");
	});
	$(".pop-sure").on("click",function(){
        $(".pop").hide();
        $(".mask").hide();
    });
    $(".inconformity").click(function(){
        $(".pop").show();
        $(".mask").show();
    	$(".pop span").text("对不起，您的健康状况不符合本产品的要求，不能投保本产品！");
    });
    console.log("coincidence")
    $(".coincidence").click(function(){
    	sendRequest("../../life/xintai/toldinfo_save.do",{},function(data)
    	{
    		var obj = JSON.parse(data);
    		console.log(obj);
        	if(obj.code == 0)
        	{
        		window.location.href = "../../life/xintai/xt_jkwy_03.do?payendyear="+$("#payendyear").val()+"&addinsureyear="+$("#addinsureyear").val()+"&productNo="+$("#productNo").val()+"&ishuomian="+$("#ishuomian").val()+"&amnt="+$("#amnt").val()+"&age="+$("#age").val()+"&prem="+$("#prem").val()
            }else{
            	$(".pop").show();
            	$(".mask").show();
            	$(".pop span").text(obj.msg);
            }
    	},function(){})
    	
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