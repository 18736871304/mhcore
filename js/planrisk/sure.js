/**
 * Created by 18311 on 2018/9/3.
 */
$(function () {
	
	
	
	
	
    //下拉选择样式
    $("select").each(function () {
        $(this).scroller('destroy').scroller($.extend({preset: 'select'}, {
            theme: "android-ics light",
            lang: "zh",
            display: 'bottom',
            rtl: true,
            inputClass: 'tmp',
            onSelect: function () {
                if ($(this).find("option:selected").text()=="请选择"){
                    $(this).siblings(".tmp").css("color","#999999");
                }else{
                    $(this).siblings(".tmp").css("color","#0c0c0e");
                }
            }
        }));
    });
    $(".tmp").each(function(){
        if($(this).val()=="请选择"){
            $(this).css("color","#999999");
        }else{
            $(this).css("color","#0c0c0e");
        }
    });
    $("select.appntOccupation").each(function () {
        $(this).scroller('destroy').scroller($.extend({preset: 'select'}, {
            theme: "android-ics light",
            lang: "zh",
            display: 'bottom',
            rtl: true,
            inputClass: 'tmp',
            onSelect: function () {
                if ($(this).find("option:selected").text() == "请选择") {
                    $(this).siblings(".tmp").css("color","#999999");
                    $(".occupationReadonly").val("");
                } else {
                    $(this).siblings(".tmp").css("color","#0c0c0e");
                    $(".occupationReadonly").val($(this).find("option:selected").text());
                    $(this).parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
                }
            }
        }));
        if ($(this).find("option:selected").text() == "请选择") {
            $(this).siblings(".tmp").css("color","#999999");
        } else {
            $(this).siblings(".tmp").css("color","#0c0c0e");
        }
    });
    $("select.occupation").each(function () {
        $(this).scroller('destroy').scroller($.extend({preset: 'select'}, {
            theme: "android-ics light",
            lang: "zh",
            display: 'bottom',
            rtl: true,
            inputClass: 'tmp',
            onSelect: function () {
                if ($(this).find("option:selected").text() != "请选择") {
                    $(this).siblings(".tmp").css("color","#0c0c0e");
                    $(this).parent().siblings(".errorMsg").css("display", "inline-block").text("").hide();
                }else {
                    $(this).siblings(".tmp").css("color","#999999");
                }
            }
        }));
        if ($(this).find("option:selected").text() != "请选择") {
            $(this).siblings(".tmp").css("color","#0c0c0e");
        }else {
            $(this).siblings(".tmp").css("color","#999999");
        }
    });

})
