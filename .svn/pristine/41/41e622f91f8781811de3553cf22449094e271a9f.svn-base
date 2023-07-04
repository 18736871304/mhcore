//隐藏选项遮罩层
$(".return-close").click(function () {
    if ($(".hq-mask,.trialCon").css("display") == 'block') {
        $(".body").css("overflow", 'auto')
        $('.hq-mask,.trialCon').css('display', 'none');
        $('.footer_go').text('测算保费')
    } else {
        alert('出错le')
    }
})
//隐藏告知书遮罩层
$(".return-close1").click(function () {

    if ($(".hq-mask1,.trialCon1").css("display") == 'block') {
        $(".body").css("overflow", 'auto')
        $('.hq-mask1,.trialCon1').css('display', 'none');
        $(".insureBtn").text('测算保费')
    } else {
        alert('出错le')
    }
})


//点击进入告知书页面
// $('.notice').click(function () {
//     window.location.href = "notification.html?user.pdf"
// })



//用出生年月来计算岁数
function getAgeByBirthDay(birth) {
    var returnAge = "";
    var aDate = new Date();
    var nowYear = aDate.getFullYear();
    var nowMonth = (aDate.getMonth() + 1) < 10 ? '0' + (aDate.getMonth() + 1) : (aDate.getMonth() + 1);
    var nowDay = (aDate.getDate()) < 10 ? '0' + aDate.getDate() : aDate.getDate();

    var birthYear = birth.split("-")[0];
    var birthMonth = birth.split("-")[1];
    var birthDay = birth.split("-")[2];
    if (nowYear == birthYear) {
        returnAge = 0; // 同年 则为0岁
    } else {
        var ageDiff = nowYear - birthYear; // 年之差
        if (ageDiff > 0) {
            if (nowMonth == birthMonth) {
                var dayDiff = nowDay - birthDay; // 日之差
                if (dayDiff < 0) {
                    returnAge = ageDiff - 1;
                } else {
                    returnAge = ageDiff;
                }
            } else {
                var monthDiff = nowMonth - birthMonth; // 月之差
                if (monthDiff < 0) {
                    returnAge = ageDiff - 1;
                } else {
                    returnAge = ageDiff;
                }
            }
        }
    }
    return returnAge;
}

function showprem() {
    var age = getAgeByBirthDay('1990-01-05');
    var sex = '1';
    var socialinsuflag = 'Y';
    var issmoke = 'N';
    var zdjb = 'Y';
    var zjzyjt = 'Y';
    var txyl = 'Y';
    var hwyl = 'Y';
    if ($("#showDate").attr("data-year") != 'null') {
        age = getAgeByBirthDay($("#showDate").attr("data-year") + "-" + $("#showDate").attr("data-month") + "-" + $("#showDate").attr("data-date"));
        objWei.insage = age
        sendPriceRequest("../../../../life/zhongan_h/calprem.do", objWei, function (data) {
                var obj = JSON.parse(data);
                //这里显示成功，在进行跳转
                if (obj.code == 0) {
                    $('#insurePrice').text(Number(obj.prem).toFixed(2))
                } else {}
            },
            function () {});
        return age;
    }
}

/* 出生日期选择 */
var selectDateDom = $('#selectDate');
var showDateDom = $('#showDate');
// 初始化时间
var now = new Date();
var nowYear = now.getFullYear();
var nowMonth = now.getMonth() + 1;
var nowDate = now.getDate();

showDateDom.attr('data-year', '1960');
showDateDom.attr('data-month', '01');
showDateDom.attr('data-date', '05');
// 数据初始化
function formatYear(nowYear) {
    var arr = [];
    for (var i = nowYear; i >= nowYear - 60; i--) {
        arr.push({
            id: i + '',
            value: i + ''
        });
    }
    return arr;
}

function formatMonth() {
    var arr = [];
    for (var i = 1; i <= 12; i++) {
        if (i < 10) {
            i = '0' + i;
        }
        arr.push({
            id: i + '',
            value: i + ''
        });
    }
    return arr;
}

function formatDate(count) {
    var arr = [];
    for (var i = 1; i <= count; i++) {
        if (i < 10) {
            i = '0' + i;
        }
        arr.push({
            id: i + '',
            value: i + ''
        });
    }
    return arr;
}
var yearData = function (callback) {
    // settimeout只是模拟异步请求，真实情况可以去掉
    // setTimeout(function() {

    callback(formatYear(nowYear));
    // }, 2000)
};
var monthData = function (year, callback) {
    // settimeout只是模拟异步请求，真实情况可以去掉
    // setTimeout(function() {
    callback(formatMonth());
    // }, 2000);
};
var dateData = function (year, month, callback) {
    // settimeout只是模拟异步请求，真实情况可以去掉
    // setTimeout(function() {
    if (/^(01|03|05|07|08|10|12)$/.test(month)) {
        callback(formatDate(31));
    } else if (/^(04|06|09|11)$/.test(month)) {
        callback(formatDate(30));
    } else if (/^02$/.test(month)) {
        if (year % 4 === 0 && year % 100 !== 0 || year % 400 === 0) {
            callback(formatDate(29));
        } else {
            callback(formatDate(28));
        }
    } else {
        throw new Error('month is illegal');
    }
    // }, 2000);
    // ajax请求可以这样写
    /*
    $.ajax({
        type: 'get',
        url: '/example',
        success: function(data) {
            callback(data);
        }
    });
    */
};

