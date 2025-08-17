//传入的参数分别为表格对象(注：id不能重复)
function initDataGrid(gridid) {
	var p = gridid.datagrid('getPager');
	$(p).pagination({
		pageSize: 10, //每页显示的记录条数，默认为10  
		pageList: [10], //可以设置每页记录条数的列表  
		beforePageText: '第', //页数文本框前显示的汉字  
		afterPageText: '页    共 {pages} 页',
		displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录',
		showPageList: false,
		showRefresh: false
	});
}

function initDataGrid20(gridid) {
	var p = gridid.datagrid('getPager');
	$(p).pagination({
		pageSize: 20, //每页显示的记录条数，默认为10  
		pageList: [20], //可以设置每页记录条数的列表  
		beforePageText: '第', //页数文本框前显示的汉字  
		afterPageText: '页    共 {pages} 页',
		displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录',
		showPageList: false,
		showRefresh: false
	});
}

function initDataGrid_n(gridid, pagesize_n) {
	var p = gridid.datagrid('getPager');
	$(p).pagination({
		pageSize: pagesize_n, //每页显示的记录条数，默认为10  
		pageList: [pagesize_n], //可以设置每页记录条数的列表  
		beforePageText: '第', //页数文本框前显示的汉字  
		afterPageText: '页    共 {pages} 页',
		displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录',
		showPageList: false,
		showRefresh: false
	});
}

//传入的参数分别为表格对象(注：id不能重复),传入后台的参数 ,数据查询的url
function displayDataGrid(gridid, param, turl, sfunName) {
	//如果传入参数为null的话，要初始化一下
	if (param == null) {
		param = new Object();
	}

	param.iamsOpr = $('#iamsopr').val();
	param.iamsOprName = $('#iamsoprname').val();
	param.logonOrgan = $('#iamsoprorgan').val();
	param.iamsOprOrgan = $('#iamsoprorgan').val();
	param.iamsOrganGrade = $('#iamsorgangrade').val();

	if (gridid.datagrid('getRows').length > 0) {
		gridid.datagrid('load', param);
	} else {
		gridid.datagrid({
			url: turl,
			loadMsg: '数据加载中请稍后……',
			queryParams: param,
			onLoadSuccess: function (data) {
				if (data.total > 0) {
					let dataList = data.rows
					for (var i = 0; i < dataList.length; i++) {
						if (dataList[i].salesarea) {
							if (dataList[i].salesarea.indexOf(',') == 0) {
								dataList[i].salesarea = dataList[i].salesarea.substring(1, dataList[i].salesarea.length)
							}
						}

					}
				}
				if (sfunName == null) {} else {
					func = function () {};
					func = eval(sfunName);
					func(data);
				}
			},
		});
	}
	var p = gridid.datagrid('getPager');
	$(p).pagination({
		pageSize: 10, //每页显示的记录条数，默认为10  
		pageList: [10], //可以设置每页记录条数的列表  
		beforePageText: '第', //页数文本框前显示的汉字  
		afterPageText: '页    共 {pages} 页',
		displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录',
		showPageList: false,
		showRefresh: false,
		onSelectPage: function (pageNumber, pageSize) {
			param.totalRecord = gridid.datagrid('getData')['total'];
			param.pageNumber = pageNumber;
			param.pageSize = pageSize;
			gridid.datagrid('reload', param);
		}
	});
}

