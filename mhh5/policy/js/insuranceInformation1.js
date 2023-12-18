var insured_index = 2;
var familympehm = 'N';

var currYear = (new Date()).getFullYear();

var personCount = 1

function addDay(dayNumber, date) {
    date = date ? date : new Date();
    var ms = dayNumber * (1000 * 60 * 60 * 24);
    var newDate = new Date(date.getTime() + ms);
    return newDate;
}
var birthdayObj = {
    theme: 'android-ics light', //皮肤样式
    display: 'bottom', //显示方式
    rtl: true,
    mode: 'scroller', //日期选择模式
    lang: 'zh',
    dateFormat: 'yyyy-mm-dd',
    dateOrder: 'ddmmyy',
    startYear: currYear - 61, //开始年份
    endYear: currYear, //结束年份
    maxDate: addDay(0),
};

$(function () {


































    


    // $("#insuredBirthday").scroller('destroy').scroller($.extend({
    //     preset: 'date'
    // }, birthdayObj));

    window.onpageshow = function (event) {
        if (event.persisted) {
            window.location.reload();
        }
    }
    //勾选同意
    $("#whetherCheck").on("click", function () {
        $(".zhezhao").css("display", 'block')
        $(".zeren-info").css("display", 'block')
        $(".ze-mian").css("display", 'block')
        $(".tou-ti").css("display", 'none')
        $(".body").css("overflow", 'hidden')
        if ($(this).hasClass("unCheckBox")) {
            $(this).removeClass("unCheckBox").addClass("checkBox");
        } else {
            $(this).removeClass("checkBox").addClass("unCheckBox");
        }
    });

    $("#whetherCheck1").on("click", function () {
        $(".zhezhao").css("display", 'block')
        $(".title").css("display", 'block')
        $(".body").css("overflow", 'hidden')
    });
    $("#ze-button1").on("click", function () {
        $(".title").css("display", 'none')
        $(".zhezhao").css("display", 'none')
        $(".body").css("overflow", 'auto')
        $("#whetherCheck1").removeClass("unCheckBox").addClass("checkBox");
    });
    if ($("#idNo").val() !== '') {
        calPrice1()
    }
    $("#insuredCardType").on("change", function () {
        $("#insuredBirthday").val("");
        $("#insuredIdNo").focus();
        changeInsuredCardType();
    });
    $("#idNo").on("change", function () {});
    // 投保人姓名校验
    $("#policyName").on("blur", function () {
        checkName($(this));
        $("#insuredName").siblings(".mySelf").val($(this).val());
    });
    //投保人手机号码校验
    $("#tel").on("blur", function () {
        checkTel($(this));
        $("#insuredMobile").siblings(".mySelf").val($(this).val());
    });
    //投保人证件号码校验
    $("#idNo").on("blur", function () {
        checkID($(this));
    });
    //投保人邮箱校验
    $("#email").on("blur", function () {
        checkEmail($(this));
    });
    //子女配偶姓名校验
    $("#insuredName").on("blur", function () {
        checkName($(this));
    });
    // 被保人证件号码校验
    $("#insuredIdNo").on("blur", function () {
        checkID($(this));
    });
    //被保人手机号码校验
    $("#insuredMobile").on("blur", function () {
        checkTel($(this));
    });

    for (var i = 2; i < 7; i++) {
        // $('#insuredMobile0' + i).on("blur", function () {
        //     checkTel($(this));
        // })
        $('#insuredMobile0' + i).change(function () {
            checkTel($(this));
        })
    }
    $("#insuredIdNo").change(function () {
        $(this).val($(this).val().toUpperCase());
        if ($("#insuredCardType").find("option:selected").text() == "身份证" && $("#isSelf").val() == 0) {
            checkID($(this));
            if (checkID($(this))) {
                //带出生日和性别
                $(".insuredBirthdayReadonly").val(getBirthdayByIDCard($(this).val().trim()));
                $("#insuredBirthday").val(getBirthdayByIDCard($(this).val().trim()));
                $(".insuredSexReadonly").val(getSexByIDCard($(this).val().trim()) == "1" ? "男" : "女");
                getSexByIDCard($(this).val().trim()) == "1" ? $("#insuredSex").find("option").eq(0).prop("selected", true) : $("#insuredSex").find("option").eq(1).prop("selected", true);
            } else {
                //身份证错误时清空生日和性别
                $(".insuredBirthdayReadonly").val("");
                $("#insuredBirthday").val("");
                $(".insuredSexReadonly").val("");
                return;
            }
        }
        calPrice1();
    });


    $("#sureToSave").click(function () {
        if (!checkAll()) return; //如果为假 就返回， 所以checkAll()为假
        var transData = {
            "jsonStr": getData()
        };
        sendRequest("../../../../life/zhongan_h/newcontract_save.do", transData, function (data) {
            console.log(data)
            var obj = JSON.parse(data);
            if (obj.code == 0) {

                var orderNo = obj.orderNo;
                // window.location.href = "payment.html?orderid=" + orderNo;
                window.location.href = "payment.html?orderid=" + orderNo + "&productCode=" + $("#productcode").val();
            } else {
                $(".pop").show();
                $(".mask").show();
                $(".pop span").text(obj.msg);
            }
        }, function () {});
    });

    $("#addinsured_button").click(function (e) {
        personCount++
        addOneInsured();
        insuredclick();
        if (personCount > 1) {
            for (var i = 0; i < personCount; i++) {
                console.log(i + 2)
                calprice2(i + 2)
            }
        }

    });

    $(".insured_change").change(function () {
        calPrice1();
    });




    // 获取页面传递的参数,路径中的url
    function GetRequest() {
        var url = location.search;
        var theRequest = new Object();
        if (url.indexOf("?") != -1) {
            var str = url.substr(1);
            return str;
        }
    }
    var urlid = GetRequest();
    console.log(urlid)
    var userurl = `../../../../life/zhongan_h/getInitData_html.do?${urlid}`
    console.log(urlid == undefined)
    if (urlid == undefined) {} else {
        sendRequest(userurl, function (data) {
                console.log(data)
                // var obj = JSON.parse(data)
                // if (obj.code == 0) {

                // }
            },
            function (data) {
                console.log(data)
                var obj = JSON.parse(data)
                $("#uwid").val(obj.appnt.uwid)
                $('#policyName').val(obj.appnt.name);
                $('#idNo').val(obj.appnt.idno);
                $('#idNo').change();
                if (obj.insuredList.length > 0) {
                    personCount = obj.insuredList.length
                    if (obj.insuredList[0].relatoappnt != '00') {
                        $(".show-user1").find('a').eq(0).removeClass('wei-style')
                        $('.appured').css('display', 'none')
                        if (obj.insuredList[0].relatoappnt == "01") {
                            $(".show-user1").find('a').eq(1).addClass('wei-style')
                            $(".show-user1").find('a').eq(2).removeClass('wei-style')
                            $(".show-user1").find('a').eq(3).removeClass('wei-style')
                            $('.insured').css('display', 'block')
                        }
                        if (obj.insuredList[0].relatoappnt == "02") {
                            $(".show-user1").find('a').eq(1).removeClass('wei-style')
                            $(".show-user1").find('a').eq(2).addClass('wei-style')
                            $(".show-user1").find('a').eq(3).removeClass('wei-style')
                            $('.insured').css('display', 'block')
                        }
                        if (obj.insuredList[0].relatoappnt == "03") {
                            $(".show-user1").find('a').eq(1).removeClass('wei-style')
                            $(".show-user1").find('a').eq(2).removeClass('wei-style')
                            $(".show-user1").find('a').eq(3).addClass('wei-style')
                            $('.insured').css('display', 'block')
                        }
                        $("#relation_dummy").val($("#relation").find("option:selected").text());
                        $("#insuredName").val(obj.insuredList[0].name);
                        $("#insuredIdNo").val(obj.insuredList[0].idno);
                        $("#insuredIdNo").change();
                    }
                } else {
                    $(".pop").show();
                    $(".mask").show();
                    $(".pop span").text(obj.msg);
                }
                if (obj.insuredList.length > 1) {
                    for (var i = 1; i < obj.insuredList.length; i++) {
                        var initindex = i + 1;
                        initindex = '0' + initindex;
                        addOneInsured();
                        insuredclick()
                        if (obj.insuredList[i].relatoappnt == "01") {
                            $(".show-user" + initindex).find('a').eq(0).addClass('wei-style')
                            $(".show-user" + initindex).find('a').eq(1).removeClass('wei-style')
                            $(".show-user" + initindex).find('a').eq(2).removeClass('wei-style')
                        }
                        if (obj.insuredList[i].relatoappnt == "02") {
                            $(".show-user" + initindex).find('a').eq(0).removeClass('wei-style')
                            $(".show-user" + initindex).find('a').eq(1).addClass('wei-style')
                            $(".show-user" + initindex).find('a').eq(2).removeClass('wei-style')
                        }
                        if (obj.insuredList[i].relatoappnt == "03") {
                            $(".show-user" + initindex).find('a').eq(0).removeClass('wei-style')
                            $(".show-user" + initindex).find('a').eq(1).removeClass('wei-style')
                            $(".show-user" + initindex).find('a').eq(2).addClass('wei-style')
                        }
                        $("#relation" + initindex).val(obj.insuredList[i].relatoappnt);
                        $("#relation" + initindex + "_dummy").val($("#relation" + initindex).find("option:selected").text());
                        $("#insuredName" + initindex).val(obj.insuredList[i].name);
                        $("#insuredIdNo" + initindex).val(obj.insuredList[i].idno);
                        $("#insuredIdNo" + initindex).change();
                        calprice2(i + 1)
                    }
                }
            });
    }
});



