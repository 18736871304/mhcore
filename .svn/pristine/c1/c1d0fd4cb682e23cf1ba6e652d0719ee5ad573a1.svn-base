var insuranceProtectUrl = '/jsondata/mypolicy/policytrust/renderData.json'
	var renderData = {}

var indexFunc = {
	init: function () {
		//ajax获取用于渲染页面的数据
		this.getData()
		this.setStyle()
		this.bindEvent()
	},
	setStyle: function () {
	},
	bindEvent: function () {
		var that = this
		$('body').on('click', '#tabSelect li', function () {
			var type = $(this).data('type')
			//console.log('renderData', renderData)
			$(this).addClass('active').siblings().removeClass('active')
			that.renderChartsAndList(renderData, type)
		})

		$('body').on('click', '.selected span', function () {
			var that = $(this)
			$('#selectBoxs').find('li').each(function (index, el) {
				if ($(el).text() === that.text()) {
					// console.log(that.text())
					$(el).addClass('hide')
				}
			})
			$('#selectBoxs').slideDown(200)
			$('.triangle').css({
				borderWidth: '5px 5px 0',
				right: '2px',
				borderColor: '#333 transparent transparent'
			})
		})
		$('body').on('click', '#selectBoxs li', function () {
			$('#selectBoxs').hide()
			$('#selectedText').text($(this).text())
			$('#selectBoxs').find('li').each(function (index, el) {
				$(el).removeClass('hide')
			})
			$('.triangle').css({
				borderWidth: '5px 0 5px 5px',
				right: '5px',
				borderColor: 'transparent transparent transparent #333'
			})
		})
	},
	getData: function () {
		var that = this
		httpRequest(insuranceProtectUrl, 'get', null, {
			success: function (res) {
				$('#loading').hide()
				console.log('res', res)
				renderData = JSON.parse(JSON.stringify(res))
				that.renderChartsAndList(renderData)
			}
		})
	},
	renderChartsAndList: function (data, type) {
		var that = this
		var d = null
		if (!type) {
			type = 'all'
		}
		console.log('renderChartsAndList', data)
		console.log('renderChartsAndList type', type)
		if (type === 'all') {
			d = data
		} else if (type === 'self') {
		} else if (type === 'couple') {
		} else if (type === 'parents') {
		} else if (type === 'children') {
		}
		//TODO 渲染header
		that.renderHeader(renderData.insuranceInfo)
		//TODO 渲染charts,仅表示数据结构，所以只取了数组的第一项
		that.renderCharts(renderData.insuranceList[0].seriesData)
		//TODO 渲染charts旁边信息,仅表示数据结构，所以只取了数组的第一项
		$('#totalFee').text(handleNum(renderData.insuranceList[0].seriesData[0].value))
		$('#totalAmount').text(handleNum(renderData.insuranceList[0].seriesData[0].insuranceAmount))
		$('#protectStatus').text(renderData.insuranceList.complete ? '保障齐全' : '保障待补全')
		//TODO 渲染list,仅表示数据结构，所以只取了数组的第一项
		that.renderLists(renderData.insuranceList[0].seriesData)
	},
	renderCharts: function (data) {
		console.log(data)
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
			color: ['#444242', '#1b1b1b', '#e02828', '#d7d7d7', '#a1a1a1', '#eeeeee'],
			label: {
				fontSize: 12,
				color: '#282828'
			},
			series: [
				{
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
						length2: 10
					},
					data: data,
					itemStyle: {
						emphasis: {
							shadowBlur: 0,
							shadowOffsetX: 0,
							shadowColor: 'rgba(0, 0, 0, 0.5)'
						}
					}
				}
			]
		}

		// 使用刚指定的配置项和数据显示图表。
		myChart.setOption(option)
		myChart.on('click',function(params){
			//TODO 险种从params中可以看到
			console.log(params)
			//TODO 险种筛选，仅表示数据结构，所以只取了数组的第一项
			that.renderLists(renderData.insuranceList[0].seriesData)
		})
	},
	renderHeader: function (data) {
		$('#effectiveNum').text(data.effectiveNum)
		$('#protectionNum').text(data.protectionNum)
		var maleImg = '/images/mypolicy/policytrust/service_male.png'
		var femaleImg = '/images/mypolicy/policytrust/service_female.png'
		var serviceImg = data.gender === 'male' ? femaleImg : maleImg
		$('#serviceImg').attr('src', serviceImg)
	},
	renderLists: function (data) {
		$('#protectingNum').text(data.length)
		var list = listTpl(data)
		$('#listBoxContainer').html(list)
	}
}
indexFunc.init()

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

	data.forEach(function (item) {
		if (item.status === 'effective') {
			statusImg = '/images/mypolicy/policytrust/baozhangzhong.png'
		} else if (item.status === 'processing') {
			statusImg = '/images/mypolicy/policytrust/daichuli.png'
		} else if (item.status === 'invalid') {
			statusImg = '/images/mypolicy/policytrust/yishixiao.png'
		} else if (item.status === 'cancel') {
			statusImg = '/images/mypolicy/policytrust/yizhongzhi.png'
		}
		tpl += '<div class="list-box">' +
			'    <div class="list-wrap">' +
			'		 <div class="list-box-icon-wrap"><img class="list-box-icon" src="' + statusImg + '"></div>' +
			'        <div class="list-left">' +
			'            <span>' + item.insuranceName + '</span>' +
			'        </div>' +
			'        <div class="list-right">' +
			'            <div class="list-right-top-title">' + item.insuranceProductName + '</div>' +
			'            <div class="list-right-bottom-content">' +
			'                <ul>' +
			'                    <li>' +
			'                        <span>被保人</span>' +
			'                        <span>' + item.insuredName + '</span>' +
			'                    </li>' +
			'                    <li>' +
			'                        <span>保险金额</span>' +
			'                        <span>' + item.value + '元</span>' +
			'                    </li>' +
			'                    <li>' +
			'                        <span>保险期限</span>' +
			'                        <span>' + item.timeLimit + '</span>' +
			'                    </li>' +
			'                    <li>' +
			'                        <span>保费</span>' +
			'                        <span>' + item.insuranceAmount + '元</span>' +
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
