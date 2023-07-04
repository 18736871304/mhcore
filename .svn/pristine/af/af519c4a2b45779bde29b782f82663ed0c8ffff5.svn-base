$(function () {

    // var planListUrl = './mock/planList.json'
    var planDetailUrl = 'http://insure.meihualife.com/staff/plan/getOnePlanInfo.do'

    var selectedInsuranceType = []
    var relatoappnt = ''

    var plantype = '';
    var inssex = '';
    var insage = '';
    var appsex = ''; 
    var appage = '';
    	
    var planFunc = {
        init: function () {
            this.setStyle();
            this.bindEvent();
        },
        setStyle: function () {
            document.title = $("#method").val() === 'add' ? '添加' : '编辑'
            	
            if($("#method").val()=='edit'&&$("#planid").val()!=null&&$("#planid").val()!='')
            {
            	getData('/staff/plan/getOnePlanInfo.do', 'post', {'planid': $("#planid").val()}, 
				{
					success: function (res) 
				    {
						$('#planName').text(res.plantypename);
						plantype = res.plantype;
						
						$("#js_input").val(res.insname);
						
						$('#selectSex').text(res.inssexname);
						inssex = Number(res.inssex)+1;
						
						$('#selectAge').text(res.insage);
						insage = res.insage;
						
						$('#relation').text(res.relaname)
						relatoappnt = res.relatoappnt;
						$('#categrorySection').removeClass('hide')
						
						$("#mobile").val(res.mobile);
						
						var risktypeList = res.risktype.split('+');
						for(var i=0;i<risktypeList.length;i++)
						{	
							if(risktypeList[i]=='重疾险')
							{
								$('#risktype03').addClass('selected');
							}
							else if(risktypeList[i]=='意外险')
							{
								$('#risktype01').addClass('selected');
							}
							else if(risktypeList[i]=='医疗险')
							{
								$('#risktype02').addClass('selected');
							}
							else if(risktypeList[i]=='人寿险')
							{
								$('#risktype04').addClass('selected');
							}
						}
						
						if(res.relatoappnt!='00')
						{
							$('#insuredInfo').removeClass('hide')
							
							$('#insuredName').val(res.appname);
							
							$('#selectInsuredSex').text(res.appsexname);
							appsex = Number(res.appsex)+1;
							
							$('#selectInsuredAge').text(res.appage);
							appage = res.appage;
						}
						
				    }
				})
            }
        },
        bindEvent: function () {
            var that = this
            // 单列选择框 保障方案
            $('body').on('click', '#planName', function (e) {
                var popupData = [{
                    id: '01',
                    value: '个人保障方案'
                }, {
                    id: '02',
                    value: '家庭保障方案'
                }]
                new IosSelect(1,               // 第一个参数为级联层级，演示为1
                    [popupData],                             // 演示数据
                    {
                        container: '.container',             // 容器class
                        // title: '演示标题',                    // 标题
                        headerHeight: 50, itemHeight: 36,
                        showAnimate: true,
                        itemShowCount: 5,                    // 每一列显示元素个数，超出将隐藏
                        // oneLevelId: val,                     // 第一级默认值
                        callback: function (selectOneObj) {  // 用户确认选择后的回调函数
                            //console.log(selectOneObj)
                            plantype = selectOneObj.id;
                            $('#planName').text(selectOneObj.value)
                            
                            if (selectOneObj.value === '家庭保障方案') {
                                location.href = './familyPlan.do'
                            }
                        }
                    })
            })
            // 输入框 输入姓名
            $('body').on('input', '#js_input', function (e) {
                var $value = $('#js_input').val()
                console.log($value)
            })
            // 单列选择框 性别
            $('body').on('click', '#selectSex', function (e) {
                var genderData = [{
                    value: '男',
                    id: '1'
                }, {
                    value: '女',
                    id: '2'
                }]
                new IosSelect(1,               // 第一个参数为级联层级，演示为1
                    [genderData],                             // 演示数据
                    {
                        container: '.container',             // 容器class
                        // title: '演示标题',                    // 标题
                        headerHeight: 50, itemHeight: 36,
                        itemShowCount: 5,                    // 每一列显示元素个数，超出将隐藏
                        showAnimate: true,
                        // oneLevelId: val,                     // 第一级默认值
                        callback: function (selectOneObj) {  // 用户确认选择后的回调函数
                            //console.log(selectOneObj)
                            inssex = selectOneObj.id;
                            $('#selectSex').text(selectOneObj.value)
                        }
                    })
            })
            // 单列选择框 年龄
            $('body').on('click', '#selectAge', function (e) {
                var ageObj = function (age) {
                    return {
                        value: age + '',
                        id: age
                    }
                }
                var ageArr = (function () {
                    var arr = []
                    for (var i = 0; i <= 65; i++) {
                        arr.push(ageObj(i))
                    }
                    return arr
                })()
                new IosSelect(1,               // 第一个参数为级联层级，演示为1
                    [ageArr],                             // 演示数据
                    {
                        container: '.container',             // 容器class
                        // title: '演示标题',                    // 标题
                        headerHeight: 50, itemHeight: 36,
                        itemShowCount: 5,                    // 每一列显示元素个数，超出将隐藏
                        showAnimate: true,
                        oneLevelId: 30,                     // 第一级默认值
                        callback: function (selectOneObj) {  // 用户确认选择后的回调函数
                            //console.log(selectOneObj)
                            insage = selectOneObj.id;
                            $('#selectAge').text(selectOneObj.value)
                        }
                    })
            })
            // 单列选择框 关系
            $('body').on('click', '#relation', function (e) {
                var relationArr = [
                    {
                        value: '本人',
                        id: '00'
                    },
                    {
                        value: '配偶',
                        id: '02'
                    },
                    {
                        value: '父母',
                        id: '01'
                    },
                    {
                        value: '子女',
                        id: '03'
                    }
                ]
                new IosSelect(1,               // 第一个参数为级联层级，演示为1
                    [relationArr],                             // 演示数据
                    {
                        container: '.container',             // 容器class
                        // title: '演示标题',                    // 标题
                        headerHeight: 50, itemHeight: 36,
                        itemShowCount: 5,                    // 每一列显示元素个数，超出将隐藏
                        showAnimate: true,
                        oneLevelId: 25,                     // 第一级默认值
                        callback: function (selectOneObj) {  // 用户确认选择后的回调函数
                            //console.log(selectOneObj)
                            relatoappnt = selectOneObj.id;
                            $('#relation').text(selectOneObj.value);
                            $('#categrorySection').removeClass('hide')
                            if (selectOneObj.value !== '本人') 
                            {
                                $('#insuredInfo').removeClass('hide')
                                setTimeout(function () {
                                    console.log('sdfsdf', $(document).height(), $(window).height())
                                    var h = $(document).height()-$(window).height();
                                    $(document).scrollTop(h);
                                }, 100)
                            }
                            else 
                            {
                                if (!$('#insuredInfo').hasClass('hide')) {
                                    $('#insuredInfo').addClass('hide')
                                }
                            }
                        }
                    })
            })
            // 输入框 投保人姓名
            $('body').on('input', '#insuredName', function (e) {
                var $value = $('#insuredName').val()
                console.log($value)
            })
            // 单列选择框 投保人性别
            $('body').on('click', '#selectInsuredSex', function (e) {
                var genderData = [{
                    value: '男',
                    id: '1'
                }, {
                    value: '女',
                    id: '2'
                }]
                new IosSelect(1,               // 第一个参数为级联层级，演示为1
                    [genderData],                             // 演示数据
                    {
                        container: '.container1',             // 容器class
                        // title: '演示标题',                    // 标题
                        headerHeight: 50, itemHeight: 36,
                        itemShowCount: 5,                    // 每一列显示元素个数，超出将隐藏
                        showAnimate: true,
                        // oneLevelId: val,                     // 第一级默认值
                        callback: function (selectOneObj) {  // 用户确认选择后的回调函数
                            //console.log(selectOneObj)
                        	appsex = selectOneObj.id;
                            $('#selectInsuredSex').text(selectOneObj.value);
                        }
                    })
            })
            // 单列选择框 投保人年龄
            $('body').on('click', '#selectInsuredAge', function (e) {
                var ageObj = function (age) {
                    return {
                        value: age + '',
                        id: age
                    }
                }
                var ageArr = (function () {
                    var arr = []
                    for (var i = 18; i <= 100; i++) {
                        arr.push(ageObj(i))
                    }
                    return arr
                })()
                new IosSelect(1,               // 第一个参数为级联层级，演示为1
                    [ageArr],                             // 演示数据
                    {
                        container: '.container1',             // 容器class
                        // title: '演示标题',                    // 标题
                        headerHeight: 50, itemHeight: 36,
                        itemShowCount: 5,                    // 每一列显示元素个数，超出将隐藏
                        showAnimate: true,
                        oneLevelId: 30,                     // 第一级默认值
                        callback: function (selectOneObj) {  // 用户确认选择后的回调函数
                            //console.log(selectOneObj)
                        	appage = selectOneObj.id;
                            $('#selectInsuredAge').text(selectOneObj.value);
                        }
                    })
            })
            // 点击险种分类 选中的button 添加事件
            $('body').on('click', '#editFormBox .edit-form-select-button button', function (e) {
                // console.log(this)
                var selectedType = $(this).data('selectedinsurancetype')
                if (!$(this).hasClass('selected')) {
                    $(this).addClass('selected')
                    selectedInsuranceType.push(selectedType)
                } else {
                    $(this).removeClass('selected')
                    if (selectedInsuranceType.length) {
                        selectedInsuranceType.forEach(function (item, index, arr) {
                            if (item === selectedType) {
                                arr.splice(index, 1)
                            }
                        })
                    }
                }
                //console.log(selectedInsuranceType)
                var typeName = []
                selectedInsuranceType.forEach(function (item) {
                    typeName.push(getInsuranceTypeName(item))
                })
                //console.log(typeName.join('+'))
            })
            // 点击下一步 跳转到险种编辑
            $('body').on('click', '#goInsuranceTypeEdit', function (e) 
            {
            	var risktypeStr = []
            	
            	$('#selectedType').find('button').each(function (index, el) 
            	{
            		if($(el).hasClass('selected'))
            		{
            			risktypeStr.push(getInsuranceTypeName($(el).data('selectedinsurancetype')));
            		}
                })
                
                risktypeStr = risktypeStr.join(',');
                
                //console.log(risktypeStr);
            	
                if (!that.validate()) return false
                location.href = '/staff/plan/planDetail.do?relatoappnt='+relatoappnt +'&inssex='+inssex+'&insage='+insage+'&insname='+$.trim($('#js_input').val())
                			   +'&plantype='+plantype +'&appsex='+appsex  +'&appage='+appage +'&appname='+$.trim($('#insuredName').val())
                			   +'&risktype='+risktypeStr+'&planid='+$("#planid").val()+'&mobile='+$("#mobile").val()
            })
            $('body').on('blur', 'input', function () {
                setTimeout(function () {
                    console.log('sdfsdf', $(document).height(), $(window).height())
                    var h = $(document).height()-$(window).height();
                    $(document).scrollTop(h);
                }, 100)
            })
        },
        // 表单验证
        validate: function () {
            if ($('#planName').text() === '请选择') {
                $.toptip('请选择您的保障方案', 'error')
                return false
            }

            if (!commonMobileCheck($('#mobile').val())) {
                $.toptip('手机号码不能为空或者格式不正确！', 'error')
                return false
            }
            
            if (!$.trim($('#js_input').val())) {
                $.toptip('请输入您的姓名', 'error')
                return false
            }
            if (($('#selectSex').text() !== '男') && $('#selectSex').text() !== '女') {
                $.toptip('请选择您的性别', 'error')
                return false
            }
            if ($('#selectAge').text() === '请选择') {
                $.toptip('请选择您的年龄', 'error')
                return false
            }
            if ($('#relation').html() === '<span class="edit-form-cell-tips">本人</span>') {
                $.toptip('请选择投保人与被保人的关系', 'error')
                return false
            }
            var hasSelected = false
            $('#selectedType').find('button').each(function (index, el) {
                if ($(el).hasClass('selected')) {
                    hasSelected = true
                }
            })
            if (!hasSelected) {
                $.toptip('请至少选择一个险种', 'error')
                return false
            }
            if (!$('#insuredInfo').hasClass('hide')) {
                if (!$.trim($('#insuredName').val())) {
                    $.toptip('请输入投保人的姓名', 'error')
                    return false
                }
                if (($('#selectInsuredSex').text() !== '男') && $('#selectInsuredSex').text() !== '女') {
                    $.toptip('请选择投保人的性别', 'error')
                    return false
                }
                if ($('#selectInsuredAge').text() === '请选择') {
                    $.toptip('请选择投保人的年龄', 'error')
                    return false
                }
            }
            return true
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

    /*
     * 用EL表达式替换
    function getQueryValue(queryName) {
        // //TODO test
        // return '0001'
        var reg = new RegExp("(^|&)" + queryName + "=([^&]*)(&|$)", "i");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) {
            return decodeURI(r[2]);
        } else {
            return null;
        }
    }
    */

    function getType(v) {
        var value = ''
        if (v === '01') {
            value = '个人保障方案'
        } else if (v === '02') {
            value = '家庭保障方案'
        }
        return value
    }

    function getInsuranceTypeName(nameCode) {
        var value = ''
        if (nameCode === '01') {
            value = '意外险'
        } else if (nameCode === '02') {
            value = '医疗险'
        } else if (nameCode === '03') {
            value = '重疾险'
        } else if (nameCode === '04') {
            value = '人寿险'
        }
        return value
    }

    function unique(arr) {
        var i, obj = {}, result = [], len = arr.length
        for (i = 0; i < len; i++) {
            if (!obj[arr[i]]) {
                obj[arr[i]] = 1
                result.push(arr[i])
            }
        }
        return result
    }
})
