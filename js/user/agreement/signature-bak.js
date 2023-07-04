$(function () {
    var signatureFunc = {
        init: function () {
            this.setStyle()
            this.bindEvent()
            this.createSignatureCanvas()
        },
        setStyle: function () {

        },
        bindEvent: function () {
            $('#resetButton').on('click', function () {
                //reset signature
                $('#signatureArea').jqSignature('clearCanvas')
                $('#submitButton').attr('disabled', 'disabled')
            })
            $('#submitButton').on('click', function () {
                //get signature BASE64
                var signatureData = $('#signatureArea').jqSignature('getDataURL')
                //console.log(signatureData)
                var buzid = $('#buzid').val();
                
                var transdata = 
				{
					"imgbase64Str":signatureData,
					"buzid":buzid,
				};
                
                sendRequest("./userSign.do",transdata,function (data) 
        		{
        			var obj = JSON.parse(data);
        		   	console.log(obj);
        		   	if(obj.code == '00')
        		   	{
        		   		//display success, hide signature
                        $('.signature-content-wraper').hide()
                        $('.submit-success-wraper').show()
                        $('.signature-button-submit-wraper').hide()
                        $('.signature-button-check-agreement').show()
                        //change .main background color
                        $('.main').css({
                            background: '#fff'
                        })
        		   	}
        		   	else
        		   	{
        		   		toast({
        					message: obj.message,
        					time: 1500
        				})
        		   	}
        		},
        		function(){});
            })
        },
        createSignatureCanvas: function () {
            console.log('run canvas');
            var option = {
                width: $('#signatureArea').width(),
                height: $('#signatureArea').height(),
                border: 'none',
                lineWidth: 4
            }
            $('#signatureArea').jqSignature(option)
            //when the signature changes,cancel button attribute disabled
            $('#signatureArea').on('jq.signature.changed', function() {
                $('#submitButton').removeAttr('disabled')
            });
        }
    }
    signatureFunc.init()
    
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
})