//传入的参数分别为表格对象(注：id不能重复),传入后台的参数 ,数据查询的url
function displayDataGrid20(gridid, param, turl, sfunName) {
	//如果传入参数为null的话，要初始化一下
	if (param == null) {
		param = new Object();
	}

	param.iamsOpr = $('#iamsopr').val();
	param.iamsOprName = $('#iamsoprname').val();
	param.logonOrgan = $('#iamsoprorgan').val();
	param.iamsOprOrgan = $('#iamsoprorgan').val();
	param.iamsOrganGrade = $('#iamsorgangrade').val();

	if (gridid.datagrid('getRows').length > 0) {
		gridid.datagrid('load', param);
	} else {
		gridid.datagrid({
			url: turl,
			loadMsg: '数据加载中请稍后……',
			queryParams: param,
			onLoadSuccess: function (data) {
				if (sfunName == null) {} else {
					func = function () {};
					func = eval(sfunName);
					func(data);
				}
			},
		});
	}
	var p = gridid.datagrid('getPager');
	$(p).pagination({
		pageSize: 20, //每页显示的记录条数，默认为10  
		pageList: [20], //可以设置每页记录条数的列表  
		beforePageText: '第', //页数文本框前显示的汉字  
		afterPageText: '页    共 {pages} 页',
		displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录',
		showPageList: false,
		showRefresh: false,
		onSelectPage: function (pageNumber, pageSize) {
			param.totalRecord = gridid.datagrid('getData')['total'];
			param.pageNumber = pageNumber;
			param.pageSize = pageSize;
			gridid.datagrid('reload', param);
		}
	});
}

//传入的参数分别为表格对象(注：id不能重复),传入后台的参数 ,数据查询的url
function displayDataGrid_n(gridid, param, turl, sfunName, pagesize_n) {
	//如果传入参数为null的话，要初始化一下
	if (param == null) {
		param = new Object();
	}

	param.iamsOpr = $('#iamsopr').val();
	param.iamsOprName = $('#iamsoprname').val();
	param.logonOrgan = $('#iamsoprorgan').val();
	param.iamsOprOrgan = $('#iamsoprorgan').val();
	param.iamsOrganGrade = $('#iamsorgangrade').val();

	if (gridid.datagrid('getRows').length > 0) {
		gridid.datagrid('load', param);
	} else {
		gridid.datagrid({
			url: turl,
			loadMsg: '数据加载中请稍后……',
			queryParams: param,
			onLoadSuccess: function (data) {
				if (sfunName == null) {} else {
					func = function () {};
					func = eval(sfunName);
					func(data);
				}
			},
		});
	}
	var p = gridid.datagrid('getPager');
	$(p).pagination({
		pageSize: pagesize_n, //每页显示的记录条数，默认为10  
		pageList: [pagesize_n], //可以设置每页记录条数的列表  
		beforePageText: '第', //页数文本框前显示的汉字  
		afterPageText: '页    共 {pages} 页',
		displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录',
		showPageList: false,
		showRefresh: false,
		onSelectPage: function (pageNumber, pageSize) {
			param.totalRecord = gridid.datagrid('getData')['total'];
			param.pageNumber = pageNumber;
			param.pageSize = pageSize;
			gridid.datagrid('reload', param);
		}
	});
}

//传入参数：combox对象(注：id不能重复),参数,url,key,value
function displayCombox(comboxid, tparam, turl, key, value) {
	comboxid.combobox({
		url: turl,
		valueField: key,
		textField: value,
		formatter: function (row) {
			var s = '<span style="color:#888">' + row[value] + '</span>';
			return s;
		},
		//panelHeight:'auto',
		onBeforeLoad: function (param) {
			for (var i in tparam) {
				param[i] = tparam[i];
			}

		},
		onSelect: function () {
			aftercodeselect(comboxid);
		}
	});
}

