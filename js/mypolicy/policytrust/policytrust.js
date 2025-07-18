//var insuranceProtectUrl = '/jsondata/mypolicy/policytrust/renderData.json'
var insuranceProtectUrl = '/life/common/getTrustPolicyData.do'
var insurancegetQWUrl = '/rights/getQWUrl.do'
//var renderData = {}
var relatype = "'00','01','02','03','04'";
var querytype = "00";
var statusList = ["effective", "processing", "invalid", "cancel"];
var disprem;
var disamnt;

var insuranceColor = [{
		name: '意外险',
		color: '#444242'
	},
	{
		name: '医疗险',
		color: '#1b1b1b'
	},
	{
		name: '重疾险',
		color: '#e02828'
	},
	{
		name: '年金险',
		color: '#d7d7d7'
	},
	{
		name: '人寿险',
		color: '#a1a1a1'
	},
	{
		name: '理财险',
		color: '#dc220d'
	}
]

var indexFunc = {
	init: function () {
		$(".haspolicy").show();
		$(".nopolicy").hide();
		//ajax获取用于渲染页面的数据
		this.getData('01');
		this.setStyle();
		this.bindEvent();
	},
	setStyle: function () {},
	bindEvent: function () {
		var that = this
		$('body').on('click', '#tabSelect li', function () {
			var type = $(this).data('type')

			if (type == 'self') {
				relatype = "'00'";
			} else if (type == 'couple') {
				relatype = "'02'";
			} else if (type == 'parents') {
				relatype = "'03'";
			} else if (type == 'children') {
				relatype = "'01'";
			} else if (type == 'all') {
				relatype = "'00','01','02','03','04'";
				// relatype = "00,01,02,03,04";
			} else if (type == 'other') {
				relatype = "'04'";
			}

			$(this).addClass('active').siblings().removeClass('active');
			that.getData("02");
		})

		$('body').on('click', '.selected span', function () {
			var that = $(this)

			$('#selectBoxs').slideDown(200);
			$('.triangle').css({
				borderWidth: '5px 5px 0',
				right: '15px',
				borderColor: '#333 transparent transparent'
			})
		})
		$('body').on('click', '#selectBoxs li', function () {
			$('#selectBoxs').hide()
			$('#selectedText').text($(this).text())
			$('#listTitle').text($(this).text())
			$('#selectBoxs').find('li').each(function (index, el) {
				$(el).removeClass('hide');
			})
			$('.triangle').css({
				borderWidth: '5px 0 5px 5px',
				right: '18px',
				borderColor: 'transparent transparent transparent #333'
			})

			if ($('#selectedText').text() == '全部') {
				disAllStatusList();
			} else if ($('#selectedText').text() == '保障中') {
				disStatusList('effective');
			} else if ($('#selectedText').text() == '待处理') {
				disStatusList('processing');
			} else if ($('#selectedText').text() == '已失效') {
				disStatusList('invalid');
			} else if ($('#selectedText').text() == '已终止') {
				disStatusList('cancel');
			}

			//that.getData("02");
		})
		$('body').on('click', '.list-box', function () {
			//链接到相应的页面
			var insureid = $(this).data('insureid');
			var policyid = $(this).data('policyid')
			var contno = $(this).data('contno')
			window.location.href = '/life/common/policyDetail.do?orderid=' + policyid + '&insuredid=' + insureid + '&contno=' + contno
		})
		$('body').on('click', '#quit', function () {
			window.location.href = '/user/logout.do';
		})

		$('body').on('click', '#ipenQrcode', function () {
			var that = this
			httpRequest('/rights/getServiceCom.do', 'get', '', {
				success: function (res) {
					if (res.managecom == 'benbu') {
						// that.insurancegetQWUrl01()
						httpRequest(insurancegetQWUrl, 'get', '', {
							success: function (res) {
								if (res.code == 0 && res.qwurl != '') {
									var avtar = $('#serviceImg').attr("src")
									var avtarName = $('#serviceName').text().slice(5)
									messageAlert(res.qwurl, avtar, avtarName);
								} else {
									var avtar = $('#serviceImg').attr("src")
									var avtarName = $('#serviceName').text().slice(5)
									messageAlert('https://insure.meihualife.com//images/mypolicy/policytrust/kefu.png', avtar, avtarName);
								}
							}
						})


					} else {

					}
				}
			})




		})

		// insurancegetQWUrl01: function () {
		// httpRequest(insurancegetQWUrl, 'get', '', {
		// 	success: function (res) {
		// 		if (res.code == 0 && res.qwurl != '') {
		// 			var avtar = $('#serviceImg').attr("src")
		// 			var avtarName = $('#serviceName').text().slice(5)
		// 			messageAlert(res.qwurl, avtar, avtarName);
		// 		} else {
		// 			var avtar = $('#serviceImg').attr("src")
		// 			var avtarName = $('#serviceName').text().slice(5)
		// 			messageAlert('https://insure.meihualife.com//images/mypolicy/policytrust/kefu.png', avtar, avtarName);
		// 		}
		// 	}
		// })
		// }

	},



	getData: function (type) {
		var that = this
		var transdata = {
			"headtype": type,
			"querytype": querytype,
			"relatype": relatype
		};

		//alert(type);

		httpRequest(insuranceProtectUrl, 'get', transdata, {
			success: function (res) {
				$('#loading').hide()
				console.log('res', res)
				var getdata = JSON.parse(JSON.stringify(res));
				that.renderChartsAndList(getdata, type)
			}
		})
	},
	renderChartsAndList: function (data, type) {
		var that = this

		console.log('renderChartsAndList', data)
		console.log('renderChartsAndList type', type)

		//TODO 渲染header
		if (type == '01') {
			that.renderHeader(data.insuranceInfo);
		}

		if (data.policyData.length > 0) {
			$(".haspolicy").show();
			$(".nopolicy").hide();
		} else {
			$(".haspolicy").hide();
			$(".nopolicy").show();
		}

		//TODO 渲染charts,仅表示数据结构，所以只取了数组的第一项
		that.renderCharts(data.chartsData)
		//TODO 渲染charts旁边信息,仅表示数据结构，所以只取了数组的第一项
		$('#totalFee').text(handleNum(data.sumprem));
		disprem = handleNum(data.sumprem);
		$('#totalAmount').text(handleNum(data.sumamnt));
		disamnt = handleNum(data.sumamnt);
		$('#protectStatus').text(data.complete == 'true' ? '保障齐全' : '保障待补全');
		//TODO 渲染list,仅表示数据结构，所以只取了数组的第一项
		that.renderLists(data.policyData);
	},
	renderCharts: function (data) {
		console.log("chartsData", data)
		var that = this
		if (!data) {
			console.log(data)
			return
		}
		var tpl = '<div id="scenesCharts" style="width: 200px;height: 175px;"></div>'

		$('#echartsBox').html(tpl)
		// 基于准备好的dom，初始化echarts实例
		var myChart = echarts.init(document.getElementById('scenesCharts'))

		var option = {
			//color: ['#444242', '#1b1b1b', '#e02828', '#d7d7d7', '#a1a1a1', '#eeeeee'],
			color: setColor(data),
			label: {
				fontSize: 12,
				color: '#282828'
			},
			series: [{
				// name: '姓名',
				type: 'pie',
				radius: ['48px', '60px'],
				//高亮扇区偏移距离
				hoverOffset: 3,
				labelLine: {
					lineStyle: {
						color: '#282828'
					},
					length: 5,
					length2: 5
				},
				data: data,
				itemStyle: {
					emphasis: {
						shadowBlur: 0,
						shadowOffsetX: 0,
						shadowColor: 'rgba(0, 0, 0, 0.5)'
					}
				}
			}]
		}

		console.log("charts_option", option);
		// 使用刚指定的配置项和数据显示图表。
		myChart.setOption(option)
		myChart.on('click', function (params) {
			//TODO 险种从params中可以看到
			//console.log(params);
			//alert(params.data.risktype);
			//TODO 险种筛选，仅表示数据结构，所以只取了数组的第一项

			$('#totalFee').text(handleNum(params.data.value));
			$('#totalAmount').text(handleNum(params.data.amnt));

			//alert($(".risktype"+params.data.risktype).length);
			//dischartList(params.data.risktype);
		})

		myChart.getZr().on('click', function (params) {
			var pointInPixel = [params.offsetX, params.offsetY]
			if (myChart.containPixel({
					seriesIndex: 0
				}, pointInPixel)) {
				// 点击了圆环
				//console.log(params);
				//console.log('click in pie charts!点击了环形图!')
			} else {
				// 点击了空白处 do sth...
				//console.log(params);
				//console.log('click out of pie charts! 点击了空白处！')
				$('#totalFee').text(disprem);
				$('#totalAmount').text(disamnt);
			}
		})
	},
	renderHeader: function (data) {
		$('#effectiveNum').text(data.effectiveNum)
		$('#protectionNum').text(data.protectionNum)

		// if (data.photourl == null || data.photourl == '') {
			var maleImg = '/images/mypolicy/policytrust/service_male.png'
			var femaleImg = '/images/mypolicy/policytrust/service_female.png'
			var serviceImg = data.gender === '0' ? maleImg : femaleImg;
			$('#serviceImg').attr('src', serviceImg)
		// } else {
		// 	$('#serviceImg').attr('src', 'http://insure.meihualife.com' + data.photourl);
		// }

		if (data.realname == null || data.realname == '') {
			$('#serviceName').text('我的管家：');
		} else {

			if(data.gender === '0'){
				$('#serviceName').text("我的管家：三文老师"); 
			}else{
				 $('#serviceName').text("我的管家：一芯老师");
			}
			
			
		}
	},
	renderLists: function (data) {
		$('#protectingNum').text(data.length)
		var list = listTpl(data)
		$('#listBoxContainer').html(list);

		$('#selectedText').text("保障中");
		disStatusList('effective');
	}
}
indexFunc.init()