function initSelect(selectid) {
    selectid.scroller('destroy').scroller($.extend({
        preset: 'select'
    }, {
        theme: "android-ics light",
        lang: "zh",
        display: 'bottom',
        rtl: true,
        inputClass: 'tmp',
        onSelect: function () {
            if ($(this).find("option:selected").text() == "请选择") {
                $(this).siblings(".tmp").css("color", "#999999");
            } else {
                $(this).siblings(".tmp").css("color", "#222222");
            }
        }
    }));
}

function addOneInsured() {
    let indexUpper = getIndexUpper(insured_index);
    let NewSectionContent = _templet.addinsured_template.replace(/{index}/ig, '0' + insured_index)
        .replace(/{index_num}/ig, insured_index)
        .replace(/{indexUpper}/ig, indexUpper);
    let NewSection = $(NewSectionContent);
    $("#addinsured_div").append(NewSection);
    initSelect($("#relation0" + insured_index));
    initSelect($("#insuredCardType0" + insured_index));
    initSelect($("#insuredSex0" + insured_index));
    initSelect($("#zdjb0" + insured_index));
    initSelect($("#zjzyjt0" + insured_index));
    initSelect($("#txyl0" + insured_index));
    initSelect($("#hwyl0" + insured_index));
    initSelect($("#socialinsuflag0" + insured_index));
    initSelect($("#issmoke0" + insured_index));
    $("#insuredBirthday0" + insured_index).scroller('destroy').scroller($.extend({
        preset: 'date'
    }, birthdayObj));
    insured_index++;
    if (insured_index > 7) {
        $('#addinsured_model').hide();
    } else {
        $('#addinsured_model').show();
    }
    $('#product_plan').val('尊享e生2021版');
    familympehm = 'Y'
    calPrice1();
}


// 移除被保人信息
function removeinsured(del_index) {
    personCount--
    $("#addinsured_list_0" + del_index).remove();
    insured_index--;
    for (var i = del_index; i < insured_index; i++) {
        let next = i - 0 + 1;
        let indexUpper = getIndexUpper(i);
        next_index = '0' + next;
        cur_index = '0' + i
        //所有的替换都是先替换方法，再替换id
        //替换汉字的index
        var hh = "shanchu" + next_index
        $("#indured_info_" + next_index).html("被保人信息" + indexUpper + "<span class='shanchu' id='" + hh + "';> </span>");
        // $("#indured_info_" + next_index).append("<span class='shanchu';> </span>");
        //替换删除按钮方法的index
        $("#shanchu" + next_index).attr("onclick", "removeinsured('" + i + "')");
        //替换各种blur校验的index
        $("#insuredCardType" + next_index).attr("onchange", "checkInsIdtype('" + cur_index + "')");
        $("#insuredName" + next_index).attr("onchange", "checkInsName('" + cur_index + "')");
        $("#insuredIdNo" + next_index).attr("onchange", "checkInsIdno('" + cur_index + "')");
        $("#insuredMobile" + next_index).attr("onchange", "checkInsMobile('" + cur_index + "')");
        $("#insuredBirthday" + next_index).attr("onchange", "chg_calprice2('" + cur_index + "')");
        $("#insuredSex" + next_index).attr("onchange", "chg_calprice2('" + cur_index + "')");
        //替换各种change计算保费的index
        $("#socialinsuflag" + next_index).attr("onchange", "calprice2('" + i + "')");
        $("#issmoke" + next_index).attr("onchange", "calprice2('" + i + "')");
        $("#zdjb" + next_index).attr("onchange", "calprice2('" + i + "')");
        $("#zjzyjt" + next_index).attr("onchange", "calprice2('" + i + "')");
        $("#txyl" + next_index).attr("onchange", "calprice2('" + i + "')");
        $("#hwyl" + next_index).attr("onchange", "calprice2('" + i + "')");
        //删除的时候，替换各种id的index
        //替换div的index
        $("#addinsured_list_" + next_index).attr('id', 'addinsured_list_' + cur_index);
        $("#indured_info_" + next_index).attr('id', 'indured_info_' + cur_index);
        //替换被保险人信息id的index
        $("#relation" + next_index).attr('id', 'relation' + cur_index);
        $("#insuredName" + next_index).attr('id', 'insuredName' + cur_index);
        $("#insuredCardType" + next_index).attr('id', 'insuredCardType' + cur_index);
        $("#insuredIdNo" + next_index).attr('id', 'insuredIdNo' + cur_index);
        $("#ins_birthday" + next_index).attr('id', 'ins_birthday' + cur_index);
        $("#insuredBirthday" + next_index).attr('id', 'insuredBirthday' + cur_index);
        $("#ins_sex" + next_index).attr('id', 'ins_sex' + cur_index);
        $("#insuredSex" + next_index).attr('id', 'insuredSex' + cur_index);
        $("#insuredSex" + next_index + "_dummy").attr('id', 'insuredSex' + cur_index + "_dummy");
        $("#insuredMobile" + next_index).attr('id', 'insuredMobile' + cur_index);
        //替换保费计算因子id的index
        $("#socialinsuflag" + next_index).attr('id', 'socialinsuflag' + cur_index);
        $("#issmoke" + next_index).attr('id', 'issmoke' + cur_index);
        $("#zdjb" + next_index).attr('id', 'zdjb' + cur_index);
        $("#zjzyjt" + next_index).attr('id', 'zjzyjt' + cur_index);
        $("#txyl" + next_index).attr('id', 'txyl' + cur_index);
        $("#hwyl" + next_index).attr('id', 'hwyl' + cur_index);
        //替换隐藏域id的index
        $("#productcode" + next_index).attr('id', 'productcode' + cur_index);
        $("#prem" + next_index).attr('id', 'prem' + cur_index);
        //替换删除按钮id的index
        $("#shanchu" + next_index).attr('id', 'shanchu' + cur_index);
    }
    for (let i = 2; i < insured_index + 2; i++) {
        calprice2(i);
    }

    if (insured_index == 2) {
        $('#product_plan').val('尊享e生2021版');
        familympehm = 'N'
        calPrice1();
    }
    if (personCount > 1) {
        for (var i = 0; i < personCount; i++) {
            calprice2(i + 2)
        }
    }
    $('#addinsured_model').show();
}


function ss(classname) {
    if ($(classname).find(".wei-style").text() == '男') {
        return "1"
    } else if ($(classname).find(".wei-style").text() == '女') {
        return "0"
    }
    if ($(classname).find(".wei-style").text() == '是') {
        return "N"
    } else if ($(classname).find(".wei-style").text() == '否') {
        return "Y"
    }
    if ($(classname).find(".wei-style").text() == '投保') {
        return "Y"
    } else if ($(classname).find(".wei-style").text() == '不投保') {
        return "N"
    }
    if ($(classname).find(".wei-style").text() == '有') {
        return "Y"
    } else if ($(classname).find(".wei-style").text() == '无') {
        return "N"
    }
}