//传入参数：url，参数，ajax成功处理方法名（里面包含业务成功和失败的处理），
//ajax失败处理方法名（这里的失败，指的是ajax调用失败）
function ajaxdeal(turl, param, sfunName, efunName, sExtSFunName, sExtEFunName) {
	//如果传入参数为null的话，要初始化一下
	if (param == null) {
		param = new Object();
	}

	param.iamsOpr = $('#iamsopr').val();
	param.iamsOprName = $('#iamsoprname').val();
	param.logonOrgan = $('#iamsoprorgan').val();
	param.iamsOprOrgan = $('#iamsoprorgan').val();
	param.iamsOrganGrade = $('#iamsorgangrade').val();

	$.ajax({ //一个Ajax过程 
		type: "post",
		url: turl,
		dataType: 'json',
		data: param,
		success: function (data) {
			closeShow();
			if (sfunName == null) {
				iamssuccess(data, sExtSFunName, sExtEFunName);
			} else {
				func = function () {};
				func = eval(sfunName);
				func(data);
			}
		},
		error: function () {
			closeShow();
			if (efunName == null) {
				iamserror();
			} else {
				func = function () {};
				func = eval(efunName);
				func();
			}
		},
		beforeSend: function (XMLHttpRequest) {
			//$("#myAjaxShow").css({display:"",top:"0%",left:"0%",position:"absolute"});
			showDiv();
		}
	});
}

function iamssuccess(data, sExtSFunName, sExtEFunName) {
	if (data.flag == "0") {
		if (data.message == null || data.message == "") {
			$.messager.alert('执行成功', '操作成功', 'info');
		} else {
			$.messager.alert('执行成功', data.message, 'info');
		}
		if (sExtSFunName != null) {
			func = function () {};
			func = eval(sExtSFunName);
			func();
		}
	} else {
		if (data.message == null || data.message == "") {
			$.messager.alert('执行失败', '操作失败', 'error');
		} else {
			$.messager.alert('执行失败', data.message, 'error');
		}
		if (sExtEFunName != null) {
			func = function () {};
			func = eval(sExtEFunName);
			func();
		}
	}
}

function iamserror() {
	$.messager.alert('执行失败', 'ajax error', 'error');
}

function showDiv() {
	var doc = document;
	var ddiv1 = doc.getElementById("div1");
	var scrollTop = doc.documentElement.scrollTop || doc.body.scrollTop;
	var scrollLeft = doc.documentElement.scrollLeft || doc.body.scrollLeft;
	if (ddiv1 != null && ddiv1 != undefined) {
		ddiv1.style.display = "inline"; // 设置层1显示
		ddiv1.style.width = window.innerWidth ||
			doc.documentElement.clientWidth || doc.body.clientWidth; // 设置层1宽度

		ddiv1.style.height = window.innerHeight ||
			doc.documentElement.clientHeight || doc.body.clientHeight; // 设置层1高度		
		ddiv1.style.top = scrollTop;
		ddiv1.style.left = scrollLeft;
	}
	var ddiv2 = doc.getElementById("div2");
	if (ddiv2 != null && ddiv2 != undefined) {
		ddiv2.style.display = "inline"; // 设置层2的显示

		//设置层2的距顶位置居中算法
		ddiv2.style.top = ddiv1.clientHeight / 2 - ddiv2.clientHeight / 2 +
			scrollTop;

		//设置层2的距左位置居中算法
		ddiv2.style.left = ddiv1.clientWidth / 2 - ddiv2.clientWidth / 2 +
			scrollLeft;
	}
}

function closeShow() {
	var doc = document;
	var ddiv1 = doc.getElementById("div1");
	if (ddiv1 != null && ddiv1 != undefined) {
		ddiv1.style.display = "none";
	}
	var ddiv2 = doc.getElementById("div2");
	if (ddiv2 != null && ddiv2 != undefined) {
		ddiv2.style.display = "none";
	}
}

function date_formatter(date) {
	var y = date.getFullYear();
	var m = date.getMonth() + 1;
	var d = date.getDate();
	return y + '-' + (m < 10 ? ('0' + m) : m) + '-' + (d < 10 ? ('0' + d) : d);
}

function date_ym_formatter(date) {
	var y = date.getFullYear();
	var m = date.getMonth() + 1;
	var d = date.getDate();
	return y + '-' + (m < 10 ? ('0' + m) : m);
}

