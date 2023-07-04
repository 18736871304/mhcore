var roundCircleTimer1 = null
var roundCircleTimer2 = null

var yl_rateList = [];
var dbbc_rateList = [];

var diseaseData_zz = '';
var diseaseData_qz = '';
var diseaseData_zhongz = '';

var isDiseaseDataComplete = false;
var isgetCharts = false;
var premList = [];
var ageList = [];
var valueList = [];

var risk03img01 = '';
var risk03img02 = '';
var risk03img03 = '';
var risk03img04 = '';

var tabData = {}

var max_value = 300000;
var interval_value = 100000;

var viewplanFunc = {
	init: function () {
		this.setStyle()
		this.bindEvent()
	},
	setStyle: function () {
		this.renderExpense()
	},
	bindEvent: function () {
		//费率弹出框
		$('body').on('click', '.ylrate-dialog', function () {
			var rateDiagTplHTML = rateTpl(yl_rateList)
			//控制弹框的显示与隐藏
			$('body').append(rateDiagTplHTML)
			
			var $dialog1 = $('#js_dialog_1'),
				$iosDialog1 = $('#iosDialog1')
			$('#rateDialogs').on('click', '.weui-mask', function () {
				hideDialog($(this))
			})
			$('#closeDialog').on('click', function () {
				hideDialog($(this))
			})
			$iosDialog1.fadeIn(200);
			$dialog1.addClass('weui-half-screen-dialog_show')

			modalHelper().afterOpen()

			function hideDialog(dom) {
				dom.parents('.js_dialog').fadeOut(200)
				$dialog1.removeClass('weui-half-screen-dialog_show')
				modalHelper().beforeClose()
				setTimeout(function () {
					$('#rateDialogs').remove()
				}, 250)
			}
		})
		//费率弹出框
		$('body').on('click', '.dbbc_rate-dialog', function () {
			var rateDiagTplHTML = rateTpl(dbbc_rateList)
			//控制弹框的显示与隐藏
			$('body').append(rateDiagTplHTML)
			
			var $dialog1 = $('#js_dialog_1'),
				$iosDialog1 = $('#iosDialog1')
			$('#rateDialogs').on('click', '.weui-mask', function () {
				hideDialog($(this))
			})
			$('#closeDialog').on('click', function () {
				hideDialog($(this))
			})
			$iosDialog1.fadeIn(200);
			$dialog1.addClass('weui-half-screen-dialog_show')

			modalHelper().afterOpen()

			function hideDialog(dom) {
				dom.parents('.js_dialog').fadeOut(200)
				$dialog1.removeClass('weui-half-screen-dialog_show')
				modalHelper().beforeClose()
				setTimeout(function () {
					$('#rateDialogs').remove()
				}, 250)
			}
		})
		//疾病种类弹出框
		$('body').on('click', '#typeOfDisease', function () 
		{
			if(!isDiseaseDataComplete)
			{
				return;
			}
			
			var diagTplHTML = diseaseTpl()
			$('body').append(diagTplHTML)
			renderDiseaseBox(diseaseData_zz)
			var $dialog1 = $('#js_dialog_1'),
				$iosDialog1 = $('#iosDialog1')
			$('#dialogs').on('click', '.weui-mask', function () {
				hideDialog($(this))
			})
			$('#closeDialog').on('click', function () {
				hideDialog($(this))
			})
			$('.dialog-tab').on('click', function () {
				console.log($(this).data('diseasedata'));
				var diseaseData = $(this).data('diseasedata')
				
				if(diseaseData==='diseaseData_zz')
				{
					renderDiseaseBox(diseaseData_zz)
				}
				else if(diseaseData==='diseaseData_qz')
				{
					renderDiseaseBox(diseaseData_qz)
				}
				else if(diseaseData==='diseaseData_zhongz')
				{
					renderDiseaseBox(diseaseData_zhongz)
				}
				$(this).addClass('weui-bar__item_on').siblings('.dialog-tab').removeClass('weui-bar__item_on');
			})
			$iosDialog1.fadeIn(200);
			$dialog1.addClass('weui-half-screen-dialog_show')
			modalHelper().afterOpen()

			function hideDialog(dom) {
				dom.parents('.js_dialog').fadeOut(200)
				$dialog1.removeClass('weui-half-screen-dialog_show')
				modalHelper().beforeClose()
				setTimeout(function () {
					$('#dialogs').remove()
				}, 250)
			}
		})
		$('body').on('click', function (e) {
			if (e.target.className !== 'tree-son-box' || e.target.parentNode.className !== 'tree-son-box') {
				$('.tips').fadeOut(100)
			}
		})
		//tree
		$('.tree-parent').on('click', function (e) {
			e.stopPropagation()
			// console.log($(this))
			$(this).siblings('.tree-son-box')
				.find('.tips')
				.fadeOut(100)
			$(this).siblings('.tree-son-box')
				.find('.tree-son-branch')
				.fadeOut(100, function () {
					//二级分类动画
					$(this).find('.son2 .tree-son-box').each(function (index, el) {
						$(el).hide()
					})
				})
				.addClass('hide')
			$(this).find('.tips').fadeIn(300)
			$(this).find('.tree-son-branch').removeClass('hide').hide().show(0, function () {
				//二级分类动画
				$(this).find('.son2 .tree-son-box').each(function (index, el) {
					// console.log(el)
					$(el).show()
				})
			})
		})
        //立即签署服务协议
        $('#signButton').on('click', function () {
        	location.href = '/user/notice.do';
        })
	},
	renderExpense: function () {
		httpRequest('/staff/plan/getPlanDetail.do', 'post', {planid: $("#planid").val()}, {
			success: function (data) {
				console.log('expense',data)
				
				risk03img01 = data.risk03img01;
				risk03img02 = data.risk03img02;
				risk03img03 = data.risk03img03;
				risk03img04 = data.risk03img04;
				
				$('#tabDetail').html('<img src="'+risk03img01+'">')
				$('#risk03img04').html('<img src="'+risk03img04+'">')
				
				$('#uname').text(data.planinfo.insname)
				$('#gender').text(data.planinfo.inssex)
				$('#age').text(data.planinfo.insage)
				
				for(var i=0;i<data.planrisklist.length;i++)
				{
					if(data.planrisklist[i].risktype=='01')
					{
						$('#yiwaibaozhangSection').show();
						$('#yiwaibaozhangbaozhangBox').html(expenseTpl(data.risktype01_dutyinfo));
						$('#yiwaibaozhangImg').attr('src', data.planrisklist[i].logourl);
						$('#yiwaibaozhangTotal').text(Number(data.planrisklist[i].prem).toFixed(2)+'元/年');
						$('#yiwaibaozhangExplain').hide()
					}
					else if(data.planrisklist[i].risktype=='02')
					{
						$('#xiaobingbaozhangSection').show()
						$('#xiaobingbaozhangBox').html(expenseTpl(data.risktype02_dutyinfo))
						$('#xiaobingbaozhangImg').attr('src', data.planrisklist[i].logourl)
						$('#xiaobingbaozhangTotal').text(Number(data.planrisklist[i].prem).toFixed(2)+'元/年')
						$('#xiaobingbaozhangExplain').show();
						yl_rateList = data.risktype02_rateinfo;
					}
					else if(data.planrisklist[i].risktype=='03')
					{
						setChartData(data.planrisklist[i].riskcode);
						
						var premEndStr = '';
						
						if(data.planrisklist[i].payintv=='1')
						{
							premEndStr = '/月'
						}
						else
						{
							premEndStr = '/年'
						}
						
						
						$('#dabingbaozhangSection').show()
						$('#dabingbaozhangBox').html(expenseTpl(data.risktype03_dutyinfo))
						$('#dabingbaozhangImg').attr('src', data.planrisklist[i].logourl)
						$('#dabingbaozhangTotal').text(Number(data.planrisklist[i].prem).toFixed(2)+'元'+premEndStr)
						$('#dabingbaozhangExplain').hide();
						
						diseaseData_zz = data.disease_zz;
						diseaseData_qz = data.disease_qz;
						diseaseData_zhongz = data.disease_zhongz;
						
						isDiseaseDataComplete = true;
					}
					else if(data.planrisklist[i].risktype=='dbbc')
					{
						$('#aboutdbbc').show();
						
						$('#dabingbuchongSection').show();
						$('#dabingbuchongBox').html(expenseTpl(data.risktypedbbc_dutyinfo))
						$('#dabingbuchongImg').attr('src', data.planrisklist[i].logourl)
						$('#dabingbuchongTotal').text(Number(data.planrisklist[i].prem).toFixed(2)+'元/年')
						$('#dabingbuchongExplain').show()
						dbbc_rateList = data.risktypedbbc_rateinfo;
					}
					if(data.planrisklist[i].risktype=='04')
					{
						$('#shengubaozhangSection').show();
						$('#shengubaozhangBox').html(expenseTpl(data.risktype04_dutyinfo));
						$('#shengubaozhangImg').attr('src', data.planrisklist[i].logourl);
						$('#shengubaozhangTotal').text(Number(data.planrisklist[i].prem).toFixed(2)+'元/年');
						$('#shengubaozhangExplain').hide()
					}
				}
				
				//显示模块
				//填数字
				//换logo
				//填总价
				//是否显示总价的解释
			}
		})
	}
}
viewplanFunc.init()

