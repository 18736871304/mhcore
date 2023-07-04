$(function () {
    // var planDetailUrl = 'http://insure.meihualife.com/staff/plan/getPlanDetail.do'
    // var familyTabList = [new FamilyTab()]
    
	var familyCount = 1;
	
	var url_planid = getQueryValue('planid');
	
	var ywCompanyArr = [{id: 'pingancai',value: '平安财险'}]
	var ywRiskDataArr = [];
	
	var ylCompanyArr = [{id: 'zhongan',value: '众安财险'}]
	var ylRiskDataArr = [];
	
	var zjCompanyArr = [{id: 'hongkang',value: '弘康人寿'},{id: 'fuxingjk',value: '复星联合健康'}]
	var zjRiskDataArr = [];
	
	var sxCompanyArr = [{id: 'huagui',value: '华贵人寿'}]
	var sxRiskDataArr = [];
	
	var planList = []
	var familyTabList = []
    // familyTabList[0].currentSelect = true
    var planListUrl = './mock/familyPlan.json'
    
    var istoubao01 = [{"value": "投保","id": "Y","selectStatus": true},{"value": "不投保","id": "N","selectStatus": false}]
        
    var istoubao02 = [{"value": "投保","id": "Y","selectStatus": false},{"value": "不投保","id": "N","selectStatus": true}]
    	
    //意外险选项
    var yiwaixianMoneyButtonList = []
	
    //医疗险选项
    var yiliaoxianMoneyButtonList = []
    //重疾险 寿险 选项
    var zhongjixianMoney = []
	
    var jiaofeinianqiButtonList = []
	
    var jiaofeifangshiButtonList = []
    var baozhangqixianButtonList = []
    var fujiatoubaorenhuomian = []
    var fujiaqitabaoxian = []
    //寿险选项
    var shouxianMoney = []

    var relationList = [{id: '00',value: '本人'},{id: '01',value: '父母'}, {id: '02',value: '配偶'}, 
                        {id: '03',value: '子女'},{id: '06',value: '其他'}]
	
	//{id: '02',value: '配偶'},
	
    // var yiliaoxianObj = new Yiliaoxian()
    var yiliaoxianObj = null
    // var yiwaixianObj = new Yiwaixian()
    var yiwaixianObj = null
    // var zhongjixianObj = new Zhongjixian()
    var zhongjixianObj = null
    // var shouxianObj = new Shouxian()
    var shouxianObj = null
    //默认当前tab为01,本人
    // var currentMemberId = familyTabList[0].memberId + ''
    var currentMemberId = ''
    var currentMemberinsuranceList = []
    // currentMemberinsuranceList[currentMemberId] = []

	var pretab_select_risktype;
	
    var planFunc = {
        init: function () {
            this.setStyle()
            this.bindEvent()
            var slef = this
            
            if(url_planid!=null&&url_planid!='')
            {
            	initInsData();
            }
            
            
            /*
            if (getQueryValue('method') === 'edit') {
                getData(planListUrl, 'post', {planid: getQueryValue('planid')}, {
                    success: function (data) {
                        console.log(data)
                        if (!Array.isArray(data.planList) || !data.planList.length) {
                            return
                        }
                        //处理成员tab栏
                        data.planList.forEach(function (item, index) {
                            if (item.memberId !== '1') {
                                //1本人已经默认存在，不用再push了
                                familyTabList.push(new FamilyTab(item))
                            }
                        })
                        // console.log(familyTabList)
                        planList = handleData(data.planList)
                        //tab栏
                        renderFamilyTab(familyTabList)
                        //view层渲染
                        renderPlan(planList)
                        //渲染预览栏
                        renderPreviewTab(currentMemberinsuranceList[currentMemberId])
                        //生成保障方案按钮
                        $('#nextBtn').removeClass('hide')
                    }
                })
            } else {
                console.log('add')
                // planList.push(new Member())
                renderPlan(planList)
            }
            */
        },
        setStyle: function () {
            var method = getQueryValue('method')
            document.title = method === 'add' ? '添加' : '编辑'
            //预览栏隐藏
            $('#insurancePreview').hide()
            //险种下方的按钮隐藏
            $('#selectInsuranceBox').hide()
        },
        bindEvent: function () {
            var self = this
            //添加成员
            $('body').on('click', '#addPerson', function () {
                var relationArr = relationList
                new IosSelect(1,               // 第一个参数为级联层级，演示为1
                    [relationArr],                             // 演示数据
                    {
                        container: '.container5',             // 容器class
                        // title: '演示标题',                    // 标题
                        headerHeight: 50,
                        itemHeight: 36,
                        itemShowCount: 5,                    // 每一列显示元素个数，超出将隐藏
                        showAnimate: true,
                        // oneLevelId: 25,                     // 第一级默认值
                        callback: function (selectOneObj) {  // 用户确认选择后的回调函数
                            //console.log(selectOneObj)
                            
                        	currentMemberId = '';
                            var selected = {};
                            
                            if (familyTabList.length) {
                                var hasAdded = false
                                familyTabList.forEach(function (item) {
                                    if (selectOneObj.id == '00' && selectOneObj.id == item.relationid) {
                                        $.toast('本人只能添加一次！', 'text')
                                        hasAdded = true
                                    }
                                })
                                if (!hasAdded) {
                                	selected.memberId = 'member_'+lpad(familyCount);
                                	currentMemberId = 'member_'+lpad(familyCount);
                                	
                                	selected.relationid = selectOneObj.id
                                    selected.memberName = selectOneObj.value
                                    addNewRelationTab(selected)
                                	
                                    familyCount++
                                }
                            } else {
                            	selected.memberId = 'member_'+lpad(familyCount);
                            	currentMemberId = 'member_'+lpad(familyCount);
                            	
                            	selected.relationid = selectOneObj.id
                                selected.memberName = selectOneObj.value
                                addNewRelationTab(selected)
                                
                            	familyCount++
                            }
                        }
                    })
            })
            //tab
            $('body').on('click', '#familyTab li', function () {
                // console.log($(this).data('relationid'))
                if ($(this).hasClass('current-tab')) {
                    //console.log('hasClass(current-tab)')
                    return
                }
                var relationid = $(this).data('relationid')
                var memberId = $(this).data('memberid') + ''
                currentMemberId = memberId
                familyTabList.forEach(function (item) {
                    if (item.memberId === memberId) {
                        item.currentSelect = true
                    } else {
                        item.currentSelect = false
                    }
                })

                //console.log('familyTab selected currentMemberId', currentMemberId)
                //console.log('familyTab selected planList', planList)
                
                if (planList.length) {
                    renderPlan(planList, currentMemberId)
                }
            })
            
            //删除成员
            $('body').on('click', '.delete-icon', function (e) {
                e.stopPropagation()
                var memberid = $(this).data('memberid') + ''
                console.log('删除成员',memberid)
                $.confirm({
                    title: '温馨提示',
                    text: '删除该人员后，自身的保障计划会清空，以TA为投保人的保障计划会自动更改为投保人，请留意',
                    onOK: function () {
                        //点击确认
                        deleteMember(memberid)
                    },
                    onCancel: function () {
                    }
                })
                
                $('.primary').text('确定删除');
            })
            $('body').on('click', '#selectInsurance_delete', function () 
            {	
            	if (pretab_select_risktype === '01') 
            	{
                    removeDataFromCurrentMemberData(currentMemberinsuranceList[currentMemberId], yiwaixianObj)
                }
            	else if (pretab_select_risktype === '02') 
            	{
                    removeDataFromCurrentMemberData(currentMemberinsuranceList[currentMemberId], yiliaoxianObj)
                }
            	else if (pretab_select_risktype === '03') 
            	{
                    removeDataFromCurrentMemberData(currentMemberinsuranceList[currentMemberId], zhongjixianObj)
                }
            	else if (pretab_select_risktype === '04') 
            	{
                    removeDataFromCurrentMemberData(currentMemberinsuranceList[currentMemberId], shouxianObj)
                }
            	
            	renderPlan(planList,currentMemberId);
            	
            	//$("#selectBox").popup();
            })
            $('body').on('click', '#selectInsurance_modify', function () {
            	$("#selectBox").popup();
            })
            $('body').on('click', '.risk_selected', function () {
            	$("#selectBox").popup();
            })
            //家庭保障方案中，选择险种的弹窗
            $('body').on('click', '.select-insurance button', function () 
            {
            	//console.log($(this).attr("id"));
            	if (!$(this).hasClass('selected')) 
            	{
                    $(this).addClass('selected').siblings('button').removeClass('selected')
                    
                    if($(this).html()=='意外险')
                    {
                    	pretab_select_risktype = '01';
                    	renderPreviewTabContent(yiwaixianObj);
                    }
                    else if($(this).html()=='医疗险')
                    {
                    	pretab_select_risktype = '02';
                    	renderPreviewTabContent(yiliaoxianObj);
                    }
                    else if($(this).html()=='重疾险')
                    {
                    	pretab_select_risktype = '03';
                    	renderPreviewTabContent(zhongjixianObj);
                    }
                    else if($(this).html()=='人寿险')
                    {
                    	pretab_select_risktype = '04';
                    	renderPreviewTabContent(shouxianObj);
                    }
                } 
            	else
            	{
                    $(this).removeClass('selected')
                }
            	
            	//$("#selectBox").popup();
            })
            // 单列选择框 保障方案
            $('body').on('click', '#planName', function (e) {
                var popupData = [{id: '01',value: '个人保障方案'}, {id: '02',value: '家庭保障方案'}]
                
                //编辑状态下不可选择该项
                if (getQueryValue('method') === 'edit') {
                    $.toast("编辑状态下不可改变保障方案类型", "text")
                    return
                }
                new IosSelect(1,               // 第一个参数为级联层级，演示为1
                    [popupData],                             // 演示数据
                    {
                        container: '.container6',             // 容器class
                        // title: '演示标题',                    // 标题
                        headerHeight: 50, itemHeight: 36,
                        showAnimate: true,
                        itemShowCount: 5,                    // 每一列显示元素个数，超出将隐藏
                        // oneLevelId: val,                     // 第一级默认值
                        callback: function (selectOneObj) {  // 用户确认选择后的回调函数
                            //console.log(selectOneObj)

                            $('#planName').text(selectOneObj.value)
                            if (selectOneObj.value === '个人保障方案') {
                                location.href = './planProject.do?method=add'
                            }
                        }
                    })
            })
            // 输入框 被保人姓名
            $('body').on('input', '#js_input', function (e) {
                var nameVal = $('#js_input').val()
                //console.log('当前成员类型id：', currentMemberId, ',值:', nameVal)
                //赋值
                if (planList.length) {
                    planList.forEach(function (item) {
                        if (item.memberId === currentMemberId) {
                            item.insuredName = nameVal
                        }
                    })
                }
            })
            $("#js_input").change(function()
            {
            	renderAppntButton(planList, $('#selectappnt'));
            });
            // 单列选择框 性别
            $('body').on('click', '#selectSex', function (e) {
                var genderData = [{value: '男',id: '1'}, {value: '女',id: '2'}]
                
                new IosSelect(1,               // 第一个参数为级联层级，演示为1
                    [genderData],                             // 演示数据
                    {
                        container: '.container7',             // 容器class
                        // title: '演示标题',                    // 标题
                        headerHeight: 50, itemHeight: 36,
                        itemShowCount: 5,                    // 每一列显示元素个数，超出将隐藏
                        showAnimate: true,
                        // oneLevelId: val,                     // 第一级默认值
                        callback: function (selectOneObj) {  // 用户确认选择后的回调函数
                            //console.log(selectOneObj)
                            $('#selectSex').text(selectOneObj.value)
                            $('#selectSex').attr("data-id",selectOneObj.id);
                            //console.log('当前成员类型id：', currentMemberId, ',值:', selectOneObj.value)
                            //赋值
                            if (planList.length) {
                                planList.forEach(function (item) {
                                    if (item.memberId === currentMemberId) {
                                        item.insuredGender = selectOneObj.value
                                        item.inssex = selectOneObj.id
                                    }
                                })
                            }
                            
                            renderFamilyTab(familyTabList);
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
                    for (var i = 0; i <= 106; i++) {
                        arr.push(ageObj(i))
                    }
                    return arr
                })()
                new IosSelect(1,               // 第一个参数为级联层级，演示为1
                    [ageArr],                             // 演示数据
                    {
                        container: '.container8',             // 容器class
                        // title: '演示标题',                    // 标题
                        headerHeight: 50, itemHeight: 36,
                        itemShowCount: 5,                    // 每一列显示元素个数，超出将隐藏
                        showAnimate: true,
                        oneLevelId: 25,                     // 第一级默认值
                        callback: function (selectOneObj) {  // 用户确认选择后的回调函数
                            //console.log(selectOneObj)
                            $('#selectAge').text(selectOneObj.value)
                            $('#selectAge').attr("data-id",selectOneObj.id);
                            //console.log('当前成员类型id：', currentMemberId, ',值:', selectOneObj.value)
                            //赋值
                            if (planList.length) {
                                planList.forEach(function (item) {
                                    if (item.memberId === currentMemberId) {
                                        item.insuredAge = selectOneObj.value
                                    }
                                })
                            }
                            
                            renderFamilyTab(familyTabList);
                        }
                    })
            })
            // 点击险种分类 添加险种
            $('body').on('click', '#selectBox .categrory .edit-form-select-button button', function (e) {
                var selectedType = $(this).data('selectedinsurancetype')

                if(currentMemberinsuranceList[currentMemberId]==null||currentMemberinsuranceList[currentMemberId]=='')
                {
                	currentMemberinsuranceList[currentMemberId] = [];
                }
                if (!$(this).hasClass('selected')) {
                    $(this).addClass('selected')
                    if (selectedType === '01') {
                        yiwaixianObj = new Yiwaixian()
                        renderYiwaixian(yiwaixianObj)
                        currentMemberinsuranceList[currentMemberId].push(yiwaixianObj)
                    } else if (selectedType === '02') {
                        yiliaoxianObj = new Yiliaoxian()
                        renderYiliaoxian(yiliaoxianObj)
                        currentMemberinsuranceList[currentMemberId].push(yiliaoxianObj)
                    } else if (selectedType === '03') {
                        $('#zhongjixian').removeClass('hide')
                        zhongjixianObj = new Zhongjixian()
                        renderZhongjixian(zhongjixianObj)
                        currentMemberinsuranceList[currentMemberId].push(zhongjixianObj)
                    } else if (selectedType === '04') {
                        $('#shouxian').removeClass('hide')
                        shouxianObj = new Shouxian()
                        renderShouxian(shouxianObj)
                        currentMemberinsuranceList[currentMemberId].push(shouxianObj)
                    }
                } else {
                    $(this).removeClass('selected')
                    if (selectedType === '01') {
                        $('#yiwaixian').addClass('hide')
                        removeDataFromCurrentMemberData(currentMemberinsuranceList[currentMemberId], yiwaixianObj)
                    } else if (selectedType === '02') {
                        $('#yiliaoxian').addClass('hide')
                        removeDataFromCurrentMemberData(currentMemberinsuranceList[currentMemberId], yiliaoxianObj)
                    } else if (selectedType === '03') {
                        $('#zhongjixian').addClass('hide')
                        removeDataFromCurrentMemberData(currentMemberinsuranceList[currentMemberId], zhongjixianObj)
                    } else if (selectedType === '04') {
                        $('#shouxian').addClass('hide')
                        removeDataFromCurrentMemberData(currentMemberinsuranceList[currentMemberId], shouxianObj)
                    }
                }
                //console.log('selectedType click',currentMemberinsuranceList[currentMemberId])
            })
            // 险种编辑界面 选择相应保险公司
            $('body').on('click', '#yiwaixianCompany', function () {
                var companyArr = ywCompanyArr;
                var that = $(this)
                new IosSelect(1,               // 第一个参数为级联层级，演示为1
                    [companyArr],                             // 演示数据
                    {
                        container: '.container9',             // 容器class
                        // title: '演示标题',                    // 标题
                        headerHeight: 50,
                        itemHeight: 36,
                        itemShowCount: 5,                    // 每一列显示元素个数，超出将隐藏
                        showAnimate: true,
                        //oneLevelId: companyArr[0].id,       // 第一级默认值
                        callback: function (selectOneObj) {  // 用户确认选择后的回调函数
                            //console.log(selectOneObj)
                            $('#yiwaixianCompany').text(selectOneObj.value)
                            yiwaixianObj.companyid = selectOneObj.id
                            yiwaixianObj.insorgancode = selectOneObj.id
                            yiwaixianObj.company = selectOneObj.value
                            
                            getData('/staff/plan/getRiskList.do', 'post', {'insorgancode': selectOneObj.id,'risktype':'01'}, 
        					{
                            	success: function (res) 
        			            {
                            		ywRiskDataArr = res;
        			                
                            		renderAmntButton([], $('#yiwaixianMoneyButton'))
        			            	$('#yiwaixianchanpin').text('请选择')
                                    yiwaixianObj.riskname = ''
                                    yiwaixianObj.riskcode = ''
        			                $('#yiwaixianbaofei').text('0元/年');
        			            }
        			        })
                            //console.log('company',currentMemberinsuranceList[currentMemberId])
                        }
                    })
            })
            $('body').on('click', '#yiliaoxianCompany', function () {
                var companyArr = ylCompanyArr;
                
                var that = $(this)
                new IosSelect(1,               // 第一个参数为级联层级，演示为1
                    [companyArr],                             // 演示数据
                    {
                        container: '.container0',             // 容器class
                        // title: '演示标题',                    // 标题
                        headerHeight: 50,
                        itemHeight: 36,
                        itemShowCount: 5,                    // 每一列显示元素个数，超出将隐藏
                        showAnimate: true,
                        //oneLevelId: companyArr[0].id,       // 第一级默认值
                        callback: function (selectOneObj) {  // 用户确认选择后的回调函数
                            //console.log(selectOneObj)
                            $('#yiliaoxianCompany').text(selectOneObj.value)
                            yiliaoxianObj.companyid = selectOneObj.id
                            yiliaoxianObj.insorgancode = selectOneObj.id
                            yiliaoxianObj.company = selectOneObj.value
                            
                            getData('/staff/plan/getRiskList.do', 'post', {'insorgancode': selectOneObj.id,'risktype':'02'}, 
                			{
                            	success: function (res) 
                			    {
                            		ylRiskDataArr = res;
                			        
                            		renderAmntButton([], $('#yiliaoxianMoneyButton'))
                            		$('#yiliaoxianchanpin').text('请选择')
                                    yiliaoxianObj.riskname = ''
                                    yiliaoxianObj.riskcode = ''
                			        $('#yiliaoxianbaofei').text('0元/年');
                			    }
                			})
                            //console.log('company',currentMemberinsuranceList[currentMemberId])
                        }
                    })
            })
            $('body').on('click', '#zhongjixiancompany', function () {
                var companyArr = zjCompanyArr;
                
                var that = $(this)
                new IosSelect(1,               // 第一个参数为级联层级，演示为1
                    [companyArr],                             // 演示数据
                    {
                        container: '.container11',             // 容器class
                        // title: '演示标题',                    // 标题
                        headerHeight: 50,
                        itemHeight: 36,
                        itemShowCount: 5,                    // 每一列显示元素个数，超出将隐藏
                        showAnimate: true,
                        //oneLevelId: companyArr[0].id,       // 第一级默认值
                        callback: function (selectOneObj) {  // 用户确认选择后的回调函数
                            //console.log(selectOneObj)
                            $('#zhongjixiancompany').text(selectOneObj.value)
                            zhongjixianObj.companyid = selectOneObj.id
                            zhongjixianObj.insorgancode = selectOneObj.id
                            zhongjixianObj.company = selectOneObj.value
                            
                            getData('/staff/plan/getRiskList.do', 'post', {'insorgancode': selectOneObj.id,'risktype':'03'}, 
        					{
        						success: function (res) 
        					    {
        							zjRiskDataArr = res;
        							renderAmntButton([], $('#moneyButton'));
        							renderButton([], $('#paymentTime'));
        							renderButton([], $('#paymentMethod'));
        							renderButton([], $('#term'));
        							
        							$('#additionalInsurance03').html('');
        							$('#zhongjixianchanpin').text('请选择')
        							
        							zhongjixianObj.payendyear = '';
        							zhongjixianObj.payintv = '';
        							zhongjixianObj.insureyear = '';
        							zhongjixianObj.amnt = '';
        							zhongjixianObj.prem = '';
        							$('#zhongjixianbaofei').text('0元/年');
        					    }
        					})
                        }
                    })
            })
            $('body').on('click', '#shouxiancompany', function () {
                var companyArr = sxCompanyArr;
                
                var that = $(this)
                new IosSelect(1,               // 第一个参数为级联层级，演示为1
                    [companyArr],                             // 演示数据
                    {
                        container: '.container12',             // 容器class
                        // title: '演示标题',                    // 标题
                        headerHeight: 50,
                        itemHeight: 36,
                        itemShowCount: 5,                    // 每一列显示元素个数，超出将隐藏
                        showAnimate: true,
                        //oneLevelId: companyArr[0].id,       // 第一级默认值
                        callback: function (selectOneObj) {  // 用户确认选择后的回调函数
                            //console.log(selectOneObj)
                            $('#shouxiancompany').text(selectOneObj.value)
                            shouxianObj.companyid = selectOneObj.id
                            shouxianObj.insorgancode = selectOneObj.id
                            shouxianObj.company = selectOneObj.value
                            
                            getData('/staff/plan/getRiskList.do', 'post', {'insorgancode': selectOneObj.id,'risktype':'04'}, 
                			{
                				success: function (res) 
                			    {
                					sxRiskDataArr = res;
                					renderAmntButton([], $('#shouxianMoneyButton'));
                					renderButton([], $('#shouxianPaymentTime'));
                					renderButton([], $('#shouxianPaymentMethod'));
                					renderButton([], $('#shouxianTerm'));
                					
                					//$('#additionalInsurance03').html('');
                					$('#shouxianchanpin').text('请选择')
                					
                					shouxianObj.payendyear = '';
                					shouxianObj.payintv = '';
                					shouxianObj.insureyear = '';
                					shouxianObj.amnt = '';
                					shouxianObj.prem = '';
                					$('#shouxianbaofei').text('0元/年');
                			    }
                			})
                        }
                    })
            })
            // 险种编辑界面 选择相应保险公司，出现相应的产品，并赋值
            $('body').on('click', '#yiwaixianchanpin', function () {
                //console.log('yiwaixianchanpin')
                var dataArr = ywRiskDataArr;
                
                var that = $(this)
                new IosSelect(1,               // 第一个参数为级联层级，演示为1
                    [dataArr],                             // 演示数据
                    {
                        container: '.container1',             // 容器class
                        title: '',                    // 标题
                        headerHeight: 50, itemHeight: 36,
                        itemShowCount: 5,                    // 每一列显示元素个数，超出将隐藏
                        showAnimate: true,
                        // oneLevelId: val,                     // 第一级默认值
                        callback: function (selectOneObj) {  // 用户确认选择后的回调函数
                            //console.log('selectOneObj',selectOneObj)
                            $('#yiwaixianchanpin').text(selectOneObj.value)
                            yiwaixianObj.riskname = selectOneObj.value
                            yiwaixianObj.riskcode = selectOneObj.id
                            yiwaixianObj.risktype = '01';
                            
                            getData('/staff/plan/getRiskInfo.do', 'post', {'insorgancode': yiwaixianObj.companyid,'risktype':'01','riskcode':selectOneObj.id}, 
        					{
        						success: function (res)
        					    {
        							yiwaixianObj.insuranceAmount = res.amntList;
        							renderAmntButton(res.amntList, $('#yiwaixianMoneyButton'))
        							yiwaixianObj.prem = ''
        							yiwaixianObj.amnt = ''
        					    }
        					})
                        }
                    })
            })
            $('body').on('click', '#yiliaoxianchanpin', function () {
                var dataArr = ylRiskDataArr;
                
                var that = $(this)
                new IosSelect(1,               // 第一个参数为级联层级，演示为1
                    [dataArr],                             // 演示数据
                    {
                        container: '.container2',             // 容器class
                        title: '',                    // 标题
                        headerHeight: 50, itemHeight: 36,
                        itemShowCount: 5,                    // 每一列显示元素个数，超出将隐藏
                        showAnimate: true,
                        // oneLevelId: val,                     // 第一级默认值
                        callback: function (selectOneObj) {  // 用户确认选择后的回调函数
                            
                        	//console.log('selectOneObj',selectOneObj)
                            $('#yiliaoxianchanpin').text(selectOneObj.value)
                            yiliaoxianObj.riskname = selectOneObj.value
                            yiliaoxianObj.riskcode = selectOneObj.id
                            yiliaoxianObj.risktype = '02';
                        	
                        	getData('/staff/plan/getRiskInfo.do', 'post', {'insorgancode': yiliaoxianObj.companyid,'risktype':'02','riskcode':selectOneObj.id}, 
                			{
                				success: function (res)
                			    {
                					yiliaoxianObj.insuranceAmount = res.amntList;
                					renderAmntButton(res.amntList, $('#yiliaoxianMoneyButton'))
                					yiliaoxianObj.prem = ''
                					yiliaoxianObj.amnt = ''
                			    }
                			})
                        }
                    })
            })
            $('body').on('click', '#zhongjixianchanpin', function () {
                var dataArr = zjRiskDataArr;
                
                var that = $(this)
                new IosSelect(1,               // 第一个参数为级联层级，演示为1
                    [dataArr],                             // 演示数据
                    {
                        container: '.container3',             // 容器class
                        title: '',                    // 标题
                        headerHeight: 50, itemHeight: 36,
                        itemShowCount: 5,                    // 每一列显示元素个数，超出将隐藏
                        showAnimate: true,
                        // oneLevelId: val,                     // 第一级默认值
                        callback: function (selectOneObj) {  // 用户确认选择后的回调函数
                            //console.log(selectOneObj)
                            $('#zhongjixianchanpin').text(selectOneObj.value)
                            zhongjixianObj.riskname = selectOneObj.value
                            zhongjixianObj.riskcode = selectOneObj.id
                            zhongjixianObj.risktype = '03';
                            
                            getData('/staff/plan/getRiskInfo.do', 'post', {'insorgancode': zhongjixianObj.insorgancode,'risktype':'03','riskcode':selectOneObj.id}, 
        					{
        						success: function (res) 
        					    {
        							zhongjixianObj.insuranceAmount = res.amntList;
        							renderAmntButton(res.amntList, $('#moneyButton'));
        							
        							zhongjixianObj.jiaofeinianqiButtonList = res.payendyearList;
        							renderButton(res.payendyearList, $('#paymentTime'));
        							
        							zhongjixianObj.jiaofeifangshiButtonList = res.payintvList;
        							renderButton(res.payintvList, $('#paymentMethod'));
        							
        							zhongjixianObj.baozhangqixianButtonList = res.insureyearList;
        							renderButton(res.insureyearList, $('#term'));
        									
        							$('#additionalInsurance03').html('');
        							
        							//console.log('zhongjixianObj currentMemberinsuranceList[currentMemberId]', currentMemberinsuranceList[currentMemberId])
        							//console.log(currentMemberId,$('#selectappnt').attr("data-id"));
        							addRiskList = res.addRiskList;									
        							addRiskList.forEach(function (item)
        							{
        								/*
        								 * 豁免险的时候，要根据投被保险人关系显示
        								 */
        								if(item.riskcode=='521507')
        								{
        									if ($('#selectappnt').attr("data-id")!=null&&$('#selectappnt').attr("data-id")!=''
        									   &&currentMemberId!=$('#selectappnt').attr("data-id")) 
        									{
        										zhongjixianObj[item.riskcode] = 'Y'
        										zhongjixianObj.addRiskList[item.riskcode+'Obj'] = {"riskcode":item.riskcode,"riskname":item.riskname};
        										zhongjixianObj.addRiskList[item.riskcode+'Obj']['riskData'] = [{"value": "投保","id": "Y","selectStatus": true},{"value": "不投保","id": "N","selectStatus": false}];
        										
        										renderAdditionalInsurance(item,'03');
        									}
        									else
        									{
        										zhongjixianObj[item.riskcode] = 'N'
        										zhongjixianObj.addRiskList[item.riskcode+'Obj'] = {"riskcode":item.riskcode,"riskname":item.riskname};
        										zhongjixianObj.addRiskList[item.riskcode+'Obj']['riskData'] = [{"value": "投保","id": "Y","selectStatus": false},{"value": "不投保","id": "N","selectStatus": true}];
        									}
        								}
        								else
        								{	
        									if(item.riskcode=='hongkang000002'||item.riskcode=='hongkang000024')
        									{
        										zhongjixianObj[item.riskcode] = 'N'
        										zhongjixianObj.addRiskList[item.riskcode+'Obj'] = {"riskcode":item.riskcode,"riskname":item.riskname};
        										zhongjixianObj.addRiskList[item.riskcode+'Obj']['riskData'] = [{"value": "投保","id": "Y","selectStatus": false},{"value": "不投保","id": "N","selectStatus": true}];
        									}
        									else
        									{
        										zhongjixianObj[item.riskcode] = 'Y'
        										zhongjixianObj.addRiskList[item.riskcode+'Obj'] = {"riskcode":item.riskcode,"riskname":item.riskname};
        										zhongjixianObj.addRiskList[item.riskcode+'Obj']['riskData'] = [{"value": "投保","id": "Y","selectStatus": true},{"value": "不投保","id": "N","selectStatus": false}];
        									}
        									
        									renderAdditionalInsurance(item,'03')
        								}
        							})
        							
        							zhongjixianObj.payendyear = '';
        							zhongjixianObj.payintv = '';
        							zhongjixianObj.insureyear = '';
        							zhongjixianObj.amnt = '';
        							zhongjixianObj.prem = '';
        							$('#zhongjixianbaofei').text('0元/年');
        					    }
        					})
                        }
                    })
            })
            $('body').on('click', '#shouxianchanpin', function () {
                var dataArr = sxRiskDataArr;
                
                var that = $(this)
                new IosSelect(1,               // 第一个参数为级联层级，演示为1
                    [dataArr],                             // 演示数据
                    {
                        container: '.container4',             // 容器class
                        title: '',                    // 标题
                        headerHeight: 50, itemHeight: 36,
                        itemShowCount: 5,                    // 每一列显示元素个数，超出将隐藏
                        showAnimate: true,
                        // oneLevelId: val,                     // 第一级默认值
                        callback: function (selectOneObj) {  // 用户确认选择后的回调函数
                            //console.log(selectOneObj)
                            $('#shouxianchanpin').text(selectOneObj.value)
                            shouxianObj.riskname = selectOneObj.value
                            shouxianObj.riskcode = selectOneObj.id
                            shouxianObj.risktype = '04';
                            
                            getData('/staff/plan/getRiskInfo.do', 'post', {'insorgancode': shouxianObj.companyid,'risktype':'04','riskcode':selectOneObj.id}, 
                        	{
                        		success: function (res)
                        	    {
                        			shouxianObj.insuranceAmount = res.amntList;
        							renderAmntButton(res.amntList, $('#shouxianMoneyButton'));
        							
        							shouxianObj.jiaofeinianqiButtonList = res.payendyearList;
        							renderButton(res.payendyearList, $('#shouxianPaymentTime'));
        							
        							shouxianObj.jiaofeifangshiButtonList = res.payintvList;
        							renderButton(res.payintvList, $('#shouxianPaymentMethod'));
        							
        							shouxianObj.baozhangqixianButtonList = res.insureyearList;
        							renderButton(res.insureyearList, $('#shouxianTerm'));
        							
        							shouxianObj.payendyear = '';
        							shouxianObj.payintv = '';
        							shouxianObj.insureyear = '';
        							shouxianObj.amnt = '';
        							shouxianObj.prem = '';
        							$('#shouxianbaofei').text('0元/年');
                        	    }
                        	})
                        }
                    })
            })
            // 险种编辑界面 butotn点击  单选
            $('body').on('click', '#selectBox .edit-form-box .edit-form-select-button button', function (e) {
                if (!$(this).hasClass('selected')) {
                    $(this).addClass('selected').siblings('button').removeClass('selected')
                } else {
                    $(this).removeClass('selected')
                }
                // console.log($(this).text())
                var id = $(this).parent().attr('id')
                var risktype = $(this).parent().attr('data-type')

                //console.log(id)
                switch (id) {
                    case 'yiwaixianMoneyButton':
                        console.log('意外险-保费金额-', $(this).attr("data-id"))
                        if (yiwaixianObj.amnt !== $(this).attr("data-id"))
                        {
                            yiwaixianObj.amnt = $(this).attr("data-id");
                            changeSelectedStatus(yiwaixianObj, $(this).attr("data-id"), 'insuranceAmount', true)
                        } else {
                            yiwaixianObj.amnt = ''
                            changeSelectedStatus(yiwaixianObj, $(this).attr("data-id"), 'insuranceAmount', false)
                        }
                        calYWprem();
                        break
                    case 'yiliaoxianMoneyButton':
                        console.log('医疗险-保费金额-', $(this).attr("data-id"))
                        if (yiliaoxianObj.amnt !== $(this).attr("data-id")) 
                        {
                            yiliaoxianObj.amnt = $(this).attr("data-id")
                            changeSelectedStatus(yiliaoxianObj, $(this).attr("data-id"), 'insuranceAmount', true)
                        } else {
                            yiliaoxianObj.amnt = ''
                            changeSelectedStatus(yiliaoxianObj, $(this).attr("data-id"), 'insuranceAmount', false)
                        }
                        calYLprem();
                        break
                    case 'moneyButton':
                        console.log('重疾险-保费金额-', $(this).attr("data-id"))
                        if (zhongjixianObj.amnt !== $(this).attr("data-id")) {
                            zhongjixianObj.amnt = $(this).attr("data-id")
                            changeSelectedStatus(zhongjixianObj, $(this).attr("data-id"), 'insuranceAmount', true)
                        } else {
                            zhongjixianObj.amnt = ''
                            changeSelectedStatus(zhongjixianObj, $(this).attr("data-id"), 'insuranceAmount', false)
                        }
                        calZJprem();
                        break
                    case 'paymentTime':
                        console.log('重疾险-缴费年期-', $(this).attr("data-id"))
                        if (zhongjixianObj.payendyear !== $(this).attr("data-id")) 
                        {
                            zhongjixianObj.payendyear = $(this).attr("data-id")
                            zhongjixianObj.payendyearname = $(this).html();
                            changeSelectedStatus(zhongjixianObj, $(this).attr("data-id"), 'jiaofeinianqiButtonList', true)
                        }
                        else 
                        {
                            zhongjixianObj.payendyear = ''
                            zhongjixianObj.payendyearname = '';
                            changeSelectedStatus(zhongjixianObj, $(this).attr("data-id"), 'jiaofeinianqiButtonList', false)
                        }
                        calZJprem();
                        break
                    case 'paymentMethod':
                        console.log('重疾险-缴费方式-', $(this).attr("data-id"))
                        if (zhongjixianObj.payintv !== $(this).attr("data-id")) 
                        {
                            zhongjixianObj.payintv = $(this).attr("data-id")
                            zhongjixianObj.payintvname = $(this).html();
                            changeSelectedStatus(zhongjixianObj, $(this).attr("data-id"), 'jiaofeifangshiButtonList', true)
                        }
                        else 
                        {
                            zhongjixianObj.payintv = ''
                            zhongjixianObj.payintvname = '';
                            changeSelectedStatus(zhongjixianObj, $(this).attr("data-id"), 'jiaofeifangshiButtonList', false)
                        }
                        calZJprem();
                        break
                    case 'term':
                        console.log('重疾险-保障期限-', $(this).attr("data-id"))
                        if (zhongjixianObj.insureyear !== $(this).attr("data-id")) 
                        {
                            zhongjixianObj.insureyear = $(this).attr("data-id")
                            zhongjixianObj.insureyearname = $(this).html();
                            changeSelectedStatus(zhongjixianObj, $(this).attr("data-id"), 'baozhangqixianButtonList', true)
                        }
                        else 
                        {
                            zhongjixianObj.insureyear = ''
                            zhongjixianObj.insureyearname = '';
                            changeSelectedStatus(zhongjixianObj, $(this).attr("data-id"), 'baozhangqixianButtonList', false)
                        }
                        calZJprem();
                        break
                    case 'fujiatoubao':
                        console.log('附加投保人豁免-', $(this).text())
                        if (zhongjixianObj.exempt !== $(this).text()) {
                            zhongjixianObj.exempt = $(this).text()
                            changeSelectedStatus(zhongjixianObj, $(this).text(), 'fujiatoubaorenhuomianList', true)
                        } else {
                            zhongjixianObj.exempt = ''
                            changeSelectedStatus(zhongjixianObj, $(this).text(), 'fujiatoubaorenhuomianList', false)
                        }
                        break
                    case 'shouxianMoneyButton':
                        console.log('寿险-保费金额-', $(this).attr("data-id"))
                        if (shouxianObj.amnt !== $(this).attr("data-id")) 
                        {
                            shouxianObj.amnt= $(this).attr("data-id")
                            changeSelectedStatus(shouxianObj, $(this).attr("data-id"), 'insuranceAmount', true)
                        }
                        else 
                        {
                            shouxianObj.amnt = ''
                            changeSelectedStatus(shouxianObj, $(this).attr("data-id"), 'insuranceAmount', false)
                        }
                        calSXprem();
                        break
                    case 'shouxianPaymentTime':
                        console.log('寿险-缴费年期-', $(this).attr("data-id"))
                        if (shouxianObj.payendyear !== $(this).attr("data-id")) 
                        {
                            shouxianObj.payendyear = $(this).attr("data-id")
                            shouxianObj.payendyearname = $(this).html();
                            changeSelectedStatus(shouxianObj, $(this).attr("data-id"), 'jiaofeinianqiButtonList', true)
                        }
                        else 
                        {
                            shouxianObj.payendyear = '';
                            shouxianObj.payendyearname = '';
                            changeSelectedStatus(shouxianObj, $(this).attr("data-id"), 'jiaofeinianqiButtonList', false)
                        }
                        calSXprem();
                        break
                    case 'shouxianPaymentMethod':
                        console.log('寿险-缴费方式-', $(this).attr("data-id"))
                        if (shouxianObj.payintv !== $(this).attr("data-id")) 
                        {
                            shouxianObj.payintv = $(this).attr("data-id")
                            shouxianObj.payintvname = $(this).html();
                            changeSelectedStatus(shouxianObj, $(this).attr("data-id"), 'jiaofeifangshiButtonList', true)
                        }
                        else 
                        {
                            shouxianObj.payintv = ''
                            shouxianObj.payintvname = '';
                            changeSelectedStatus(shouxianObj, $(this).attr("data-id"), 'jiaofeifangshiButtonList', false)
                        }
                        calSXprem();
                        break
                    case 'shouxianTerm':
                        console.log('寿险-保障期限-', $(this).attr("data-id"))
                        if (shouxianObj.insureyear !== $(this).attr("data-id")) 
                        {
                            shouxianObj.insureyear = $(this).attr("data-id")
                            shouxianObj.insureyearname = $(this).html();
                            changeSelectedStatus(shouxianObj, $(this).attr("data-id"), 'baozhangqixianButtonList', true)
                        }
                        else 
                        {
                            shouxianObj.insureyear = ''
                            shouxianObj.insureyearname = '';
                            changeSelectedStatus(shouxianObj, $(this).attr("data-id"), 'baozhangqixianButtonList', false)
                        }
                        calSXprem();
                        break
                    default:
                        console.log('附加-', $(this).attr("data-id"), $(this).attr("id"), risktype)
                        
                        if(risktype=='03')
                        {
                        	if(zhongjixianObj[id]!=$(this).attr("data-id"))
                        	{
                        		zhongjixianObj[id] = $(this).attr("data-id")
                        		changeSelectedStatus(zhongjixianObj.addRiskList[id+'Obj'], $(this).attr("data-id"), 'riskData', true)
                        	}
                        	else
                        	{
                        		zhongjixianObj[id] = 'N'
                        		changeSelectedStatus(zhongjixianObj.addRiskList[id+'Obj'], $(this).attr("data-id"), 'riskData', true)
                        	}
                        	
                        	calZJprem();
                        }
                        //setObjStatus(currentPlusObj, $(this).data('itemid'))
                        //zhongjixianObj.plusInsurance.push(currentPlusObj)
                }
                observe(currentMemberinsuranceList[currentMemberId])
            })
            //预览栏中的tab点击
            $('body').on('click', '#insurancePreview .selected-list ul li', function () {
                if ($(this).hasClass('current-selected')) {
                    //console.log('hasClass current-selected')
                    return
                }
                //console.log($(this).data('insurancetype'), currentMemberinsuranceList[currentMemberId])
                $(this).addClass('current-selected').siblings('li').removeClass('current-selected')
                var type = $(this).data('insurancetype')
                //console.log('type', type)
                var currentObj = null
                if (currentMemberinsuranceList[currentMemberId].length) {
                    currentMemberinsuranceList[currentMemberId].forEach(function (item) {
                        if (item.id === type) {
                            currentObj = item
                        }
                    })
                }
                if (currentObj) {
                    //console.log(currentObj)
                    renderPreviewTabContent(currentObj)
                }
            })
            //选择完险种后点击确定
            $('#savePlanBtn').on('click', function () {
                //console.log('savePlanBtn currentMemberinsuranceList[currentMemberId]', currentMemberinsuranceList[currentMemberId])
                //赋值
                if (planList.length) {
                    planList.forEach(function (item) {
                        if (item.memberId === currentMemberId) {
                            item.insuranceList = currentMemberinsuranceList[currentMemberId]
                        }
                    })
                }
                console.log('savePlanBtn planList------', planList)
                //渲染下方的tab
                renderPreviewTab(currentMemberinsuranceList[currentMemberId])
                //渲染险种分类下方的展示文字
                renderSelectedInsuranceButton(currentMemberinsuranceList[currentMemberId])
                //显示生成保障方案的按钮
                $('#insurancePreview').show()
                $('#nextBtn').removeClass('hide')
                // currentMemberinsuranceList[currentMemberId].length = 0
                $.closePopup()
            })
            //生成保障方案
            $('#goInsuranceTypeEdit').on('click', function () {
                //console.log(planList)
            	
            	var checkflag = false;
            	
            	if(!commonMobileCheck($('#mobile').val()))
            	{
            		$.alert('手机号码不能为空或者格式不正确！', "温馨提示");
                	checkflag = true;
                	return;
            	}
            	
            	if (planList.length) 
            	{
                    planList.forEach(function (item) 
                    {
                    	if (item.insuredName == null||item.insuredName == '') 
                        {
                    		$.alert(item.memberName+'的姓名不能为空！', "温馨提示");
                        	checkflag = true;
                        	return;
                        }
                    	
                        if (item.inssex == null||item.inssex == '') 
                        {
                        	$.alert(item.memberName+'的性别不能为空！', "温馨提示");
                        	checkflag = true;
                        	return;
                        }
                        
                        if (item.insuredAge == null||item.insuredAge == '') 
                        {
                        	$.alert(item.memberName+'的年龄不能为空！', "温馨提示");
                        	checkflag = true;
                        	return;
                        }
                        
                        if (item.appntid == null||item.appntid == '') 
                        {
                        	$.alert('请选择'+item.memberName+'的投保人！', "温馨提示");
                        	checkflag = true;
                        	return;
                        }
                        
                        item.insuranceList.forEach(function (insurance) 
                        {
                        	if(insurance.prem==null||insurance.prem==''||insurance.prem=='0')
                        	{
                        		$.alert(item.memberName+'存在保费未计算的产品，请选择产品要素！', "温馨提示");
                            	checkflag = true;
                        		return;
                        	}
                        })
                    })
                }
            	
            	if(checkflag)
            	{
            		return;
            	}
            	
            	var planListStr = JSON.stringify(planList);
            	console.log('planListStr',planListStr);
            	
            	getData('/staff/plan/familyPlanDeal.do', 'post', {'planListStr':planListStr,"oldplanid":url_planid,"mobile":$('#mobile').val()}, 
            	{
            		success: function (res) 
            		{
            			location.href = '/staff/plan/familyPlanView.do?planid='+res.planid;
            		}
            	})
            	
            })
            $('body').on('click', '#selectappnt button', function (e) {
                if (!$(this).hasClass('selected')) 
                {
                    $(this).addClass('selected').siblings('button').removeClass('selected')
                    
                    var appnt_id = $(this).attr("data-id");
                    var appnt_relationid = $(this).attr("data_relationid");
                    
                    $(this).parent().attr("data-id",appnt_id);
                    if (planList.length) 
                    {
	                    planList.forEach(function (item) {
	                        if (item.memberId === currentMemberId) {
	                            item.appntid = appnt_id;
	                            item.appntrelationid = appnt_relationid;
	                        }
	                    })
	                }
                }
                else 
                {
                    $(this).removeClass('selected')
                    
                    $(this).parent().attr("data-id",'');
                    if (planList.length) 
                    {
	                    planList.forEach(function (item) {
	                        if (item.memberId === currentMemberId) {
	                            item.appntid = '';
	                            item.appntrelationid = '';
	                        }
	                    })
	                }
                }
            })
        },
        //TODO 表单验证
        validate: function () {
            if ($('#planName').text() === '请选择') {
                $.toptip('请选择您的保障方案', 'error')
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
            timeout: 150000,
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

    function setObjectValue(insuranceList)
    {
    	insuranceList.forEach(function (insurance) 
    	{
            if (insurance.insuranceTypeId === '01') 
            {
                //意外险
                yiwaixianObj = insurance;
            } 
            else if (insurance.insuranceTypeId === '02')
            {
                //医疗险
                yiliaoxianObj = insurance;
            } 
            else if (insurance.insuranceTypeId === '03') 
            {
                //重疾险
                zhongjixianObj = insurance;
            }
            else if (insurance.insuranceTypeId === '04')
            {
                //寿险
                shouxianObj = insurance;
            }
        })
    }

    //渲染当前成员的plan
    function renderPlan(planList, current_Member_Id, scrollToLeft) {
        //console.log('%c Plan Data:', 'background: red;color: #fff', planList, currentMemberId)
        // $('#insuredInfo').removeClass('hide')
        // $('#insurancePreview').show()
    	
    	if (!current_Member_Id) {
        	current_Member_Id = 'self'
        }
        currentMemberId = current_Member_Id + ''
    	
        var cData = null
        if (planList.length) {
            //隐藏险种分类下方的按钮
            $('#selectInsuranceBox').hide()
            $('#beibaoren').removeClass('hide')
            $('#categrorySection').removeClass('hide')
            $('#iAndPRelation').removeClass('hide')
            planList.forEach(function (val) {
                if (val.memberId + '' === currentMemberId) {
                    cData = val
                }
            })
        }
        
        familyTabList.forEach(function (item) 
        {
            if (item.memberId === currentMemberId) 
            {
            	item.currentSelect = true
            } 
            else 
            {
                item.currentSelect = false
            }
        })

        //console.log('%c 当前成员数据：', 'background: black;color: #fff', cData)
        
        if (cData) {
            //更新数据
            currentMemberinsuranceList[currentMemberId] = cData.insuranceList;
            setObjectValue(cData.insuranceList);
            //家庭成员的tab
            renderFamilyTab(familyTabList, scrollToLeft)
            //被保人和投保人信息
            renderPersonInfo(cData)
            renderAppntButton(planList, $('#selectappnt'));
            //险种模块
            renderInsurance(cData.insuranceList)
            // renderInsurance(currentMemberinsuranceList[currentMemberId])

            //险种分类下面的按钮
            renderSelectedInsuranceButton(currentMemberinsuranceList[currentMemberId])
            renderPreviewTab(currentMemberinsuranceList[currentMemberId])
        }
        //console.log('%c 当前成员险种列表：', 'background: black;color: #fff', currentMemberinsuranceList[currentMemberId])
    }

    //渲染人员信息
    function renderPersonInfo(item) {
        // console.log(item)
        //console.log('%c renderPersonInfo 渲染人员信息：', 'background: black;color: #fff', item)
        //如果投保人和被保人关系与保单关系一致，不显示投保人信息模块
        //被保人姓名
        $('#js_input').val(item.insuredName)
        //被保人性别
        $('#selectSex').text(item.insuredGender)
        //被保人年龄
        $('#selectAge').text(item.insuredAge)
        
        $('#selectAge').attr("data-id",item.insuredAge)
        $('#selectSex').attr("data-id",item.inssex)
        
        $('#selectappnt').attr("data-id",item.appntid)
        $('#selectappnt').attr("data_relationid",item.appntrelationid)
    }

    //渲染保险种类
    function renderInsurance(data) {
        //console.log('渲染保险种类', data)
        $('#selectedType button').each(function (i, v) {
            $(v).removeClass('selected')
        })
        $('#yiwaixian').addClass('hide')
        $('#yiliaoxian').addClass('hide')
        $('#zhongjixian').addClass('hide')
        $('#shouxian').addClass('hide')

        if (!Array.isArray(data) || !data.length) {
            return
        }
        console.log(data)
        data.forEach(function (item, index) {
            //险种分类
            $('#selectedType button').each(function (i, v) {
                if ($(v).data('selectedinsurancetype') === item.insuranceTypeId) {
                    $(v).addClass('selected')
                }
            })
            //显示相应险种模块
            if (item.insuranceTypeId === '01') {
                renderYiwaixian(item)
            } else if (item.insuranceTypeId === '02') {
                renderYiliaoxian(item)
            } else if (item.insuranceTypeId === '03') {
                renderZhongjixian(item)
            } else if (item.insuranceTypeId === '04') {
                renderShouxian(item)
            }
        })
    }

    //意外险模块
    function renderYiwaixian(item) {
        //console.log('意外险加载 item', item)
        $('#yiwaixian').removeClass('hide')
        
        $('#yiwaixianCompany').text(item.company || '请选择')
        $('#yiwaixianchanpin').text(item.riskname || '请选择')
        
        renderAmntButton(item.insuranceAmount, $('#yiwaixianMoneyButton'))
        
        if (item.prem && item.prem !== '') 
        {
            $('#yiwaixianbaofei').text(item.prem+'元/年').parent().removeClass('hide')
        }
        else
        {
        	$('#yiwaixianbaofei').text('0元/年').parent().addClass('hide')
        }
    }

    //医疗险模块
    function renderYiliaoxian(item) {
    	//console.log('医疗险加载 item', item)
    	$('#yiliaoxian').removeClass('hide')
    	
        $('#yiliaoxianCompany').text(item.company || '请选择')
        $('#yiliaoxianchanpin').text(item.riskname || '请选择')
        
        renderAmntButton(item.insuranceAmount, $('#yiliaoxianMoneyButton'))
    	
        if (item.prem && item.prem !== '') 
        {
            $('#yiliaoxianbaofei').text(item.prem+'元/年').parent().removeClass('hide')
        }
        else
        {
        	$('#yiliaoxianbaofei').text('0元/年').parent().addClass('hide')
        }
    }

    //重疾险模块
    function renderZhongjixian(item) {
    	//console.log('重疾险加载 item', item)
        $('#zhongjixian').removeClass('hide')
        
        $('#zhongjixiancompany').text(item.company || '请选择')
        $('#zhongjixianchanpin').text(item.riskname || '请选择')
        
        renderAmntButton(item.insuranceAmount, $('#moneyButton'))
        renderButton(item.jiaofeinianqiButtonList, $('#paymentTime'))
        renderButton(item.jiaofeifangshiButtonList, $('#paymentMethod'))
        renderButton(item.baozhangqixianButtonList, $('#term'))
        
        $('#additionalInsurance03').html('');
        
    	
    	Object.keys(item.addRiskList).forEach(function(key)
    	{
    		var addriskcode = item.addRiskList[key].riskcode;
    		
    		//console.log('重疾险 item.addRiskList.riskcode', addriskcode,item[addriskcode]);
    		if(addriskcode=='521507')
    		{
    			if(item[addriskcode]=='N')
    			{
    				if ($('#selectappnt').attr("data-id")!=null&&$('#selectappnt').attr("data-id")!=''
						   &&currentMemberId!=$('#selectappnt').attr("data-id"))
    				{
    					renderAdditionalInsurance(item.addRiskList[key],'03');
    				}
    			}
    			else
    			{
    				renderAdditionalInsurance(item.addRiskList[key],'03');
    			}
    		}
    		else
    		{
    			renderAdditionalInsurance(item.addRiskList[key],'03');
    		}
    	});
        
        if (item.prem && item.prem !== '') 
        {
            $('#zhongjixianbaofei').text(item.prem+item.premEndStr).parent().removeClass('hide')
        }
        else
        {
        	$('#zhongjixianbaofei').text('0元/年').parent().removeClass('hide')
        }
    }

    //寿险模块
    function renderShouxian(item) {
    	//console.log('寿险加载 item', item)
        $('#shouxian').removeClass('hide')
        
        $('#shouxiancompany').text(item.company || '请选择')
        $('#shouxianchanpin').text(item.riskname || '请选择')
        
        renderAmntButton(item.insuranceAmount, $('#shouxianMoneyButton'))
        
        renderButton(item.jiaofeinianqiButtonList, $('#shouxianPaymentTime'))
        renderButton(item.jiaofeifangshiButtonList, $('#shouxianPaymentMethod'))
        renderButton(item.baozhangqixianButtonList, $('#shouxianTerm'))
        
        if (item.prem && item.prem !== '') 
        {
            $('#shouxianbaofei').text(item.prem+item.premEndStr).parent().removeClass('hide')
        }
        else
        {
        	$('#shouxianbaofei').text('0元/年').parent().removeClass('hide')
        }
    }

    //按钮
    function renderAppntButton(list, jQueryDom) {
        
        // console.log('按钮', list)
        var tpl = ''
        list.forEach(function (item) {
        	if(item.insuredName!=null&&item.insuredName!='')
        	{
        		tpl += '<button id = "appnt_'+item.memberId+'" data-id = "'+item.memberId+'" data_relationid = "'+item.relationid+'">' + item.insuredName + '</button>'	
        	}
        })
        jQueryDom.html(tpl)
        
        
        if(planList.length) 
        {
        	planList.forEach(function (item) 
        	{
	            if (item.memberId === currentMemberId) 
	            {
	            	if($("#appnt_"+item.appntid).length > 0)
	                {
	                	$("#appnt_"+item.appntid).addClass('selected');
	                }
	            }
            })
        }
    }
    
    //按钮
    function renderButton(list, jQueryDom) {
        
        // console.log('按钮', list)
        var tpl = ''
        list.forEach(function (item) {
            var classText = item.selectStatus ? 'selected' : ''
            tpl += '<button class="'+classText+'" data-itemid="' + item.id + '"  data-id="'+item.id+'" id = "'+jQueryDom.attr("data-id")+item.id+'">' + item.value + '</button>'
        })
        jQueryDom.html(tpl)
    }
    
    function renderAmntButton(buttonList, jQueryDom) 
	{
		var tpl = ''	
		
		//console.log('amntid',jQueryDom.attr("data-id"));
		
		buttonList.forEach(function (item) {
			var classText = item.selectStatus ? 'selected' : ''
			tpl += '<button class="'+classText+'" data-id="'+item.id+'" id = "'+jQueryDom.attr("data-id")+item.id+'">'+transAmnt(item.value)+'</button>'
		})
		jQueryDom.html(tpl)
	}
    
    function renderAdditionalInsurance(item,type) 
    {
		var tpl = '<div class="edit-form-choose-item">' +
			'       <div class="choose-item-title">'+item.riskname+'</div>' +
			'       <div class="edit-form-weui-cell weui-cell edit-form-select-button" data-id="'+item.riskcode+'" id="'+item.riskcode+'" data-type = "'+type+'"></div>' +
			'      </div>'
	    $('#additionalInsurance03').append(tpl)
	    
	    if(item['riskData']!=null&&item['riskData']!='')
	    {
	    	renderButton(item['riskData'], $('#' + item.riskcode))
	    }
	    else
	    {
	    	if(item.riskcode=='hongkang000002'||item.riskcode=='hongkang000024')
		    {
		    	renderButton(istoubao02, $('#' + item.riskcode))
		    }
		    else
		    {
		    	renderButton(istoubao01, $('#' + item.riskcode))
		    }
	    }
    }

    //观察是否全部填完整
    function observe(objArr) {
    	console.log('finishInput',currentMemberinsuranceList[currentMemberId])
    }

    //移除元素
    function removeDataFromCurrentMemberData(objArr, obj) {
        if (!Array.isArray(objArr) || !objArr.length) {
            return
        }
        objArr.forEach(function (item, index) {
            if (item.id === obj.id) {
                objArr.splice(index, 1)
            }
        })
        
        //console.log(planList);
    }

    function renderFamilyTab(data, scrollToLeft) {
        var tpl = ''
        if (!Array.isArray(data) || !data.length) {
            return
        }
        data.forEach(function (item, index) {
            //console.log('item', item)
            var c = item.currentSelect ? 'current-tab' : ''
            var icon = item.currentSelect ? '/images/insureplan/del1.png' : '/images/insureplan/del_white.png'
            var delTpl = item.relationid === '00' ? '' : deleteTpl(item, icon)
            tpl += '<li class="' + c + '" data-memberid="' + item.memberId + '" data-relationid="' + item.relationid + '">' +
                '<p>' + item.memberName + '</p>' + delTpl 
            
            if (planList.length) {
            	planList.forEach(function (plan_item) 
            	{
            		if (plan_item.memberId === item.memberId) 
            		{
            			tpl += '<p>'+plan_item.insuredGender+'-'+plan_item.insuredAge+'岁</p>'
                    }
                })
            }
            
            tpl += '</li>'
        })
        $('#familyTab').html(tpl)
        if (scrollToLeft) {
            $('#familyTab').scrollLeft($('#familyTab').width())
        }
    }

    //最下方的预览tab栏
    function renderPreviewTab(objArr) {
        if (!Array.isArray(objArr) || !objArr.length) {
            $('#insurancePreview').hide()
            return
        }
        //console.log('tab', objArr)
        /*
        var tpl = ''
        objArr.forEach(function (item, index) {
            var cls = index === 0 ? 'current-selected' : ''
            tpl += '<li class="' + cls + '" data-insurancetype="' + item.id + '"><span>' + item.name + '</span></li>'
        })
        $('#previewTab').html(tpl)
        */
        
        var dis_risk_info = false;
        
        objArr.forEach(function (item,index) 
        {	
        	if(item.risktype == '01')
        	{
        		renderPreviewTabContent(item)
        		dis_risk_info = true;
        	}
        })
        
        if(!dis_risk_info)
        {
        	objArr.forEach(function (item,index) 
        	{	
        		if(item.risktype == '02')
        	    {
        			renderPreviewTabContent(item)
        	        dis_risk_info = true;
        	    }
        	})
        }
        
        if(!dis_risk_info)
        {
        	objArr.forEach(function (item,index) 
        	{	
        		if(item.risktype == '03')
        	    {
        			renderPreviewTabContent(item)
        	        dis_risk_info = true;
        	    }
        	})
        }
        
        if(!dis_risk_info)
        {
        	objArr.forEach(function (item,index) 
        	{	
        		if(item.risktype == '04')
        	    {
        			renderPreviewTabContent(item)
        	        dis_risk_info = true;
        	    }
        	})
        }
        
        $('#insurancePreview').removeClass('hide')
        $('#insurancePreview').show();
    }

    //最下方的预览tab栏内容
    function renderPreviewTabContent(obj) {
        //content
    	//console.log('renderPreviewTabContent', obj)
    	
        $('.selected-detail-name').text(obj.riskname)
        var tpl = ' <li style="width: 19%"><span>保险金额</span><span>' + transAmnt(obj.amnt) + '</span></li>' +
            '<li style="width: 19%"><span>缴费期限</span><span>' + (obj.payendyearname || '-') + '</span></li>' +
            '<li style="width: 19%"><span>缴费方式</span><span>' + (obj.payintvname || '-') + '</span></li>' +
            '<li style="width: 19%"><span>保障期限</span><span>' + (obj.insureyearname || '-') + '</span></li>' +
            '<li style="width: 24%"><span>保费</span><span>' + Number(obj.prem).toFixed(2) + obj.premEndStr + '</span></li>'
        $('#selectedDetailContent').html(tpl)
    }

    //险种分类下面的一排按钮
    function renderSelectedInsuranceButton(list) {
        if (!Array.isArray(list) || !list.length) {
            return
        }
        //console.log('险种分类下面的一排按钮', list)
        //class="selected"
        var tpl = ''
        
        var calssStr = 'selected'
        	
        list.forEach(function (item,index) 
        {	
        	if(item.risktype == '01')
        	{
        		tpl += '<button style="margin: 0.5px 10px 0.5px 0;" data-risktype = "01" class = "'+calssStr+'">' + item.name + '</button>'
        		
        		if(calssStr == 'selected')
        		{
        			pretab_select_risktype = '01'
        		}
        		
        		calssStr = '';
        	}
        })
        
        list.forEach(function (item,index) 
        {	
        	if(item.risktype == '02')
        	{
        		tpl += '<button style="margin: 0.5px 10px 0.5px 0;" data-risktype = "02" class = "'+calssStr+'">' + item.name + '</button>'
        		
        		if(calssStr == 'selected')
        		{
        			pretab_select_risktype = '02'
        		}
        		
        		calssStr = '';
        	}
        })
        
        list.forEach(function (item,index) 
        {	
        	if(item.risktype == '03')
        	{
        		tpl += '<button style="margin: 0.5px 10px 0.5px 0;" data-risktype = "03" class = "'+calssStr+'">' + item.name + '</button>'
        		
        		if(calssStr == 'selected')
        		{
        			pretab_select_risktype = '03'
        		}
        		
        		calssStr = '';
        	}
        })
        
        list.forEach(function (item,index) 
        {
        	if(item.risktype == '04')
        	{
        		tpl += '<button style="margin: 0.5px 10px 0.5px 0;" data-risktype = "04" class = "'+calssStr+'">' + item.name + '</button>'
        		
        		if(calssStr == 'selected')
        		{
        			pretab_select_risktype = '04'
        		}
        		
        		calssStr = '';
        	}
        })
        
        $('#selectInsuranceBox').html(tpl)
        $('#selectInsuranceBox').show()
    }

    //添加新成员
    function addNewRelationTab(obj) {
        //console.log('family tab--', obj);
        familyTabList.forEach(function (item) {
            item.currentSelect = false
        })
        renderAppntButton(planList, $('#selectappnt'));
        familyTabList.push(new FamilyTab(obj.memberId, obj.memberName,false,obj.relationid))
        
        //console.log('familyTabList',familyTabList,obj);
        
        familyTabList[familyTabList.length - 1].currentSelect = true
        
        planList.push(new Member(obj))
        
        //console.log('%c 添加成功，当前成员列表为', 'background:#000;color:#fff', currentMemberId, planList)
        renderPlan(planList, currentMemberId, true)
        //预览栏
        // $('#insurancePreview').hide()
    }

    function deleteMember(memberId) {
        //数据层删除
        var tabIndex = 0
        if (familyTabList.length > 1) {
            familyTabList.forEach(function (item, index) {
                if (item.memberId === memberId) {
                    tabIndex = index
                    familyTabList.splice(index, 1)
                }
            })
        } else {
            //console.log('无法删除最后一个成员')
            return
        }

        if (planList.length > 1) {
            planList.forEach(function (item, index) {
                if (item.memberId === memberId) {
                    planList.splice(index, 1)
                }
            })
        } else {
            //console.log('无法删除最后一个成员')
            return
        }
        
        if(currentMemberId==memberId)
        {
        	currentMemberId = familyTabList[tabIndex - 1].memberId;
        }
        
        if (planList.length > 1) 
        {
            planList.forEach(function (item, index) 
            {
            	//debugger;
                if(item.appntid == memberId) 
                {
                	item.appntid = currentMemberId;
                	
                	if(item.memberId==item.appntid)
                	{
                		item.insuranceList.forEach(function (insurance) 
                		{
                			if(insurance.risktype = '03')
                            {
                				insurance.prem = '';
                            }
                		})
                	}
                	
                }
            })
        }
        
        //view层渲染
        
        //console.log('删除成员',familyTabList[tabIndex - 1].memberId)
        
        renderPlan(planList, currentMemberId)
        
        console.log(currentMemberId,planList);
    }

    function deleteTpl(item, icon) {
        return '<span class="delete-icon" data-memberid="' + item.memberId + '"><img src="' + icon + '"></span>'
    }

    function Member(memberObj) {
        memberObj = memberObj || {
            memberId: 'self',
            memberName: '本人',
            insuredName: '',
            insuredGender: '请选择',
            insuredAge: 25,
            insuranceList: [],
            relationid: ''
        }
        this.memberId = memberObj.memberId
        this.memberName = memberObj.memberName
        this.insuredName = memberObj.insuredName
        this.insuredGender = memberObj.insuredGender || '请选择'
        this.insuredAge = memberObj.insuredAge || 25
        this.insuranceList = memberObj.insuranceList || []
        
        this.relationid = memberObj.relationid
    }

    function FamilyTab(memberId, memberName, currentSelect,relationid) {
        // console.log(memberId, memberName)
        this.memberId = (memberId || '1') + ''
        this.memberName = (memberName || '1') + ''
        this.currentSelect = currentSelect || false
        
        this.relationid = (relationid || '1') + ''
    }

    function Yiwaixian(obj) {
        obj = obj || {}
        
        this.amnt = obj.amnt || ''
        this.company = obj.insorganname || '请选择'
        this.companyid = obj.insorgancode || ''
        this.id = 'yiwaixianbaofei'
        this.insorgancode = obj.insorgancode || ''
        
        this.insuranceAmount = []
        
        this.insuranceTypeId = '01'
        this.name = '意外险'
        this.prem = obj.prem || ''
        this.riskcode = obj.riskcode || ''
        this.riskname = obj.riskname || ''
        this.risktype = '01'
        	
        this.payendyear = obj.payendyear || '1'
        this.payendyearname = obj.payendyearname || '1年'
        
        this.payintv = obj.payintv || '0'
        this.payintvname = obj.payintvname || '趸交'
        
        this.insureyear = obj.insureyear || '1'
        this.insureyearname = obj.insureyearname || '1年'
        
        this.premEndStr = '元/年'
    }

    function Yiliaoxian(obj) {
        obj = obj || {}
        
        this.amnt = obj.amnt || ''
        this.company = obj.insorganname || '请选择'
        this.companyid = obj.insorgancode || ''
        this.id = 'yiliaoxianbaofei'
        this.insorgancode = obj.insorgancode || ''
        
        this.insuranceAmount = []
        
        this.insuranceTypeId = '02'
        this.name = '医疗险'
        this.prem = obj.prem || ''
        this.riskcode = obj.riskcode || ''
        this.riskname = obj.riskname || ''
        this.risktype = '02'
        	
        this.payendyear = obj.payendyear || '1'
        this.payendyearname = obj.payendyearname || '1年'
            
        this.payintv = obj.payintv || '0'
        this.payintvname = obj.payintvname || '趸交'
           
        this.insureyear = obj.insureyear || '1'
        this.insureyearname = obj.insureyearname || '1年'
        
        this.premEndStr = '元/年'
    }

    function Zhongjixian(obj) {
        obj = obj || {}
        
        this.addRiskList = [];
        this.amnt = obj.amnt || ''
        this.company = obj.insorganname || '请选择'
        this.companyid = obj.insorgancode || ''
        this.id = 'zhongjixianbaofei'
        this.insorgancode = obj.insorgancode || ''
        	
        this.insuranceTypeId = '03'
        this.name = '重疾险'
        this.prem = obj.prem || ''
        this.riskcode = obj.riskcode || ''
        this.riskname = obj.riskname || ''
        this.risktype = '03'
        
        this.insuranceAmount = []
        this.jiaofeinianqiButtonList = []
        this.jiaofeifangshiButtonList = []
        this.baozhangqixianButtonList = []
        
        this.payendyear = obj.payendyear || ''
        this.payendyearname = obj.payendyearname || ''
        
        this.payintv = obj.payintv || ''
        this.payintvname = obj.payintvname || ''
        
        this.insureyear = obj.insureyear || ''
        this.insureyearname = obj.insureyearname || ''
        
        if(this.payintv=='1')
        {
        	this.premEndStr = '元/月'
        }
        else
        {
        	this.premEndStr = '元/年'
        }
    }

    function Shouxian(obj) {
        obj = obj || {}
        
        this.amnt = obj.amnt || ''
        this.company = obj.insorganname || '请选择'
        this.companyid = obj.insorgancode || ''
        this.id = obj.id || 'shouxianbaofei'
        this.insorgancode = obj.insorgancode || ''
        
        this.insuranceTypeId = '04'
        this.name = '人寿险'
        this.prem = obj.prem || ''
        this.riskcode = obj.riskcode || ''
        this.riskname = obj.riskname || ''
        this.risktype = '04'
        
        this.insuranceAmount = []
        this.jiaofeinianqiButtonList = []
        this.jiaofeifangshiButtonList = []
        this.baozhangqixianButtonList = []
        
        this.payendyear = obj.payendyear || ''
        this.payendyearname = obj.payendyearname || ''
        
        this.payintv = obj.payintv || ''
        this.payintvname = obj.payintvname || ''
        
        this.insureyear = obj.insureyear || ''
        this.insureyearname = obj.insureyearname || ''
        
        if(this.payintv=='1')
        {
        	this.premEndStr = '元/月'
        }
        else
        {
        	this.premEndStr = '元/年'
        }
    }

    function changeSelectedStatus(insuranceobj, value, property, flag) {
        console.log('insuranceobj[property]',insuranceobj[property]);
        insuranceobj[property].forEach(function (item) {
            item.selectStatus = false
            
            if (item.id == value) {
                item.selectStatus = flag
            }
        })
    }

    function getObj(id, list, property) {
        if (!Array.isArray(list) || !list.length) {
            return
        }
        var obj = null
        list.forEach(function (item) {
            if (item[property] === id) {
                obj = item
            }
        })
        return obj
    }

    function setObjStatus(obj, statusText) {
        obj.options.forEach(function (item) {
            item.selectStatus = false
            if (item.id === statusText) {
                item.selectStatus = true
            }
        })
    }

    function handleData(list) {
        if (!Array.isArray(list) || !list.length) {
            return list
        }
        list.forEach(function (val) {
            val.insuranceList.forEach(function (item) {
                if (item.insuranceTypeId === '01') {
                    item.insuranceAmount = JSON.parse(JSON.stringify(yiwaixianMoneyButtonList))
                    changeSelectedStatus(item, item.money, 'insuranceAmount', true)
                } else if (item.insuranceTypeId === '02') {
                    item.insuranceAmount = JSON.parse(JSON.stringify(yiliaoxianMoneyButtonList))
                    changeSelectedStatus(item, item.money, 'insuranceAmount', true)
                } else if (item.insuranceTypeId === '03') {
                    item.insuranceAmount = JSON.parse(JSON.stringify(zhongjixianMoney))
                    changeSelectedStatus(item, item.money, 'insuranceAmount', true)
                    item.jiaofeinianqiButtonList = JSON.parse(JSON.stringify(jiaofeinianqiButtonList))
                    changeSelectedStatus(item, item.paymentTime, 'jiaofeinianqiButtonList', true)
                    item.jiaofeifangshiButtonList = JSON.parse(JSON.stringify(jiaofeifangshiButtonList))
                    changeSelectedStatus(item, item.paymentMethod, 'jiaofeifangshiButtonList', true)
                    item.baozhangqixianButtonList = JSON.parse(JSON.stringify(baozhangqixianButtonList))
                    changeSelectedStatus(item, item.term, 'baozhangqixianButtonList', true)
                    item.fujiatoubaorenhuomianList = JSON.parse(JSON.stringify(fujiatoubaorenhuomian))
                    changeSelectedStatus(item, item.exempt, 'fujiatoubaorenhuomianList', true)
                    item.plusInsuranceButtonList = JSON.parse(JSON.stringify(fujiaqitabaoxian))
                    item.plusInsurance.forEach(function (originItem) {
                        item.plusInsuranceButtonList.forEach(function (listItem) {
                            setObjStatus(listItem, 'no')
                        })
                    })
                    item.plusInsurance.forEach(function (originItem) {
                        item.plusInsuranceButtonList.forEach(function (listItem) {
                            if (originItem.additionalInsuranceId === listItem.additionalInsuranceId) {
                                setObjStatus(listItem, 'yes')
                            }
                        })
                    })
                } else if (item.insuranceTypeId === '04') {
                    item.insuranceAmount = JSON.parse(JSON.stringify(shouxianMoney))
                    changeSelectedStatus(item, item.money, 'insuranceAmount', true)
                    item.jiaofeinianqiButtonList = JSON.parse(JSON.stringify(jiaofeinianqiButtonList))
                    changeSelectedStatus(item, item.paymentTime, 'jiaofeinianqiButtonList', true)
                    item.jiaofeifangshiButtonList = JSON.parse(JSON.stringify(jiaofeifangshiButtonList))
                    changeSelectedStatus(item, item.paymentMethod, 'jiaofeifangshiButtonList', true)
                    item.baozhangqixianButtonList = JSON.parse(JSON.stringify(baozhangqixianButtonList))
                    changeSelectedStatus(item, item.term, 'baozhangqixianButtonList', true)
                }
            })
        })

        return list
    }
    
    function transAmnt(amnt)
	{
		var amntStr = Number(amnt/10000).toFixed(0)+'万';
		return amntStr;
	}
    
    function calYWprem()
	{
		$('#yiwaixianbaofei').text('0元');
		yiwaixianObj.prem='';
		
		if(yiwaixianObj.riskcode == 'HP033100320002')
		{
			if(yiwaixianObj.amnt == '100000')
			{
				$('#yiwaixianbaofei').text('98.00元/年').parent().removeClass('hide');
				yiwaixianObj.prem=98;
			}
			else if(yiwaixianObj.amnt == '300000')
			{
				$('#yiwaixianbaofei').text('258.00元/年').parent().removeClass('hide');
				yiwaixianObj.prem=258;
			}
			else if(yiwaixianObj.amnt == '500000')
			{
				$('#yiwaixianbaofei').text('408.00元/年').parent().removeClass('hide');
				yiwaixianObj.prem=408;
			}
		}
		
		//console.log('意外险保费计算完毕：yiwaixianObj',yiwaixianObj);
	}
    
    function calYLprem()
	{
		$('#yiliaoxianbaofei').text('0元');
		yiliaoxianObj.prem='';
		
		if(yiliaoxianObj.insorgancode!=null&&yiliaoxianObj.insorgancode!=''
		 &&yiliaoxianObj.riskcode!=null&&yiliaoxianObj.riskcode!=''
		 &&yiliaoxianObj.amnt!=null&&yiliaoxianObj.amnt!=''
		 &&$('#selectAge').text()!='')
		{
			var transdata = 
			{
				"insorgancode":yiliaoxianObj.insorgancode,
				"riskcode":yiliaoxianObj.riskcode,
				"age":$('#selectAge').text(),
				"amnt":yiliaoxianObj.amnt
			};
			
			getData('/staff/plan/calprem_yl.do', 'post', transdata, 
			{
				success: function (res) 
			    {
					$('#yiliaoxianbaofei').text(Number(res.sumPrem).toFixed(2)+'元/年').parent().removeClass('hide');
					yiliaoxianObj.prem=res.sumPrem;
			    }
			})
		}
	}
    
    function calZJprem()
	{
    	console.log('重疾险计算保费开始：',zhongjixianObj);
		$('#zhongjixianbaofei').text('0元/年');
		zhongjixianObj.prem='';
		
		if(zhongjixianObj.insorgancode!=null&&zhongjixianObj.insorgancode!=''
		 &&zhongjixianObj.riskcode!=null&&zhongjixianObj.riskcode!=''
		 &&zhongjixianObj.amnt!=null&&zhongjixianObj.amnt!=''
		 &&zhongjixianObj.payendyear!=null&&zhongjixianObj.payendyear!=''
		 &&zhongjixianObj.payintv!=null&&zhongjixianObj.payintv!=''
		 &&zhongjixianObj.insureyear!=null&&zhongjixianObj.insureyear!=''
	     &&$('#selectAge').attr("data-id")!=''
	     &&$('#selectSex').attr("data-id")!='')
		{
			var appntage = '';
			var appntsex = '';
			
			if (planList.length) 
			{
                planList.forEach(function (item) {
                    if (item.memberId === $('#selectappnt').attr("data-id")) {
                    	appntage = item.insuredAge;
                    	appntsex = item.inssex;
                    }
                })
            }
			
			var transdata = 
			{
				"insorgancode":zhongjixianObj.insorgancode,
				"riskcode":zhongjixianObj.riskcode,
				"amnt":zhongjixianObj.amnt,
				"insuyear":zhongjixianObj.insureyear,
				"payendyear":zhongjixianObj.payendyear,
				"payintv":zhongjixianObj.payintv,
				"age":$('#selectAge').attr("data-id"),
				"insuredSex":$('#selectSex').attr("data-id"),
				"appntage":appntage,
				"appntsex":appntsex,
				//"producttype":"01",
			};
			
			var allData = $.extend(transdata, getZYCalTrasnData());
			
			console.log('calPremData',allData);
			
			var zjCalPremUrl = '';
			
			if(zhongjixianObj.riskcode=='511505'
			 ||zhongjixianObj.riskcode=='hongkang000015')
			{
				zjCalPremUrl = '/life/hongkang/calprem.do';
			}
			else if(zhongjixianObj.riskcode=='110055')
			{
				zjCalPremUrl = '/staff/plan/calprem_zj.do';
			}
				
			getData(zjCalPremUrl, 'post', allData, 
			{
				success: function (res) 
			    {
					var premEndStr = '';
					
					if(zhongjixianObj.payintv=='1')
					{
						premEndStr = '元/月'
					}
					else
					{
						premEndStr = '元/年'
					}
					
					$('#zhongjixianbaofei').text(Number(res.sumPrem).toFixed(2)+premEndStr).parent().removeClass('hide');
					zhongjixianObj.prem=(Number(res.sumPrem)-Number(res.zjylPrem)).toFixed(2);
					zhongjixianObj.premEndStr = premEndStr;
					zhongjixianObj.dbbcprem = res.zjylPrem;
			    }
			})
		}
		
		console.log('calprem currentMemberinsuranceList[currentMemberId]', currentMemberinsuranceList[currentMemberId])
	}
    
    function getZYCalTrasnData()
	{
		var zjRiskData = {"code":"0"}
		
		if(zhongjixianObj.riskcode == '511505')
		{
			var zjRiskData = 
			{
				"ishuomian":zhongjixianObj[521507],
				"iszjyl":zhongjixianObj[521506],
				"isexzl":zhongjixianObj.hongkang000002,
				"isdbbjb":zhongjixianObj.hongkang000024
			}
		}
		else if(zhongjixianObj.riskcode == 'hongkang000015')
		{
			var zjRiskData = 
			{
				"ishuomian":zhongjixianObj[521507],
				"producttype":zhongjixianObj.hongkang000015_kx=='Y'?'02':'01'
			}
		}
		else if(zhongjixianObj.riskcode == '110055')
		{
			var zjRiskData = 
			{
				"ishuomian":zhongjixianObj[120015],
				"premunit":1000
			}
		}
		
		return zjRiskData;
	}
    
    function calSXprem()
	{
    	console.log('寿险计算保费开始：',shouxianObj);
		$('#shouxianbaofei').text('0元/年');
		shouxianObj.prem='';
		
		if(shouxianObj.insorgancode!=null&&shouxianObj.insorgancode!=''
		 &&shouxianObj.riskcode!=null&&shouxianObj.riskcode!=''
		 &&shouxianObj.amnt!=null&&shouxianObj.amnt!=''
		 &&shouxianObj.payendyear!=null&&shouxianObj.payendyear!=''
		 &&shouxianObj.payintv!=null&&shouxianObj.payintv!=''
		 &&shouxianObj.insureyear!=null&&shouxianObj.insureyear!=''
		 &&$('#selectAge').attr("data-id")!=''
		 &&$('#selectSex').attr("data-id")!='')
		{
			var transdata = 
			{
				"premunit":'10000',
				"insorgancode":shouxianObj.insorgancode,
				"riskcode":shouxianObj.riskcode,
				"amnt":shouxianObj.amnt,
				"insuyear":shouxianObj.insureyear,
				"payendyear":shouxianObj.payendyear,
				"payintv":shouxianObj.payintv,
				"age":$('#selectAge').attr("data-id"),
				"insuredSex":$('#selectSex').attr("data-id"),
			};
			
			getData('/staff/plan/calprem_sx.do', 'post', transdata, 
			{
				success: function (res) 
			    {
					var premEndStr = '';
					
					if(shouxianObj.payintv=='1')
					{
						premEndStr = '元/月'
					}
					else
					{
						premEndStr = '元/年'
					}
					
					$('#shouxianbaofei').text(Number(res.sumPrem).toFixed(2)+premEndStr).parent().removeClass('hide');
					shouxianObj.prem = res.sumPrem;
					shouxianObj.premEndStr = premEndStr;
			    }
			})
		}
	}
    
    function initInsData()
    {
    	getData('/staff/plan/editFamilyPlanDetail.do', 'post', {"planid": url_planid}, 
        {
    		success: function (data) 
            {
    			$('#mobile').val(data.mobile);
    			familyCount = data.maxFamilyCount;
    			
    			//console.log('familyCount',familyCount);
    			
        		data.familyMemberList.forEach(function (item, index)
        		{
        			var oneMember = new Member();
                    		
                    oneMember.memberId = item.memberid
                    oneMember.relationid = item.memberrelation
                    oneMember.memberName = item.relation
                    
                    oneMember.insuredName = item.name
                    oneMember.insuredGender = item.sexname
                    oneMember.insuredAge = item.age
                    oneMember.inssex = item.inssex
                    
                    oneMember.appntid = item.appntid
                    oneMember.appntrelationid = item.appntrelation
                    
                    oneMember.insuranceList = [];
                    
                    var familySelected = false;
                    
                    if(index==0)
                    {
                    	familySelected = true;
                    	currentMemberId = oneMember.memberId;
                    }
                    
                    familyTabList.push(new FamilyTab(oneMember.memberId, oneMember.memberName,familySelected,oneMember.relationid))
                    
                    //意外险的处理
                    if(item.riskInfo01)
                    {
                    	var family_yw_obj = new Yiwaixian(item.riskInfo01);
                        family_yw_obj.insuranceAmount = item.amntList01;
                        family_yw_obj.insuranceAmount.forEach(function (amnt_item, amnt_index)
                        {
                        	if(amnt_item.id == family_yw_obj.amnt)
                        	{
                        		amnt_item.selectStatus = true;
                        	}
                        })
                        oneMember.insuranceList.push(family_yw_obj);	
                    }
                    //意外险处理完毕
                    
                    //医疗险的处理
                    if(item.riskInfo02)
                    {
                    	var family_yl_obj = new Yiliaoxian(item.riskInfo02)
                        family_yl_obj.insuranceAmount = item.amntList02;
                        family_yl_obj.insuranceAmount.forEach(function (amnt_item, amnt_index)
                        {
                        	if(amnt_item.id == family_yl_obj.amnt)
                            {
                        		amnt_item.selectStatus = true;
                            }
                        })
                        oneMember.insuranceList.push(family_yl_obj);
                    }
                    //医疗险处理完毕
                    
                    //重疾险的处理
                    if(item.riskInfo03)
                    {
                    	var family_zj_obj = new Zhongjixian(item.riskInfo03)
                    	
                    	if(item.riskInfodbbc)
                    	{
                    		family_zj_obj.dbbcprem = item.riskInfodbbc.prem
                    	}
                    	
                        family_zj_obj.insuranceAmount = item.amntList03;
                        family_zj_obj.insuranceAmount.forEach(function (amnt_item, amnt_index)
                        {
                        	if(amnt_item.id == family_zj_obj.amnt)
                            {
                        		amnt_item.selectStatus = true;
                            }
                        })
                        
                        family_zj_obj.baozhangqixianButtonList = item.insureyearList03;
                        family_zj_obj.baozhangqixianButtonList.forEach(function (insureyear_item, insureyear_index)
                        {
                        	if(insureyear_item.id == family_zj_obj.insureyear)
                            {
                        		insureyear_item.selectStatus = true;
                        		family_zj_obj.insureyearname = insureyear_item.value;
                            }
                        })
                        
                        family_zj_obj.jiaofeinianqiButtonList = item.payendyearList03;
                        family_zj_obj.jiaofeinianqiButtonList.forEach(function (payendyear_item, payendyear_index)
                        {
                            if(payendyear_item.id == family_zj_obj.payendyear)
                            {
                            	payendyear_item.selectStatus = true;
                            	family_zj_obj.payendyearname = payendyear_item.value;
                        	}
                        })
                        
                        family_zj_obj.jiaofeifangshiButtonList = item.payintvList03;
                        family_zj_obj.jiaofeifangshiButtonList.forEach(function (payintv_item, payintv_index)
                        {
                        	if(payintv_item.id == family_zj_obj.payintv)
                            {
                        		payintv_item.selectStatus = true;
                        		family_zj_obj.payintvname = payintv_item.value;
                            }
                        })
                        
                        item.addRiskList03.forEach(function (addrisk_item, payintv_index)
                        {
                        	family_zj_obj[addrisk_item.riskcode] = item[addrisk_item.riskcode];
                        	family_zj_obj.addRiskList[addrisk_item.riskcode+'Obj'] = {"riskcode":addrisk_item.riskcode,"riskname":addrisk_item.riskname};
                        	
                        	if(family_zj_obj[addrisk_item.riskcode]=='Y')
                        	{
                        		family_zj_obj.addRiskList[addrisk_item.riskcode+'Obj']['riskData'] = [{"value": "投保","id": "Y","selectStatus": true},{"value": "不投保","id": "N","selectStatus": false}];	
                        	}
                        	else
                        	{
                        		family_zj_obj.addRiskList[addrisk_item.riskcode+'Obj']['riskData'] = [{"value": "投保","id": "Y","selectStatus": false},{"value": "不投保","id": "N","selectStatus": true}];
                        	}
                        })
                        
                        oneMember.insuranceList.push(family_zj_obj);
                    }
                    //重疾险处理完毕
                    
                    //寿险的处理
                    if(item.riskInfo04)
                    {
                    	var family_sx_obj = new Shouxian(item.riskInfo04)
                        family_sx_obj.insuranceAmount = item.amntList04;
                        family_sx_obj.insuranceAmount.forEach(function (amnt_item, amnt_index)
                        {
                        	if(amnt_item.id == family_sx_obj.amnt)
                            {
                        		amnt_item.selectStatus = true;
                            }
                        })
                        
                        family_sx_obj.baozhangqixianButtonList = item.insureyearList04;
                        family_sx_obj.baozhangqixianButtonList.forEach(function (insureyear_item, insureyear_index)
                        {
                        	if(insureyear_item.id == family_sx_obj.insureyear)
                            {
                        		insureyear_item.selectStatus = true;
                        		family_sx_obj.insureyearname = insureyear_item.value;
                            }
                        })
                        
                        family_sx_obj.jiaofeinianqiButtonList = item.payendyearList04;
                        family_sx_obj.jiaofeinianqiButtonList.forEach(function (payendyear_item, payendyear_index)
                        {
                            if(payendyear_item.id == family_sx_obj.payendyear)
                            {
                            	payendyear_item.selectStatus = true;
                            	family_sx_obj.payendyearname = payendyear_item.value;
                        	}
                        })
                        
                        family_sx_obj.jiaofeifangshiButtonList = item.payintvList04;
                        family_sx_obj.jiaofeifangshiButtonList.forEach(function (payintv_item, payintv_index)
                        {
                        	if(payintv_item.id == family_sx_obj.payintv)
                            {
                        		payintv_item.selectStatus = true;
                        		family_sx_obj.payintvname = payintv_item.value;
                            }
                        })
                        oneMember.insuranceList.push(family_sx_obj);
                    }
                    //寿险处理完毕
                    
                    //险种下拉的处理
                    ywRiskDataArr = item.riskCodeList01;
                    ylRiskDataArr = item.riskCodeList02;
                    zjRiskDataArr = item.riskCodeList03;
                    sxRiskDataArr = item.riskCodeList04;
                    //险种下拉处理完毕
                    
                    planList.push(oneMember);
                })
                
                console.log('planList',planList);
                //console.log('familyTabList',familyTabList);
        		
                //renderFamilyTab(familyTabList);
                
                //view层渲染
                renderPlan(planList,currentMemberId);
                //渲染预览栏
                //renderPreviewTab(currentMemberinsuranceList[currentMemberId])
                //生成保障方案按钮
                $('#nextBtn').removeClass('hide')
            }
        })
    }
    
    function lpad(number)
    {
    	if(number<10){
    		return '00'+number;
    	}
    	else if(number<100){
    		return '0'+number;
    	}
    	else{
    		return number;
    	}
    }
})