function date_parser(s) {
	if (!s) return new Date();
	var ss = (s.split('-'));
	var y = parseInt(ss[0], 10);
	var m = parseInt(ss[1], 10);
	var d = parseInt(ss[2], 10);
	if (!isNaN(y) && !isNaN(m) && !isNaN(d)) {
		return new Date(y, m - 1, d);
	} else {
		return new Date();
	}
}

function showPage(img, spanID) {
	if (spanID.style.display == "") {
		//关闭
		spanID.style.display = "none";
		img.src = "images/butCollapse.gif";
	} else {
		//打开
		spanID.style.display = "";
		img.src = "images/butExpand.gif";
	}
}

function ajaxFileUpload(inputid, turl, param, sfunName, efunName, sExtSFunName, sExtEFunName) {
	showDiv();
	if (param == null) {
		param = new Object();
	}

	param.iamsOpr = $('#iamsopr').val();
	param.iamsOprName = $('#iamsoprname').val();
	param.logonOrgan = $('#iamsoprorgan').val();
	param.iamsOprOrgan = $('#iamsoprorgan').val();
	param.iamsOrganGrade = $('#iamsorgangrade').val();

	$.ajaxFileUpload({
		//处理文件上传操作的服务器端地址(可以传参数,已亲测可用)
		url: turl,
		secureuri: false, //是否启用安全提交,默认为false 
		fileElementId: inputid, //文件选择框的id属性
		data: param,
		dataType: 'json', //服务器返回的格式,可以是json或xml等
		success: function (data) { //服务器响应成功时的处理函数
			closeShow();
			if (sfunName == null) {
				iamssuccess(data, sExtSFunName, sExtEFunName);
			} else {
				func = function () {};
				func = eval(sfunName);
				func(data);
			}
		},
		error: function (data, status, e) { //服务器响应失败时的处理函数
			closeShow();
			if (efunName == null) {
				iamserror();
			} else {
				func = function () {};
				func = eval(efunName);
				func();
			}
		}
	});
}

//不能为空的校验
//目前没有日期类型的校验，后续加
function checknotnull(compentid) {

	for (var i = 0; i < compentid.length; i++) {
		if (compentid[i].attr("class") == null) {
			$.messager.alert('debug提示', compentid[i].attr("id") + "没有定义class属性", 'error');
			return false;
		}

		if (compentid[i].attr("class") == "txt") {
			if (null == trim(compentid[i].val()) || "" == trim(compentid[i].val())) {
				$.messager.alert('执行失败', compentid[i].attr("notnull") + "不能为空", 'error');
				return false;
			}
		} else if (compentid[i].attr("class").indexOf("easyui-combobox") >= 0) {

			if (trim(compentid[i].combobox('getText')) == null || trim(compentid[i].combobox('getText')) == "") {
				$.messager.alert('执行失败', compentid[i].attr("notnull") + "不能为空", 'error');
				return false;
			}

			/*以后会存在很多定义的是一样的
			if(compentid[i].combobox('getText')==compentid[i].combobox('getValue')){
				$.messager.alert('执行失败',compentid[i].attr("notnull")+"请从下拉列表中进行选择",'error');
				return false;
				
			}
			*/
		} else if (compentid[i].attr("class").indexOf("easyui-datebox") >= 0) {
			if (trim(compentid[i].datebox("getValue")) == null || trim(compentid[i].datebox("getValue")) == "") {
				$.messager.alert('执行失败', compentid[i].attr("notnull") + "不能为空", 'error');
				return false;
			}
		} else {
			$.messager.alert('debug提示', "没有定义class为" + compentid[i].attr("class") + "的非空校验", 'error');
			return false;
		}

	}
	return true;
}