var tabFunc = {
	init: function () {
		//this.render(tabData.beAbleTo)
		this.bindEvent()
	},
	bindEvent: function () {
		var that = this
		$('.rules-tab .weui-navbar__item').on('click', function () {
			console.log('click tab', $(this).data('type'))
			var tabType = $(this).data('type')
			// that.render(tabData[tabType])
			that.render(tabType)
			$(this).addClass('weui-bar__item_on')
				.siblings('.weui-bar__item_on')
				.removeClass('weui-bar__item_on')
			if (tabType === 'beAbleTo') {
				$('#tabDetail').find('li').each(function (i, el) {
					console.log(el);
					$(el).removeClass('should-not').addClass('be-able-to')
				})
			} else {
				$('#tabDetail').find('li').each(function (i, el) {
					console.log(el);
					$(el).removeClass('be-able-to').addClass('should-not')
				})
			}

		})
	},
	render: function (data) {
		var tpl = ''
		// var list = data.list
		// for (var i = 0; i < list.length; i++) {
		// 	if (list[i].name) {
		// 		tpl += '<li class="be-able-to">' +
		// 			'<span class="list-name">' + list[i].name + '</span>' +
		// 			'<span class="list-desc ' + data.style.alignClass + '">' + list[i].desc + '</span>' +
		// 			'</li>'
		// 	} else {
		// 		tpl += '<li class="should-not">' +
		// 			'<span class="list-desc ' + data.style.alignClass + '">' + list[i].desc + '</span>' +
		// 			'</li>'
		// 	}
		// }
		if (data === 'shouldNot') {
			tpl = '<img src="'+risk03img02+'">'
		} else if (data === 'rules') {
			tpl = '<img src="'+risk03img03+'">'
		} else {
			tpl = '<img src="'+risk03img01+'">'
		}
		$('#tabDetail').html(tpl)
	}
}
tabFunc.init()

