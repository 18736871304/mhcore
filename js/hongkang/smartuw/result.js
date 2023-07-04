$(function () {

	var resultFunc = {
		init: function () {
			this.bindEvent()
			this.getResult()
		},
		bindEvent: function () {
			$('body').on('click', '.meihua-button', function () {
				var type = $(this).data('type')
				console.log(type)
				if (type === 'return') {
					//返回首页
					console.log('返回首页')
				} else if (type === 'confirm') {
					//确定或 立即投保
					console.log('确定或 立即投保')
				} else if (type === 'abandon') {
					//放弃投保
					console.log('放弃投保')
					$.confirm({
						title: '',
						text: '是否确定放弃投保？',
						onOK: function () {
							//点击确认
							console.log('点击确认')
						},
						onCancel: function () {
							console.log('点击取消')
						}
					})
				} else if (type === 'other') {
					//还有异常
					console.log('还有异常')
				}
			})
		},
		getResult: function () {
			var self = this
			//成功，有加费
			var url = './mock/result_success_plus.json'
			//成功，无加费
			// var url = './mock/result_success.json'
			//失败
			// var url = './mock/result_failure.json'
			getData(url, 'get', null, {
				success: function (res) {
					console.log(res)
					if (res.result === 'success') {
						self.renderSuccess(res)
					} else if (res.result === 'failure') {
						self.renderFailure(res)
					}
				}
			})
		},
		renderSuccess: function (res) {
			if (res.result === 'success') {
				var tpl = '<div class="result-img-box">' +
					'        <img src="./asset/success.png">' +
					'        <p class="main-text">可以投保</p>' +
					'      </div>'
				var btnTpl = ''
				if (res.plus && Object.keys(res.plus).length) {
					//有加费
					var reason = res.plus.reason.join('、')
					var plusTpl = '因<span>'+reason+'</span>，需加费，加费金额为<span class="money">'+res.plus.increaseNumber+'</span>元，基础保费为<span class="money">'+res.plus.baseNumber+'</span>元。'
					$('#plusContent').html(plusTpl)
					$('.result-plus-list').removeClass('hide')
					btnTpl = '<button class="meihua-button button-confirm" data-type="confirm">确定</button>'
				} else {
					btnTpl = '<button class="meihua-button button-confirm" data-type="confirm">接受，立即投保</button>' +
						'      <button class="meihua-button button-fail" data-type="abandon">放弃投保</button>' +
						'      <button class="meihua-button button-return" data-type="other">还有其他异常</button>'
				}
				$('#resultContent').html(tpl)
				$('#resultBtn').html(btnTpl)
			}
		},
		renderFailure: function (res) {
			if (res.result === 'failure') {
				var tpl = '<div class="result-img-box">' +
					'        <img src="./asset/failure.png">' +
					'        <p class="main-text">非常遗憾</p>' +
					'        <p class="sub-text">被保险人无法投保该险种</p>' +
					'      </div>'
				var btnTpl = '<button class="meihua-button button-return" data-type="return">返回首页</button>'
				$('#resultContent').html(tpl)
				$('#resultBtn').html(btnTpl)
			}
		}
	}

	resultFunc.init()
})