$(function () {
    //地区
    setTimeout(function(){
    	getArea("appntArea");
	    getArea("insuredArea");
	    //getArea("propertyArea");
    },0)
    
});

/***************************提交校验方法**************************/


//三级联动
function getArea(id){
    //ajax请求 默认发同步请求
    sendAreaRequest = function (url, data, success, error) {
        $.ajax({
            url: url,
            type: "post",
            async: false,//发送同步请求
            data: data ? data : {},
            success: function (data) {
                if (success) {
                    success(data);
                }
            },
            error: function (data) {
                if (error) {
                    error(data);
                }
            }
        });
    };
    //初始获取省数据
    var iosProvinces = provinces;
    
    
    
//------------------------------------------------------------------------------------------------
   
//--------------------------------------------------------------------------------------    
    /*sendAreaRequest(path + "/getAreaInfo", {
        productNo : $("#productNo").val(),
        parentId : "0"
    }, function (successData) {
        var data =  JSON.parse(successData).data;
        for (var i = 0; i < data.length; i++) {
            iosProvinces.push({
                id: data[i].id,
                value: data[i].codeName,
                parentId:data[i].parentId,
                codeValue:data[i].codeValue
            });
        }
    }, function (errorData) {});*/
    //这个对象处理关于市的读取
    this.citysObject = {
        selectedOneLevelId: {},
        iosCitys: [],
        refreshCitys: function (oneLevelId) {
            var _this = this;
            if (!(this.selectedOneLevelId[oneLevelId])) {
                this.selectedOneLevelId[oneLevelId] = true;
                //通过省id请求市
                sendAreaRequest("../../car/common/getPlace.do", {
                	incode : 'suncar',
                    parentId : oneLevelId,
                    placeType: 'addr'
                }, function (data) {
                	
                	//console.log(successData);
                	
                    /*var data =  JSON.parse(successData).data;*/
                    
                    for (var i = 0; i < data.length; i++) {
                        _this.iosCitys.push({
                        	id: data[i].id,
                            value: data[i].cityName,
                            parentId:data[i].pid,
                            codeValue:data[i].id
                        });
                    }
                }, function (errorData) {});
            }
        }
    };
    //这个对象处理关于区的读取
    this.countysObject = {
        selectedTwoLevelId: {},
        iosCountys: [],
        refreshCountys: function (oneLevelId, twoLevelId) {
            var _this = this;
            if (!(this.selectedTwoLevelId[twoLevelId])) {
                this.selectedTwoLevelId[twoLevelId] = true;
                //通过市id请求区
                sendAreaRequest("../../car/common/getPlace.do", {
                	incode : 'suncar',
                    parentId : twoLevelId,
                    placeType: 'addr'
                }, function (data) {
                	//console.log(successData);
                    /*var data =  JSON.parse(successData).data;*/
                    for (var i = 0; i < data.length; i++) {
                        _this.iosCountys.push({
                        	id: data[i].id,
                            value: data[i].cityName,
                            parentId:data[i].pid,
                            codeValue:data[i].id
                        })
                    }
                }, function (errorData){});
            }
        }
    };
    var that = this;
    $("#"+id).on("click", function () {
        var oneLevelId = $("#newCar_price_lable").attr('data-province-code');
        var twoLevelId = $("#newCar_price_lable").attr('data-city-code');
        var threeLevelId = $("#newCar_price_lable").attr('data-district-code');
        var $this=$(this);
        if ($this.siblings("input")[0].value == 2){
            var iosSelect = new IosSelect(2,
                [iosProvinces, that.citysObject.iosCitys],
                {
                    itemHeight: 36,itemShowCount: 5,
                    oneTwoRelation: 1,//第一列和第二列是否通过parentId关联
                    oneLevelId: oneLevelId,//默认选中的第一列是哪个ID
                    twoLevelId: twoLevelId, //默认选中的第二列是哪个ID
                    callback: function (selectOneObj, selectTwoObj, selectThreeObj) {
                        //先配置选择好的省市区Id,下次打开的时候默认选中之前选中好的省市区
                        $("#newCar_price_lable").attr('data-province-code', selectOneObj.id);
                        $("#newCar_price_lable").attr('data-city-code', selectTwoObj.id);
                        //把 “请选择行驶区域” 改为选好的省市区
                        $("#"+id).val(selectOneObj.value + ' ' + selectTwoObj.value);
                        $this.siblings("input")[1].value = selectOneObj.codevalue;
                        $this.siblings("input")[2].value = selectTwoObj.codevalue;
                        $("#insuredArea").siblings(".mySelf").val($("#appntArea").val());
                    }
                });
        }else{
            var iosSelect = new IosSelect(3,
                [iosProvinces, that.citysObject.iosCitys, that.countysObject.iosCountys],
                {
                    itemHeight: 36,itemShowCount: 5,
                    oneTwoRelation: 1,//第一列和第二列是否通过parentId关联
                    twoThreeRelation: 1,//第二列和第三列是否通过parentId关联
                    oneLevelId: oneLevelId,//默认选中的第一列是哪个ID
                    twoLevelId: twoLevelId, //默认选中的第二列是哪个ID
                    threeLevelId: threeLevelId,
                    callback: function (selectOneObj, selectTwoObj, selectThreeObj) {
                        //先配置选择好的省市区Id,下次打开的时候默认选中之前选中好的省市区
                        $("#newCar_price_lable").attr('data-province-code', selectOneObj.id);
                        $("#newCar_price_lable").attr('data-city-code', selectTwoObj.id);
                        $("#newCar_price_lable").attr('data-district-code', selectThreeObj.id);
                        //把 “请选择行驶区域” 改为选好的省市区
                        $("#"+id).val(selectOneObj.value + ' ' + selectTwoObj.value + ' ' + selectThreeObj.value);
                        $this.siblings("input")[1].value = selectOneObj.codevalue;
                        $this.siblings("input")[2].value = selectTwoObj.codevalue;
                        $this.siblings("input")[3].value = selectThreeObj.codevalue;
                        $("#insuredArea").siblings(".mySelf").val($("#appntArea").val());
                    }
                });
        }
        $(".iosselect-box").on("touchmove",function(e){ 
            e.preventDefault();  
        });
    })
}




