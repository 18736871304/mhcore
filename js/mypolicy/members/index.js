$(function () {
	var renderData = {
		list: [
			{
				name: '保全服务',
				imgPath: '/images/mypolicy/members/baoquanfuwu.png',
				pageType: 'bq'
			},
			{
				name: '保单托管',
				imgPath: '/images/mypolicy/members/baodantuoguan.png',
				pageType: 'bt'
			},
			{
				name: '律师服务',
				imgPath: '/images/mypolicy/members/lvshifuwu.png',
				pageType: 'lf'
			},
			{
				name: '健康讲座',
				imgPath: '/images/mypolicy/members/jiankangjiangzuo.png',
				pageType: 'jk'
			},
			// {
			// 	name: '家庭医生',
			// 	imgPath: '/images/mypolicy/members/jiatingyisheng.png',
			// 	pageType: 'jt'
			// },
			{
				name: '体检筛查',
				imgPath: '/images/mypolicy/members/tijianshaicha.png',
				pageType: 'tc'
			},
			{
				name: '就医绿通',
				imgPath: '/images/mypolicy/members/jiuyilvtong.png',
				pageType: 'jy'
			},
			{
				name: '重疾绿通',
				imgPath: '/images/mypolicy/members/zhongjilvtong.png',
				pageType: 'zl'
			},
			{
				name: '购药优惠',
				imgPath: '/images/mypolicy/members/gouyaoyouhui.png',
				pageType: 'gy'
			}
		]
	}

	var indexFunc = {
		init: function () {
			//ajax获取用于渲染页面的数据
			// this.getData()
			this.setStyle()
			this.renderPage(renderData.list)
			this.bindEvent()
			//TODO 如果接口返回不是会员，则显示对话框
			
			if(ismember!='00')
			{
				/*
				$.alert({
					title: '温馨提示',
					text: '<div style="font-size: 14px;padding-bottom: 10px;">您还不是我们的会员，如有保险需求可直接拨打服务热线：400-9200-713或联系您的服务专员!',
					onOK: function () {
						//点击确认
					}
				})
				*/
				messageAlert('您还不是我们的会员，如有保险需求可直接拨打服务热线：400-9200-713或联系您的服务专员!');
			}
			
		},
		setStyle: function () {
		},
		bindEvent: function () {
			var that = this
			$('body').on('click', '.content-list', function () {
				var pagetype = $(this).data('pagetype')
				location.href = "/life/common/members.do?pageType="+pagetype;
			})
		},
		renderPage: function (list) {
			var tpl = ''
			list.forEach(function (item) {
				tpl += '<li class="content-list" data-pagetype="'+item.pageType+'">' +
					'                        <span><img src="'+item.imgPath+'"></span>' +
					'                        <span>'+item.name+'</span>' +
					'                    </li>'
			})
			$('#contentBox').html(tpl)
		}
	}
	indexFunc.init()

})