// 个人保费测算
function calPrice1() {
    if (insured_index == 2) {
        $('#product_plan').val('尊享e生2021版');
        familympehm = 'N'
    } else {
        familympehm = 'Y'
    }
    var transData = '';
    if ($(".show-user1").find(".wei-style").text() == '本人') {
        if ($("#idNo").val().trim() == null || $("#idNo").val().trim() == '') {
            return;
        }
        var insage = getAgeByBirthDay(getBirthdayByIDCard($("#idNo").val().trim()));
        var insbirthday = getBirthdayByIDCard($("#idNo").val().trim());
        var inssex = getSexByIDCard($("#idNo").val().trim()).trim();
        var socialinsuflag = ss('.show-sb01')
        var issmoke = ss('.show-xy01')
        var zdjb = ss('.show-jb01')
        var zjzyjt = ss('.show-jbzy01')
        var txyl = ss('.show-jbss01')
        var hwyl = ss('.show-hwyl01')
        var zybc = ss('.show-zybc01')
        var hljz = ss('.show-hljz01')
        var jzfy = ss('.show-hljz01')
        var productCode = ''
        console.log(insage)
        if (insage <= 65 && insage > 60) {
            $('.small01').css("display", "none")
            $('.bigage01').css("display", "none")
            zdjb = ""
            zjzyjt = ""
            txyl = ""
            hwyl = ""
            zybc = ""
            hljz = ""
            jzfy = ""
            productCode = 'AV26'
        } else if (insage < 6) {
            $('.show-hljz01').find("a").eq(0).css("display", "block")
            $('.show-jzfy01').find("a").eq(0).css("display", "block")
            // if ($('.show-hljz01').find("a").eq(0).hasClass("wei-style")) {
            //     $('.show-hljz01').find("a").eq(0).addClass("wei-style");
            //     $('.show-hljz01').find("a").eq(1).removeClass("wei-style");
            // }
            // hljz = "N"
            $('.bigage').css('display', 'block')

            productCode = 'AV25'
        } else if (insage <= 60 && insage >= 6) {
         
            $('.small01').css('display', 'block')
            $('.bigage').css('display', 'block')
            
            if ($('.show-hljz01').find("a").eq(0).hasClass("wei-style")) {
                $('.show-jzfy01').find("a").eq(0).addClass("wei-style");
                $('.show-jzfy01').find("a").eq(1).removeClass("wei-style");
                hljz = "N"
                jzfy = "N"
            } else {
                $('.show-jzfy01').find("a").eq(1).addClass("wei-style");
                $('.show-jzfy01').find("a").eq(0).removeClass("wei-style");
                hljz = "Y"
                jzfy = "Y"
            }
            if ($('.show-jzfy01').find("a").eq(0).hasClass("wei-style")) {
                $('.show-hljz01').find("a").eq(0).addClass("wei-style");
                $('.show-hljz01').find("a").eq(1).removeClass("wei-style");
                hljz = "N"
                jzfy = "N"
            } else {
                $('.show-hljz01').find("a").eq(1).addClass("wei-style");
                $('.show-hljz01').find("a").eq(0).removeClass("wei-style");
                hljz = "Y"
                jzfy = "Y"
            }
            productCode = 'AV25'
        } else if (insage > 65) {
            $('.bigage').css('display', 'none')
            // $('.wei-box').css('height', '17.3rem')
            zdjb = ""
            zjzyjt = ""
            txyl = ""
            hwyl = ""
            zybc = ""
            hljz = ""
            jzfy = ""
            $('.small01').css("display", "none")
            productCode = 'AV26'
        }
        transData = {
            "insbirthday": insbirthday,
            "inssex": inssex,
            "insage": insage,
            "socialinsuflag": socialinsuflag,
            "issmoke": issmoke,
            "d_7F9": zdjb,
            "d_7G6": zjzyjt,
            "d_7G7": txyl,
            "d_7G8": hwyl,
            "d_7B7": zybc,
            "d_7B1": hljz,
            "d_7B2": jzfy,
            'productCode': productCode,
            "personCount": personCount,
            "mpehm": familympehm
        }
    } else if ($(".show-user1").find(".wei-style").text() == '子女' || $(".show-user1").find(".wei-style").text() == '配偶' || $(".show-user1").find(".wei-style").text() == '父母') {
        if ($("#insuredIdNo").val().trim() == null || $("#insuredIdNo").val().trim() == '') {
            return;
        }
        var insage = getAgeByBirthDay(getBirthdayByIDCard($("#insuredIdNo").val().trim()));
        var insbirthday = getBirthdayByIDCard($("#insuredIdNo").val().trim());
        var inssex = getSexByIDCard($("#insuredIdNo").val().trim());
        var socialinsuflag = ss('.show-sb1')
        var issmoke = ss('.show-xy')
        var zdjb = ss('.show-jb')
        var zjzyjt = ss('.show-jbzy')
        var txyl = ss('.show-jbss')
        var hwyl = ss('.show-hwyl')
        var zybc = ss('.show-zybc')
        var hljz = ss('.show-hljz')
        var jzfy = ss('.show-jzfy')
        var productCode = ''
        if (insage <= 65 && insage > 60) {
            $('.small').css("display", "none")
            $('.bigage').css("display", "none")
            zdjb = ""
            zjzyjt = ""
            txyl = ""
            hwyl = ""
            zybc = ""
            hljz = ""
            jzfy = ""
            productCode = 'AV26'
        } else if (insage < 6) {
            $('.show-hljz').find("a").eq(0).css("display", "block")
            $('.show-jzfy').find("a").eq(0).css("display", "block")
            // if ($('.show-hljz').find("a").eq(0).hasClass("wei-style")) {
            //     $('.show-hljz').find("a").eq(0).addClass("wei-style");
            //     $('.show-hljz').find("a").eq(1).removeClass("wei-style");
            // }
            // hljz = "N"
            $('.bigage').css('display', 'block')
            $('.wei-box').css('height', '22.5rem')
            productCode = 'AV25'
        } else if (insage <= 60 && insage >= 6) {
            $('.small').css('display', 'block')
            $('.bigage').css('display', 'block')
            if ($('.show-hljz').find("a").eq(0).hasClass("wei-style")) {
                $('.show-jzfy').find("a").eq(0).addClass("wei-style");
                $('.show-jzfy').find("a").eq(1).removeClass("wei-style");
                hljz = "N"
                jzfy = "N"
            } else {
                $('.show-jzfy').find("a").eq(1).addClass("wei-style");
                $('.show-jzfy').find("a").eq(0).removeClass("wei-style");
                hljz = "Y"
                jzfy = "Y"
            }
            if ($('.show-jzfy').find("a").eq(0).hasClass("wei-style")) {
                $('.show-hljz').find("a").eq(0).addClass("wei-style");
                $('.show-hljz').find("a").eq(1).removeClass("wei-style");
                hljz = "N"
                jzfy = "N"
            } else {
                $('.show-hljz').find("a").eq(1).addClass("wei-style");
                $('.show-hljz').find("a").eq(0).removeClass("wei-style");
                hljz = "Y"
                jzfy = "Y"
            }
            $('.wei-box').css('height', '22.5rem')
            productCode = 'AV25'
        } else if (insage > 65) {
            $('.bigage').css('display', 'none')
            $('.wei-box').css('height', '17.3rem')
            zdjb = ""
            zjzyjt = ""
            txyl = ""
            hwyl = ""
            zybc = ""
            hljz = ""
            jzfy = ""
            $('.small').css("display", "none")
            productCode = 'AV26'
        }

        transData = {
            "insbirthday": insbirthday,
            "inssex": inssex,
            "insage": insage,
            "socialinsuflag": socialinsuflag,
            "issmoke": issmoke,
            "d_7F9": zdjb,
            "d_7G6": zjzyjt,
            "d_7G7": txyl,
            "d_7G8": hwyl,
            "d_7B7": zybc,
            "d_7B1": hljz,
            "d_7B2": jzfy,
            'productCode': productCode,
            "personCount": personCount,
            "mpehm": familympehm
        }
    }
    console.log(transData)
    sendRequest("../../../../life/zhongan_h/calprem.do", transData, function (data) {
        var obj = JSON.parse(data);
        if (obj.code == 0) {
            $("#productcode").val(obj.productcode);
            $("#prem").val(obj.prem);
            sumPrem();
        } else {
            $(".pop").show();
            $(".mask").show();
            $(".pop span").text(obj.msg);
        }
    }, function () {});
}