function disStatusList(status) {
	for (var i = 0; i < statusList.length; i++) {
		if (statusList[i] == status) {
			$('#protectingNum').text($("." + statusList[i]).length)
			$("." + statusList[i]).show();
		} else {
			$("." + statusList[i]).hide();
		}
	}
}

function disAllStatusList() {
	var listCount = 0;

	for (var i = 0; i < statusList.length; i++) {
		$("." + statusList[i]).show();
		listCount = listCount + $("." + statusList[i]).length;
	}

	$('#protectingNum').text(listCount);
}

function httpRequest(url, method, data, fnObj) {
	$.ajax({
		url: url,
		type: method,
		data: data,
		dataType: 'json',
		timeout: 15000,
		beforeSend: function () {
			$.showLoading("加载中...")
			if (fnObj.beforeSend) {
				fnObj.beforeSend()
			}
		},
		complete: function (xhr, status) {
			$.hideLoading()
			if (status === 'timeout') {
				console.log('api time out')
			}
			if (fnObj.complete) {
				fnObj.complete(status)
			}
		},
		success: function (res) {
			$.hideLoading()
			if (fnObj.success) {
				fnObj.success(res)
			}
		},
		error: function (error) {
			$.hideLoading()
			console.log(error)
			if (fnObj.error) {
				fnObj.error(error)
			}
		}
	})
}

