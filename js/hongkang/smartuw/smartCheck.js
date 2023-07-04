$(function () {
	var smartFunc = {
		init: function () {
			this.bindEvent();
			
			var riskcode_str = ''
				
			if($('#riskCode').val()=='511505_yue'||$('#riskCode').val()=='511505_nian')
			{
				riskcode_str = '511505';
			}
			else if($('#riskCode').val()=='hongkang000015_yue'||$('#riskCode').val()=='hongkang000015_nian')
			{
				riskcode_str = 'hongkang000015';
			}
			
			var premdata = 
			{
				"riskCode":riskcode_str,
				"insurebirthday":$('#insurebirthday').val(),
				"insuresex":$('#insuresex').val(),
				"amnt":$('#amnt').val(),
				"payintv":$('#payintv').val(),
				"payendyear":$('#payendyear').val(),
				"insuyear":$('#insuyear').val(),

				"iszjyl":$('#iszjyl').val(),
				"isexzl":$('#isexzl').val(),
				"isdbbjb":$('#isdbbjb').val(),
				"isabzkx":$('#isabzkx').val(),
			};
			
			getData('/life/hongkang/getUwQuestion.do', 'post', premdata, 
			{
				success: function (res) 
			    {
					console.log(res.healthList);
					renderQuestion(res.healthList)
			    }
			})
		},
		bindEvent: function () {
			$('#questionBox').on('click', 'li', function () {
				var questionId = $(this).data('questionid')
				console.log('questionId', questionId)
				$.toast(questionId, 'text')
				location.href = './questionconfirm.html?qid=' + questionId
			})
		},
	}

	smartFunc.init()
	
	function renderQuestion(list) {
		if (!Array.isArray(list) || !list.length) {
			return
		}
		$('#questionBox').html(questionTpl(list))
	}
	
	function questionTpl(list) {
		console.log(list)
		if (!Array.isArray(list) || !list.length) {
			return
		}
		var tpl = ''
		list.forEach(function (item) {
			tpl += '<li data-questionid="' + item.healthno + '">' +
				'    <span>' + item.healthdesc + '</span>' +
				'    <span><img src="/images/hongkang/smartuw/jiantou.png"></span>' +
				'   </li>'
		})
		return tpl
	}
})