// 修改单个被保人信息保费测算
function calprice2(calindex) {
    if (insured_index == 2) {
        $('#product_plan').val('尊享e生2021版');
        familympehm = 'N'

    } else {
        familympehm = 'Y'
    }

    var calindex = Number(calindex)
    if ($("#insuredIdNo0" + calindex).val() == null || $("#insuredIdNo0" + calindex).val() == '') {
        return;
    }
    // var insage = getAgeByBirthDay($("#insuredBirthday0" + calindex).val());
    var insage = getAgeByBirthDay(getBirthdayByIDCard($("#insuredIdNo0" + calindex).val().trim()));
    var insbirthday = getBirthdayByIDCard($("#insuredIdNo0" + calindex).val().trim());
    var inssex = getSexByIDCard($("#insuredIdNo0" + calindex).val().trim()).trim();
    var socialinsuflag = ss('.show-sb0' + calindex)
    var issmoke = ss('.show-xy0' + calindex)
    var zdjb = ss('.show-jb0' + calindex)
    var zjzyjt = ss('.show-jbzy0' + calindex)
    var txyl = ss('.show-jbss0' + calindex)
    var hwyl = ss('.show-hwyl0' + calindex)
    var zybc = ss('.show-zybc0' + calindex)
    var hljz = ss('.show-hljz0' + calindex)
    var jzfy = ss('.show-jzfy0' + calindex)
    var productCode = ''
    if (insage <= 65 && insage > 60) {
        $('.small0' + calindex).css("display", "none")
        $('.bigage0' + calindex).css("display", "none")
        zdjb = ""
        zjzyjt = ""
        txyl = ""
        hwyl = ""
        zybc = ""
        hljz = ""
        jzfy = ""
        productCode = 'AV26'
    } else if (insage < 6) {
        $('.show-hljz0' + calindex).find("a").eq(0).css("display", "block")
        $('.show-jzfy0' + calindex).find("a").eq(0).css("display", "block")
        // if ($('.show-hljz0'+ calindex).find("a").eq(0).hasClass("wei-style")) {
        //     $('.show-hljz0'+ calindex).find("a").eq(0).addClass("wei-style");
        //     $('.show-hljz0'+ calindex).find("a").eq(1).removeClass("wei-style");
        // }
        // hljz = "N"
        $('.bigage0' + calindex).css('display', 'block')
        productCode = 'AV25'
    } else if (insage <= 60 && insage >= 6) {
        $('.small0' + calindex).css('display', 'block')
        $('.bigage0' + calindex).css('display', 'block')
        if ($('.show-hljz0' + calindex).find("a").eq(0).hasClass("wei-style")) {
            $('.show-jzfy0' + calindex).find("a").eq(0).addClass("wei-style");
            $('.show-jzfy0' + calindex).find("a").eq(1).removeClass("wei-style");
            hljz = "N"
            jzfy = "N"
        } else {
            $('.show-jzfy0' + calindex).find("a").eq(1).addClass("wei-style");
            $('.show-jzfy0' + calindex).find("a").eq(0).removeClass("wei-style");
            hljz = "Y"
            jzfy = "Y"
        }
        if ($('.show-jzfy0' + calindex).find("a").eq(0).hasClass("wei-style")) {
            $('.show-hljz0' + calindex).find("a").eq(0).addClass("wei-style");
            $('.show-hljz0' + calindex).find("a").eq(1).removeClass("wei-style");
            hljz = "N"
            jzfy = "N"
        } else {
            $('.show-hljz0' + calindex).find("a").eq(1).addClass("wei-style");
            $('.show-hljz0' + calindex).find("a").eq(0).removeClass("wei-style");
            hljz = "Y"
            jzfy = "Y"
        }
        productCode = 'AV25'
    } else if (insage > 65) {
        $('.bigage0' + calindex).css('display', 'none')
        // $('.wei-box').css('height', '17.3rem')
        zdjb = ""
        zjzyjt = ""
        txyl = ""
        hwyl = ""
        zybc = ""
        hljz = ""
        jzfy = ""
        $('.small0' + calindex).css("display", "none")
        productCode = 'AV26'
    }
    transData = {
        "insbirthday": insbirthday,
        "inssex": inssex,
        "insage": insage,
        "socialinsuflag": socialinsuflag,
        "issmoke": issmoke,
        "d_7F9": zdjb,
        "d_7G6": zjzyjt,
        "d_7G7": txyl,
        "d_7G8": hwyl,
        "d_7B7": zybc,
        "d_7B1": hljz,
        "d_7B2": jzfy,
        'productCode': productCode,
        "personCount": personCount,
        "mpehm": familympehm
    }
    sendRequest("../../../../life/zhongan_h/calprem.do", transData, function (data) {
        var obj = JSON.parse(data);
        if (obj.code == 0) {
            $("#productcode0" + calindex).val(obj.productcode);
            $("#prem0" + calindex).val(obj.prem);
            sumPrem();
        } else {
            $(".pop").show();
            $(".mask").show();
            $(".pop span").text(obj.msg);
        }
    }, function () {});
}


// 总保费计算
function sumPrem() {
    var sumprem = Number($("#prem").val());

    for (var i = 2; i < insured_index; i++) {
        sumprem = Number(sumprem) + Number($("#prem0" + i).val());
    }
    $("#insurePrice").html(Number(sumprem).toFixed(2));
    $("#sumprem").val(Number(sumprem).toFixed(2));
}


//校验所有信息
function checkAll() {
    var flag = true;
    //姓名验证
    if ($("#policyName").length > 0) {
        if (!checkName($("#policyName"))) {
            flag = false;
        }
    }
    //证件号码校验
    if ($("#idNo").length > 0) {
        if (!checkID($("#idNo"))) {
            flag = false;
        }
    }
    //手机号码校验
    if ($("#tel").length > 0) {
        if (!checkTel($("#tel"))) {
            flag = false;
        }
    }
    //电子邮箱校验
    if ($("#email").length > 0) {
        if (!checkEmail($("#email"))) {
            flag = false;
        }
    }

    if ($(".show-user1 .filter-center ul li .wei-style").text() != '本人') {
        //姓名验证
        if ($("#insuredName").length > 1) {
            if (!checkName($("#insuredName"))) {
                flag = false;
            }
        }
        //证件号码校验
        if ($("#insuredIdNo").length > 0) {
            if (!checkID($("#insuredIdNo"))) {
                flag = false;
            }
        }
        //手机号码校验
        if ($("#insuredMobile").length > 0) {
            if (!checkTel($("#insuredMobile"))) {
                flag = false;
            }
        }

    } else {


    }

    // 子女配偶父母等校验
    for (var i = 2; i < insured_index; i++) {
        var cur_index = '0' + i;
        // 姓名校验
        if ($("#insuredName" + cur_index).length > 0) {
            if (!checkName($("#insuredName" + cur_index))) {
                flag = false;
            }
        }

        //证件号码校验
        if ($("#insuredIdNo" + cur_index).length > 0) {
            if (!($("#insuredCardType" + cur_index).find("option:selected").text() == "身份证" ? checkID($("#insuredIdNo" + cur_index)) : checkOtherId($("#insuredIdNo" + cur_index)))) {
                flag = false;
            }
        }

        //手机号码校验
        if ($("#insuredMobile" + cur_index).length > 0) {
            if (!checkTel($("#insuredMobile" + cur_index))) {
                flag = false;
            }
        }
    }





    //勾选阅读校验
    if ($("#whetherCheck").length > 0) {
        if (!$("#whetherCheck").hasClass("checkBox")) {
            $(".pop").show().find("span").text("请阅读并同意相关条款");
            $(".mask").show();
            flag = false;
        }
    }

    if ($("#whetherCheck1").length > 0) {
        if (!$("#whetherCheck1").hasClass("checkBox")) {
            $(".pop").show().find("span").text("请阅读并同意相关条款");
            $(".mask").show();
            flag = false;
        }
    }

    //这是用户投保内容是否保存
    // if ($("#whetherCheck2").length > 0) {
    //     if (!$("#whetherCheck2").hasClass("checkBox")) {
    //         $(".pop").show().find("span").text("请阅读并同意相关条款");
    //         $(".mask").show();
    //         flag = false;
    //     }else{
    //         flag = false;
    //     }
    // }


    return flag;
}