var scenesFunc = {
	init: function () 
	{
		this.renderCharts();
		this.bindEvent()
	},
	bindEvent: function () {
		var that = this
		$('#scenesTab .weui-navbar__item__scenes').on('click', function () {

			$('#scenesTab .weui-navbar__item__scenes').each(function (index, el) {
				if ($(el).data('hasclick') === 'yes') {
					$(el).removeClass('tab-no-click').addClass('tab-clicked')
				}
			})
			if ($(this).data('hasclick') === 'no') {
				$(this).data('hasclick', 'yes')
			}
			$(this).removeClass('tab-no-click')
				.addClass('tab-active')
				.siblings('.weui-navbar__item__scenes')
				.removeClass('tab-active')


			var type = $(this).data('scenestype')
			console.log(type)
			if (type === 'a') {
				$('#sceneDesc').text('有病理赔，无病储蓄，不仅保大病还可以增值')
				$('#sceneDescSub').show();
				that.renderCharts()
			} else if (type === 'b') {
				$('#sceneDesc').text('医疗升级，等同于多次赔付不分组且无等待期')
				$('#sceneDescSub').hide();
				// var scenesBTplHTML = template.render(scenesBTpl)
				$('#panelContent').html(sceneBTpl())
				//动画
				$('.axis-x').animate({width: '+=100%'}, 400, function () {
					$('.axis-point .item1 .axis-circle').stop()
						.removeClass('hide').hide().delay(100).fadeIn()
						.siblings('.verticle-line')
						.removeClass('hide').hide().delay(150).fadeIn()
						.siblings('.axis-item-text')
						.removeClass('hide').hide().delay(200).fadeIn()
						.parent().siblings('.item2').find('.axis-circle')
						.removeClass('hide').hide().delay(250).fadeIn()
						.siblings('.verticle-line')
						.removeClass('hide').hide().delay(300).fadeIn()
						.siblings('.axis-item-text')
						.removeClass('hide').hide().delay(350).fadeIn()
						.parent().siblings('.item3').find('.axis-circle')
						.removeClass('hide').hide().delay(400).fadeIn()
						.siblings('.verticle-line')
						.removeClass('hide').hide().delay(450).fadeIn()
						.siblings('.axis-item-text')
						.removeClass('hide').hide().delay(500).fadeIn()
						.parent().siblings('.item4').find('.axis-circle')
						.removeClass('hide').hide().delay(550).fadeIn()
						.siblings('.verticle-line')
						.removeClass('hide').hide().delay(600).fadeIn()
						.siblings('.axis-item-text')
						.removeClass('hide').hide().delay(650).fadeIn()
						.parent().siblings('.item5').find('.axis-circle')
						.removeClass('hide').hide().delay(700).fadeIn()
						.siblings('.verticle-line')
						.removeClass('hide').hide().delay(750).fadeIn()
						.siblings('.axis-item-text')
						.removeClass('hide').hide().delay(800).fadeIn()
					setTimeout(function () {
						$('.b-charts-left').stop().removeClass('hide').hide().delay(50).fadeIn()
					}, 850)
					setTimeout(function () {
						$('.b-charts-right-content').stop().removeClass('hide').hide().delay(50).fadeIn()
							.find('.b-charts-right-icon').hide()
							.siblings('.b-charts-right-text').removeClass('hide').hide().delay(50).fadeIn(function () {
							setCircleItemPosition()
							$('.b-charts-icon').removeClass('hide').hide().delay(50).fadeIn()
						})
					}, 950)
				})


			} else if (type === 'c') {
				$('#sceneDesc').text('身故保障，可指定受益人，健康安享财富传承')
				$('#sceneDescSub').hide();
				// var scenesCTplHTML = template.render(scenesCTpl)
				$('#panelContent').html(sceneCTpl())
				$(function () {
					$('.item1').removeClass('hide').hide().delay(100).fadeIn()
						.parent().siblings().find('.item2').removeClass('hide').hide().delay(200).fadeIn()
						.parent().siblings().find('.item3').removeClass('hide').hide().delay(300).fadeIn()
						.parent().siblings().find('.item4').removeClass('hide').hide().delay(400).fadeIn()
						.parent().siblings().find('.item5').removeClass('hide').hide().delay(500).fadeIn()
				})
			}
			// $(document).scrollTop($(document).height() - $('#ourPromise').height())
		})
	},
	renderCharts: function () 
	{
		if(isgetCharts)
		{
			disCharts();
		}
	}
}
scenesFunc.init()

