<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html  style="font-size: calc(100vw/ 18.75);">
<head>
    <meta charset="UTF-8">
    <title>个人中心设置</title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width">
    <meta name="format-detection" content="telephone=no" />
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="full-screen" content="yes">
    <meta name="x5-fullscreen" content="true">
    <link rel="stylesheet" href="../../css/user/staff/public.css?v=20180717">
    <link rel="stylesheet" href="../../css/user/staff/usercenter.css?v=20180722">
    <script src=" ../js/jquery/jquery-3.6.0.min.js"></script>
    <script src=" ../js/common/insuCommon.js"></script>
    <script src=" ../js/common/staff/uploadPic.js?v=20180717"></script>
</head>

<body>
<div class="main usercenter_setting">
    <!-- warning-->
    <div class="mask">
        <div class="pop">
            <span class="warn">错误警告</span> <a class="pop-sure">确定</a>
        </div>
    </div>
    <input type="text" id="saveId" hidden="hidden" value="${userid}">
    <!--START  头部-->
    <div class="haedBox d_boxSz">
        <div class="d_table">
            <div class="d_cell">
                <div class="filebox">
                    <span style="margin-right: 1rem;">
                        <img id="thumburlShow01" class="head_img" src="../../images/user/staff/icon_file.png" onclick="fileSelect()"/>
                    </span>
                    <input style="display: none" type="file" accept="image/*" class="file" id="upHeadPic" onchange="upPic(this);">
                    <input type="text" id="thumbUrl01" hidden="hidden" value="">
                    <input type="text" id="thumbUrl02" hidden="hidden" value="">
                </div>
                <p>添加头像</p>
            </div>
        </div>
    </div>
    <!--END    头部-->
    <!--START  表单-->
    <div class="setting_formBox">
        <h1 class="title d_boxSz">个人信息</h1>
        <div class="formBox d_boxSz">
            <dl class="row d_boxSz">
                <div class="name">姓名</div>
                <input type="text" id="name" readonly/>
            </dl>
            <dl class="row d_boxSz">
                <div class="name">职称</div>
                <input type="text" id="title" placeholder="请输入职称" />
            </dl>
            <dl class="row d_boxSz">
                <div class="name">证书</div>
                <input type="text" id="diploma" placeholder="请输入持有证书" />
            </dl>
            <dl class="row d_boxSz">
                <div class="name">手机</div>
                <input type="text" id="mobilenumber" readonly/>
            </dl>
            <dl class="row d_boxSz">
                <div class="name">微信</div>
                <input type="text" id="weixin" placeholder="请输入微信号" />
            </dl>
            <dl class="row d_boxSz">
                <div class="name">QQ</div>
                <input type="text" id="qq" placeholder="请输入企业QQ号" />
            </dl>
        </div>
    </div>
    <!--END    表单-->
    <div class="btnBox d_boxSz">
        <a class="save_to">保存</a>
    </div>
</div>
<script type="text/javascript">
    var realname = '${realname}';
    var title = '${title}';
    var diploma = '${diploma}';
    var mobilenumber = '${mobilenumber}';
    var weixin = '${weixin}';
    var qq = '${qq}';

    $(function () {
        if(realname!=null&&realname!=""){
            $("#name").val(realname);
        }if(title!=null&&title!=""){
            $("#title").val(title);
        }if(diploma!=null&&diploma!=""){
            $("#diploma").val(diploma);
        }if(mobilenumber!=null&&mobilenumber!=""){
            $("#mobilenumber").val(mobilenumber);
        }if(weixin!=null&&weixin!=""){
            $("#weixin").val(weixin);
        }if(qq!=null&&qq!=""){
            $("#qq").val(qq);
        }
    });

    $('.save_to').click(function(){

        var userid = '${userid}';
        console.log($("#thumbUrl01").val());
        console.log($("#thumbUrl02").val());
        var transdata =
        {
            "name" : $("#name").val(),
            "title" : $("#title").val(),
            "diploma" : $("#diploma").val(),
            "mobilenumber" : $("#mobilenumber").val(),
            "weixin" : $("#weixin").val(),
            "qq" : $("#qq").val(),
            "userid" : userid,
            "thumbUrl01" : $("#thumbUrl01").val(),
            "thumbUrl02" : $("#thumbUrl02").val()
        };
        sendRequest("../staff/staffChangeInfo.do",transdata,function (data)
        {
            var obj = JSON.parse(data);
            console.log(obj);
            if(obj.code == '00')
            {
                window.location.href = "../staff/toStaffCenter.do";
            }
            else
            {
                $(".pop").show();
                $(".mask").show();
                $(".pop span").text(obj.message);
            }
        },function(){});
    });

    $('.pop-sure').click(function(){
        $('.mask').css("display","none");
    });

    function fileSelect() {
        document.getElementById("upHeadPic").click();
    }
</script>
</body>
</html>