//拼接传到后台的信息
function getData() {

    function weiNum(classname) {
        if ($(classname).find(".wei-style").text() == '男') {
            return "1"
        } else if ($(classname).find(".wei-style").text() == '女') {
            return "0"
        }
        if ($(classname).find(".wei-style").text() == '是') {
            return "N"
        } else if ($(classname).find(".wei-style").text() == '否') {
            return "Y"
        }
        if ($(classname).find(".wei-style").text() == '投保') {
            return "Y"
        } else if ($(classname).find(".wei-style").text() == '不投保') {
            return "N"
        }

        if ($(classname).find(".wei-style").text() == '有') {
            return "Y"
        } else if ($(classname).find(".wei-style").text() == '无') {
            return "N"
        }

        if ($(classname).find(".wei-style").text() == '本人') {
            return "00"
        } else if ($(classname).find(".wei-style").text() == '子女') {
            return "01"
        } else if ($(classname).find(".wei-style").text() == '配偶') {
            return "02"
        } else if ($(classname).find(".wei-style").text() == '父母') {
            return "03"
        }
    }

    if (insured_index == 2) {
        $('#product_plan').val('尊享e生2021版');
        familympehm = 'N'

    } else {
        familympehm = 'Y'
    }
    if ($(".show-user1").find(".wei-style").text() == '本人') {
        //如果是本人，本人信息赋给被保人相应项
        $("#insuredName").val($("#policyName").val());
        $("#insuredIdNo").val($("#idNo").val().trim());
        $("#insuredMobile").val($("#tel").val());
    }
    //投保人生日
    var appbirthday = getBirthdayByIDCard($("#idNo").val().trim());
    //被保人生日
    var insbirthday = getBirthdayByIDCard($("#insuredIdNo").val().trim());
    // 投保人性别
    var appsex = getSexByIDCard($("#idNo").val().trim()).trim();
    //被保人性别
    var inssex = getSexByIDCard($("#insuredIdNo").val().trim()).trim();
    // 被保人年龄
    var insage = getAgeByBirthDay(getBirthdayByIDCard($("#insuredIdNo").val().trim()));
    var productCode = ''


    var zdjb01 = weiNum(".show-jb01")
    var zjzyjt01 = weiNum(".show-jbzy01")
    var txyl01 = weiNum(".show-jbss01")
    var hwyl01 = weiNum(".show-hwyl01")
    var zybc01 = weiNum(".show-zybc01")
    var hljz01 = weiNum(".show-hljz01")
    var jzfy01 = weiNum(".show-jzfy01")

    if (insage <= 65 && insage > 60) {
        $('.small01').css("display", "none")
        $('.bigage01').css("display", "none")
        zdjb01 = ""
        zjzyjt01 = ""
        txyl01 = ""
        hwyl01 = ""
        zybc01 = ""
        hljz01 = ""
        jzfy01 = ""
        productCode = 'AV26'
    } else if (insage < 6) {
        $('.show-hljz01').find("a").eq(0).css("display", "block")
        $('.show-jzfy01').find("a").eq(0).css("display", "block")
        // if ($('.show-hljz01').find("a").eq(0).hasClass("wei-style")) {
        //     $('.show-hljz01').find("a").eq(0).addClass("wei-style");
        //     $('.show-hljz01').find("a").eq(1).removeClass("wei-style");
        // }
        // hljz = "N"
        $('.bigage01').css('display', 'block')
        $('.wei-box').css('height', '22.5rem')
        productCode = 'AV25'
    } else if (insage <= 60 && insage >= 6) {
        $('.small').css('display', 'block')
        $('.bigage01').css('display', 'block')
        if ($('.show-hljz01').find("a").eq(0).hasClass("wei-style")) {
            $('.show-jzfy01').find("a").eq(0).addClass("wei-style");
            $('.show-jzfy01').find("a").eq(1).removeClass("wei-style");
            hljz01 = "N"
            jzfy01 = "N"
        } else {
            $('.show-jzfy01').find("a").eq(1).addClass("wei-style");
            $('.show-jzfy01').find("a").eq(0).removeClass("wei-style");
            hljz01 = "Y"
            jzfy01 = "Y"
        }
        if ($('.show-jzfy01').find("a").eq(0).hasClass("wei-style")) {
            $('.show-hljz01').find("a").eq(0).addClass("wei-style");
            $('.show-hljz01').find("a").eq(1).removeClass("wei-style");
            hljz01 = "N"
            jzfy01 = "N"
        } else {
            $('.show-hljz01').find("a").eq(1).addClass("wei-style");
            $('.show-hljz01').find("a").eq(0).removeClass("wei-style");
            hljz01 = "Y"
            jzfy01 = "Y"
        }
        $('.wei-box').css('height', '22.5rem')
        productCode = 'AV25'
    } else if (insage > 65) {
        $('.bigage01').css('display', 'none')
        $('.wei-box').css('height', '17.3rem')
        zdjb01 = ""
        zjzyjt01 = ""
        txyl01 = ""
        hwyl01 = ""
        zybc01 = ""
        hljz01 = ""
        jzfy01 = ""
        $('.small01').css("display", "none")
        productCode = 'AV26'
    }

    var zdjb = weiNum(".show-jb")
    var zjzyjt = weiNum(".show-jbzy")
    var txyl = weiNum(".show-jbss")
    var hwyl = weiNum(".show-hwyl")
    var zybc = weiNum(".show-zybc")
    var hljz = weiNum(".show-hljz")
    var jzfy = weiNum(".show-jzfy")

    if (insage <= 65 && insage > 60) {
        $('.small').css("display", "none")
        $('.bigage').css("display", "none")
        zdjb = ""
        zjzyjt = ""
        txyl = ""
        hwyl = ""
        zybc = ""
        hljz = ""
        jzfy = ""
        productCode = 'AV26'
    } else if (insage < 6) {
        $('.show-hljz').find("a").eq(0).css("display", "block")
        $('.show-jzfy').find("a").eq(0).css("display", "block")

        // if ($('.show-hljz').find("a").eq(0).hasClass("wei-style")) {
        //     $('.show-hljz').find("a").eq(0).addClass("wei-style");
        //     $('.show-hljz').find("a").eq(1).removeClass("wei-style");
        // }
        // hljz = "N"
        $('.bigage').css('display', 'block')
        $('.wei-box').css('height', '22.5rem')
        productCode = 'AV25'
    } else if (insage <= 60 && insage >= 6) {
        $('.small').css('display', 'block')
        $('.bigage').css('display', 'block')
        if ($('.show-hljz').find("a").eq(0).hasClass("wei-style")) {
            $('.show-jzfy').find("a").eq(0).addClass("wei-style");
            $('.show-jzfy').find("a").eq(1).removeClass("wei-style");
            hljz = "N"
            jzfy = "N"
        } else {
            $('.show-jzfy').find("a").eq(1).addClass("wei-style");
            $('.show-jzfy').find("a").eq(0).removeClass("wei-style");
            hljz = "Y"
            jzfy = "Y"
        }
        if ($('.show-jzfy').find("a").eq(0).hasClass("wei-style")) {
            $('.show-hljz').find("a").eq(0).addClass("wei-style");
            $('.show-hljz').find("a").eq(1).removeClass("wei-style");
            hljz = "N"
            jzfy = "N"
        } else {
            $('.show-hljz').find("a").eq(1).addClass("wei-style");
            $('.show-hljz').find("a").eq(0).removeClass("wei-style");
            hljz = "Y"
            jzfy = "Y"
        }

        $('.wei-box').css('height', '22.5rem')
        productCode = 'AV25'
    } else if (insage > 65) {
        $('.bigage').css('display', 'none')
        $('.wei-box').css('height', '17.3rem')
        zdjb = ""
        zjzyjt = ""
        txyl = ""
        hwyl = ""
        zybc = ""
        hljz = ""
        jzfy = ""
        $('.small').css("display", "none")
        productCode = 'AV26'
    }

    var jsonStr = '{"appntinfo":{"appname":"' + $("#policyName").val() + '","appcardno":"' + $("#idNo").val().trim() + '","appcardtype":"0","appmobile":"' + $("#tel").val() + '",' +
        '"appmail":"' + $("#email").val() + '","appbirthday":"' + appbirthday + '","appsex":"' + appsex + '"},' +
        '"uwid":"' + $("#uwid").val() + '",' +
        '"sumprem":"' + $("#sumprem").val() + '",' +
        '"insuredinfo":['

    if ($('.show-user1').find(".wei-style").text() == '本人') {
        jsonStr = jsonStr + '{"insrealtion":"' + weiNum(".show-user1") + '","insname":"' + $("#insuredName").val() + '","inscardno":"' + $("#insuredIdNo").val().trim() + '","inscardtype":"0",' +
            '"insmobile":"' + $("#insuredMobile").val() + '","insbirthday":"' + insbirthday + '","inssex":"' + inssex + '",' +
            '"insage":"' + insage + '","mpehm":"' + familympehm + '",' +
            '"socialinsuflag":"' + weiNum(".show-sb01") + '","issmoke":"' + weiNum(".show-xy01") + '",' +
            '"productCode":"' + $("#productcode").val() + '","prem":"' + $("#prem").val() + '","amnt":"3000000",' +
            '"d_7F9":"' + zdjb01 + '","d_7G6":"' + zjzyjt01 +
            '","d_7G7":"' + txyl01 + '","d_7G8":"' + hwyl01 +
            '","d_7B7":"' + zybc01 +
            '","d_7B1":"' + hljz01 +
            '","d_7B2":"' + jzfy01 +
            '"},'
    } else {
        jsonStr = jsonStr + '{"insrealtion":"' + weiNum(".show-user1") + '","insname":"' + $("#insuredName").val() + '","inscardno":"' + $("#insuredIdNo").val().trim() + '","inscardtype":"0",' +
            '"insmobile":"' + $("#insuredMobile").val() + '","insbirthday":"' + insbirthday + '","inssex":"' + inssex + '",' +
            '"insage":"' + insage + '","mpehm":"' + familympehm + '",' +
            '"socialinsuflag":"' + weiNum(".show-sb1") + '","issmoke":"' + weiNum(".show-xy") + '",' +
            '"productCode":"' + $("#productcode").val() + '","prem":"' + $("#prem").val() + '","amnt":"3000000",' +
            '"d_7F9":"' + zdjb + '","d_7G6":"' + zjzyjt +
            '","d_7G7":"' + txyl + '","d_7G8":"' + hwyl +
            '","d_7B7":"' + zybc +
            '","d_7B1":"' + hljz +
            '","d_7B2":"' + jzfy +
            '"},'
    }
    for (var i = 2; i < insured_index; i++) {
        var cur_index = '0' + i;
        // 年龄 $(".show-sb" + cur_index).find(".wei-style").text()
        var insage = getAgeByBirthDay(getBirthdayByIDCard($("#insuredIdNo" + cur_index).val().trim()));
        // 姓别
        var inssex = getSexByIDCard($("#insuredIdNo" + cur_index).val()).trim(); // $("#insuredSex" + cur_index).val()
        //生日
        var insbirthday = getBirthdayByIDCard($("#insuredIdNo" + cur_index).val().trim());
        var productCode = "var productCode" + cur_index;
        productCode = '';

        var zdjb02 = weiNum(".show-jb" + cur_index)
        var zjzyjt02 = weiNum(".show-jbzy" + cur_index)
        var txyl02 = weiNum(".show-jbss" + cur_index)
        var hwyl02 = weiNum(".show-hwyl" + cur_index)
        var zybc02 = weiNum(".show-zybc" + cur_index)
        var hljz02 = weiNum(".show-hljz" + cur_index)
        var jzfy02 = weiNum(".show-jzfy" + cur_index)


        console.log(insage)
        if (insage <= 65 && insage > 60) {
            $('.small' + cur_index).css("display", "none")
            $('.bigage' + cur_index).css("display", "none")
            // $('.show-hljz'+ cur_index).find("a").eq(0).css("display", "none")
            // $('.show-jzfy'+ cur_index).find("a").eq(0).css("display", "none")
            // $('.bigage'+ cur_index).css('display', 'none')
            // // $('.wei-box').css('height', '17.3rem')
            // if ($('.show-hljz'+ cur_index).find("a").eq(0).hasClass("wei-style")) {
            //     $('.show-hljz'+ cur_index).find("a").eq(0).removeClass("wei-style");
            //     $('.show-hljz'+ cur_index).find("a").eq(1).addClass("wei-style");
            // }
            // if ($('.show-jzfy'+ cur_index).find("a").eq(0).hasClass("wei-style")) {
            //     $('.show-jzfy'+ cur_index).find("a").eq(0).removeClass("wei-style");
            //     $('.show-jzfy'+ cur_index).find("a").eq(1).addClass("wei-style");
            // }
            zdjb02 = ""
            zjzyjt02 = ""
            txyl02 = ""
            hwyl02 = ""
            zybc02 = ""
            hljz02 = ""
            jzfy02 = ""
            productCode = 'AV26'
        } else if (insage < 6) {
            $('.show-hljz' + cur_index).find("a").eq(0).css("display", "block")
            $('.show-jzfy' + cur_index).find("a").eq(0).css("display", "block")
            // if ($('.show-hljz0'+ cur_index).find("a").eq(0).hasClass("wei-style")) {
            //     $('.show-hljz0'+ cur_index).find("a").eq(0).addClass("wei-style");
            //     $('.show-hljz0'+ cur_index).find("a").eq(1).removeClass("wei-style");
            // }
            // hljz = "N"
            $('.bigage' + cur_index).css('display', 'block')
            productCode = 'AV25'
        } else if (insage <= 60 && insage >= 6) {
            $('.small' + cur_index).css('display', 'block')
            $('.bigage' + cur_index).css('display', 'block')

            if ($('.show-hljz' + cur_index).find("a").eq(0).hasClass("wei-style")) {
                $('.show-jzfy' + cur_index).find("a").eq(0).addClass("wei-style");
                $('.show-jzfy' + cur_index).find("a").eq(1).removeClass("wei-style");
                hljz02 = "N"
                jzfy02 = "N"
            } else {
                $('.show-jzfy' +cur_index).find("a").eq(1).addClass("wei-style");
                $('.show-jzfy0' + cur_index).find("a").eq(0).removeClass("wei-style");
                hljz02 = "Y"
                jzfy02 = "Y"
            }
            if ($('.show-jzfy' + cur_index).find("a").eq(0).hasClass("wei-style")) {
                $('.show-hljz' + cur_index).find("a").eq(0).addClass("wei-style");
                $('.show-hljz' + cur_index).find("a").eq(1).removeClass("wei-style");
                hljz02 = "N"
                jzfy02 = "N"
            } else {
                $('.show-hljz' + cur_index).find("a").eq(1).addClass("wei-style");
                $('.show-hljz' + cur_index).find("a").eq(0).removeClass("wei-style");
                hljz02 = "Y"
                jzfy02 = "Y"
            }
            productCode = 'AV25'
        } else if (insage > 65) {
            $('.bigage' + cur_index).css('display', 'none')
            // $('.wei-box').css('height', '17.3rem')
            zdjb02 = ""
            zjzyjt02 = ""
            txyl02 = ""
            hwyl02 = ""
            zybc02 = ""
            hljz02 = ""
            jzfy02 = ""
            $('.small' + cur_index).css("display", "none")
            productCode = 'AV26'
        }
        jsonStr = jsonStr + '{"insrealtion":"' + weiNum(".show-user" + cur_index) + '","insname":"' + $("#insuredName" + cur_index).val() + '","inscardno":"' + $("#insuredIdNo" + cur_index).val().trim() + '","inscardtype":"0",' +
            '"insmobile":"' + $("#insuredMobile" + cur_index).val() + '","insbirthday":"' + insbirthday + '","inssex":"' + inssex + '",' +
            '"insage":"' + insage + '","mpehm":"Y",' +
            '"socialinsuflag":"' + weiNum('.show-sb' + cur_index) + '","issmoke":"' + weiNum(".show-xy" + cur_index) + '",' +
            '"productCode":"' + $("#productcode" + cur_index).val() + '","prem":"' + $("#prem" + cur_index).val() + '","amnt":"3000000",' +
            '"d_7F9":"' + zdjb02 + '","d_7G6":"' + zjzyjt02 + '","d_7G7":"' + txyl02 + '","d_7G8":"' + hwyl02 +
            '","d_7B7":"' + zybc02 +
            '","d_7B1":"' + hljz02 +
            '","d_7B2":"' + jzfy02 +
            '"}'

        if (i != insured_index - 1) {
            jsonStr = jsonStr + ',';
        }
    }
    jsonStr = jsonStr + ']}';
    return jsonStr;
}

