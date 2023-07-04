var signtype = '1'

$(function () {

    //获取参数封装
    function GetParam(name) {
        //设置正则表达式
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
        // 设置或返回从问号 (?) 开始的 URL（查询部分）
        var r = window.location.search.substr(1).match(reg);
        if (r != null) {
            // 解码一个编码的 URI 组件。
            return decodeURIComponent(r[2]);
        }
        return null;
    }
    var orderid = GetParam('orderid')
    var productCode = GetParam('productCode')
    // var orderid = GetRequest();
    $('#orderNo').val(orderid)
    $('#productCode').val(productCode)

    var userurl = `../../../../life/zhongan_h/contractpay_html.do?orderid=${orderid}`
    // sendRequest(userurl, function (data) {
    //     console.log(userurl)
    //     var obj = JSON.parse(data);
    //     if (obj.code != 0) {
    //         $(".pop").show().find("span").html(obj.msg);
    //         $(".mask").show();
    //         return;
    //     }
    // }, function () {})

    $.ajax({
        url: userurl,
        type: "post",
        async: true,
        data: {},
        beforeSend: function () {
            $(".loading").show();
        },
        success: function (data) {
            console.log(data)
            var obj = JSON.parse(data);
            var appinfo = obj.policyinfo
            var money = Number(appinfo.sumprem).toFixed(2)
            // 订单信息
            $(".proposalprtno").text(appinfo.proposalprtno)
            $(".riskname").text(appinfo.riskname)
            $(".state").text(appinfo.amnt)
            $(".insuyear").text(appinfo.insuyear)
            $(".payendyear").text(appinfo.payendyear)
            $("#insurePrice").text(money)
            $(".paymoney").text(money)

            // 投保人信息
            $('.appntname').text(appinfo.appntname)
            $('.appntsex').text(appinfo.appntsex)
            $('.appntbirthday').text(appinfo.appntbirthday)
            $('.appntidno').text(appinfo.appntidno)
            $('.appntmobile').text(appinfo.appntmobile)
            $('.appntname').text(appinfo.appntname)



            var tinsList = obj.insList
            var Num = ['一', '二', '三', '四', '五', '六', '七']
            //循环添加
            var html = ''
            for (let i = 0; i < tinsList.length; i++) {
                html += `
                <section class="pl pr pt bgColor">
                <p class="borBot1 secTitle">被保人信息 ${Num[i]}</p>
                <div class="orderDetails  w100">
                    <div class="tinsList">
                        <dl>
                            <span class="orderLeft">姓名：</span>
                            <span class="orderRight appntname">${tinsList[i].name}</span>
                        </dl>
                        <dl>
                            <span class="orderLeft">性别：</span>
                            <span class="orderRight appntsex">${tinsList[i].sex}</span>
                        </dl>
                        <dl>
                            <span class="orderLeft">生日：</span>
                            <span class="orderRight appntbirthday">${tinsList[i].birthday}</span>
                        </dl>
                        <dl>
                            <span class="orderLeft">证件号码：</span>
                            <span class="orderRight">${tinsList[i].idno}</span>
                        </dl>

                    </div>
                </div>
            </section>
                `
            }
            $('#addhtml').append(html)
        },
        error: function (data) {},
        complete: function () {
            $(".loading").hide();
        }
    });

    //显示隐藏订单详情
    $(".order").on("click", function () {
        if ($(this).find("span").hasClass("hideOrder")) {
            $(".info").slideDown();
            $(this).find("span").removeClass("hideOrder").addClass("showOrder").text("隐藏订单详情 ");
        } else {
            $(".info").slideUp();
            $(this).find("span").removeClass("showOrder").addClass("hideOrder").text("显示订单详情 ");
        }
    });
    //滚动到一定位置固定
    $(window).scroll(function (event) {
        var headerHeight = $(".header").height(),
            scrollTop = $(window).scrollTop(),
            orderHeight = $(".order").height();
        if (scrollTop > headerHeight) {
            $(".order").addClass("orderFixed borBot1");
            $(".info").addClass("paddingTop");
        } else {
            $(".order").removeClass("orderFixed borBot1");
            $(".info").removeClass("paddingTop");
        }
    });
    //支付方式选择
    $(".payMethod").each(function () {
        $(this).on("click", function () {
            $(this).find("i").removeClass("unCheckBox").addClass("checkBox");
            $(this).siblings("dl").find("i").removeClass("checkBox").addClass("unCheckBox");
            $(this).find("i").siblings("input").prop("checked", true);
        })
    });
    $("input[name='payType']").each(function () {
        if ($(this).prop("checked")) {
            $(this).siblings("i").removeClass("unCheckBox").addClass("checkBox");
        } else {
            $(this).siblings("i").removeClass("checkBox").addClass("unCheckBox");
        }
    });
    //是否阅读投保声明
    $("#whetherCheck").on("click", function () {
        if ($(this).hasClass("unCheckBox")) {
            $(this).removeClass("unCheckBox").addClass("checkBox");
        } else {
            $(this).removeClass("checkBox").addClass("unCheckBox");
        }
    });
    //弹窗
    $(".pop-sure").on("click", function () {
        $(".pop").hide();
        $(".mask").hide();
    });
    //关闭二维码
    $(".closeQrcodeBtn").click(function () {
        $(".qrcodeMask").hide();
        $(".qrcodeMask canvas").remove();
        clearInterval(window.timer);
    })

    //点击修改回退
    $(".modify").on("click", function () {
        goBack();

    });
});






function sendRequest(url, data, success, error) {
    $.ajax({
        url: url,
        type: "post",
        async: true,
        data: data ? data : {},
        beforeSend: function () {
            $(".loading").show();
        },
        success: function (data) {
            if (success) {
                success(data);
            }
        },
        error: function (data) {
            if (error) {
                error(data);
            }
        },
        complete: function () {
            $(".loading").hide();
        }
    });
}