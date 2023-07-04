function getData(url, method, data, fn) {
	$.ajax({
		url: url,
		type: method,
		data: data,
		dataType: 'json',
		timeout: 15000,
		beforeSend: function () {
			$.showLoading("加载中...")
			if (fn && fn.beforeSend) {
				fn.beforeSend()
			}
		},
		complete: function (xhr, status) {
			// $.hideLoading()
			if (status === 'timeout') {
				console.log('api time out')
			}
		},
		success: function (res) {
			$.hideLoading()
			if (fn && fn.success) {
				fn.success(res)
			}
		},
		error: function (error) {
			$.hideLoading()
			console.log(error)
			if (fn && fn.error) {
				fn.error(error)
			}
		}
	})
}

function getData_noloading(url, method, data, fn) {
	$.ajax({
    	url: url,
        type: method,
        data: data,
        dataType: 'json',
        timeout: 15000,
        beforeSend: function () {
            if (fn && fn.beforeSend) {
                fn.beforeSend()
            }
        },
        complete: function (xhr, status) {
            if (status === 'timeout') {
                console.log('api time out')
            }
        },
        success: function (res) {
            if (fn && fn.success) {
                fn.success(res)
            }
        },
        error: function (error) {
            console.log(error)
            if (fn && fn.error) {
                fn.error(error)
            }
        }
    })
}

function getQueryValue(queryName) {
	var reg = new RegExp("(^|&)" + queryName + "=([^&]*)(&|$)", "i");
	var r = window.location.search.substr(1).match(reg);
	if (r != null) {
		return decodeURI(r[2]);
	} else {
		return null;
	}
}