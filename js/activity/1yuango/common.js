/**
 @Date 2019-12-17
 @Project  service
 */

function toast(params, fn) {
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
function validatemobile(mobile) {
    if (mobile == null || mobile == "") {
        toast({
            message: '请输入手机号码！',
            time: 1500
        })
        return false;
    }

    if (mobile.length == 0) {
        toast({
            message: '请输入手机号码！',
            time: 1500
        })
        return false;
    }

    if (mobile.length != 11) {
        toast({
            message: '请输入有效的手机号码！',
            time: 1500
        })
        return false;
    }

    // var myreg = /^0?1[3|4|5|7|8][0-9]\d{8}$/;
    var myreg = /^(13[0-9]|14[579]|15[0-3,5-9]|16[6]|17[0135678]|18[0-9]|19[89])\d{8}$/;
    if (!myreg.test(mobile)) {
        toast({
            message: '请输入有效的手机号码！',
            time: 1500
        })
        return false;
    }
    return true;
}
function isChinese(str){
    var reg=/^[\u4E00-\u9FA5]+$/;
    if(!reg.test(str)){
        return false;
    }
    return true;
}