selectDateDom.bind('click', function () {


    var oneLevelId = showDateDom.attr('data-year');
    var twoLevelId = showDateDom.attr('data-month');
    var threeLevelId = showDateDom.attr('data-date');
    var iosSelect = new IosSelect(3, [yearData, monthData, dateData], {
        title: '',
        headerHeight: 50,
        itemHeight: 36,
        itemShowCount: 5,
        oneLevelId: oneLevelId,
        twoLevelId: twoLevelId,
        threeLevelId: threeLevelId,
        showLoading: true,
        callback: function (selectOneObj, selectTwoObj, selectThreeObj) {
            showDateDom.attr('data-year', selectOneObj.id);
            showDateDom.attr('data-month', selectTwoObj.id);
            showDateDom.attr('data-date', selectThreeObj.id);
            showDateDom.html(selectOneObj.value + '-' + selectTwoObj.value + '-' + selectThreeObj.value);
            showprem();
        }
    });
});




/* 出生日期选择 */
var selectDateDom1 = $('#selectDate1');
var showDateDom1 = $('#showDate1');


selectDateDom1.bind('click', function () {



    var oneLevelId = showDateDom1.attr('data-year');
    var twoLevelId = showDateDom1.attr('data-month');
    var threeLevelId = showDateDom1.attr('data-date');
    var iosSelect = new IosSelect(3, [yearData, monthData, dateData], {
        title: '',
        headerHeight: 50,
        itemHeight: 36,
        itemShowCount: 5,
        oneLevelId: oneLevelId,
        twoLevelId: twoLevelId,
        threeLevelId: threeLevelId,
        showLoading: true,
        callback: function (selectOneObj, selectTwoObj, selectThreeObj) {
            showDateDom1.attr('data-year', selectOneObj.id);
            showDateDom1.attr('data-month', selectTwoObj.id);
            showDateDom1.attr('data-date', selectThreeObj.id);
            showDateDom1.html(selectOneObj.value + '-' + selectTwoObj.value + '-' + selectThreeObj.value);
            showprem();
        }
    });
});




//选择选项属性
$(".filter-item .filter-center a").click(function () {
    $(this).parent("li").siblings().children("a").removeClass("wei-style");
    $(this).addClass("wei-style");
    $(".filter-title .filter-con").empty();
    iswei('.show-sex1', "inssex"); //投保人性别
    iswei('.show-sb', "socialinsuflag");
    iswei('.show-xy', "issmoke");
    iswei('.show-jb', "zdjb");
    iswei('.show-jbzy', "zjzyjt");
    iswei('.show-jbss', "txyl");
    iswei('.show-hwyl', "hwyl");
})


var objWei = {}
//判断哪个是要传递的值,进行数值和文字的转换
function iswei(classname, aa) {
    objWei[aa] = $(classname).find(".wei-style").text();
    if ($(classname).find(".wei-style").text() == '男') {
        objWei[aa] = "1"
    } else if ($(classname).find(".wei-style").text() == '女') {
        objWei[aa] = "0"
    }
    if ($(classname).find(".wei-style").text() == '是') {
        objWei[aa] = "Y"
    } else if ($(classname).find(".wei-style").text() == '否') {
        objWei[aa] = "N"
    }
    if ($(classname).find(".wei-style").text() == '有') {
        objWei[aa] = "Y"
    } else if ($(classname).find(".wei-style").text() == '无') {
        objWei[aa] = "N"
    }

    if ($(classname).find(".wei-style").text() == '投保') {
        objWei[aa] = "Y"
    } else if ($(classname).find(".wei-style").text() == '不投保') {
        objWei[aa] = "N"
    }

    objWei.insage = getAgeByBirthDay($('#showDate').text())
    sendPriceRequest("../../../../life/zhongan_h/calprem.do", objWei, function (data) {
            var obj = JSON.parse(data);
            //这里获取价格， 进行展示价格
            if (obj.code == 0) {
                $('#insurePrice').text(Number(obj.prem).toFixed(2))
            } else {}
        },
        function () {});
    return objWei;
}

