$(function () {
    $(".wyx_ul li").on("click",function () {
        $(".wyx_ul li").removeClass("diji");
        $(this).addClass("diji");
//      $(this).find("img").attr("src","/images/zhuanti/2018zjzc/yuan1.png");
    });
     $(".wyx1_ul li").on("click",function () {
        $(".wyx1_ul li").removeClass("dinji1");
        $(this).addClass("dinji1");
//      $(this).find("img").attr("src","/images/zhuanti/2018zjzc/yuan1.png");
    });
    
     $(".my_div_dl1").on("click",function () {
        window.location.href = "baoyou.html";
//      window.location = "";
    });
    
     $(".kuaiqian").on("click",function () {
        window.location.href = "kuaiqian.html";
//      window.location = "";
    });
    $(".wanyouxi").on("click",function () {
        window.location.href = "wanyouxi.html";
//      window.location = "";
    });
    
     $(".sanjiao").on("click",function () {
        window.location.href = "index.html";
//      window.location = "";
    });
   
    
    
//  var number,numbers;
//  $(".xz").on("click",function () {
//      if($(this).hasClass("actives")){
//          $(this).removeClass("actives");
//      }else{
//          $(this).addClass("actives");
//      }
//  });
//  $(".xuanzhe .xz").on("click",function () {
//      number="";
//      for(var i=0;i<$(".xuanzhe .actives").length;i++){
//          number+=$(".xuanzhe .actives").eq(i).find("input").attr("data-value")+",";
//      }
//      $(".teshuinput1").attr("data-value",number);
//  });
//  $(".xuanzhebook .xz").on("click",function () {
//      numbers="";
//      for(var i=0;i<$(".xuanzhebook .actives").length;i++){
//          numbers+=$(".xuanzhebook .actives").eq(i).find("input").attr("value")+",";
//      }
//      $(".teshuinput2").attr("value",numbers);
//  });
//  $(".btn").click(function() {
//      var value = $(this).parent().find("input").attr("data-value");
//      $("#select_course_list").val(value);
//      dealCourseDialog()
//  });
//  $(".teshubtn1").click(function() {
//      if($(".teshuinput1").attr("data-value")==""){
//          alert("请选择课程！");
//      }else{
//          var value = $(".teshuinput1").attr("data-value");
//          $("#select_course_list").val(value);
//          dealCourseDialog()
//      }
//  });
//  $(".teshubtn2").click(function() {
//      if($(".teshuinput2").attr("value")==""){
//          alert("请选择书籍！");
//      }else{
//          var values = $(".teshuinput2").attr("value");
//          $("#buy_book_list").val(values);
//          dealCourseDialog()
//      }
//  });
//
//
//  //弹框提示处理函数
//  function dealCourseDialog(){
//      var adHtml = "<div id='protocolsBg'></div>" +
//          "<div class='protocols'>" +
//          "<i class='closeXY'><img src='/images/chujizhicheng/project2018/close2.png'/></i>" +
//          "<h1>温馨提示</h1>" +
//          "<div class='xyContainer'>您选报的辅导课程将于2018年考试结束一周后关闭！</div>" +
//          "<button class='sure'>我知道了</button><br/><br/>" +
//          "</div>";
//      $("body").append(adHtml);
//      $(".protocols").css({height: $(window).height()});
//      $(".protocols").animate({right: 0}, 500);
//      var _close = function () {
//          $("#protocolsBg").remove();
//          $(".protocols").remove();
//      }
//      $(".closeXY").on("click", _close);
//      $(".sure").on("click", function () {
//          _close();
//          gotoPay();
//      })
//
//  };
//  function gotoPay() {
//      $("#selectForm").submit();
//      $("#protocolsBg").remove();
//      $(".protocols").remove();
//  }
//});
//
//
////登录
//function login(){
//  var url = window.location.href;
//  window.location.href = "http://m.chinaacc.com/m_member/member/login.shtm?gotoURL="+url;
//}
//
//function removeClick(flag){
//  if(flag != 1){
//      $('.mflk1').text('领取中...');
//  }
//  $('.mflk1').attr('onclick','javascript:void();');
//}
//
//function addClick(){
//  $('.mflk1').text('手快点击去领取 >');
//  $('.mflk1').attr('onclick','getFreeCourse("cwjyfhxly")');
//}
//
//function getFreeCourse(courseFlag_vaL) {
//  var flag;
//  removeClick(1);
//  $.ajax({
//      type:"GET",
//      url:"http://m.chinaacc.com/m_member/member/verifyLogin.shtm?jsonpCallback=?",
//      dataType:"jsonp",
//      success: function(json){
//          if(json.flag == 'true'){
//              $('.mflk1').text('领取中...');
//              $.ajax({
//                  type:"GET",
//                  url:"http://m.chinaacc.com/m_member/api/getFreeCourse.shtm?jsonpCallback=?",
//                  data: {courseFlag:courseFlag_vaL, puid: json.uid},
//                  dataType:"jsonp",
//                  success: function(data){
//                      if(data.code == 1 || data.code == 2){
//                          $('.mflk1').hide();
//                          $('.mflk2').show();
//                      }else{
//                          addClick();
//                          alert(data.msg);
//                      }
//                  },
//                  error: function(){
//                      addClick();
//                  }
//              });
//
//          }else{
//              login();
//          }
//      },
//      error: function(){
//          addClick();
//      }
//  });
//
//};
//
//$(document).ready(function() {
//  var origOffsetY = $('.text3').offset().top;
//  var origOffsetY1 = $('#aa').offset().top;
//  var origOffsetY2 = $('#bb').offset().top;
//  var origOffsetY3 = $('#cc').offset().top;
//  var origOffsetY4 = $('#dd').offset().top;
//  $(window).scroll(function () {
//      if ($(window).scrollTop() > origOffsetY) {
//          $(".text3").addClass("fixed");
//      } else if ($(window).scrollTop() < origOffsetY) {
//          $(".text3").removeClass("fixed");
//      }
//      if($(window).scrollTop() > origOffsetY1-100 && $(window).scrollTop() < origOffsetY2-100){
//          $(".text3 a").removeClass("active");
//          $(".text3 a img").attr("src","/images/zhuanti/2018zjzc/yuan2.png");
//          $(".text3 a").eq(0).addClass("active");
//          $(".text3 a img").eq(0).attr("src","/images/zhuanti/2018zjzc/yuan1.png");
//      }else if($(window).scrollTop() > origOffsetY2-100 && $(window).scrollTop() < origOffsetY3-100){
//          $(".text3 a").removeClass("active");
//          $(".text3 a img").attr("src","/images/zhuanti/2018zjzc/yuan2.png");
//          $(".text3 a").eq(1).addClass("active");
//          $(".text3 a img").eq(1).attr("src","/images/zhuanti/2018zjzc/yuan1.png");
//      }else if($(window).scrollTop() > origOffsetY3-100 && $(window).scrollTop() < origOffsetY4-100 ){
//          $(".text3 a").removeClass("active");
//          $(".text3 a img").attr("src","/images/zhuanti/2018zjzc/yuan2.png");
//          $(".text3 a").eq(2).addClass("active");
//          $(".text3 a img").eq(2).attr("src","/images/zhuanti/2018zjzc/yuan1.png");
//      }else if($(window).scrollTop() > origOffsetY4-100  ){
//          $(".text3 a").removeClass("active");
//          $(".text3 a img").attr("src","/images/zhuanti/2018zjzc/yuan2.png");
//          $(".text3 a").eq(3).addClass("active");
//          $(".text3 a img").eq(3).attr("src","/images/zhuanti/2018zjzc/yuan1.png");
//      }
//  });
})