function getIndexUpper(index) {
    return {
        '1': '一',
        '2': '二',
        '3': '三',
        '4': '四',
        '5': '五',
        '6': '六',
        '7': '七',
        '8': '八',
        '9': '九',
        '10': '十'
    } [index + ''] || '更多';
};

//checkbox选择去掉input盒子下面的边框
function checkInsName(name_index) {
    checkName($("#insuredName" + name_index));
}

function checkInsIdtype(idtype_index) {
    var cardType = $("#insuredCardType" + idtype_index).find("option:selected").text();
    if (cardType == "身份证") {
        //$("#ins_birthday"+idtype_index).hide();
        //$("#ins_sex"+idtype_index).hide();
    } else {
        $("#ins_birthday" + idtype_index).show();
        $("#ins_sex" + idtype_index).show();
    }
}

function checkInsMobile(mobile_index) {
    checkTel($("#insuredMobile" + mobile_index));
}

function checkInsIdno(idno_index) {
    $("#insuredIdNo" + idno_index).val($("#insuredIdNo" + idno_index).val().toUpperCase());
    if ($("#insuredCardType" + idno_index).find("option:selected").text() == "身份证") {
        //checkID($(this));
        if (checkID($("#insuredIdNo" + idno_index))) {
            //带出生日和性别
            $("#insuredBirthday" + idno_index).val(getBirthdayByIDCard($("#insuredIdNo" + idno_index).val().trim()));
            $("#insuredSex" + idno_index).val(getSexByIDCard($("#insuredIdNo" + idno_index).val().trim()));
            $("#insuredSex" + idno_index + "_dummy").val($("#insuredSex" + idno_index).find("option:selected").text());
        } else {
            //身份证错误时清空生日和性别
            $("#insuredBirthday" + idno_index).val("");
            $("#insuredSex" + idno_index).val("");
            $("#insuredSex" + idno_index + "_dummy").val($("#insuredSex" + idno_index).find("option:selected").text());
        }
    }
    calprice2(Number(idno_index));
}

