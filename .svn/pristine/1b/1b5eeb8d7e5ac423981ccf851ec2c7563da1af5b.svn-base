/**
 * creater:duqian
 * create time:2018/06/14
 * describe：公共js资源
 **/

//选项卡事件
function tabEvent(self) {
    var $list = self.parent().find("li");
    var $objlist = $("." + self.parent().attr("obj"));
    var $i = $list.index(self);
    $list.removeClass("cur");
    self.addClass("cur");
    $objlist.removeClass("cur").eq($i).addClass("cur")
}