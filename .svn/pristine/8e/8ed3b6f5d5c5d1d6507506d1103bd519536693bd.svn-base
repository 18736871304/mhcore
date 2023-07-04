$(function () {
	//从url获取当前的问题id
	var qid = getQueryValue('qid')
	//全局变量，存储答案
	var answer = null
	var questionFirm = {
		init: function () {
			this.bindEvent()
			this.renderQuestionList()
		},
		bindEvent: function () {
			$('body').on('click', '.question-radio .button-radio', function () {
				var selectStatus = $(this).data('selecteditem') === 'yes'
				$(this).addClass('selected').find('i').removeClass('iconb-1').removeClass('iconb-').addClass('iconb-1')
					.parent().siblings('span').removeClass('selected').find('i').removeClass('iconb-1').removeClass('iconb-').addClass('iconb-')
				var sonQuestionId = $(this).parent().data('questionid')
				console.log('问题id：---', sonQuestionId, '回答：---', selectStatus)
				var currentItem = {
					sonQuestionId: sonQuestionId,
					selectStatus: selectStatus
				}
				if (Array.isArray(answer) && answer.length) {
					checkAnswer(currentItem, answer)
				}
			})
			$('body').on('click', '#checkBtn', function () {
				console.log('显示：', answer)
				if (Array.isArray(answer) && answer.length) {
					$('#questionConfirmList').html(confirmListTpl(answer))
					$('.question-answer').addClass('hide')
					$('.question-confirm').removeClass('hide')
				}
			})
			$('body').on('click', '#confirmBtn', function () {
				console.log('提交答案：', answer)
			})
		},
		renderQuestionList: function () {
			//根据url的问题id，获取该问题的子问题
			getData('./mock/questionDetail.json', 'get', {questionId: qid}, {
				success: function (res) {
					console.log(res)
					answer = res
					$('#questionBox').html(questionListTpl(res))
				}
			})
		}
	}
	questionFirm.init()
})

function questionListTpl(list) {
	if (!Array.isArray(list) || !list.length) {
		return ''
	}
	var tpl = ''
	list.forEach(function (item) {
		var radio = item.selectStatus ? '<span class="button-radio selected" data-selecteditem="yes"><i class="iconfont iconb-1"></i>是</span><span class="button-radio" data-selecteditem="no"><i class="iconfont iconb-"></i>否</span>' : '<span class="button-radio" data-selecteditem="yes"><i class="iconfont iconb-"></i>是</span><span class="button-radio selected" data-selecteditem="no"><i class="iconfont iconb-1"></i>否</span>'
		tpl += '  <div class="question-list">' +
			'        <div class="question-detail">' +
			'          <span>问：</span>' +
			'          <span>' + item.questionTitle + '</span>' +
			'        </div>' +
			'        <div class="question-radio" data-questionid="' + item.questionId + '">' + radio + '</div>' +
			'      </div>'
	})
	return tpl
}

function checkAnswer(currentItem, questionList) {
	if (!Array.isArray(questionList) || !questionList.length) {
		return []
	}
	questionList.forEach(function (item) {
		if (item.questionId === currentItem.sonQuestionId) {
			item.selectStatus = currentItem.selectStatus
		}
	})
}

function confirmListTpl(list) {
	if (!Array.isArray(list) || !list.length) {
		return ''
	}
	var tpl = ''
	list.forEach(function (item, index) {
		var text = item.selectStatus ? '是' : '否'
		tpl += '<div class="confirm-box">' +
			'          <div class="confirm-question">' +
			'            <span><i>Q' + (index + 1) + '</i></span>' +
			'            <span>' + item.questionTitle + '</span>' +
			'          </div>' +
			'          <div class="confirm-answer">' +
			'            <span><i>A' + (index + 1) + '</i></span>' +
			'            <span>' + text + '</span>' +
			'          </div>' +
			'        </div>'
	})
	return tpl
}