function chg_calprice2(chg_index) {
    if ($("#insuredCardType" + chg_index).find("option:selected").text() != "身份证") {
        calprice2(Number(chg_index));
    }
}


function changeInsuredCardType() {
    var cardType = $("#insuredCardType").find("option:selected").text();
    if (cardType == "身份证") {
        $(".insuredBirthday").hide();
        $(".insuredBirthdayReadonly").show();
        $(".insuredSex").hide();
        $(".insuredSexReadonly").show();
        $("#ins_birthday").hide();
        $("#ins_sex").hide();
    } else {
        $(".insuredBirthday").show().css("display", "inline-block");
        $(".insuredBirthdayReadonly").hide();
        $(".insuredSex").show().css("display", "inline-block");
        $(".insuredSexReadonly").hide();
        $("#ins_birthday").show();
        $("#ins_sex").show();
    }
}



// 判断哪个是要传递的值,进行数值和文字的转换
var objWei = {}

function iswei(classname, aa) {
    if ($(classname).find(".wei-style").text() == '男') {
        objWei[aa] = "1"
    } else if ($(classname).find(".wei-style").text() == '女') {
        objWei[aa] = "0"
    }
    if ($(classname).find(".wei-style").text() == '是') {
        objWei[aa] = "N"
    } else if ($(classname).find(".wei-style").text() == '否') {
        objWei[aa] = "Y"
    }
    if ($(classname).find(".wei-style").text() == '投保') {
        objWei[aa] = "Y"
    } else if ($(classname).find(".wei-style").text() == '不投保') {
        objWei[aa] = "N"
    }
    if ($(classname).find(".wei-style").text() == '有') {
        objWei[aa] = "Y"
    } else if ($(classname).find(".wei-style").text() == '无') {
        objWei[aa] = "N"
    }
    return objWei;
}
//选择第一个本人父母子女配偶
$(".show-user1  .filter-center a").click(function () {
    $(this).parent("li").siblings().children("a").removeClass("wei-style");
    $(this).addClass("wei-style");
    $(".filter-title .filter-con").empty();

    if ($(this).parent("li").children(".wei-style").text() == '本人') {
        $('.insured').css('display', 'none')
        $('.appured').css('display', 'block')
        $('#addinsured_model').css('display', 'block')
    } else {
        $('.insured').css('display', 'block')
        $('#addinsured_model').css('display', 'block')
        $('.appured').css('display', 'none')
        $('.bigage').css('display', 'block')
        // 清空本人信息
        $("#insuredName").val('');
        $("#insuredIdNo").val('');
        $("#insuredMobile").val('');
    }
    calPrice1()
})

//子女父母配偶选择保险属性
$(".insured   .filter-item  .filter-center a").click(function () {
    $(this).parent("li").siblings().children("a").removeClass("wei-style");
    $(this).addClass("wei-style");
    $(".filter-title .filter-con").empty();
    calPrice1()
})
// 本人为被保人选择属性 appured
$(".appured  .filter-item  .filter-center a").click(function () {
    $(this).parent("li").siblings().children("a").removeClass("wei-style");
    $(this).addClass("wei-style");
    $(".filter-title .filter-con").empty();
    calPrice1()
})

// 选择子女父母为被保人属性
function insuredclick() {
    for (let a = 2; a < 8; a++) {
        $(" .insured0" + a + " .show-user0" + a + " .filter-center a").click(function () {
            $(this).parent("li").siblings().children("a").removeClass("wei-style");
            $(this).addClass("wei-style");
            $(".filter-title .filter-con").empty();
            $('#insuredIdNo0' + a).val('')
            $('.bigage0' + a).css('display', 'block')
            calprice2(a)
        })

        $(" .insured0" + a + " .show-sb0" + a + " .filter-center a").click(function () {
            $(this).parent("li").siblings().children("a").removeClass("wei-style");
            $(this).addClass("wei-style");
            $(".filter-title .filter-con").empty();
            calprice2(a)
        })

        $(" .insured0" + a + " .show-xy0" + a + " .filter-center a").click(function () {
            $(this).parent("li").siblings().children("a").removeClass("wei-style");
            $(this).addClass("wei-style");
            $(".filter-title .filter-con").empty();
            calprice2(a)
        })

        $(" .insured0" + a + " .show-jb0" + a + " .filter-center a").click(function () {
            $(this).parent("li").siblings().children("a").removeClass("wei-style");
            $(this).addClass("wei-style");
            $(".filter-title .filter-con").empty();
            calprice2(a)
        })

        $(" .insured0" + a + " .show-jbzy0" + a + " .filter-center a").click(function () {
            $(this).parent("li").siblings().children("a").removeClass("wei-style");
            $(this).addClass("wei-style");
            $(".filter-title .filter-con").empty();
            calprice2(a)
        })

        $(" .insured0" + a + " .show-jbss0" + a + " .filter-center a").click(function () {
            $(this).parent("li").siblings().children("a").removeClass("wei-style");
            $(this).addClass("wei-style");
            $(".filter-title .filter-con").empty();
            calprice2(a)
        })

        $(" .insured0" + a + " .show-hwyl0" + a + " .filter-center a").click(function () {
            $(this).parent("li").siblings().children("a").removeClass("wei-style");
            $(this).addClass("wei-style");
            $(".filter-title .filter-con").empty();
            calprice2(a)
        })

        $(" .insured0" + a + " .show-zybc0" + a + " .filter-center a").click(function () {
            $(this).parent("li").siblings().children("a").removeClass("wei-style");
            $(this).addClass("wei-style");
            $(".filter-title .filter-con").empty();
            calprice2(a)
        })
        $(" .insured0" + a + " .show-hljz0" + a + " .filter-center a").click(function () {
            $(this).parent("li").siblings().children("a").removeClass("wei-style");
            $(this).addClass("wei-style");
            $(".filter-title .filter-con").empty();
            calprice2(a)
        })

        $(" .insured0" + a + " .show-jzfy0" + a + " .filter-center a").click(function () {
            $(this).parent("li").siblings().children("a").removeClass("wei-style");
            $(this).addClass("wei-style");
            $(".filter-title .filter-con").empty();
            calprice2(a)
        })


    }
}




