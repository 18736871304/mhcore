$(function(){
	
	$("#insuyear").change(function()
	{
		if($("#insuyear").val()!= "106A")
		{
			$("#LifetimeOrRegularasis").attr("href","../../contract/ab/risk02/productDetail.html?risk=regularasis");
		}
		else
		{
			$("#LifetimeOrRegularasis").attr("href","../../contract/ab/risk02/productDetail.html");
		}
    });
	
	if ($("audio").length > 0) {
        $("audio").audioPlayer();
    };
	
    //下拉选择样式
    $("select").each(function(){
        $(this).scroller("destroy").scroller($.extend({preset:"select"},{
            theme:"android-ics light", 
            lang:"zh",
            //headerText:"请您选择",
            display:"bottom",
            rtl:true,
            inputClass:"tmp"
        }));
    });
	//fastclick
	FastClick.attach(document.body);
	//初始化滑动到对应机会
	setTimeout(function(){
		$(".planCon").animate({"scrollLeft":$(".active").position().left+"px"},"swing");
	}, 0);
	//展示责任要素内容
	$(".obligatioCon").click(function(){
		$(this).toggleClass("active");
		if($(this).hasClass("active")){
			$(".obligationText").slideUp();
			$(".obligatioCon").removeClass("active");
			$(this).addClass("active");
			$(this).siblings(".obligationText").slideDown("50");
		}else{
			$(this).siblings(".obligationText").slideUp("50");
		};
	});
	//滑动吸顶效果 改变标题样式
	$(document).scroll(function(event) {
		if($(this).scrollTop() > $(".featureDetailBox").offset().top){
			$(".featureDetail").css("position", "fixed");
		}else{
			$(".featureDetail").css("position", "static");
		};
		if($(this).scrollTop() > $(".faq").offset().top - $(".featureDetail").outerHeight()){
			$(".detailTitle").addClass("active");
			$(".featureTitle").removeClass("active");
		}else{
			$(".featureTitle").addClass("active");
			$(".detailTitle").removeClass("active");
		};
	});
	if($(this).scrollTop() > $(".faq").offset().top - $(".featureDetail").outerHeight()){
		$(".detailTitle").addClass("active");
		$(".featureTitle").removeClass("active");
	}else{
		$(".featureTitle").addClass("active");
		$(".detailTitle").removeClass("active");
	};
	$(".featureTitle").click(function(){
		$("html body").animate({"scrollTop":$(".featureDetailBox").offset().top+"px"},"swing");
	});
	$(".detailTitle").click(function(){
		$("html body").animate({"scrollTop":$(".faq").offset().top - $(".featureDetail").outerHeight()+1+"px"},"swing");
	});
	//控制弹出框
	$(".pop-sure").on("click",function(){
        $(".pop").hide();
        $(".mask").hide();
    });
	//计划切换
	$(".planCon a").each(function(){
 		if($(this).data("url")){
 			$(this).click(function(){
				$(this).addClass("active");
				$(this).siblings().removeClass("active");
 				var arg = "";
 				url.indexOf("?")>0?arg=url.substr(url.indexOf("?")):arg;
 				window.location.href = $(this).data("url")+arg;
 			})
 		}
 	})
	//点击效果
	clickResult(".noticeClause a");
	clickResult(".poster");
	clickResult(".buyButton");
	function clickResult(ele){
		$(ele).on("touchstart",function(){
			$(this).addClass("active");
		});
		$(ele).on("touchend",function(){
			$(this).removeClass("active");
		})
	}
	//进入页面加载图片
	setTimeout(function(){
		$("img").each(function(index, el) {
			$(this).attr("src", $(this).data("original"));
		});
	}, 0)
	
    
})

function newcontract()
{
	window.location.href = "../../life/hq/nc_hq.do";
}

function calprice()
{
	if($("#amnt").val()==null||$("#amnt").val()=="")
	{
		return;
	}
	
	if($("#age").find("option:selected").val()==null
	 ||$("#age").find("option:selected").val()=="")
	{
		return;
	}
	
	if($("#sex").find("option:selected").val()==null
     ||$("#sex").find("option:selected").val()=="")
	{
		return;
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
	
	var transdata = 
	{
		"riskcode":$("#riskcode").val(),
		"amnt":$("#amnt").val(),
		"age":$("#age").find("option:selected").val(),
		"sex":$("#sex").find("option:selected").val(),
		"insuyear":$("#insuyear").find("option:selected").val(),
		"payendyear":$("#payendyear").find("option:selected").val()
	};
	console.log(1111111)
	sendRequest("../../life/hq/getprice02.do",transdata,function (data) 
	{
		var obj = JSON.parse(data);
	   	console.log(obj);
	   	if(obj.code == '0')
	   	{
	   		$("#sumprem").val(obj.sumprem);
	   	}
	   	else
	   	{
	   		
	   	}
	},
	function(){});
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
};