<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>员工登录页面</title>
    <link rel="stylesheet" href="../../css/user/staff/login.css?v=20180714">
    <link rel="stylesheet" href="../../css/user/staff/public.css?v=20180717">
    <script src=" ../js/jquery/jquery-3.6.0.min.js"></script>
    <script src=" ../js/common/insuCommon.js"></script>
    <script src="../../../js/jquery/md5.js"></script>
</head>
<body>
    <!-- warning-->
    <div class="mask">
        <div class="pop">
            <span class="warn">错误警告</span> <a class="pop-sure">确定</a>
        </div>
    </div>

    <div class="main d_backFFF loginBox">
        <form class="">
            <div class="formBox d_boxSz">
                <div class="name d_boxSz">
                    <i class="icon account"></i>
                    <input type="text" id="staffnum" class="d_boxSz" placeholder="请输入您的工号" />
                </div>
                <div class="type d_boxSz">
                    <i class="icon password"></i>
                    <input type="password" id="password" class="d_boxSz" placeholder="请输入密码" />
                </div>
                <div class="btnBoxLogin d_boxSz">
                    <a class="bd">登录</a>
                </div>
                <div class="forgetp d_boxSz" style="display:none">
                    <a href="#" class="forget">忘记密码</a>
                </div>
            </div>
        </form>
    </div>
    <script type="text/javascript">
        //忘记密码
        $('.forget').click(function()
        {
            window.location.href = "../user/staffForgetpsd.do";
        });

        //登录
        $('.bd').click(function()
        {

            if($("#staffnum").val()==null||$("#staffnum").val()=="")
            {
                $(".pop").show();
                $(".mask").show();
                $(".pop span").text("请输入工号！");
                return false;
            }

            if($("#password").val()==null||$("#password").val()=="")
            {
                $(".pop").show();
                $(".mask").show();
                $(".pop span").text("请输入密码！");
                return false;
            }
           var password = hex_md5($("#password").val()).toUpperCase()
           $("#password").val(password)
            var transdata =
                {
                    "staffnum":$("#staffnum").val(),
                    "password":$("#password").val()
                };

            sendRequest("../user/staffLogonin.do",transdata,function (data)
                {
                    var obj = JSON.parse(data);
                    console.log(obj);
                    if(obj.code == "0")
                    {
                        if($("#backUrl").val()!=null&&$("#backUrl").val()!="")
                        {
                            window.location.href = $("#backUrl").val();
                        }
                        else
                        {
                            window.location.href = "../staff/toStaffCenter.do";
                        }
                    }
                    else
                    {
                        $(".pop").show();
                        $(".mask").show();
                        $(".pop span").text(obj.message);
                    }
                },
                function(){});
        });

        $('.pop-sure').click(function(){
            $('.mask').css("display","none");
        });
    </script>
</body>
</html>