function disCharts()
{
	var tpl = '<div id="scenesCharts" style="width: 100%;height: 270px;"></div>'

		$('#panelContent').html(tpl)
		// 基于准备好的dom，初始化echarts实例
		var myChart = echarts.init(document.getElementById('scenesCharts'))

		// 指定图表的配置项和数据
		var line1Color = '#dc230e'
		var line2Color = '#282828'
		var lineColor = [line1Color, line2Color]
		var option = {
			tooltip: {
				trigger: 'axis',
				formatter: function (params) {
					console.log(params)
					var h = '<div>' + params[0].name + '</div>'

					params.forEach(function (item, index) {
						h += '<div style="display: flex;justify-content: center;align-items: center">' +
							'<div style="width: 12px;height: 12px;background-color: ' + lineColor[index] + ';border-radius: 50%;margin-right: 3px;"></div>' +
							'<div>' + item.seriesName + '：' + item.value + '</div>' +
							'</div>'
					})
					return h
				}
			},
			legend: {
				data: ['现金价值', '已交保费'],
				bottom: 0,
				padding: [0, 0, 5, 0]
			},
			grid: {
				top: '10%',
				left: '3%',
				right: '4%',
				bottom: '10%',
				containLabel: true
			},
			xAxis: {
				type: 'category',
				name: '年龄',
				nameLocation: 'end',
				nameTextStyle: {
					fontStyle: 400,
					color: '#686868',
					fontSize: 12
				},
				boundaryGap: false,
				data: ageList
			},
			yAxis: {
				type: 'value',
				name: '现金价值',
				nameTextStyle: {
					fontStyle: 400,
					color: '#686868',
					fontSize: 12
				},
				min: 0,
				max: max_value,
				interval: interval_value
			},
			series: [
				{
					name: '现金价值',
					type: 'line',
					smooth: true,
					lineStyle: {
						color: line1Color
					},
					data: valueList
				},
				{
					name: '已交保费',
					type: 'line',
					smooth: true,
					lineStyle: {
						color: line2Color
					},
					data: premList
				}
			]
		}
		// 使用刚指定的配置项和数据显示图表。
		myChart.setOption(option)
}