function prepareparam(compentid) {
	var sParam = new Object();
	for (var i = 0; i < compentid.length; i++) {
		if (compentid[i].attr("class") == null) {
			$.messager.alert('debug提示', compentid[i].attr("id") + "没有定义class属性", 'error');
			return false;
		}

		if (compentid[i].attr("class") == "txt") {
			sParam[compentid[i].attr("id")] = compentid[i].val();
		} else if (compentid[i].attr("class").indexOf("easyui-combobox") >= 0) {
			sParam[compentid[i].attr("id")] = compentid[i].combobox('getValue');
		} else if (compentid[i].attr("class").indexOf("easyui-datebox") >= 0) {
			if (compentid[i].datebox("getValue") != null && compentid[i].datebox("getValue") != "") {
				sParam[compentid[i].attr("id")] = new Date(compentid[i].datebox("getValue"));
			} else {

			}
		} else {
			$.messager.alert('debug提示', "没有定义class为" + compentid[i].attr("class") + "的自动取值", 'error');
			return false;
		}
	}
	return sParam;
}

function cleardata(compentList) {
	for (var i = 0; i < compentList.length; i++) {
		if (compentList[i].attr("class") == null) {
			$.messager.alert('debug提示', compentList[i].attr("id") + "没有定义class属性", 'error');
			return false;
		}

		if (compentList[i].attr("class") == "txt") {
			compentList[i].val("");
		} else if (compentList[i].attr("class").indexOf("easyui-combobox") >= 0) {
			compentList[i].combobox('setValue', "");
		} else if (compentList[i].attr("class").indexOf("easyui-datebox") >= 0) {
			compentList[i].datebox('setValue', "");
		} else {
			$.messager.alert('debug提示', "没有定义class为" + compentList[i].attr("class") + "的自动取值", 'error');
			return false;
		}
	}
	return true;
}

function doubleDefaultZero(doubleList) {
	for (var i = 0; i < doubleList.length; i++) {
		if (doubleList[i].attr("class") == null) {
			$.messager.alert('debug提示', doubleList[i].attr("id") + "没有定义class属性", 'error');
			return false;
		}

		if (doubleList[i].attr("class") != "txt") {
			$.messager.alert('debug提示', doubleList[i].attr("id") + "是double类型的，但是class不是txt", 'error');
			return false;
		} else {
			if (doubleList[i].val() == null || doubleList[i].val() == "") {
				doubleList[i].val("0");
			}
		}
	}
	return true;
}

//简单sql的公共combox
function disComBox(comboxId, comboxType, tparam) {
	var tturl = "combox/disComBox.do?comboxType=" + comboxType;

	displayCombox(comboxId, tparam, tturl, "dd_key", "dd_value");
}