function listTpl(data) {
	var tpl = ''
	var statusImg = ''
	var bgcolor = ''
	data.forEach(function (item) {
		if (item.status === 'effective') {
			statusImg = '/images/mypolicy/policytrust/baozhangzhong.png?v=20191031'
		} else if (item.status === 'processing') {
			statusImg = '/images/mypolicy/policytrust/daichuli.png?v=20191031'
		} else if (item.status === 'invalid') {
			statusImg = '/images/mypolicy/policytrust/yishixiao.png?v=20191031'
		} else if (item.status === 'cancel') {
			statusImg = '/images/mypolicy/policytrust/yizhongzhi.png?v=20191031'
		}

		insuranceColor.forEach(function (value) {
			if (item.risktypename === value.name) {
				bgcolor = value.color
			}
		})

		tpl += '<div class="list-box ' + item.status + '" data-insureid="' + item.insuredserialno + '" data-policyid="' + item.orderid + '"   data-contno="' + item.contno + '">' +
			'    <div class="list-wrap">' +
			'		 <div class="list-box-icon-wrap"><img class="list-box-icon" src="' + statusImg + '"></div>' +
			'        <div class="list-left" style="background: ' + bgcolor + ';">' +
			'            <span>' + item.risktypename + '</span>' +
			'        </div>' +
			'        <div class="list-right">' +
			'            <div class="list-right-top-title">' + item.riskname + '</div>' +
			'            <div class="list-right-bottom-content">' +
			'                <ul>' +
			'                    <li>' +
			'                        <span>被保人</span>' +
			'                        <span>' + item.name + '</span>' +
			'                    </li>' +
			'                    <li>' +
			'                        <span>保险金额</span>' +
			'                        <span>' + item.amnt + '元</span>' +
			'                    </li>' +
			'                    <li>' +
			'                        <span>保障期限</span>' +
			'                        <span>' + item.insuyearStr + '</span>' +
			'                    </li>' +
			'                    <li>' +
			'                        <span>保费</span>' +
			'                        <span>' + item.prem + '元</span>' +
			'                    </li>' +
			'                </ul>' +
			'            </div>' +
			'        </div>' +
			'    </div>' +
			'</div>'
	})
	return tpl

}

//将数字处理为 1,000 的格式
function handleNum(num) {
	num = num + ''
	return num.replace(/(\d)(?=(\d{3})+\b)/g, '$1,')
}

function setColor(data) {
	if (!data.length) {
		return []
	}
	var color = []
	data.forEach(function (item) {
		insuranceColor.forEach(function (value) {
			if (value.name === item.name) {
				color.push(value.color)
			}
		})
	})
	return color;
}

// '            <span>管家联系方式</span>' +
function messageAlert(msg, avtar, avtarName) {
	console.log('dom')
	var dom = '<div class="member-message-box hide" id="messageBox">' +
		'    <div class="member-message-mask"></div>' +
		'    <div class="member-message-content">' +
		'        <div class="member-message-title">' +

		'             <div class="tan_header">' +
		'<div class="ssdf">' +
		'               <img src="' + avtar + '" alt="">' +
		'</div>' +
		'                <div class="tanBigbox">' +
		'                  <p class="tanTeach">' + avtarName + '</p>' +
		'                  <p>免费咨询您的专属管家</p>' +
		'                </div>' +
		'              </div>' +
		'            <span class="close" id="close">×</span>' +
		'        </div>' +
		'        <div class="member-message-msg"><img   src="' + msg + '"><p>长按识别上方二维码添加企业微信</p></div>' +
		'    </div>' +
		'</div>'

	$('body').append(dom)
	$('.member-message-content').hide()
	$('#messageBox').removeClass('hide')
	$('.member-message-content').hide().fadeIn(200)

	$('body').on('click', '#close', function () {
		$('#messageBox').fadeOut(200, function () {
			$('#messageBox').remove()
		})
	})
}