function sceneBTpl() {
	var tpl = '<div class="scenes-b-box">' +
		'    <div class="scenes-b">' +
		'        <div class="scenes-b-axis">' +
		'            <div class="axis-wrap" id="axisAnimation">' +
		'                <!--<img src="/images/insureplan/xAxis.png">-->' +
		'                <div class="axis">' +
		'                    <div class="axis-point">' +
		'                        <div class="axis-point-item item1">' +
		'                            <div class="axis-circle hide"></div>' +
		'                            <div class="verticle-line hide"></div>' +
		'                            <div class="axis-item-text hide">' +
		'                                <p>确诊</p>' +
		'                                <p>癌症</p>' +
		'                            </div>' +
		'                        </div>' +
		'                        <div class="axis-point-item item2">' +
		'                            <div class="axis-circle hide"></div>' +
		'                            <div class="verticle-line hide"></div>' +
		'                            <div class="axis-item-text hide">' +
		'                                <p>第一次</p>' +
		'                                <p>放/化疗</p>' +
		'                            </div>' +
		'                        </div>' +
		'                        <div class="axis-point-item item3">' +
		'                            <div class="axis-circle hide"></div>' +
		'                            <div class="verticle-line hide"></div>' +
		'                            <div class="axis-item-text hide">' +
		'                                <p>第二次</p>' +
		'                                <p>放/化疗</p>' +
		'                            </div>' +
		'                        </div>' +
		'                        <div class="axis-point-item item4">' +
		'                            <div class="axis-circle hide"></div>' +
		'                            <div class="verticle-line hide"></div>' +
		'                            <div class="axis-item-text hide">' +
		'                                <p>第三次</p>' +
		'                                <p>放/化疗</p>' +
		'                            </div>' +
		'                        </div>' +
		'                        <div class="axis-point-item item5">' +
		'                            <div class="axis-circle hide"></div>' +
		'                            <div class="verticle-line hide"></div>' +
		'                            <div class="axis-item-text hide">' +
		'                                <p>?</p>' +
		'                                <p style="color: #ffffff;">?</p>' +
		'                            </div>' +
		'                        </div>' +
		'                    </div>' +
		'                    <div class="axis-x">' +
		'                        <div class="axis-line"></div>' +
		'                        <div class="triangle"></div>' +
		'                    </div>' +
		'                </div>' +
		'            </div>' +
		'        </div>' +
		'        <div class="scenes-b-charts" id="scenesBCharts">' +
		'            <!--<img src="/images/insureplan/scenes_b.png">-->' +
		'            <div class="scenes-b-charts-box">' +
		'                <div class="b-charts-left b-charts-border hide">' +
		'                    <p>确诊给付</p>' +
		'                    <p>保额</p>' +
		'                </div>' +
		'                <div class="b-charts-icon hide">' +
		'                    <i class="iconfont iconjiahao"></i>' +
		'                </div>' +
		'                <div class="b-charts-right">' +
		'                    <div class="b-charts-right-content b-charts-border hide">' +
		'                        <div class="b-charts-right-text hide" id="centerText">' +
		'                            <p style="font-size: 14px;" id="sceneBText">300万报销额度</p>' +
		'                            <p>癌症新发/复发/转移/持续</p>' +
		'                            <p>都可100%报销</p>' +
		'                            <p>不限次数和病种</p>' +
		'                        </div>' +
		'                        <div class="b-charts-right-icon right-icon1 hide"><i' +
		'                                class="iconfont iconshoushu"></i><span>手术费</span></div>' +
		'                        <div class="b-charts-right-icon right-icon2 hide"><i' +
		'                                class="iconfont iconjianchabiao"></i><span>检查费</span></div>' +
		'                        <div class="b-charts-right-icon right-icon3 hide"><i' +
		'                                class="iconfont iconzhuyuanjiancha"></i><span>床位费</span>' +
		'                        </div>' +
		'                        <div class="b-charts-right-icon right-icon4 hide"><i' +
		'                                class="iconfont iconred-chongwuyaopin"></i><span>药品费</span></div>' +
		'                        <div class="b-charts-right-icon right-icon5 hide"><i' +
		'                                class="iconfont iconyaopin"></i><span>进口药</span>' +
		'                        </div>' +
		'                        <div class="b-charts-right-icon right-icon6 hide"><i' +
		'                                class="iconfont icon27"></i><span>靶向药</span>' +
		'                        </div>' +
		'                        <div class="b-charts-right-icon right-icon7 hide"><i' +
		'                                class="iconfont icon_shanshijiankang"></i><span>膳食费</span>' +
		'                        </div>' +
		'                        <div class="b-charts-right-icon right-icon8 hide"><i' +
		'                                class="iconfont iconyangshenghuli"></i><span>护理费</span></div>' +
		'                        <div class="b-charts-right-icon right-icon9 hide"><i' +
		'                                class="iconfont iconicon_zhenliao"></i><span>诊疗费</span></div>' +
		'                    </div>' +
		'                </div>' +
		'            </div>' +
		'        </div>' +
		'    </div>' +
		'</div>'

	return tpl
}

