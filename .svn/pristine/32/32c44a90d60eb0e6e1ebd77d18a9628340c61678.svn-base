function listTpl(data) {
	var listItem = ''

	if (!Array.isArray(data) || data.length === 0) {
		return ''
	}

	data.forEach(function (item) {
		listItem += '<li class="list-item">' +
			'        <div class="list-item-left">' +
			'          <img src="'+item.imgSrc+'">' +
			'        </div>' +
			'        <div class="list-item-right">' +
			'          <div class="top">'+item.title+'</div>' +
			'          <div class="bottom">'+item.desc+'</div>' +
			'        </div>' +
			'      </li>'
	})

	var listBox = '  <ul class="list-box-wrap">' + listItem + '  </ul>'

	return listBox
}

function messageAlert(msg) {
	console.log('dom')
	var dom = '<div class="member-message-box hide" id="messageBox">' +
		'    <div class="member-message-mask"></div>' +
		'    <div class="member-message-content">' +
		'        <div class="member-message-title">' +
		'            <span>温馨提示</span>' +
		'            <span class="close" id="close">×</span>' +
		'        </div>' +
		'        <div class="member-message-msg">'+msg+'</div>' +
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

function connect_us(pagetype)
{
	sendRequest("/life/common/connectUs.do",{"pageType":pagetype},function (data) 
	{
		messageAlert('您的管家已收到您的请求，稍后会立即与您联系，请您耐心等待！')
	},function(){});
}