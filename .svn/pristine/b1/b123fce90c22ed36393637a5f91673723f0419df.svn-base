$(function(){
	//客服弹层
	$(".kf_p").on('click', function() {
		$("#prompt").show();
		$(".js_kf_prpmpt").show();
	})
	$(".js_kf_close").on('click', function() {
		$("#prompt").hide();
		$(".js_kf_prpmpt").hide();
	})
	
	$('.dlSec').click(function(){
		setTimeout(function(){
			$('.layer').css({
				'position':'absolute',
				'bottom': '0px'
			});
		},100);
	});
	$('.hq-mask').click(function(){
    	$('.hq-mask,.trialCon').css('display','none');
    });
	/* 导航悬浮  */
	//判断导航栏是否在原来位置上的标志，初始为false
	var test = false;
	var canrun=true;
	var navHeight = $('#nav').height();
	function scrollHandle(event){
		event.preventDefault();
		//获取当前位置到窗口顶部的高度
			var h_num = $(window).scrollTop();
			var h_height = $('.banner_wrapper').height();
		if(h_num > h_height){//当当前高度大于导航条到窗口顶部高度
	    	//切换导航条的类名为固定后的类名
			$('.product_nav').addClass('fixer');
			//当导航条的position变成了fixed后，原来的位置会变空，需要在原位置增加个占位div
			if(!test){
				var stayPos = document.createElement("div");
				stayPos.id= "stayPosDiv";
				stayPos.style.height = "2.35rem";//导航条的高度
				var temp = document.getElementById("nav");
				temp.appendChild(stayPos);
				test=true;
			}
		}else{
			//如果回到导航条原位置之前则替换回原来的类名
			$('.product_nav').removeClass('fixer');
			if(test){//移除占位div
				var temp = document.getElementById("nav");
				temp.removeChild(stayPosDiv);
				test = false;
			}
		}
	    var hNum = Number(h_num);
	    var height1 = $('#nav1').offset().top - navHeight;
	    var height11 = height1 - navHeight;
	    var height2 = $('#nav2').offset().top - navHeight;
	    var height22 = height2 - navHeight;
	    var height3 = $('#nav3').offset().top - navHeight;
	    var height33 = height3 - navHeight;
	    var height4 = $('#nav4').offset().top - navHeight;
	    var height44 = height4 - navHeight;
	    if(hNum > height11 && h_num < height22){
	        $('.product_nav a').removeClass('active_nav');
	        $('.product_nav a').eq(0).addClass('active_nav');
	    }else if(hNum > height22 && h_num < height33){
	        $('.product_nav a').removeClass('active_nav');
	        $('.product_nav a').eq(1).addClass('active_nav');
	    }else if(hNum > height33 && h_num < height44){
	        $('.product_nav a').removeClass('active_nav');
	        $('.product_nav a').eq(2).addClass('active_nav');
	    }else if(hNum > height44){
	        $('.product_nav a').removeClass('active_nav');
	        $('.product_nav a').eq(3).addClass('active_nav');
	    }
	}
	$(window).on('scroll', function(event) {scrollHandle(event)});
	$('.product_nav a').click(function(){
		$('.product_nav').addClass('fixer')
		$(window).off('scroll')
		$('.product_nav a').removeClass('active_nav');
		$(this).addClass('active_nav');
		var index = $(this).index();
		$('.product_nav a').eq(index).addClass('active_nav');
		if(index == 0){
	     $('body,html').scrollTop($('#nav1').offset().top - navHeight);
		}else if(index == 1){
	 		$('body,html').scrollTop($('#nav2').offset().top - navHeight);
		}else if(index == 2){
	    	$('body,html').scrollTop($('#nav3').offset().top - navHeight);
	  	}else if(index == 3){
	     	$('body,html').scrollTop($('#nav4').offset().top - navHeight);
		}
		setTimeout(function(){
			$(window).on('scroll', function(event) {scrollHandle(event)});
		},100)
		
	});
	$('.spanOne').click(function(){
	    $(this).css({
	        'background': '#0daeff',
	    	'color': '#ffffff'
		});
	    $('.spanTwo').css({
	        'background': 'none',
	        'color': '#333'
	    });
	});
	$('.spanTwo').click(function(){
	    $(this).css({
	        'background': '#EE6363',
	        'color': '#ffffff'
	    });
	    $('.spanOne').css({
	        'background': 'none',
	        'color': '#333'
	    });
	});
});