function sceneCTpl() {
	var tpl = '<div class="scenes-c-box">' +
		'    <div class="scenes-c">' +
		'        <div class="scenes-c-item-wrap">' +
		'            <div class="scenes-c-item icon item1 hide">' +
		'                <span><i class="iconfont iconlaoren"></i></span>' +
		'                <span>健康一生</span>' +
		'            </div>' +
		'        </div>' +
		'        <div class="scenes-c-item-wrap">' +
		'            <div class="scenes-c-item jiantou item2 hide">' +
		'                <span class="jiantou-wrap"><i class="iconfont iconjiantou"></i></span>' +
		'                <span class="jiantou-fix">一</span>' +
		'            </div>' +
		'        </div>' +
		'        <div class="scenes-c-item-wrap">' +
		'            <div class="scenes-c-item icon item3 hide">' +
		'                <span><i class="iconfont iconjiaren"></i></span>' +
		'                <span>指定受益人</span>' +
		'            </div>' +
		'        </div>' +
		'        <div class="scenes-c-item-wrap">' +
		'            <div class="jiantou item4 hide">' +
		'                <div class="scenes-c-item jiantou">' +
		'                    <span class="jiantou-wrap"><i class="iconfont iconjiantou"></i></span>' +
		'                    <span class="jiantou-fix">一</span>' +
		'                </div>' +
		'            </div>' +
		'        </div>' +
		'        <div class="scenes-c-item-wrap">' +
		'            <div class="scenes-c-item icon item5 hide">' +
		'                <span><i class="iconfont iconshouzhimingxicaifuhongbaoyue"></i></span>' +
		'                <span>财富传承</span>' +
		'            </div>' +
		'        </div>' +
		'    </div>' +
		'</div>'
	return tpl
}

