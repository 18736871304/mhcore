/**
 * creater:duqian
 * create time:2018/06/14
 * describe：保单js资源
 **/

//tab选项卡切换
var itemIndex = 0;
var tab1LoadEnd = false;
var tab2LoadEnd = false;
var tab3LoadEnd = false;
var tab4LoadEnd = false;
$(".js_live_tab li").click(function() {
	var $this = $(this);
	itemIndex = $this.index();
	tabEvent($this);

	// 如果选中有效
	if(itemIndex == '0') {
		// 如果数据没有加载完
		if(!tab1LoadEnd) {
			// 解锁
			dropload.unlock();
			dropload.noData(false);
		} else {
			// 锁定
			dropload.lock('down');
			dropload.noData();
		}
		// 如果选中可终止
	} else if(itemIndex == '1') {
		if(!tab2LoadEnd) {
			// 解锁
			dropload.unlock();
			dropload.noData(false);
		} else {
			// 锁定
			dropload.lock('down');
			dropload.noData();
		}
		// 如果选中可续保
	} else if(itemIndex == '2') {
		// 如果数据没有加载完
		if(!tab3LoadEnd) {
			// 解锁
			dropload.unlock();
			dropload.noData(false);
		} else {
			// 锁定
			dropload.lock('down');
			dropload.noData();
		}
		// 如果选中待处理
	} else if(itemIndex == '3') {
		if(!tab4LoadEnd) {
			// 解锁
			dropload.unlock();
			dropload.noData(false);
		} else {
			// 锁定
			dropload.lock('down');
			dropload.noData();
		}
	}
	// 重置
	dropload.resetload();
})

/*
var counter = 0,
	counter1 = 0,
	counter2 = 0,
	counter3 = 0;
// 每页展示4个
var num = 10;
var pageStart = 0,
	pageEnd = 0,
	pageStart1 = 0,
	pageEnd1 = 0,
	pageStart2 = 0,
	pageEnd2 = 0,
	pageStart3 = 0,
	pageEnd3 = 0;
*/


function sendRequest(url, data, success, error) 
{
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


var pagelength = 200;
var pagecount1 = 0;
var pagecount2 = 0;
var pagecount3 = 0;
var pagecount4 = 0;

// dropload
var dropload = $('.js_tabbody').dropload({
	scrollArea: window,
	loadDownFn: function(me) {
		// 加载有效的数据
		
		//0代表保障中的数据
		if(itemIndex == '0') 
		{
			var policydata = 
			{
				"pagecount":pagecount1,
				"pagelength":pagelength,
				"querytype":'01'
			};
			
			sendRequest("../../life/common/getPolicyList.do", policydata, function(data) 
			{
				var result = '';
				
				var obj = JSON.parse(data);
				console.log(obj);
				
				if(obj.length!=0)
				{
					for(var i=0;i<obj.length;i++)
					{
						result += '<li class="row d_boxSz">' 
						         +'<a href="../../life/common/policyDetail.do?orderid='+obj[i].orderid+'&insuredid='+obj[i].insuredserialno+'">' 
						         +'<div class="title">' + obj[i].riskname + '</div>' 
						         +'<i class="protection"></i>' 
						         +'<p class="name">被保人：<span>' + obj[i].name + '</span></p>' 
						         +'<p class="time">保障期限：<span>' + obj[i].insuyearStr + '</span></p>' 
						         +'</a></li>';
					}
					
					pagecount1 = pagecount1 + obj.length;
					
					if(pagelength>obj.length)
					{
						// 数据加载完
						tab1LoadEnd = true;
						// 锁定
						me.lock();
						// 无数据
						me.noData();
					}
					
					$('.js_live_tablist').eq(itemIndex).find("ul").append(result);
					// 每次数据加载完，必须重置
					me.resetload();
				}
				else
				{
					// 数据加载完
					tab1LoadEnd = true;
					// 锁定
					me.lock();
					// 无数据
					me.noData();
				}
			}, 
			function() 
			{
				// 即使加载出错，也得重置
				me.resetload();
			});
		}
		else if(itemIndex == '1') 
		{
			// 数据加载完
			tab1LoadEnd = true;
			// 锁定
			me.lock();
			// 无数据
			me.noData();
			
			me.resetload();
		} 
		else if(itemIndex == '2') 
		{
			var policydata = 
			{
				"pagecount":pagecount3,
				"pagelength":pagelength,
				"querytype":'03'
			};
			
			sendRequest("../../life/common/getPolicyList.do", policydata, function(data) 
			{
				var result = '';
				
				var obj = JSON.parse(data);
				console.log(obj);
				
				if(obj.length!=0)
				{
					for(var i=0;i<obj.length;i++)
					{
						result += '<li class="row d_boxSz">' 
						         +'<a href="../../life/common/policyDetail.do?orderid='+obj[i].orderid+'&insuredid='+obj[i].insuredserialno+'">' 
						         +'<div class="title">' + obj[i].riskname + '</div>' 
						         +'<i class="renewal"></i>' 
						         +'<p class="name">被保人：<span>' + obj[i].name + '</span></p>' 
						         +'<p class="time">保障期限：<span>' + obj[i].insuyearStr + '</span></p>' 
						         +'</a></li>';
					}
					
					pagecount3 = pagecount3 + obj.length;
					
					if(pagelength>obj.length)
					{
						// 数据加载完
						tab3LoadEnd = true;
						// 锁定
						me.lock();
						// 无数据
						me.noData();
					}
					
					$('.js_live_tablist').eq(itemIndex).find("ul").append(result);
					// 每次数据加载完，必须重置
					me.resetload();
				}
				else
				{
					// 数据加载完
					tab3LoadEnd = true;
					// 锁定
					me.lock();
					// 无数据
					me.noData();
				}
			}, 
			function() 
			{
				// 即使加载出错，也得重置
				me.resetload();
			});
		} 
		else if(itemIndex == '3') 
		{
			var policydata = 
			{
				"pagecount":pagecount4,
				"pagelength":pagelength,
				"querytype":'04'
			};
			
			sendRequest("../../life/common/getPolicyList.do", policydata, function(data) 
			{
				var result = '';
				
				var obj = JSON.parse(data);
				console.log(obj);
				
				if(obj.length!=0)
				{
					for(var i=0;i<obj.length;i++)
					{
						result += '<li class="row d_boxSz">' 
						         +'<a href="../../life/common/policyDetail.do?orderid='+obj[i].orderid+'&insuredid='+obj[i].insuredserialno+'">' 
						         +'<div class="title">' + obj[i].riskname + '</div>' 
						         +'<i class="failure"></i>' 
						         +'<p class="name">被保人：<span>' + obj[i].name + '</span></p>' 
						         +'<p class="time">保障期限：<span>' + obj[i].insuyearStr + '</span></p>' 
						         +'</a></li>';
					}
					
					pagecount4 = pagecount4 + obj.length;
					
					if(pagelength>obj.length)
					{
						// 数据加载完
						tab4LoadEnd = true;
						// 锁定
						me.lock();
						// 无数据
						me.noData();
					}
					
					$('.js_live_tablist').eq(itemIndex).find("ul").append(result);
					// 每次数据加载完，必须重置
					me.resetload();
				}
				else
				{
					// 数据加载完
					tab4LoadEnd = true;
					// 锁定
					me.lock();
					// 无数据
					me.noData();
				}
			}, 
			function() 
			{
				// 即使加载出错，也得重置
				me.resetload();
			});
		}
	}
});