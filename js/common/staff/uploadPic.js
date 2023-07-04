//上传图片
function upPic(obj){//用于进行图片上传，返回地址
    var f=$(obj).val();
    if(f == null || f ==undefined || f == ''){
        return false;
    }
    if(!/\.(?:png|jpg|jpeg|bmp|gif|PNG|JPG|BMP|GIF)$/.test(f))
    {
        alert("类型必须是图片(.png|jpg|jpeg|bmp|gif|PNG|JPG|BMP|GIF)");
        $(obj).val('');
        return false;
    }
    var data = new FormData();
    $.each($(obj)[0].files,function(i,file){
        data.append('file', file);
    });
    var userid = $('#saveId').val();
    if(userid==null || userid ==undefined || userid==''){
        $(".pop").show();
        $(".mask").show();
        $(".pop span").text("登录超时,请重新登录!");
        return false;
    }
    console.log("确认登录");
    data.append('userid',userid);
    $.ajax({
        type: "POST",
        url: "../../../staff/upHportrait.do",
        data: data,
        beforeSend:function(){
            $(".loading").show();
        },
        complete:function(){
            $(".loading").hide();
        },
        cache: false,
        contentType: false,    //不可缺
        processData: false,    //不可缺
        dataType:"json",
        success: function(suc) {
            var jsondata = $.parseJSON(suc);
            if(jsondata.code==0){
                $("#thumbUrl01").val(jsondata.message);//缩略图
                $("#thumbUrl02").val(jsondata.url);//原图
                // $("#fileno01").val(jsondata.fileno);
                $("#thumburlShow01").attr("src",jsondata.message);//显示图片
                console.log(jsondata.message);
                console.log(jsondata.url);
            }else{
                $("#url").val("");
                $(obj).val('');
                $(".pop").show();
                $(".mask").show();
                $(".pop span").text("上传失败");
            }
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
            $(".pop").show();
            $(".mask").show();
            $(".pop span").text("上传失败");
            $("#url").val("");
            $(obj).val('');
        }
    });
}