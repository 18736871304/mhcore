$(function () 
{
	var ywCompanyArr = [{id: 'pingancai',value: '平安财险'}]
	var ywRiskDataArr = [];
	
	var ylCompanyArr = [{id: 'zhongan',value: '众安财险'}]
	var ylRiskDataArr = [];
	
	var zjCompanyArr = [{id: 'hongkang',value: '弘康人寿'},{id: 'fuxingjk',value: '复星联合健康'}]
	var zjRiskDataArr = [];
	
	var sxCompanyArr = [{id: 'huagui',value: '华贵人寿'}]
	var sxRiskDataArr = [];
    
    var istoubao01 = [{"value": "投保","id": "Y","selectStatus": true},
                      {"value": "不投保","id": "N",}]
    
    var istoubao02 = [{"value": "投保","id": "Y",},
                      {"value": "不投保","id": "N","selectStatus": true}]

    var accidentInsuranceObj = {insorgancode: '',riskcode: '',amnt: '',prem: ''}
	var medicalInsurance = {insorgancode: '',riskcode: '',amnt: '',prem: ''}
	var criticalIllnessInsurance = {insorgancode: '',riskcode: '',amnt: '',prem: '',insureyear: '',payendyear: '',payintv: ''}
    var shouxianInsurance = {insorgancode: '',riskcode: '',amnt: '',prem: '',insureyear: '',payendyear: '',payintv: ''}

    var addRiskList = [];

    var editInsuranceFunc = {
		init: function () {
			this.setStyle()
			this.bindEvent()
		},
		setStyle: function () 
		{
			var risktype = $("#risktype").val().split(',');
			
			if($("#planid").val()==null||$("#planid").val()=='')
			{
				if (risktype.length) 
				{
					risktype.forEach(function (item) 
					{
						if (item === '意外险') 
						{
							$('#yiwaixian').removeClass('hide')
						} else if (item === '医疗险') {
							$('#yiliaoxian').removeClass('hide')
						} else if (item === '重疾险') {
							$('#zhongjixian').removeClass('hide')
						} else if (item === '人寿险') {
							$('#shouxian').removeClass('hide')
						}
					})
				}
			}
			else
			{
				getData('/staff/plan/editPlanDetail.do', 'post', {'planid': $("#planid").val()}, 
				{
					success: function (res) 
				    {
						if (risktype.length) 
						{
							risktype.forEach(function (item) 
							{
								if (item === '意外险') 
								{
									$('#yiwaixian').removeClass('hide')
									
									console.log('riskInfo01',res.riskInfo01);
									
									if(res.riskInfo01!=null)
									{
										$('#yiwaixianCompany').text(res.riskInfo01.insorganname);
										accidentInsuranceObj.insorgancode = res.riskInfo01.insorgancode;
										
										ywRiskDataArr = res.riskCodeList01;
										$('#yiwaixianchanpin').text(res.riskInfo01.riskname)
										accidentInsuranceObj.riskcode = res.riskInfo01.riskcode;
										accidentInsuranceObj.risktype = '01';
										
										renderAmntButton(res.amntList01, $('#yiwaixianMoneyButton'))
										$('#yw'+res.riskInfo01.amnt).addClass('selected')
										accidentInsuranceObj.amnt = res.riskInfo01.amnt;
										
										$('#yiwaixianbaofei').text(Number(res.riskInfo01.prem).toFixed(2)+'元').parent().removeClass('hide');
										accidentInsuranceObj.prem=res.riskInfo01.prem;
									}
								}
								else if (item === '医疗险') 
								{
									$('#yiliaoxian').removeClass('hide')
									
									if(res.riskInfo02!=null)
									{
										$('#yiliaoxianCompany').text(res.riskInfo02.insorganname);
										medicalInsurance.insorgancode = res.riskInfo02.insorgancode;
										
										ylRiskDataArr = res.riskCodeList02;
										$('#yiliaoxianchanpin').text(res.riskInfo02.riskname);
										medicalInsurance.riskcode = res.riskInfo02.riskcode;
										medicalInsurance.risktype = '02';
										
										renderAmntButton(res.amntList02, $('#yiliaoxianMoneyButton'))
										$('#yl'+res.riskInfo02.amnt).addClass('selected')
										medicalInsurance.amnt = res.riskInfo02.amnt;
										
										$('#yiliaoxianbaofei').text(Number(res.riskInfo02.prem).toFixed(2)+'元').parent().removeClass('hide');
										medicalInsurance.prem=res.riskInfo02.prem;
									}
								}
								else if (item === '重疾险') 
								{
									$('#zhongjixian').removeClass('hide')
									
									if(res.riskInfo03!=null)
									{
										$('#zhongjixiancompany').text(res.riskInfo03.insorganname)
										criticalIllnessInsurance.insorgancode = res.riskInfo03.insorgancode;
										
										zjRiskDataArr = res.riskCodeList03;
										$('#zhongjixianchanpin').text(res.riskInfo03.riskname);
										criticalIllnessInsurance.riskcode = res.riskInfo03.riskcode;
										criticalIllnessInsurance.risktype = '03';
										
										renderAmntButton(res.amntList03, $('#moneyButton'));
										$('#zj'+res.riskInfo03.amnt).addClass('selected')
										criticalIllnessInsurance.amnt = res.riskInfo03.amnt;
										
										$('#zhongjixianbaofei').text(Number(res.riskInfo03.prem).toFixed(2)+'元').parent().removeClass('hide');
										criticalIllnessInsurance.prem=res.riskInfo03.prem;
										if(res.riskInfo03.riskcode == '511505')
										{
											criticalIllnessInsurance.dbbcprem = res.riskInfodbbc.prem;
										}
										
										renderButton(res.payendyearList03, $('#paymentTime'));
										$('#payendyear'+res.riskInfo03.payendyear).addClass('selected');
										criticalIllnessInsurance.payendyear=res.riskInfo03.payendyear;
										
										renderButton(res.payintvList03, $('#paymentMethod'));
										$('#payintv'+res.riskInfo03.payintv).addClass('selected');
										criticalIllnessInsurance.payintv=res.riskInfo03.payintv;
										
										renderButton(res.insureyearList03, $('#term'));
										$('#insureyear'+res.riskInfo03.insureyear).addClass('selected');
										criticalIllnessInsurance.insureyear=res.riskInfo03.insureyear;
										
										res.addRiskList03.forEach(function (item)
										{
											//豁免险的时候，要根据投被保险人关系显示
											if(item.riskcode=='521507')
											{
												var relatoappnt = $("#relatoappnt").val();
												if (relatoappnt !== '00') 
												{
													renderAdditionalInsurance(item);
												}
											}
											else
											{
												renderAdditionalInsurance(item)
											}
											criticalIllnessInsurance[item.riskcode] = res[item.riskcode];
											$('#'+item.riskcode+res[item.riskcode]).addClass('selected').siblings('button').removeClass('selected')
										})
										
										//console.log('加载完',criticalIllnessInsurance);
									}
								}
								else if (item === '人寿险') 
								{
									$('#shouxian').removeClass('hide')
									
									if(res.riskInfo04!=null)
									{
										$('#shouxiancompany').text(res.riskInfo04.insorganname)
										shouxianInsurance.insorgancode = res.riskInfo04.insorgancode;
										
										sxRiskDataArr = res.riskCodeList04;
										$('#shouxianchanpin').text(res.riskInfo04.riskname);
										shouxianInsurance.riskcode = res.riskInfo04.riskcode;
										shouxianInsurance.risktype = '04';
										
										renderAmntButton(res.amntList04, $('#shouxianMoneyButton'));
										$('#sx'+res.riskInfo04.amnt).addClass('selected')
										shouxianInsurance.amnt = res.riskInfo04.amnt;
										
										$('#shouxianbaofei').text(Number(res.riskInfo04.prem).toFixed(2)+'元').parent().removeClass('hide');
										shouxianInsurance.prem=res.riskInfo04.prem;
										
										renderButton(res.payendyearList04, $('#shouxianPaymentTime'));
										$('#sx_payendyear'+res.riskInfo04.payendyear).addClass('selected');
										shouxianInsurance.payendyear=res.riskInfo04.payendyear;
										
										renderButton(res.payintvList04, $('#shouxianPaymentMethod'));
										$('#sx_payintv'+res.riskInfo04.payintv).addClass('selected');
										shouxianInsurance.payintv=res.riskInfo04.payintv;
										
										renderButton(res.insureyearList04, $('#shouxianTerm'));
										$('#sx_insureyear'+res.riskInfo04.insureyear).addClass('selected');
										shouxianInsurance.insureyear=res.riskInfo04.insureyear;
										
										//console.log('加载完',shouxianInsurance);
									}
								}
							})
						}
				    }
				})
			}
		},
		bindEvent: function () {
			var that = this
			// 险种编辑界面 选择相应保险公司
			$('body').on('click', '#yiwaixianCompany', function () {
				var that = $(this)
				new  IosSelect(1,               // 第一个参数为级联层级，演示为1
					[ywCompanyArr],                             // 演示数据
					{
						container: '.container',             // 容器class
						// title: '演示标题',                    // 标题
						headerHeight: 50,
						itemHeight: 36,
						itemShowCount: 5,                    // 每一列显示元素个数，超出将隐藏
						showAnimate: true,
						//oneLevelId: companyArr[0].id,       // 第一级默认值
						callback: function (selectOneObj) {  // 用户确认选择后的回调函数
							//console.log(selectOneObj)
							$('#yiwaixianCompany').text(selectOneObj.value)
							accidentInsuranceObj.insorgancode = selectOneObj.id
                            
							getData('/staff/plan/getRiskList.do', 'post', {'insorgancode': selectOneObj.id,'risktype':'01'}, 
							{
			                    success: function (res) 
			                    {
			                    	ywRiskDataArr = res;
			                    	renderAmntButton([], $('#yiwaixianMoneyButton'))
			                    	accidentInsuranceObj.amnt = '';
			                    	accidentInsuranceObj.prem = '';
			                    	$('#yiwaixianbaofei').text('0元');
			                    }
			                })
						}
					})
			})
			$('body').on('click', '#yiliaoxianCompany', function () 
			{
				var that = $(this)
				new  IosSelect(1,               // 第一个参数为级联层级，演示为1
					[ylCompanyArr],                             // 演示数据
					{
						container: '.container',             // 容器class
						// title: '演示标题',                    // 标题
						headerHeight: 50,
						itemHeight: 36,
						itemShowCount: 5,                    // 每一列显示元素个数，超出将隐藏
						showAnimate: true,
						//oneLevelId: companyArr[0].id,       // 第一级默认值
						callback: function (selectOneObj) {  // 用户确认选择后的回调函数
							//console.log(selectOneObj)
							$('#yiliaoxianCompany').text(selectOneObj.value);
							medicalInsurance.insorgancode = selectOneObj.id;
							
							getData('/staff/plan/getRiskList.do', 'post', {'insorgancode': selectOneObj.id,'risktype':'02'}, 
							{
								success: function (res) 
					            {
					            	ylRiskDataArr = res;
					            	renderAmntButton([], $('#yiliaoxianMoneyButton'));
					            	medicalInsurance.amnt = '';
					            	medicalInsurance.prem = '';
					            	$('#yiliaoxianbaofei').text('0元');
					            }
					        })
						}
					})
			})
			$('body').on('click', '#zhongjixiancompany', function () {
				var that = $(this)
				new  IosSelect(1,               // 第一个参数为级联层级，演示为1
					[zjCompanyArr],                             // 演示数据
					{
						container: '.container',             // 容器class
						// title: '演示标题',                    // 标题
						headerHeight: 50,
						itemHeight: 36,
						itemShowCount: 5,                    // 每一列显示元素个数，超出将隐藏
						showAnimate: true,
						//oneLevelId: companyArr[0].id,       // 第一级默认值
						callback: function (selectOneObj) {  // 用户确认选择后的回调函数
							//console.log(selectOneObj)
							$('#zhongjixiancompany').text(selectOneObj.value)
							criticalIllnessInsurance = {insorgancode: '',riskcode: '',amnt: '',prem: '',insureyear: '',payendyear: '',payintv: ''}
							criticalIllnessInsurance.insorgancode = selectOneObj.id
							
							getData('/staff/plan/getRiskList.do', 'post', {'insorgancode': selectOneObj.id,'risktype':'03'}, 
							{
								success: function (res) 
						        {
									zjRiskDataArr = res;
									renderAmntButton([], $('#moneyButton'));
									renderButton([], $('#paymentTime'));
									renderButton([], $('#paymentMethod'));
									renderButton([], $('#term'));
									
									$('#additionalInsurance').html('');
									
									criticalIllnessInsurance.payendyear = '';
									criticalIllnessInsurance.payintv = '';
									criticalIllnessInsurance.insureyear = '';
									criticalIllnessInsurance.amnt = '';
									criticalIllnessInsurance.prem = '';
									$('#zhongjixianbaofei').text('0元');
						        }
						    })
						}
					})
			})
			$('body').on('click', '#shouxiancompany', function () {
				var that = $(this)
				new  IosSelect(1,               // 第一个参数为级联层级，演示为1
					[sxCompanyArr],                             // 演示数据
					{
						container: '.container',             // 容器class
						// title: '演示标题',                    // 标题
						headerHeight: 50,
						itemHeight: 36,
						itemShowCount: 5,                    // 每一列显示元素个数，超出将隐藏
						showAnimate: true,
						//oneLevelId: companyArr[0].id,       // 第一级默认值
						callback: function (selectOneObj) {  // 用户确认选择后的回调函数
							//console.log(selectOneObj)
							$('#shouxiancompany').text(selectOneObj.value)
							shouxianInsurance.insorgancode = selectOneObj.id
							
							getData('/staff/plan/getRiskList.do', 'post', {'insorgancode': selectOneObj.id,'risktype':'04'}, 
							{
								success: function (res) 
						        {
									sxRiskDataArr = res;
									
									renderAmntButton([], $('#shouxianMoneyButton'));
									renderButton([], $('#shouxianPaymentTime'));
									renderButton([], $('#shouxianPaymentMethod'));
									renderButton([], $('#shouxianTerm'));
									
									shouxianInsurance.payendyear = '';
									shouxianInsurance.payintv = '';
									shouxianInsurance.insureyear = '';
									shouxianInsurance.amnt = '';
									shouxianInsurance.prem = '';
									$('#shouxianbaofei').text('0元');
						        }
						    })
						}
					})
			})
			// 险种编辑界面 选择相应保险公司，出现相应的产品，并赋值
			$('body').on('click', '#yiwaixianchanpin', function () {
				var that = $(this)
				new  IosSelect(1,               // 第一个参数为级联层级，演示为1
					[ywRiskDataArr],                             // 演示数据
					{
						container: '.container',             // 容器class
						title: '',                    // 标题
						headerHeight: 50, itemHeight: 36,
						itemShowCount: 5,                    // 每一列显示元素个数，超出将隐藏
						showAnimate: true,
						// oneLevelId: val,                     // 第一级默认值
						callback: function (selectOneObj) {  // 用户确认选择后的回调函数
							//console.log(selectOneObj)
							$('#yiwaixianchanpin').text(selectOneObj.value)
							accidentInsuranceObj.riskcode = selectOneObj.id;
							accidentInsuranceObj.risktype = '01';
                            
							getData('/staff/plan/getRiskInfo.do', 'post', {'insorgancode': accidentInsuranceObj.insorgancode,'risktype':'01','riskcode':selectOneObj.id}, 
							{
								success: function (res) 
							    {
									renderAmntButton(res.amntList, $('#yiwaixianMoneyButton'))
									accidentInsuranceObj.amnt = '';
			                    	accidentInsuranceObj.prem = '';
			                    	$('#yiwaixianbaofei').text('0元');
							    }
							})
						}
					})
			})
			$('body').on('click', '#yiliaoxianchanpin', function () {
				var that = $(this)
				new  IosSelect(1,               // 第一个参数为级联层级，演示为1
					[ylRiskDataArr],                             // 演示数据
					{
						container: '.container',             // 容器class
						title: '',                    // 标题
						headerHeight: 50, itemHeight: 36,
						itemShowCount: 5,                    // 每一列显示元素个数，超出将隐藏
						showAnimate: true,
						// oneLevelId: val,                     // 第一级默认值
						callback: function (selectOneObj) {  // 用户确认选择后的回调函数
							//console.log(selectOneObj)
							$('#yiliaoxianchanpin').text(selectOneObj.value);
							medicalInsurance.riskcode = selectOneObj.id;
							medicalInsurance.risktype = '02';
							
							getData('/staff/plan/getRiskInfo.do', 'post', {'insorgancode': medicalInsurance.insorgancode,'risktype':'02','riskcode':selectOneObj.id}, 
							{
								success: function (res) 
							    {
									renderAmntButton(res.amntList, $('#yiliaoxianMoneyButton'))
									medicalInsurance.amnt = '';
					            	medicalInsurance.prem = '';
					            	$('#yiliaoxianbaofei').text('0元');
							    }
							})
						}
					})
			})
			$('body').on('click', '#zhongjixianchanpin', function () {
				var that = $(this)
				new  IosSelect(1,               // 第一个参数为级联层级，演示为1
					[zjRiskDataArr],                             // 演示数据
					{
						container: '.container',             // 容器class
						title: '',                    // 标题
						headerHeight: 50, itemHeight: 36,
						itemShowCount: 5,                    // 每一列显示元素个数，超出将隐藏
						showAnimate: true,
						// oneLevelId: val,                     // 第一级默认值
						callback: function (selectOneObj) {  // 用户确认选择后的回调函数
							//console.log(criticalIllnessInsurance)
							
							/*
							 * 上线删除
							selectOneObj.id = 'hongkang000015';
							selectOneObj.value = '弘康倍倍加重大疾病保险';
							*/
							
							$('#zhongjixianchanpin').text(selectOneObj.value);
							criticalIllnessInsurance.riskcode = selectOneObj.id;
							criticalIllnessInsurance.risktype = '03';
                            
							//console.log(criticalIllnessInsurance)
							
							getData('/staff/plan/getRiskInfo.do', 'post', {'insorgancode': criticalIllnessInsurance.insorgancode,'risktype':'03','riskcode':selectOneObj.id}, 
							{
								success: function (res) 
							    {
									renderAmntButton(res.amntList, $('#moneyButton'));
									renderButton(res.payendyearList, $('#paymentTime'));
									renderButton(res.payintvList, $('#paymentMethod'));
									renderButton(res.insureyearList, $('#term'));
									
									$('#additionalInsurance').html('');
									
									addRiskList = res.addRiskList;									
									addRiskList.forEach(function (item)
									{
										/*
										 * 豁免险的时候，要根据投被保险人关系显示
										 */
										if(item.riskcode=='521507'||item.riskcode=='120015')
										{
											var relatoappnt = $("#relatoappnt").val();
											if (relatoappnt !== '00') 
											{
												criticalIllnessInsurance[item.riskcode] = 'Y'
												renderAdditionalInsurance(item);
											}
											else
											{
												criticalIllnessInsurance[item.riskcode] = 'N'
											}
										}
										else
										{
											if(item.riskcode=='hongkang000002'||item.riskcode=='hongkang000024')
											{
												criticalIllnessInsurance[item.riskcode] = 'N'
											}
											else
											{
												criticalIllnessInsurance[item.riskcode] = 'Y'
											}
											
											renderAdditionalInsurance(item)
										}
									})
									
									criticalIllnessInsurance.payendyear = '';
									criticalIllnessInsurance.payintv = '';
									criticalIllnessInsurance.insureyear = '';
									criticalIllnessInsurance.amnt = '';
									criticalIllnessInsurance.prem = '';
									$('#zhongjixianbaofei').text('0元');
							    }
							})
						}
					})
			})
			$('body').on('click', '#shouxianchanpin', function () {
				var that = $(this)
				new  IosSelect(1,               // 第一个参数为级联层级，演示为1
					[sxRiskDataArr],                             // 演示数据
					{
						container: '.container',             // 容器class
						title: '',                    // 标题
						headerHeight: 50, itemHeight: 36,
						itemShowCount: 5,                    // 每一列显示元素个数，超出将隐藏
						showAnimate: true,
						// oneLevelId: val,                     // 第一级默认值
						callback: function (selectOneObj) {  // 用户确认选择后的回调函数
							
							$('#shouxianchanpin').text(selectOneObj.value);
							shouxianInsurance.riskcode = selectOneObj.id;
							shouxianInsurance.risktype = '04';
                            
							getData('/staff/plan/getRiskInfo.do', 'post', {'insorgancode': shouxianInsurance.insorgancode,'risktype':'04','riskcode':selectOneObj.id}, 
							{
								success: function (res) 
							    {
									renderAmntButton(res.amntList, $('#shouxianMoneyButton'));
									renderButton(res.payendyearList, $('#shouxianPaymentTime'));
									renderButton(res.payintvList, $('#shouxianPaymentMethod'));
									renderButton(res.insureyearList, $('#shouxianTerm'));
									
									shouxianInsurance.payendyear = '';
									shouxianInsurance.payintv = '';
									shouxianInsurance.insureyear = '';
									shouxianInsurance.amnt = '';
									shouxianInsurance.prem = '';
									$('#shouxianbaofei').text('0元');
							    }
							})
						}
					})
			})
			// 险种编辑界面 butotn点击  单选
			$('body').on('click', '#editType .edit-form-select-button button', function (e) {
				if (!$(this).hasClass('selected')) {
					$(this).addClass('selected').siblings('button').removeClass('selected')
				} else {
					$(this).removeClass('selected')
				}
				// console.log($(this).text())
				var id = $(this).parent().attr('id')
				//console.log(id)
				switch (id) {
					case 'yiwaixianMoneyButton':
						console.log('意外险-保费金额-', $(this).attr("data-id"))
                        if (accidentInsuranceObj.amnt !== $(this).attr("data-id")) 
                        {
                            accidentInsuranceObj.amnt = $(this).attr("data-id");
                        } else {
                            accidentInsuranceObj.amnt = ''
                        }
						calYWprem();
						break
					case 'yiliaoxianMoneyButton':
						console.log('医疗险-保费金额-', $(this).attr("data-id"))
                        if (medicalInsurance.amnt !== $(this).attr("data-id")) 
                        {
                            medicalInsurance.amnt = $(this).attr("data-id")
                        } else {
                            medicalInsurance.amnt = ''
                        }
						calYLprem();
						break
					case 'moneyButton':
						console.log('重疾险-保费金额-', $(this).attr("data-id"))
                        if (criticalIllnessInsurance.amnt !== $(this).attr("data-id")) 
                        {
                            criticalIllnessInsurance.amnt = $(this).attr("data-id")
                        } else {
                            criticalIllnessInsurance.amnt = ''
                        }
						calZJprem();
						break
					case 'paymentTime':
						console.log('重疾险-缴费年期-', $(this).attr("data-id"))
                        if (criticalIllnessInsurance.payendyear !== $(this).attr("data-id")) 
                        {
                             criticalIllnessInsurance.payendyear = $(this).attr("data-id")
                        } else {
                             criticalIllnessInsurance.payendyear = ''
                        }
						calZJprem();
						break
					case 'paymentMethod':
						console.log('重疾险-缴费方式-', $(this).attr("data-id"))
                        if (criticalIllnessInsurance.payintv !== $(this).attr("data-id")) 
                        {
                            criticalIllnessInsurance.payintv = $(this).attr("data-id")
                        } else {
                            criticalIllnessInsurance.payintv = ''
                        }
						calZJprem();
						break
					case 'term':
						console.log('重疾险-保障期限-', $(this).attr("data-id"))
                        if (criticalIllnessInsurance.insureyear !== $(this).attr("data-id")) 
                        {
                            criticalIllnessInsurance.insureyear = $(this).attr("data-id")
                        } else {
                            criticalIllnessInsurance.insureyear = ''
                        }
						calZJprem();
						break
					case 'hmtoubao':
						console.log('附加投保人豁免-', $(this).attr("data-id"))
                        if (criticalIllnessInsurance.ishuomian !== $(this).attr("data-id")) 
                        {
                            criticalIllnessInsurance.ishuomian = $(this).attr("data-id")
                        } else {
                            criticalIllnessInsurance.ishuomian = ''
                        }
						calZJprem();
						break
					case 'shouxianMoneyButton':
						console.log('人寿险-保险金额-', $(this).attr("data-id"))
                        if (shouxianInsurance.amnt !== $(this).attr("data-id")) 
                        {
                        	shouxianInsurance.amnt = $(this).attr("data-id")
                        } else {
                        	shouxianInsurance.amnt = ''
                        }
						calSXprem();
						break
					case 'shouxianPaymentTime':
						console.log('人寿险-缴费年期-', $(this).attr("data-id"))
                        if (shouxianInsurance.payendyear !== $(this).attr("data-id")) 
                        {
                        	shouxianInsurance.payendyear = $(this).attr("data-id")
                        } else {
                        	shouxianInsurance.payendyear = ''
                        }
						calSXprem();
						break
					case 'shouxianPaymentMethod':
						console.log('人寿险-缴费方式-', $(this).attr("data-id"))
                        if (shouxianInsurance.payintv !== $(this).attr("data-id")) 
                        {
                        	shouxianInsurance.payintv = $(this).attr("data-id")
                        } else {
                        	shouxianInsurance.payintv = ''
                        }
						calSXprem();
						break
					case 'shouxianTerm':
						console.log('人寿险-保障期限-', $(this).attr("data-id"))
                        if (shouxianInsurance.insureyear !== $(this).attr("data-id")) 
                        {
                        	shouxianInsurance.insureyear = $(this).attr("data-id")
                        } else {
                        	shouxianInsurance.insureyear = ''
                        }
						calSXprem();
						break
					default:
						console.log('附加-', $(this).attr("data-id"))
						if (criticalIllnessInsurance[id] !== $(this).attr("data-id")) {
							criticalIllnessInsurance[id] = $(this).attr("data-id")
						} else {
							criticalIllnessInsurance[id] = 'N'
						}
						calZJprem();
						//console.log(criticalIllnessInsurance);
				}
			})
			// 保存并生成计划书，跳转到查看计划书
			$('body').on('click', '#savePlanBtn', function (e) 
			{
				//console.log('saveData')
				//TODO 此处ajax上传到服务器保存，生成一个id后，在下一个页面中再用ajax获取到相应id的数据渲染页面
				if (!that.validate()) return false
				
				var jsonStr = '{'+'"plantype":"'+$('#plantype').val()+'",'
				 +'"planserialno":"'+$('#planid').val()+'",'
			     +'"risktype":"'+$('#risktype').val()+'",'
				 +'"appname":"'+$('#appname').val()+'",'
				 +'"appsex":"'+$('#appsex').val()+'",'
				 +'"appage":"'+$('#appage').val()+'",'
				 +'"relatoappnt":"'+$('#relatoappnt').val()+'",'
				 +'"insname":"'+$('#insname').val()+'",'
				 +'"inssex":"'+$('#inssex').val()+'",'
				 +'"insage":"'+$('#insage').val()+'",'
				 +'"mobile":"'+$('#mobile').val()+'",'
				 +'"risklist":['
				 
				 var isstart = false;
				 
				 if (!$('#yiwaixian').hasClass('hide')) 
				 {
					 jsonStr = jsonStr + getRiskSaveJson(accidentInsuranceObj);
					 isstart = true;
				 }
				 
				 if (!$('#yiliaoxian').hasClass('hide'))
				 {
					 if(isstart)
					 {
						 jsonStr = jsonStr + ',';
					 }
					 jsonStr = jsonStr + getRiskSaveJson(medicalInsurance);
					 isstart = true;
				 }
				 
				 if (!$('#zhongjixian').hasClass('hide'))
				 {
					 if(isstart)
					 {
						 jsonStr = jsonStr + ',';
					 }
					 jsonStr = jsonStr + getRiskSaveJson(criticalIllnessInsurance) + getZyDbbcSaveJson(criticalIllnessInsurance);
					 isstart = true;
				 }
				 
				 if (!$('#shouxian').hasClass('hide'))
				 {
					 if(isstart)
					 {
						 jsonStr = jsonStr + ',';
					 }
					 jsonStr = jsonStr + getRiskSaveJson(shouxianInsurance)
					 isstart = true;
				 }
				 
				 jsonStr = jsonStr + ']}';
				
				 console.log('saveData',jsonStr);
				 
				 getData('/staff/plan/creatPlan.do', 'post', {"jsonStr":jsonStr}, 
				 {
					success: function (res) 
				    {
						if(res.code == '0')
						{
							location.href = '/staff/plan/viewPlan.do?planid='+res.planid;
						}
				    }
				 })
			})
		},
		validate: function () 
		{
			if (!$('#yiwaixian').hasClass('hide')) 
			{
			    for (var k in accidentInsuranceObj) 
			    {
			        if (!accidentInsuranceObj[k]) 
			        {
			           if (k === 'insorgancode') {
                           $.toptip('请选择意外险保险公司', 'error')
                       }else if (k === 'amnt') {
                           $.toptip('请选择意外险保险金额', 'error')
                       }else if (k === 'riskcode') {
                           $.toptip('请选择意外险产品', 'error')
                       }else if (k === 'prem') {
                           $.toptip('未计算出意外险保费', 'error')
                       }
                       return false
                    }
                }
			}
			if (!$('#yiliaoxian').hasClass('hide')) {
                for (var k in medicalInsurance) {
                    if (!medicalInsurance[k]) {
                    	if (k === 'insorgancode') {
                            $.toptip('请选择医疗险保险公司', 'error')
                        }else if (k === 'amnt') {
                            $.toptip('请选择医疗险保险金额', 'error')
                        }else if (k === 'riskcode') {
                            $.toptip('请选择医疗险产品', 'error')
                        }else if (k === 'prem') {
                            $.toptip('未计算出医疗险保费', 'error')
                        }
                        return false
                    }
                }
			}
			if (!$('#zhongjixian').hasClass('hide')) {
                for (var k in criticalIllnessInsurance) {
                    if (!criticalIllnessInsurance[k]) {
                        if (k === 'insorgancode') {
                            $.toptip('请选择重疾险保险公司', 'error')
                        } else if (k === 'amnt') {
                            $.toptip('请选择重疾险保险金额', 'error')
                        } else if (k === 'riskcode') {
                            $.toptip('请选择重疾险产品', 'error')
                        } else if (k === 'prem') {
                            $.toptip('未计算出重疾险保费', 'error')
                        } else if (k === 'payendyear') {
                            $.toptip('请选择重疾险缴费年期', 'error')
                        } else if (k === 'payintv') {
                            $.toptip('请选择重疾险缴费方式', 'error')
                        } else if (k === 'insureyear') {
                            $.toptip('请选择重疾险保障期限', 'error')
                        }
                        return false
                    }
                }
			}
			
			if (!$('#shouxian').hasClass('hide')) {
                for (var k in shouxianInsurance) {
                    if (!shouxianInsurance[k]) {
                        if (k === 'insorgancode') {
                            $.toptip('请选择人寿险保险公司', 'error')
                        } else if (k === 'amnt') {
                            $.toptip('请选择人寿险保险金额', 'error')
                        } else if (k === 'riskcode') {
                            $.toptip('请选择人寿险产品', 'error')
                        } else if (k === 'prem') {
                            $.toptip('未计算出人寿险保费', 'error')
                        } else if (k === 'payendyear') {
                            $.toptip('请选择人寿险缴费年期', 'error')
                        } else if (k === 'payintv') {
                            $.toptip('请选择人寿险缴费方式', 'error')
                        } else if (k === 'insureyear') {
                            $.toptip('请选择人寿险保障期限', 'error')
                        }
                        return false
                    }
                }
			}
			
			return true
		}
	}
	editInsuranceFunc.init()

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
	function getQueryValue(queryName) {
		var reg = new RegExp("(^|&)" + queryName + "=([^&]*)(&|$)", "i");
		var r = window.location.search.substr(1).match(reg);
		if (r != null) {
			return decodeURI(r[2]);
		} else {
			return null;
		}
	}
	function isSelected(id) {
		var hasSelected = false
		$(id).find('button').each(function (index, el) {
			if ($(el).hasClass('selected')) {
				hasSelected = true
			}
		})
		if (!hasSelected){
			return false
		}
		return true
	}
	
	function calYWprem()
	{
		$('#yiwaixianbaofei').text('0元');
		accidentInsuranceObj.prem='';
		
		if(accidentInsuranceObj.riskcode == 'HP033100320002')
		{
			if(accidentInsuranceObj.amnt == '100000')
			{
				$('#yiwaixianbaofei').text('98.00元/年').parent().removeClass('hide');
				accidentInsuranceObj.prem=98;
			}
			else if(accidentInsuranceObj.amnt == '300000')
			{
				$('#yiwaixianbaofei').text('258.00元/年').parent().removeClass('hide');
				accidentInsuranceObj.prem=258;
			}
			else if(accidentInsuranceObj.amnt == '500000')
			{
				$('#yiwaixianbaofei').text('408.00元/年').parent().removeClass('hide');
				accidentInsuranceObj.prem=408;
			}
		}
	}
	
	function calYLprem()
	{
		$('#yiliaoxianbaofei').text('0元');
		medicalInsurance.prem='';
		
		if(medicalInsurance.insorgancode!=null&&medicalInsurance.insorgancode!=''
		 &&medicalInsurance.riskcode!=null&&medicalInsurance.riskcode!=''
		 &&medicalInsurance.amnt!=null&&medicalInsurance.amnt!='')
		{
			var transdata = 
			{
				"insorgancode":medicalInsurance.insorgancode,
				"riskcode":medicalInsurance.riskcode,
				"age":$('#insage').val(),
				"amnt":medicalInsurance.amnt
			};
			
			getData('/staff/plan/calprem_yl.do', 'post', transdata, 
			{
				success: function (res) 
			    {
					$('#yiliaoxianbaofei').text(Number(res.sumPrem).toFixed(2)+'元/年').parent().removeClass('hide');
					medicalInsurance.prem=res.sumPrem;
			    }
			})
		}
	}
	
	function calZJprem()
	{
		$('#zhongjixianbaofei').text('0元');
		criticalIllnessInsurance.prem='';
		
		//测试用
		//criticalIllnessInsurance.amnt = 200000;
		
		if(criticalIllnessInsurance.insorgancode!=null&&criticalIllnessInsurance.insorgancode!=''
		 &&criticalIllnessInsurance.riskcode!=null&&criticalIllnessInsurance.riskcode!=''
		 &&criticalIllnessInsurance.amnt!=null&&criticalIllnessInsurance.amnt!=''
		 &&criticalIllnessInsurance.payendyear!=null&&criticalIllnessInsurance.payendyear!=''
		 &&criticalIllnessInsurance.payintv!=null&&criticalIllnessInsurance.payintv!=''
		 &&criticalIllnessInsurance.insureyear!=null&&criticalIllnessInsurance.insureyear!='')
		{
			var transdata = 
			{
				"insorgancode":criticalIllnessInsurance.insorgancode,
				"riskcode":criticalIllnessInsurance.riskcode,
				"amnt":criticalIllnessInsurance.amnt,
				"insuyear":criticalIllnessInsurance.insureyear,
				"payendyear":criticalIllnessInsurance.payendyear,
				"payintv":criticalIllnessInsurance.payintv,
				"age":$('#insage').val(),
				"insuredSex":$('#inssex').val(),
				"appntage":$('#appage').val(),
				"appntsex":$('#appsex').val(),
				//"producttype":"01",
			};
			
			var allData = $.extend(transdata, getZYCalTrasnData());
			
			console.log('calPremData',allData);
			
			var zjCalPremUrl = '';
			
			if(criticalIllnessInsurance.riskcode=='511505'
			 ||criticalIllnessInsurance.riskcode=='hongkang000015')
			{
				zjCalPremUrl = '/life/hongkang/calprem.do';
			}
			else if(criticalIllnessInsurance.riskcode=='110055')
			{
				zjCalPremUrl = '/staff/plan/calprem_zj.do';
			}
				
			getData(zjCalPremUrl, 'post', allData, 
			{
				success: function (res) 
			    {
					var premEndStr = '';
					
					if(criticalIllnessInsurance.payintv=='1')
					{
						premEndStr = '/月'
					}
					else
					{
						premEndStr = '/年'
					}
					
					$('#zhongjixianbaofei').text(Number(res.sumPrem).toFixed(2)+'元'+premEndStr).parent().removeClass('hide');
					criticalIllnessInsurance.prem=(Number(res.sumPrem)-Number(res.zjylPrem)).toFixed(2);
					criticalIllnessInsurance.dbbcprem = res.zjylPrem;
					
					console.log('criticalIllnessInsurance.prem',criticalIllnessInsurance);
			    }
			})
		}
	}
	
	function calSXprem()
	{
    	console.log('寿险计算保费开始：',shouxianInsurance);
		$('#shouxianbaofei').text('0元/年');
		shouxianInsurance.prem='';
		
		if(shouxianInsurance.insorgancode!=null&&shouxianInsurance.insorgancode!=''
		 &&shouxianInsurance.riskcode!=null&&shouxianInsurance.riskcode!=''
		 &&shouxianInsurance.amnt!=null&&shouxianInsurance.amnt!=''
		 &&shouxianInsurance.payendyear!=null&&shouxianInsurance.payendyear!=''
		 &&shouxianInsurance.payintv!=null&&shouxianInsurance.payintv!=''
		 &&shouxianInsurance.insureyear!=null&&shouxianInsurance.insureyear!='')
		{
			var transdata = 
			{
				"premunit":'10000',
				"insorgancode":shouxianInsurance.insorgancode,
				"riskcode":shouxianInsurance.riskcode,
				"amnt":shouxianInsurance.amnt,
				"insuyear":shouxianInsurance.insureyear,
				"payendyear":shouxianInsurance.payendyear,
				"payintv":shouxianInsurance.payintv,
				"age":$('#insage').val(),
				"insuredSex":$('#inssex').val(),
			};
			
			getData('/staff/plan/calprem_sx.do', 'post', transdata, 
			{
				success: function (res) 
			    {
					var premEndStr = '';
					
					if(shouxianInsurance.payintv=='1')
					{
						premEndStr = '/月'
					}
					else
					{
						premEndStr = '/年'
					}
					
					$('#shouxianbaofei').text(Number(res.sumPrem).toFixed(2)+'元'+premEndStr).parent().removeClass('hide');
					shouxianInsurance.prem = res.sumPrem;
					shouxianInsurance.premEndStr = premEndStr;
			    }
			})
		}
	}
	
	function renderButton(buttonList, jQueryDom) 
	{
		var tpl = ''
		buttonList.forEach(function (item) 
		{
			var classText = item.selectStatus ? 'selected' : ''
			tpl += '<button class="'+ classText +'" data-id="'+item.id+'" id = "'+jQueryDom.attr("data-id")+item.id+'">'+item.value+'</button>'
		})
		jQueryDom.html(tpl)
	}
	
	function renderAmntButton(buttonList, jQueryDom) 
	{
		var tpl = ''	
		
		console.log('amntid',jQueryDom.attr("data-id"));
		
		buttonList.forEach(function (item) {
			tpl += '<button class="" data-id="'+item.id+'" id = "'+jQueryDom.attr("data-id")+item.id+'">'+transAmnt(item.value)+'</button>'
		})
		jQueryDom.html(tpl)
	}
	

    function renderAdditionalInsurance(item) 
    {
		var tpl = '<div class="edit-form-choose-item">' +
			'       <div class="choose-item-title">'+item.riskname+'</div>' +
			'       <div class="edit-form-weui-cell weui-cell edit-form-select-button" data-id="'+item.riskcode+'" id="'+item.riskcode+'"></div>' +
			'      </div>'
	    $('#additionalInsurance').append(tpl)
	    
	    if(item.riskcode=='hongkang000002'||item.riskcode=='hongkang000024')
	    {
	    	renderButton(istoubao02, $('#' + item.riskcode))
	    }
	    else
	    {
	    	renderButton(istoubao01, $('#' + item.riskcode))
	    }
    }
	
	function transAmnt(amnt)
	{
		var amntStr = Number(amnt/10000).toFixed(0)+'万';
		return amntStr;
	}
	
	/*
	 * 重疾补充医疗的处理
	 */
	function getZyDbbcSaveJson(riskObject)
	{
		var jsonStr = '';
		
		if(riskObject.riskcode=='511505'&&riskObject[521506]=='Y')
		{
			jsonStr = ','
		            +'{'+'"insorgancode":"'+riskObject.insorgancode+'",'
				    +'"riskcode":"521506",'
				    +'"risktype":"dbbc",'
				    +'"payintv":"'+riskObject.payintv+'",'
				    +'"payendyear":"'+riskObject.payendyear+'",'
				    +'"insureyear":"'+riskObject.insureyear+'",'
				    +'"amnt":"'+riskObject.amnt+'",'
				    +'"prem":"'+riskObject.dbbcprem+'"}'
		}
		
		return jsonStr;
	}
	
	function getRiskSaveJson(riskObject)
	{
		var jsonStr = '{'+'"insorgancode":"'+riskObject.insorgancode+'",'
        				 +'"riskcode":"'+riskObject.riskcode+'",'
        				 +'"risktype":"'+riskObject.risktype+'",'
        				 
        				 if(riskObject.risktype=='03'||riskObject.risktype=='04')
        				 {
        					 jsonStr = jsonStr +'"payintv":"'+riskObject.payintv+'",'
        					                   +'"payendyear":"'+riskObject.payendyear+'",'
        					                   +'"insureyear":"'+riskObject.insureyear+'",'
        					                   + getZYSaveJsonStr();
        				 }
        				 else
        				 {
        					 jsonStr = jsonStr +'"payintv":"0",'
        					 				   +'"payendyear":"1Y",'
        					                   +'"insureyear":"1Y",'
        				 }
        				 
		jsonStr = jsonStr +'"amnt":"'+riskObject.amnt+'",'
        				  +'"prem":"'+riskObject.prem+'"}'
        				  
        return jsonStr;
	}
	
	function getZYSaveJsonStr()
	{
		var jsonStr = '';
		
		if(criticalIllnessInsurance.riskcode == '511505')
		{
			jsonStr = '"addriskdata":{'
				     +'"iszjyl":"'+criticalIllnessInsurance[521506]+'",'
			         +'"isexzl":"'+criticalIllnessInsurance.hongkang000002+'",'
			         +'"ishuomian":"'+criticalIllnessInsurance[521507]+'",'
			         +'"isdbbjb":"'+criticalIllnessInsurance.hongkang000024+'"},'
		}
		else if(criticalIllnessInsurance.riskcode == 'hongkang000015')
		{
			jsonStr = '"addriskdata":{'
				     +'"ishuomian":"'+criticalIllnessInsurance[521507]+'",'
			         +'"ishongkang000015_kx":"'+criticalIllnessInsurance.hongkang000015_kx+'"},'
		}
		else if(criticalIllnessInsurance.riskcode == '110055')
		{
			jsonStr = '"addriskdata":{'
			     +'"ishuomian":"'+criticalIllnessInsurance[120015]+'"'
		         +'},'
		}
		
		return jsonStr;
	}
	
	function getZYCalTrasnData()
	{
		var zjRiskData = {"code":"0"}
		
		if(criticalIllnessInsurance.riskcode == '511505')
		{
			var zjRiskData = 
			{
				"ishuomian":criticalIllnessInsurance[521507],
				"iszjyl":criticalIllnessInsurance[521506],
				"isexzl":criticalIllnessInsurance.hongkang000002,
				"isdbbjb":criticalIllnessInsurance.hongkang000024
			}
		}
		else if(criticalIllnessInsurance.riskcode == 'hongkang000015')
		{
			var zjRiskData = 
			{
				"ishuomian":criticalIllnessInsurance[521507],
				"producttype":criticalIllnessInsurance.hongkang000015_kx=='Y'?'02':'01'
			}
		}
		else if(criticalIllnessInsurance.riskcode == '110055')
		{
			var zjRiskData = 
			{
				"ishuomian":criticalIllnessInsurance[120015],
				"premunit":1000
			}
		}
		
		return zjRiskData;
	}
})