function checkCardId(socialNo) {
	if (socialNo == "0") {
		return true;
	}

	if (socialNo.substr(0, 10) == "0000000000") {
		return true;
	}

	if (socialNo == "") {
		$.messager.alert('操作提示', '输入身份证号码不能为空！', 'error');
		return (false);
	}

	if (socialNo.length != 15 && socialNo.length != 18) {
		$.messager.alert('操作提示', '输入身份证号码格式不正确！', 'error');
		return (false);
	}

	var area = {
		11: "北京",
		12: "天津",
		13: "河北",
		14: "山西",
		15: "内蒙古",
		21: "辽宁",
		22: "吉林",
		23: "黑龙江",
		31: "上海",
		32: "江苏",
		33: "浙江",
		34: "安徽",
		35: "福建",
		36: "江西",
		37: "山东",
		41: "河南",
		42: "湖北",
		43: "湖南",
		44: "广东",
		45: "广西",
		46: "海南",
		50: "重庆",
		51: "四川",
		52: "贵州",
		53: "云南",
		54: "西藏",
		61: "陕西",
		62: "甘肃",
		63: "青海",
		64: "宁夏",
		65: "新疆",
		71: "台湾",
		81: "香港",
		82: "澳门",
		91: "国外"
	};

	if (area[parseInt(socialNo.substr(0, 2))] == null) {
		$.messager.alert('操作提示', '身份证号码不正确(地区非法)！', 'error');
		return (false);
	}

	if (socialNo.length == 15) {
		pattern = /^\d{15}$/;
		if (pattern.exec(socialNo) == null) {
			$.messager.alert('操作提示', '15位身份证号码必须为数字！', 'error');
			return (false);
		}
		var birth = parseInt("19" + socialNo.substr(6, 2));
		var month = socialNo.substr(8, 2);
		var day = parseInt(socialNo.substr(10, 2));
		switch (month) {
			case '01':
			case '03':
			case '05':
			case '07':
			case '08':
			case '10':
			case '12':
				if (day > 31) {
					$.messager.alert('操作提示', '输入身份证号码不格式正确！', 'error');
					return false;
				}
				break;
			case '04':
			case '06':
			case '09':
			case '11':
				if (day > 30) {
					$.messager.alert('操作提示', '输入身份证号码不格式正确！', 'error');
					return false;
				}
				break;
			case '02':
				if ((birth % 4 == 0 && birth % 100 != 0) || birth % 400 == 0) {
					if (day > 29) {
						$.messager.alert('操作提示', '输入身份证号码不格式正确！', 'error');
						return false;
					}
				} else {
					if (day > 28) {
						$.messager.alert('操作提示', '输入身份证号码不格式正确！', 'error');
						return false;
					}
				}
				break;
			default:
				$.messager.alert('操作提示', '输入身份证号码不格式正确！', 'error');
				return false;
		}

		var nowYear = new Date().getYear();

		if (nowYear - parseInt(birth) < 15 || nowYear - parseInt(birth) > 100) {
			$.messager.alert('操作提示', '输入身份证号码不格式正确！', 'error');
			return false;
		}
		return true;
	}

	var Wi = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2, 1);
	var lSum = 0;
	var nNum = 0;
	var nCheckSum = 0;

	for (i = 0; i < 17; ++i) {
		if (socialNo.charAt(i) < '0' || socialNo.charAt(i) > '9') {
			$.messager.alert('操作提示', '输入身份证号码不格式正确！', 'error');
			return false;
		} else {
			nNum = socialNo.charAt(i) - '0';
		}
		lSum += nNum * Wi[i];
	}

	if (socialNo.charAt(17) == 'X' || socialNo.charAt(17) == 'x') {
		lSum += 10 * Wi[17];
	} else if (socialNo.charAt(17) < '0' || socialNo.charAt(17) > '9') {
		$.messager.alert('操作提示', '输入身份证号码不格式正确！', 'error');
		return false;
	} else {
		lSum += (socialNo.charAt(17) - '0') * Wi[17];
	}

	if ((lSum % 11) == 1) {
		return true;
	} else {
		$.messager.alert('操作提示', '输入身份证号码不格式正确！', 'error');
		return false;
	}
}

function getBirthdatByIdNo(iIdNo) {
	if (iIdNo == "0") {
		return "";
	}

	if (iIdNo.substr(0, 10) == "0000000000") {
		return "";
	}

	var tmpStr = "";
	var strReturn = "";

	iIdNo = trim(iIdNo);

	if ((iIdNo.length != 15) && (iIdNo.length != 18)) {
		strReturn = "输入的身份证号位数错误";
		return strReturn;
	}

	if (iIdNo.length == 15) {
		tmpStr = iIdNo.substring(6, 12);
		tmpStr = "19" + tmpStr;
		tmpStr = tmpStr.substring(0, 4) + "-" + tmpStr.substring(4, 6) + "-" + tmpStr.substring(6)

		return tmpStr;
	} else // if (iIdNo.length==18)
	{
		tmpStr = iIdNo.substring(6, 14);
		tmpStr = tmpStr.substring(0, 4) + "-" + tmpStr.substring(4, 6) + "-" + tmpStr.substring(6)

		return tmpStr;
	}
}

