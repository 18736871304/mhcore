$(function () {

    // var planListUrl = './mock/planList.json'
    var planListUrl = '/staff/plan/getPlanList.do'

    var planFunc = {
        init: function () {
            this.setStyle()
            this.bindEvent()
            getData(planListUrl, 'post', {start: 0, length: 100}, {
                success: function (res) {
                    console.log(res)
                    var tpl = renderPlanList(res.planlist)
                    $('#planList').html(tpl)
                    $('.weui-cell_swiped').swipeout('close');
                }
            })
        },
        setStyle: function () {
        },
        bindEvent: function () {
            var that = this
            //添加计划书
            $('body').on('click', '#addPlanBtn', function () 
            {
                var planId = $(this).data('planid');
                location.href = '/staff/plan/planProject.do?method=add';
            })
            // 计划书编辑按钮点击，进入编辑界面
            $('body').on('click', '.edit-plan-btn', function (e) {
                var planId = $(this).data('planid')
                
                if($(this).data('plantype')=='01')
                {
                	location.href = '/staff/plan/planProject.do?planid='+planId+'&method=edit'
                }
                else
                {
                	location.href = '/staff/plan/familyPlan.do?planid='+planId
                }
            })
            $('body').on('click', '.plan-item', function () {
                var planId = $(this).data('planid')
                
                if($(this).data('plantype')=='01')
                {
                	location.href = '/staff/plan/viewPlan.do?planid='+planId
                }
                else
                {
                	location.href = '/staff/plan/familyPlanView.do?planid='+planId
                }
            })
            // 计划书滑动，做滑动删除
		    $('body').on('click', '#swipedDel', function (e) 
		    {
			    var self = $(this)
			    
			    $.confirm("确定删除此方案吗？", function () 
			    {
			    	console.log('yes',self.data('planid'))
			    	
			    	getData('/staff/plan/deletePlan.do', 'post', {'planid':self.data('planid')}, 
			    	{
			    		success: function (res) 
			    		{
			    			self.parents('.weui-cell').remove()
			    		}
			    	})
			    }, function () 
			    {
			    	console.log('no')
			    });
		    })
        }
    }
    planFunc.init()

    function getData(url, method, data, fn) {
        $.ajax({
            url: url,
            type: method,
            data: data,
            dataType: 'json',
            timeout: 15000,
            beforeSend: function () {
                $.showLoading("加载中...")
                if (fn && fn.beforeSend) {
                    fn.beforeSend()
                }
            },
            complete: function (xhr, status) {
                // $.hideLoading()
                if (status === 'timeout') {
                    console.log('api time out')
                }
            },
            success: function (res) {
                $.hideLoading()
                if (fn && fn.success) {
                    fn.success(res)
                }
            },
            error: function (error) {
                $.hideLoading()
                console.log(error)
                if (fn && fn.error) {
                    fn.error(error)
                }
            }
        })
    }

    function renderPlanList(data) {
        var tpl = ''
        data.forEach(function (item) {
            tpl += '<div class="weui-cell weui-cell_swiped list-item">' +
                '    <div class="weui-cell__bd item-cell">' +
                '        <div class="weui-cell">' +
                '            <div class="weui-cell__bd">' +
                '                <p style="color: #3E3C3C;">' + item.plantypename + '</p>' +
                '            </div>' +
                '            <div class="weui-cell__ft edit-plan-btn add-touch-area"' +
                '                 data-planid="' + item.planid + '"' +
                '                 data-plantype="' + item.plantype + '"' +
                '                 style="color: #979797;">编辑</div>' +
                '        </div>' +
                '        <a class="weui-cell weui-cell_access plan-item" data-planid="' + item.planid + '" data-plantype="' + item.plantype + '" href="javascript:;">' +
                '            <div class="weui-cell__bd">' +
                '                <p>' +
                '                    <span style="color: #979797;font-size: 15px;">姓名</span>' +
                '                    <span style="margin-left: 10px;color: #686868;">' + item.insname + '</span>' +
                '                </p>' +
                '                <p>' +
                '                    <span style="color: #979797;font-size: 15px;">方案</span>' +
                '                    <span style="margin-left: 10px;color: #686868;">' + item.risktype + '</span>' +
                '                </p>' +
                '            </div>' +
                '            <div class="weui-cell__ft">' +
                '            </div>' +
                '        </a>' +
                '    </div>' +
                '    <div class="weui-cell__ft">' +
                '        <a class="weui-swiped-btn weui-swiped-btn_warn"' +
                '           href="javascript:"' +
                '           id="swipedDel" data-planid="'+item.planid+'" data-plantype="'+item.plantype+'" ' +
                '           style="display: flex;align-items: center;justify-content: center;">删除</a>' +
                '    </div>' +
                '</div>'
        })
        return tpl
    }
})