//点击提交的时候进行获取值
$('.footer_go').click(function () {
    $('.footer_go').text('确认投保')
    iswei('.show-sex1', "inssex"); //投保人性别
    iswei('.show-sb', "socialinsuflag");
    iswei('.show-xy', "issmoke");
    iswei('.show-jb', "zdjb");
    iswei('.show-jbzy', "zjzyjt");
    iswei('.show-jbss', "txyl");
    iswei('.show-hwyl', "hwyl");
    objWei.insage = getAgeByBirthDay($('#showDate1').text())
    if ($(".hq-mask,.trialCon").css("display") != 'block') {
        $('.hq-mask,.trialCon').css('display', 'block');
        $(".body").css("overflow", 'hidden')

    } else {
        $('.hq-mask,.trialCon').css('display', 'none');
        $('.hq-mask1,.trialCon1').css('display', 'block');
    }


});

//点击确认投保
$('#click-insure').click(function () {
    window.location.href = 'notice.html'
    // + "?appsex=" + objWei.appsex + "&user=" + objWei.user +
    // "&socialinsuflagb=" + objWei.socialinsuflagb + "&issmoke=" + objWei.issmoke + "&zdjb=" + objWei.zdjb +
    // "&issmoke=" + objWei.issmoke + "&zjzyjt=" + objWei.zjzyjt + "&txyl=" + objWei.txyl + "&pryl=" + objWei.pryl +
    // "&hwyl=" + objWei.hwyl + "&appage=" + objWei.appage;
});





var url = window.location.href; //获取当前页面的url
function GetQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return unescape(r[2]);
    return null;
}
var dataReuserid = GetQueryString("reuserid")
if (dataReuserid == null) {
    dataReuserid = ''
}
console.log(url)
var data = {
    weburl: window.location.href,
    reuserid: dataReuserid
}
console.log(data)
$.ajax({
    url: "../../../../life/zhongan_h/getShareInfo_zxes2020.do",
    type: "get",
    async: false,
    data: data,
    beforeSend: function () {},
    success: function (data) {
        var obj = JSON.parse(data);
        console.log(obj)
        var jsstr = obj.jsstr
        var objqq = eval('(' + jsstr + ')');


        wx.config(objqq);

        var pyqtitle = obj.pyqtitle;
        var pyqlink = obj.pyqlink;
        var pyqimgurl = obj.pyqimgurl;
        var hytitle = obj.pyqtitle;
        var hydesc = obj.hydesc;



        var hylink = obj.hylink;
        var hyimgurl = obj.hyimgurl;
        var reuserid = obj.reuserid;
    
        wx.ready(function () { //朋友圈
            wx.onMenuShareTimeline({
                title: pyqtitle, // 分享标题
                link: pyqlink + '&reuserid=' + reuserid, // 分享链接
                imgUrl: pyqimgurl,
                success: function (res) {
                    // alert(1);
                },
                cancel: function (res) {
                    //alert(2);
                },
                fail: function (res) {

                }
            });
            //朋友
            wx.onMenuShareAppMessage({
                title: hytitle, // 分享标题
                desc: hydesc, // 分享描述
                link: hylink + '&reuserid=' + reuserid, // 分享链接
                imgUrl: hyimgurl,
                type: '', // 分享类型,music、video或link，不填默认为link
                dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
                success: function () {
                    
                    // 用户确认分享后执行的回调函数
                    // alert(2);
                },
                cancel: function () {
                    // 用户取消分享后执行的回调函数
                    // alert(4);
                }
            });

            // wx.getLocation({
            //     success: function (res) {
            //         //alert("获取地理位置成功，经纬度为：（" + res.latitude + "，" + res.longitude + "）" );
            //     },
            //     fail: function (error) {
            //         //alert("获取地理位置失败");
            //     }
            // });
        });
        wx.error(function (res) {
            alert(res.errMsg);
            // alert("出错了");
        });


    },
})







// getSignature()

// function getSignature() {
//     $.ajax({
//         url: '../../../user/getWxFxInfo.do',
//         // url: '../../../../life/zhongan_h/getShareInfo_zxes2020.do',
//         type: 'GET',
//         dataType: 'json',
//         success: function (res) {
//             console.log(res)
//             console.log(res.jsstr)
//             var shareData = {
//                 title: res.pyqtitle,
//                 desc: res.hydesc,
//                 imgUrl: res.hyimgurl,
//                 link: window.location.href
//             }
//             wx.config(res.jsstr)
//             wx.ready(function () {
//                 //朋友圈
//                 wx.updateTimelineShareData(shareData);
//                 //朋友
//                 wx.updateAppMessageShareData(shareData);
//             });
//             wx.error(function (res) {
//                 console.log(res)
//                 console.log('123')
//                 //alert(JSON.stringify(res));
//             });
//         },
//         error: function (error) {
//             console.log(error)
//         }
//     })
// }



























function sendPriceRequest(url, data, success, error) {
    $.ajax({
        url: url,
        type: "post",
        async: true,
        data: data ? data : {},
        beforeSend: function () {},
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
        complete: function () {}
    });
}