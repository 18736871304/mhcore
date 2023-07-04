/**
 * creater:duqian
 * create time:2018/06/19
 * describe：保险产品列表js资源
 **/

//tab选项卡切换
var itemIndex = 0;
var tab1LoadEnd = false;
var tab2LoadEnd = false;
var tab3LoadEnd = false;
var tab4LoadEnd = false;
var tab5LoadEnd = false;
var tab6LoadEnd = false;
$(".js_live_tab li").click(function() {
	var $this = $(this);
	itemIndex = $this.index();
	tabEvent($this);

	// 如果选中意外
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
		// 如果选中医疗
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
		// 如果选中重疾
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
		// 如果选中寿险
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
		// 如果选中年金
	} else if(itemIndex == '4') {
		// 如果数据没有加载完
		if(!tab5LoadEnd) {
			// 解锁
			dropload.unlock();
			dropload.noData(false);
		} else {
			// 锁定
			dropload.lock('down');
			dropload.noData();
		}
		// 如果选中其他
	} else if(itemIndex == '5') {
		if(!tab6LoadEnd) {
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

var pagelength = 10;
var pagecount0 = 0;
var pagecount1 = 0;
var pagecount2 = 0;
var pagecount3 = 0;
var pagecount4 = 0;
var pagecount5 = 0;
var pagecount6 = 0;

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
                    "pagecount":pagecount0,
                    "pagelength":pagelength,
                    "querytype":'01'
                };

            sendRequest("../../staff/getStaffProductList.do", policydata, function(data)
                {
                    var result = '';

                    var obj = JSON.parse(data);
                    console.log(obj);
                    if(obj.length>0)
                    {
                        for(var i=0;i<obj.length;i++)
                        {
                            result += '<li class="row d_boxSz">' ;
                            console.log(obj[i].url.indexOf('http'));
                                if(obj[i].url.indexOf('http') != 0 ){
                                    result += '<a class="d_boxSz" href="\.' + obj[i].url + '">';
                                }else{
                                    result += '<a class="d_boxSz" href="' + obj[i].url + '">';
                                }
                            result += '<div class="title">' + obj[i].title + '</div>' +
                                '<p class="explain">' + obj[i].description+ '</p>';
                                if(obj[i].prem == '在线报价'){
                                    result += '<div class="pricebox"><p class="price"><span>在线报价</span></p></div>';
                                }else{
                                    result += '<div class="pricebox"><p class="price"><span>' + obj[i].prem + '</span>元/年</p>起</div>';
                                }
                            result += '<img class="icon_img" src="' + obj[i].logo + '\"></img>'+
                                '</a></li>';
                        }

                        pagecount0 = pagecount0 + obj.length;

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
            var policydata =
                {
                    "pagecount":pagecount1,
                    "pagelength":pagelength,
                    "querytype":'02'
                };

            sendRequest("../../staff/getStaffProductList.do", policydata, function(data)
                {
                    var result = '';

                    var obj = JSON.parse(data);
                    console.log(obj);
                    if(obj.length>0)
                    {
                        for(var i=0;i<obj.length;i++)
                        {
                            result += '<li class="row d_boxSz">' ;
                            console.log(obj[i].url.indexOf('http'));
                                if(obj[i].url.indexOf('http') != 0 ){
                                    result += '<a class="d_boxSz" href="\.' + obj[i].url + '">';
                                }else{
                                    result += '<a class="d_boxSz" href="' + obj[i].url + '">';
                                }
                            result += '<div class="title">' + obj[i].title + '</div>' +
                                '<p class="explain">' + obj[i].description+ '</p>';
                                if(obj[i].prem == '在线报价'){
                                    result += '<div class="pricebox"><p class="price"><span>在线报价</span></p></div>';
                                }else{
                                    result += '<div class="pricebox"><p class="price"><span>' + obj[i].prem + '</span>元/年</p>起</div>';
                                }
                            result += '<img class="icon_img" src="' + obj[i].logo + '\"></img>'+
                                '</a></li>';
                        }

                        pagecount1 = pagecount1 + obj.length;

                        if(pagelength>obj.length)
                        {
                            // 数据加载完
                            tab2LoadEnd = true;
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
                        tab2LoadEnd = true;
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
        else if(itemIndex == '2')
        {
            var policydata =
                {
                    "pagecount":pagecount2,
                    "pagelength":pagelength,
                    "querytype":'03'
                };

            sendRequest("../../staff/getStaffProductList.do", policydata, function(data)
                {
                    var result = '';

                    var obj = JSON.parse(data);
                    console.log(obj);

                    if(obj.length>0)
                    {
                        for(var i=0;i<obj.length;i++)
                        {
                            result += '<li class="row d_boxSz">' ;
                            console.log(obj[i].url.indexOf('http'));
                                if(obj[i].url.indexOf('http') != 0 ){
                                    result += '<a class="d_boxSz" href="\.' + obj[i].url + '">';
                                }else{
                                    result += '<a class="d_boxSz" href="' + obj[i].url + '">';
                                }
                            result += '<div class="title">' + obj[i].title + '</div>' +
                                '<p class="explain">' + obj[i].description+ '</p>';
                                if(obj[i].prem == '在线报价'){
                                    result += '<div class="pricebox"><p class="price"><span>在线报价</span></p></div>';
                                }else{
                                    result += '<div class="pricebox"><p class="price"><span>' + obj[i].prem + '</span>元/年</p>起</div>';
                                }
                            result += '<img class="icon_img" src="' + obj[i].logo + '\"></img>'+
                                '</a></li>';
                        }

                        pagecount2 = pagecount2 + obj.length;

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
                    "pagecount":pagecount3,
                    "pagelength":pagelength,
                    "querytype":'04'
                };

            sendRequest("../../staff/getStaffProductList.do", policydata, function(data)
                {
                    var result = '';

                    var obj = JSON.parse(data);
                    console.log(obj);

                    if(obj.length>0)
                    {
                        for(var i=0;i<obj.length;i++)
                        {
                            result += '<li class="row d_boxSz">' ;
                            console.log(obj[i].url.indexOf('http'));
                                if(obj[i].url.indexOf('http') != 0 ){
                                    result += '<a class="d_boxSz" href="\.' + obj[i].url + '">';
                                }else{
                                    result += '<a class="d_boxSz" href="' + obj[i].url + '">';
                                }
                            result += '<div class="title">' + obj[i].title + '</div>' +
                                '<p class="explain">' + obj[i].description+ '</p>';
                                if(obj[i].prem == '在线报价'){
                                    result += '<div class="pricebox"><p class="price"><span>在线报价</span></p></div>';
                                }else{
                                    result += '<div class="pricebox"><p class="price"><span>' + obj[i].prem + '</span>元/年</p>起</div>';
                                }
                            result += '<img class="icon_img" src="' + obj[i].logo + '\"></img>'+
                                '</a></li>';
                        }

                        pagecount3 = pagecount3 + obj.length;

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
        else if(itemIndex == '4')
        {
            var policydata =
                {
                    "pagecount":pagecount4,
                    "pagelength":pagelength,
                    "querytype":'05'
                };

            sendRequest("../../staff/getStaffProductList.do", policydata, function(data)
                {
                    var result = '';

                    var obj = JSON.parse(data);
                    console.log(obj);

                    if(obj.length>0)
                    {
                        for(var i=0;i<obj.length;i++)
                        {
                            result += '<li class="row d_boxSz">' ;
                            console.log(obj[i].url.indexOf('http'));
                                if(obj[i].url.indexOf('http') != 0 ){
                                    result += '<a class="d_boxSz" href="\.' + obj[i].url + '">';
                                }else{
                                    result += '<a class="d_boxSz" href="' + obj[i].url + '">';
                                }
                            result += '<div class="title">' + obj[i].title + '</div>' +
                                '<p class="explain">' + obj[i].description+ '</p>';
                                if(obj[i].prem == '在线报价'){
                                    result += '<div class="pricebox"><p class="price"><span>在线报价</span></p></div>';
                                }else{
                                    result += '<div class="pricebox"><p class="price"><span>' + obj[i].prem + '</span>元/年</p>起</div>';
                                }
                            result += '<img class="icon_img" src="' + obj[i].logo + '\"></img>'+
                                '</a></li>';
                        }

                        pagecount4 = pagecount4 + obj.length;

                        if(pagelength>obj.length)
                        {
                            // 数据加载完
                            tab5LoadEnd = true;
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
                        tab5LoadEnd = true;
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
        else if(itemIndex == '5')
        {
            var policydata =
                {
                    "pagecount":pagecount5,
                    "pagelength":pagelength,
                    "querytype":'07'
                };

            sendRequest("../../staff/getStaffProductList.do", policydata, function(data)
                {
                    var result = '';

                    var obj = JSON.parse(data);
                    console.log(obj);

                    if(obj.length>0)
                    {
                        for(var i=0;i<obj.length;i++)
                        {
                            result += '<li class="row d_boxSz">' ;
                            console.log(obj[i].url.indexOf('http'));
                                if(obj[i].url.indexOf('http') != 0 ){
                                    result += '<a class="d_boxSz" href="\.' + obj[i].url + '">';
                                }else{
                                    result += '<a class="d_boxSz" href="' + obj[i].url + '">';
                                }
                            result += '<div class="title">' + obj[i].title + '</div>' +
                                '<p class="explain">' + obj[i].description+ '</p>';
                                if(obj[i].prem == '在线报价'){
                                    result += '<div class="pricebox"><p class="price"><span>在线报价</span></p></div>';
                                }else{
                                    result += '<div class="pricebox"><p class="price"><span>' + obj[i].prem + '</span>元/年</p>起</div>';
                                }
                            result += '<img class="icon_img" src="' + obj[i].logo + '\"></img>'+
                                '</a></li>';
                        }

                        pagecount5 = pagecount5 + obj.length;

                        if(pagelength>obj.length)
                        {
                            // 数据加载完
                            tab6LoadEnd = true;
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
                        tab6LoadEnd = true;
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