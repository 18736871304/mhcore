$(function () {
  var uCodeMaxLength = 4
  var PhoneMaxLength = 11

  $('.to_top').click(function () {
    scrollTo(0, 0)
  })

  window.toast = function (params, fn) {
		if (params.message == null || params.message.trim == "") return false
		params.time = params.time || 1000

		var el = document.createElement('div')
		el.setAttribute('id', 'toast')
		el.innerHTML = params.message
		document.body.appendChild(el)
		el.classList.add("fadeIn")
		setTimeout(function () {
			el.classList.remove("fadeIn")
			el.classList.add("fadeOut")
			el.addEventListener("animationend", function () {
				document.body.removeChild(el)
				el = null
				if (fn) {
					fn()
				}
			})
		}, params.time)
  }

  $('input[name="phone"]').on('input', function () {
    var inputVal = $(this).val()
    var reg = /[^0-9]\d*/
    if (reg.test(inputVal)) {
      $(this).val(inputVal.replace(reg,''))
    }
    if (inputVal.length > PhoneMaxLength) {
      $(this).val(inputVal.substring(0, PhoneMaxLength));
    }
  });

  $('input[name="code"]').on('input', function () {
    var inputVal = $(this).val()
    var reg = /[^0-9]\d*/
    if (reg.test(inputVal)) {
      $(this).val(inputVal.replace(reg,''))
    }
    if (inputVal.length > uCodeMaxLength) {
      $(this).val(inputVal.substring(0, uCodeMaxLength));
    }
  });

})