function setCircleItemPosition() {
	//中心点横坐标
	var dotLeft = $('.b-charts-right').width() / 2 - 26
	//中心点纵坐标
	var dotTop = $('.b-charts-right-content').height() / 2 - 26
	//起始角度
	var stard = 0
	//半径
	var radius = 100 / 375 * document.body.clientWidth
	//每一个BOX对应的角度;
	var avd = 360 / $('.b-charts-right-icon').length + stard
	//每一个BOX对应的弧度;
	var ahd = avd * Math.PI / 180
	//设置圆的中心点的位置
	$('#centerText').css({left: dotLeft, top: dotTop})
	$('.b-charts-right-icon').each(function (index, element) {
//				console.log(Math.sin((ahd * index)) * radius, Math.cos((ahd * index)) * radius);
		$(this).css({
			display: 'flex',
			left: Math.cos((ahd * (index - 1))) * radius + dotLeft,
			top: Math.sin((ahd * (index - 1))) * radius + dotTop
		})
	})
	$('.b-charts-right-icon').show()
	$('.b-charts-right-icon').each(function (index, element) {
		var that = $(this)
		setTimeout(function () {
			that.stop().removeClass('hide').hide().fadeIn(450)
		}, index * 150)
//				console.log(element)
	})
}

function rateTpl(data) {
	var listTpl = ''
	data.forEach(function (item) {
		listTpl += '<li>' +
			'<span class="age">'+item.age+'</span>' +
			'<span class="money">'+item.premium+'</span>' +
			'</li>'
	})
	var tpl = '<div id="rateDialogs">' +
		'    <div class="js_dialog" id="iosDialog1" style="display: none;">' +
		'        <div class="weui-mask"></div>' +
		'        <div id="js_dialog_1" class="weui-half-screen-dialog">' +
		'            <div class="weui-half-screen-dialog__hd">' +
		'                <div class="weui-half-screen-dialog__hd__main">' +
		'                    <strong class="weui-half-screen-dialog__title">费率表</strong>' +
		'                </div>' +
		'                <div class="weui-half-screen-dialog__hd__side">' +
		'                    <button class="weui-icon-btn weui-icon-btn_close" style="color: #686868;" id="closeDialog">关闭' +
		'                    </button>' +
		'                </div>' +
		'            </div>' +
		'            <div class="weui-half-screen-dialog__bd">' +
		'                <div class="page">' +
		'                    <div class="page__bd" style="height: 100%;">' +
		'                        <div class="weui-tab">' +
		'                            <div class="weui-tab__panel">' +
		'                                <div class="panel-title">' +
		'                                    <span>年龄</span>' +
		'                                    <span>保费</span>' +
		'                                </div>' +
		'                                <ul id="rateList"  class="panel-list">'+listTpl+'</ul>' +
		'                            </div>' +
		'                        </div>' +
		'                    </div>' +
		'                </div>' +
		'            </div>' +
		'        </div>' +
		'    </div>' +
		'</div>'
	return tpl
}