function getSexByIDNo(iIdNo) {
	if (iIdNo == "0") {
		return "";
	}

	if (iIdNo.substr(0, 10) == "0000000000") {
		return "";
	}

	var tSex = "";
	var strReturn = "";
	if ((iIdNo.length != 15) && (iIdNo.length != 18)) {
		strReturn = "输入的身份证号位数错误";
		return strReturn;
	}
	var tmpInt = 0;
	if (iIdNo.length == 15) {
		tmpInt = parseInt(iIdNo.substring(14));
	}
	if (iIdNo.length == 18) {
		tmpInt = parseInt(iIdNo.substring(16, 17));
	}
	tmpInt = tmpInt % 2;
	if (tmpInt == 0) {
		tSex = "2";
	} else {
		tSex = "1";
	}
	return tSex;
}

function trim(sSrcString) {
	//使用正则表达式进行全局替换
	if (sSrcString != null && typeof (sSrcString) == "string") {
		sSrcString = sSrcString.replace(/(^\s*)|(\s*$)/g, "");
	}
	return sSrcString;
}

function strlength(str) {
	///<summary>获得字符串实际长度，中文2，英文1</summary>
	///<param name="str">要获得长度的字符串</param>
	var realLength = 0,
		len = str.length,
		charCode = -1;
	for (var i = 0; i < len; i++) {
		charCode = str.charCodeAt(i);
		if (charCode >= 0 && charCode <= 128) realLength += 1;
		else realLength += 2;
	}
	return realLength;
}

function DocNoCheck(startno, endno) {
	if (startno == '' || endno == '') {
		$.messager.alert('操作提示', '起止号码都不能为空！', 'error');
		return false;
	}

	if (startno.length != endno.length) {
		$.messager.alert('操作提示', '起止号码的长度不一致！', 'error');
		return false;
	}
	if (!isDocNo(startno)) {
		$.messager.alert('操作提示', '起始号码格式非法，编号的开头可以是字母或者数字，其后只能是数字流水号！', 'error');
		return false;
	}
	if (!isDocNo(endno)) {
		$.messager.alert('操作提示', '终止号码格式非法，编号的开头可以是字母或者数字，其后只能是数字流水号！', 'error');
		return false;
	}

	var patrn = /[a-zA-Z]/;
	var abcLength = 0;
	for (var i = 0; i < startno.length; i++) {
		if (patrn.exec(startno.substring(i, i + 1)) != null) {
			abcLength = abcLength + 1;
			if (startno.substring(i, i + 1) != endno.substring(i, i + 1)) {
				$.messager.alert('操作提示', '起止号码的开头字母不一致！', 'error');
				return false;
			}
		}
	}
	for (var i = abcLength; i < endno.length; i++) {
		if (patrn.exec(endno.substring(i, i + 1)) != null) {
			if (startno.substring(i, i + 1) != endno.substring(i, i + 1)) {
				$.messager.alert('操作提示', '起止号码的开头字母不一致！', 'error');
				return false;
			}
		}
	}
	return true;
}
//编号的开头可以是字母，而后只能是数字流水号
function isDocNo(startNo) {
	var patrn = /^[a-zA-Z]*[0-9]+$/;
	if (patrn.exec(startNo) == null) {
		return false;
	}
	return true;
}

function validatemobile(mobile) {
	if (mobile == null || mobile == "") {
		$.messager.alert('操作提示', '请输入手机号码！', 'error');
		return false;
	}

	if (mobile.length == 0) {
		$.messager.alert('操作提示', '请输入手机号码！', 'error');
		return false;
	}

	if (mobile.length != 11) {
		$.messager.alert('操作提示', '请输入有效的手机号码！', 'error');
		return false;
	}

	var myreg = /^0?1[3|4|5|6|7|8|9][0-9]\d{8}$/;
	if (!myreg.test(mobile)) {
		$.messager.alert('操作提示', '请输入有效的手机号码！', 'error');
		return false;
	}
	return true;
}

function checkPercentage(percentage) {
	var patrn = new RegExp(/^(100|[1-9]?\d(\.\d\d?)?)%$/);

	var checkresult = patrn.test(percentage);
	if (checkresult) {
		return true;
	}

	return false
}

