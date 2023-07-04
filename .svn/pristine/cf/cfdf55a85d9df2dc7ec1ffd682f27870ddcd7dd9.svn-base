$(document).ready(function () {
    $(".btn button").click(function () {
        $(this).siblings("button").removeClass("active");
        $(this).addClass("active");
    });
    $(".pop-sure").on("click", function () {
        $(".pop").hide();
        $(".mask").hide();
    });
    //为否的时候弹窗
    $(".inconformity").click(function () {
        window.location.href = 'intelligence.html'

    });

    $(".coincidence").click(function () {
        // window.location.href = 'applicant.html'+"?familyQuestionnaireId=43mDSxHqmeHNzwsQdANQgf4G1KX0Kk2A6nENbgiNkf9e80Uu%2FSiEoJ7gDQPIN0L%2FEC31"
        window.location.href = "applicant.html"
        // 获取上一个页面传递的参数
        // function GetRequest() {
        //     var url = location.search;
        //     var theRequest = new Object();
        //     if (url.indexOf("?") != -1) {
        //         var str = url.substr(1);
        //         strs = str.split("&");
        //         for (var i = 0; i < strs.length; i++) {
        //             theRequest[strs[i].split("=")[0]] = decodeURI(strs[i].split("=")[1]);
        //         }
        //     }
        //     return theRequest;
        // }
        // var objWei = {};
        // objWei = GetRequest();
        // console.log(objWei)



    });

});
//ajax
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