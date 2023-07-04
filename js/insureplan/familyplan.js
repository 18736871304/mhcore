var familyTabList = []

var yl_rateList = [];
var dbbc_rateList = [];

var diseaseData_zz = '';
var diseaseData_qz = '';
var diseaseData_zhongz = '';

var isDiseaseDataComplete = false;

var current_top;
var scrollTop;

var viewplanFunc = {
	init: function () {
		this.setStyle()
		this.bindEvent()
	},
	setStyle: function () 
	{
		var _this = this
		
		httpRequest('/staff/plan/getFamilyPlanInfo.do', 'post', {'planid':$('#planid').val()}, 
		{
            success: function (res) 
		    {
            	if(res.code=='0')
            	{
            		$('#uname').text(res.familyPlanInfo.insname);
            		$('#guaranteeNumber').text(res.familyPlanInfo.insuredcount+'位')
            		$('#firstYearMoney').text(res.familyPlanInfo.sumprem+'元')
            		_this.renderFamilyTab(res.familyMemberList)
            		
            		_this.renderExpense(res.familyMemberList[0].memberid);
            	}
		    }
		})
		
		//this.renderFamilyTab(familyTabList)
		//this.renderExpense()
	},
	bindEvent: function () {
		var self = this
		//tab
		$('body').on('click', '#familyTab li', function () {
			console.log($(this).attr('data-familyid'))
			var familyId = $(this).attr('data-familyid')
			$(this).addClass('current-tab').siblings('li').removeClass('current-tab')
			self.renderExpense(familyId)
		})
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
		$('body').on('click', '#more_desp', function () 
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
		
		//家庭保单配置样板间
		$('body').on('click', '#jiatingbaodanpeizhi', function () {
			console.log('家庭保单配置样板间')
		})
		//常见问题 手风琴
		$('body').on('click', '.accordion-item', function () {
			var curLi = $(this)
			var restUl = $(this).find('.accordion-detail')
			var img = $(this).find('.accordion-title span:last-child img')
			if (restUl.css('display') === 'none') {
				restUl.slideDown()
				img.css({transform: 'rotate(180deg)'})
			} else {
				restUl.slideUp()
				img.css({transform: 'rotate(0deg)'})
			}
			curLi.siblings().find('.accordion-detail').slideUp()
			curLi.siblings().find('.accordion-title img').css({transform: 'rotate(0deg)'})
		})
	},
	renderExpense: function (familyId) 
	{
		$('#yiwaibaozhangSection').hide()
		$('#yiliaobaozhangSection').hide()
		$('#zhongjibaozhangSection').hide()
		$('#dabingbuchongSection').hide();
		$('#shengubaozhangSection').hide();
		$('#zongbaofeiSection').hide();
		
		httpRequest('/staff/plan/getPlanDetail.do', 'post', {"planid": $("#planid").val(),"plantype":"02","memberid":familyId}, 
		{
			success: function (data) 
			{
				for(var i=0;i<data.planrisklist.length;i++)
				{
					if(data.planrisklist[i].risktype=='01')
					{
						$('#yiwaibaozhangSection').show()
						$('#yiwaibaozhangbaozhangBox').html(expenseTpl(data.risktype01_dutyinfo))
						$('#yiwaibaozhangImg').attr('src', data.planrisklist[i].logourl);
						$('#yiwaibaozhangTotal').text(Number(data.planrisklist[i].prem).toFixed(2)+'元');
						$('#yiwaibaozhangExplain').hide()
					}
					else if(data.planrisklist[i].risktype=='02')
					{
						$('#yiliaobaozhangSection').show()
						$('#xiaobingbaozhangBox').html(expenseTpl(data.risktype02_dutyinfo))
						$('#xiaobingbaozhangImg').attr('src', data.planrisklist[i].logourl)
						$('#yiliaobaozhangTotal').text(Number(data.planrisklist[i].prem).toFixed(2)+'元')
						$('#xiaobingbaozhangExplain').show();
						yl_rateList = data.risktype02_rateinfo;
					}
					else if(data.planrisklist[i].risktype=='03')
					{
						var premEndStr = '';
						
						if(data.planrisklist[i].payintv=='1')
						{
							premEndStr = '/月'
						}
						else
						{
							premEndStr = '/年'
						}
						
						$('#zhongjibaozhangSection').show()
						$('#dabingbaozhangBox').html(expenseTpl(data.risktype03_dutyinfo))
						$('#dabingbaozhangImg').attr('src', data.planrisklist[i].logourl)
						$('#zhongjibaozhangTotal').text(Number(data.planrisklist[i].prem).toFixed(2)+'元')
						$('#dabingbaozhangExplain').hide()
						
						diseaseData_zz = data.disease_zz;
						diseaseData_qz = data.disease_qz;
						diseaseData_zhongz = data.disease_zhongz;
						
						isDiseaseDataComplete = true;
					}
					else if(data.planrisklist[i].risktype=='dbbc')
					{
						$('#dabingbuchongSection').show();
						$('#dabingbuchongBox').html(expenseTpl(data.risktypedbbc_dutyinfo))
						$('#dabingbuchongImg').attr('src', data.planrisklist[i].logourl)
						$('#dabingbuchongTotal').text(Number(data.planrisklist[i].prem).toFixed(2)+'元')
						$('#dabingbuchongExplain').show()
						dbbc_rateList = data.risktypedbbc_rateinfo;
					}
					else if(data.planrisklist[i].risktype=='04')
					{
						if(data.planrisklist[i].payintv=='1')
						{
							premEndStr = '/月'
						}
						else
						{
							premEndStr = '/年'
						}
						
						$('#shengubaozhangSection').show()
						$('#shengubaozhangBox').html(expenseTpl(data.risktype04_dutyinfo))
						$('#shengubaozhangImg').attr('src', data.planrisklist[i].logourl)
						$('#shengubaozhangTotal').text(Number(data.planrisklist[i].prem).toFixed(2)+'元')
						$('#shengubaozhangExplain').hide()
					}
				}
				
				$('#zongbaofeiTotal').text(Number(data.sumprem).toFixed(2)+'元')
				$('#zongbaofeiSection').show()
			}
		})
	},
	renderFamilyTab: function (data) {
		var tpl = ''
		data.forEach(function (item, index) {
			var c = index === 0 ? 'current-tab' : ''
			tpl += '<li class="'+c+'" data-familyid="'+item.memberid+'">' +
				'                            <p>'+item.relation+'</p>' +
				'                            <p>'+item.sexname+'-'+item.age+'岁</p>' +
				'                        </li>'
		})
		$('#familyTab').html(tpl)
	}
}
viewplanFunc.init()

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

function modalHelper() {
	var bodyCls = 'modal-open'
	return {
		//打开弹窗
		afterOpen: function() {
			scrollTop = document.scrollingElement.scrollTop;
			current_top = document.body.style.top;
			
			document.body.classList.add(bodyCls);
			document.body.style.top = -scrollTop + 'px';
		},
		//关闭弹窗
		beforeClose: function() {
			document.body.classList.remove(bodyCls);
			// scrollTop lost after set position:fixed, restore it back.
			document.body.style.top = current_top;
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