function diseaseTpl() {
	var tpl = '<div id="dialogs">' +
		'    <div class="js_dialog" id="iosDialog1" style="display: none;">' +
		'        <div class="weui-mask"></div>' +
		'        <div id="js_dialog_1" class="weui-half-screen-dialog">' +
		'            <div class="weui-half-screen-dialog__hd">' +
		'                <div class="weui-half-screen-dialog__hd__main">' +
		'                    <strong class="weui-half-screen-dialog__title">疾病种类</strong>' +
		'                </div>' +
		'                <div class="weui-half-screen-dialog__hd__side">' +
		'                    <button class="weui-icon-btn weui-icon-btn_close" style="color: #686868;" id="closeDialog">关闭' +
		'                    </button>' +
		'                </div>' +
		'            </div>' +
		'            <div class="weui-half-screen-dialog__bd">' +
		'                <div class="page">' +
		'                    <div class="page__bd" style="height: 100%;">' +
		'                        <div class="weui-tab">' +
		'                            <div class="weui-navbar">'
		
		if(diseaseData_zz!=null&&diseaseData_zz!='')
		{
			tpl = tpl +
					'<div data-diseasedata="diseaseData_zz" id = "zz" class="dialog-tab weui-navbar__item weui-bar__item_on">' +
					'重疾' +
					'</div>'
		}
	    if(diseaseData_zhongz!=null&&diseaseData_zhongz!='')
	    {
	    	tpl = tpl +
	    			'<div data-diseasedata="diseaseData_zhongz" id = "zhongz" class="dialog-tab weui-navbar__item">' +
	    			'中症' +
	    			'</div>'
	    }
	    if(diseaseData_qz!=null&&diseaseData_qz!='')
	    {
	    	tpl = tpl +
	    			'<div data-diseasedata="diseaseData_qz" id = "qz" class="dialog-tab weui-navbar__item">' +
	    			'轻症' +
	    			'</div>'
	    }
	    	tpl = tpl +
		'                            </div>' +
		'                            <div class="weui-tab__panel" style="margin-top: 25px;">' +
		'                                <ul id="diseaseBox">' +
		'' +
		'                                </ul>' +
		'                            </div>' +
		'                        </div>' +
		'                    </div>' +
		'                </div>' +
		'            </div>' +
		'        </div>' +
		'    </div>' +
		'</div>'

	return tpl

}

function renderDiseaseBox(list) 
{
	list = JSON.parse(list);	
	var c = ''
	for(var i=0;i<list.length;i++)
	{
		c += '<li class="group-item group-name">'+list[i].groupName+'</li>'
		var diseaseList = list[i].groupList.split(',');
		for(var j=0;j<diseaseList.length;j++)
		{
			c+= '<li class="group-item">'+diseaseList[j]+'</li>'
		}
		c+='<br>'
	}
	$('#diseaseBox').html(c);
}

function expenseTpl(data) {
	var tpl = ''
	data.forEach(function (item) {
		tpl += '<li>' +
			'<span>'+item.dutyinfo+'</span>' +
			'<span>'+item.dutyamnt+'</span>' +
			'</li>'
	})
	return tpl
}

function modalHelper() {
	var scrollTop;
	var bodyCls = 'modal-open'
	return {
		//打开弹窗
		afterOpen: function() {
			scrollTop = document.scrollingElement.scrollTop;
			document.body.classList.add(bodyCls);
			document.body.style.top = -scrollTop + 'px';
		},
		//关闭弹窗
		beforeClose: function() {
			document.body.classList.remove(bodyCls);
			// scrollTop lost after set position:fixed, restore it back.
			document.body.style.top = 0;
			document.scrollingElement.scrollTop = scrollTop;
		}
	}
}

function httpRequest(url, method, data, fnObj) {
	$.ajax({
		url: url,
		type: method,
		data: data,
		dataType: 'json',
		timeout: 60000,
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

function setChartData(riskcode)
{
	console.log('chart riskcode',riskcode);
	
	isgetCharts = true;
	
	if(riskcode=='511505')
	{
		premList = [0, 92880, 154800, 154800, 154800];
		ageList = ['30岁', '48岁', '66岁', '84岁', '102岁'];
		valueList = [0, 70440, 168780, 261030, 288090];
		$('#sceneDescSub').text('（以30岁男性30万保额30年缴费为例）');
	}
	else if(riskcode=='hongkang000015')
	{
		premList = [0, 87480, 145800, 145800, 145800];
		ageList = ['30岁', '48岁', '66岁', '84岁', '102岁'];
		valueList = [0, 66199, 166049, 244902, 279373];
		$('#sceneDescSub').text('（以30岁男性30万保额30年缴费为例）');
	}
	else if(riskcode=='110055')
	{
		premList = [1518, 39468, 45540, 45540, 45540];
		ageList = ['0岁', '25岁', '50岁', '75岁', '100岁'];
		valueList = [0, 23127, 79341, 151269, 132126];
		
		max_value = '200000';
		interval_value = '100000'
		
		$('#sceneDescSub').text('（以0岁男宝宝30万保额30年缴费为例）');
	}
	
	disCharts();
}