function getMonthOneFormatDate() {
	var date = new Date();

	var seperator1 = "-";
	var year = date.getFullYear();
	var month = date.getMonth() + 1;
	var strDate = date.getDate();
	if (month >= 1 && month <= 9) {
		month = "0" + month;
	}
	if (strDate >= 0 && strDate <= 9) {
		strDate = "0" + strDate;
	}
	var currentdate = year + seperator1 + month + seperator1 + "01";
	return currentdate;
}

function getLastMonthOneFormatDate() {
	var date = new Date();

	var seperator1 = "-";
	var year = date.getFullYear();
	var month = date.getMonth();

	if (month == 0) {
		year = year - 1;
		month = 12;
	}

	if (month >= 1 && month <= 9) {
		month = "0" + month;
	}

	var currentdate = year + seperator1 + month + seperator1 + "01";
	return currentdate;
}

function getCurrentDate() {
	var date = new Date();

	var seperator1 = "-";
	var year = date.getFullYear();
	var month = date.getMonth() + 1;
	var strDate = date.getDate();
	if (month >= 1 && month <= 9) {
		month = "0" + month;
	}
	if (strDate >= 0 && strDate <= 9) {
		strDate = "0" + strDate;
	}
	var currentdate = year + seperator1 + month + seperator1 + strDate;
	return currentdate;
}

function getNextMonthOneFormatDate() {
	var date = new Date();

	var seperator1 = "-";
	var year = date.getFullYear();
	var month = date.getMonth() + 2;

	if (month >= 1 && month <= 9) {
		month = "0" + month;
	}

	if (month == 13) {
		year = parseInt(year) + 1;
		month = 1;
	}

	var currentdate = year + seperator1 + month + seperator1 + "01";
	return currentdate;
}

function getLastMonthOne() {
	var date = new Date();

	var seperator1 = "-";
	var year = date.getFullYear();
	var month = date.getMonth();
	var strDate = date.getDate();
	if (month >= 1 && month <= 9) {
		month = "0" + month;
	} else if (month == 0) {
		month = "12";
		year = year - 1;
	}

	if (strDate >= 0 && strDate <= 9) {
		strDate = "0" + strDate;
	}
	var currentdate = year + seperator1 + month + seperator1 + "01";
	return currentdate;
}


function getCurrentMonth() {
	var date = new Date();

	var seperator1 = "-";
	var year = date.getFullYear();
	var month = date.getMonth() + 1;

	if (month >= 1 && month <= 9) {
		month = "0" + month;
	}

	var currentmonth = year + seperator1 + month;
	return currentmonth;
}

function getQueryString(name) {
	var reg = new RegExp('(^|&)' + name + '=([^&]*)(&|$)', 'i');
	var r = window.location.search.substr(1).match(reg);
	if (r != null) {
		return unescape(r[2]);
	}
	return null;
}

// 返回当前时间7天前的日期
function getSevenDaysAgo() {
    const currentDate = new Date();
    currentDate.setDate(currentDate.getDate() - 7); // 当前日期减去7天

    const year = currentDate.getFullYear();
    const month = String(currentDate.getMonth() + 1).padStart(2, '0'); // 月份从0开始，需加1并补零
    const day = String(currentDate.getDate()).padStart(2, '0'); // 补零

    return `${year}-${month}-${day}`; // 返回格式化的日期
}


// val 是要复制的内容

function copyText(val) {
	if (val !== "undefined" && val !== '' && val !== null) {
		navigator.clipboard.writeText(val).then(() => {
			$.messager.alert('消息提示', '数据已复制到剪贴板', 'info');
		}).catch(() => {
			$.messager.alert('消息提示', '复制失败，请手动复制', 'info');
		});
	} else {
		$.messager.alert('消息提示', '该数据没有链接', 'warning');
	}
}



