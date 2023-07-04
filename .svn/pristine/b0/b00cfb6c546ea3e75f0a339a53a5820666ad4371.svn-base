
define(['jquery', 'jquery-weui'], function ($, jqueryWeui) {
	function getData (url, method, data) {
		return new Promise(function (resolve, reject) {
			$.ajax({
				url: url,
				type: method,
				data: data,
				dataType: 'json',
				timeout: 15000,
				beforeSend: function () {
					$.showLoading("加载中...")
				},
				complete: function (xhr, status) {
					// $.hideLoading()
					if (status === 'timeout') {
						console.log('api time out')
					}
				},
				success: function (res) {
					$.hideLoading()
					resolve(res)
				},
				error: function (error) {
					$.hideLoading()
					console.log(error)
					reject(error)
				}
			})
		})
	}
    return {
		getData: getData
    }
});