//点击添加的模板
const _templet = {
    addinsured_template: `
    <section class="infoList addinsured_list" id="addinsured_list_{index}">
    <p class="ml wei-addinsured" id="indured_info_{index}"> <span style="color:#222">被保人信息{indexUpper}</span> <span
    class="shanchu" id="shanchu{index}" onclick="removeinsured('{index_num}')" ;> </span> </p>
<div class="infoSec pl pr bgColor borTop1 borBot1">
<!-- 投保人为子女父母配偶 -->
<div class="infoSec  bgColor borTop1 borBot1" style='border-top:0'>
    <div class="insured{index}" style="display:block;">
        <div class="show-user{index} filter-item clearfloat">
            <div class="filter-left">为谁投保</div>
            <div class="filter-center">
                <ul class="clearfloat">

                    <li style="margin-right: 11px;">
                        <a href="javascript:;" class='wei-style'>子女</a>
                    </li>
                    <li style="margin-right: 11px;">
                        <a href="javascript:;">配偶</a>
                    </li>
                    <li>
                        <a href="javascript:;">父母</a>
                    </li>

                </ul>
            </div>
        </div>

        <dl class="clearfix infoDl borTop1 dlSec ">
            <dt class="w35 l-float">姓名</dt>
            <dd class="w65 l-float txtR " style="box-sizing: border-box;">
                <input type="text" class="textfield txtR personInfo" id="insuredName{index}" value=""
                    placeholder="请输入被保人姓名">
                <!-- <input class="textfield txtR mySelf" readonly=""> -->
            </dd>
            <span class="errorMsg"></span>
        </dl>


        <dl class="clearfix infoDl borTop1 dlSec ">
            <dt class="w55 l-float">证件类型</dt>
            <dd class="w45 l-float txtR  hasArrow">
                <input type="text" class="textfield txtR personInfo" readonly="" value="身份证">

            </dd>
            <span class="errorMsg"></span>
        </dl>


        <dl class="clearfix infoDl borTop1 dlSec ">
            <dt class="w35 l-float">证件号码</dt>
            <dd class="w65 l-float txtR " style="box-sizing: border-box;">
                <input type="text" class="textfield txtR personInfo idNo_compare" id="insuredIdNo{index}"
                    value="" placeholder="请输入证件号码" onchange="calprice2('{index}')">
                <!-- <input class="textfield txtR mySelf idNo_compare" readonly=""> -->
            </dd>
            <span class="errorMsg"></span>
        </dl>


        <dl class="clearfix infoDl borBot1 dlSec ">
            <dt class="w35 l-float">手机号</dt>
            <dd class="w65 l-float txtR " style="box-sizing: border-box;">
                <input type="tel" class="textfield txtR personInfo" id="insuredMobile{index}"
                    name="insuredList[0].insuredMobile" value="" placeholder="请输入手机号码">
                <!-- <input class="textfield txtR mySelf" readonly=""> -->
            </dd>
            <span class="errorMsg"></span>
        </dl>

        <div class=" show-sb{index} filter-item clearfloat borBot1">
            <div class="filter-left" style="padding-left:0rem">是否有社保</div>
            <div class="filter-center">
                <ul class="clearfloat">
                    <li style="margin-right: 11px;">
                        <a href="javascript:;">无</a>
                    </li>
                    <li>
                        <a href="javascript:;" class='wei-style'>有</a>
                    </li>

                </ul>
            </div>
        </div>

        <div class="show-xy{index} filter-item clearfloat borBot1">
            <div class="filter-left">是否每日吸烟小于10支且吸烟史小于10年</div>
            <div class="filter-center">
                <ul class="clearfloat">
                    <li style="margin-right: 11px;">
                        <a href="javascript:;" class='wei-style'>否</a>
                    </li>
                    <li>
                        <a href="javascript:;">是</a>
                    </li>

                </ul>
            </div>
        </div>
        <div class="bigage{index}">

            <div class="show-jb{index} filter-item clearfloat borBot1">
                <div class="filter-left">重大疾病保险金</div>
                <div class="filter-center">
                    <ul class="clearfloat">
                        <li style="margin-right: 11px;">
                            <a href="javascript:;">不投保</a>
                        </li>
                        <li>
                            <a href="javascript:;" class='wei-style'>投保</a>
                        </li>

                    </ul>
                </div>
            </div>
            <div class="show-jbzy{index} filter-item clearfloat borBot1">
                <div class="filter-left">重大疾病住院津贴保险金</div>
                <div class="filter-center">
                    <ul class="clearfloat">
                        <li style="margin-right: 11px;">
                            <a href="javascript:;">不投保</a>
                        </li>
                        <li>
                            <a href="javascript:;" class='wei-style'>投保</a>
                        </li>

                    </ul>
                </div>
            </div>
            <div class="show-jbss{index} filter-item clearfloat borBot1">
                <div class="filter-left">指定疾病及手术扩展特需医疗</div>
                <div class="filter-center">
                    <ul class="clearfloat">
                        <li style="margin-right: 11px;">
                            <a href="javascript:;">不投保</a>
                        </li>
                        <li>
                            <a href="javascript:;" class='wei-style'>投保</a>
                        </li>

                    </ul>
                </div>
            </div>

            <div class="show-hwyl{index} filter-item clearfloat borBot1">
                <div class="filter-left">个人恶性肿瘤海外医疗</div>
                <div class="filter-center">
                    <ul class="clearfloat">
                        <li style="margin-right: 11px;">
                            <a href="javascript:;">不投保</a>
                        </li>
                        <li>
                            <a href="javascript:;" class='wei-style'>投保</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="show-zybc{index} filter-item clearfloat borBot1">
                <div class="filter-left">住院医疗费用补偿</div>
                <div class="filter-center">
                    <ul class="clearfloat">
                        <li style="margin-right: 11px;">
                            <a href="javascript:;">不投保</a>
                        </li>
                        <li>
                            <a href="javascript:;" class='wei-style'>投保</a>
                        </li>
                    </ul>
                </div>
            </div>

            
        </div>


        <div class="small{index}">
        <div class="show-hljz{index} filter-item clearfloat borBot1 " >
            <div class="filter-left">互联网门急诊</div>
            <div class="filter-center">
                <ul class="clearfloat">
                    <li style="margin-right: 11px;">
                        <a href="javascript:;">不投保</a>
                    </li>
                    <li>
                        <a href="javascript:;" class='wei-style'>投保</a>
                    </li>
                </ul>
            </div>
        </div>

        <div class="show-jzfy{index} filter-item clearfloat borBot1 " style="border-bottom: 0;">
            <div class="filter-left">急诊费用医疗保险金</div>
            <div class="filter-center">
                <ul class="clearfloat">
                    <li style="margin-right: 11px;">
                        <a href="javascript:;">不投保</a>
                    </li>
                    <li>
                        <a href="javascript:;" class='wei-style'>投保</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>








    </div>
    <input hidden id="productcode{index}">
    <input hidden id="prem{index}" value='0'>
</div>
</div>
</section>`
}












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