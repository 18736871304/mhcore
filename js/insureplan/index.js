$(function () {
    var indexFunc = {
        init: function () {
            this.setStyle()
            this.bindEvent()
        },
        setStyle: function () {
            $('#enterImg').one('load', function () {
                $('#loading').hide()
                $('#transitionBox').removeClass('hide').hide().fadeIn(1000, function () {
                    $('#transitionBox').fadeOut()
                    $('#enterBox').removeClass('hide').hide().fadeIn(1000)
                })
            }).each(function () {
                if (this.complete) {
                    $(this).load();
                }
            });
        },
        bindEvent: function () {
            $('#enterBtn').on('click', function () 
            {
            	getData_noloading('/staff/planweb/planviewclick.do', 'post', {"planid":$('#planid').val(),"openid":$('#openid').val()}, 
    			{
                	success: function (res) 
		            {
                		
		            }
    			})
    			
    			if($('#plantype').val()=='01')
    			{
    				window.location.href = '/staff/plan/viewPlan.do?planid='+$('#planid').val();
    			}
    			else
    			{
    				window.location.href = '/staff/plan/familyPlanView.do?planid='+$('#planid').val();
    			}
            })
        }
    }
    indexFunc.init()
})
