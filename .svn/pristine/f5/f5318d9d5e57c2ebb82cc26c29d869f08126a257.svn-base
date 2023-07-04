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
    	window.location.href = "../../life/zhongan_h/dis_zxes2020_uw.do";
    });
    
    $(".coincidence").click(function()
    {
    	window.location.href = "../../life/zhongan_h/dis_zxes2020_03.do"
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