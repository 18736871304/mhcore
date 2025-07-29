<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%>

<head>
	<title></title>
	<link rel="stylesheet" href="../../../../css/inputbox/line6.css">
	<script>
		window.onload = function () {
			// initDataGrid20($('#newMedium'));
			newMediumList()
		}

		function aftercodeselect(comboxid) {

		}

		function selectone() {}

		function saveSuss() {}

		function clearInputData() {

		}




		function newMediumList() {
			$('#newMedium').datagrid({
				title: '',
				collapsible: true,
				singleSelect: true,
				nowrap: true,
				loadMsg: "数据加载中......",
				onLoadSuccess: function (data) {
					$(this).datagrid("autoMergeCells");
				}
			})
			var p = $('#newMedium').datagrid('getPager');
			$(p).pagination({
				pagesize: 30, //每页显示的记录条数，默认为10
				pageList: [30], //可以设置每页记录条数的列表
				beforePageText: "第", //页数文本框前显示的汉字
				afterPageText: '页 共{pages}页',
				displayMsg: '当前显示{from}-{to}条记录 共{total} 条',
				ishowPageList: false,
				showRefresh: false,
				// onSelectPage: function (pageNumber, pageSize) {
				// 	param.totalRecord = gridid.datagrid('getData')['total'];
				// 	param.pageNumber = pageNumber;
				// 	param.pageSize = pageSize;
				// 	gridid.datagrid('reload', param);
				// }
			})



			var newMediumList = [{

					"activityCode": "自营知乎&公众号全量",
					"newMedia": "知乎",
					"accountName": "三文读财",
					"resourceType": "重疾",
					"channelCode": "8d93ef45d6e011ee927700163e123e09",
					"channelLink": "https://work.weixin.qq.com/ca/cawcde0b4391a2966f?comp_scene=ENC4kGvjdMP4G5hX7i1gYTDrx&customer_channel=8d93ef45d6e011ee927700163e123e09&cb=__CALLBACK__",
					"channelQRCode": '',
					"linkRemark": '',
				},
				{
					"activityCode": "自营知乎&公众号全量",
					"newMedia": "知乎",
					"accountName": "三文读财",
					"resourceType": "理财",
					"channelCode": "4e40e865d6e111ee927700163e123e09",
					"channelLink": "https://work.weixin.qq.com/ca/cawcde06bd4de53abf?comp_scene=ENCNrbFPFSQCnVcdKPNKh9Ckz&customer_channel=4e40e865d6e111ee927700163e123e09&cb=__CALLBACK__",
					"channelQRCode": '',
					"linkRemark": '',
				},
				{
					"activityCode": "自营知乎&公众号全量",
					"newMedia": "知乎",
					"accountName": "三文读保",
					"resourceType": "重疾",
					"channelCode": "63e0bee0d6e111ee927700163e123e09",
					"channelLink": "https://work.weixin.qq.com/ca/cawcde0b4391a2966f?comp_scene=ENC4kGvjdMP4G5hX7i1gYTDrx&customer_channel=63e0bee0d6e111ee927700163e123e09&cb=__CALLBACK__",
					"channelQRCode": '',
					"linkRemark": '',
				},
				{
					"activityCode": "自营知乎&公众号全量",
					"newMedia": "知乎",
					"accountName": "三文读保",
					"resourceType": "理财",
					"channelCode": "6143e59fd6e111ee927700163e123e09",
					"channelLink": "https://work.weixin.qq.com/ca/cawcde06bd4de53abf?comp_scene=ENCNrbFPFSQCnVcdKPNKh9Ckz&customer_channel=6143e59fd6e111ee927700163e123e09&cb=__CALLBACK__",
					"channelQRCode": '',
					"linkRemark": '',
				},
				{
					"activityCode": "自营知乎&公众号全量",
					"newMedia": "知乎",
					"accountName": "三文说保险",
					"resourceType": "重疾",
					"channelCode": "a2310197d6e111ee927700163e123e09",
					"channelLink": "https://work.weixin.qq.com/ca/cawcde0b4391a2966f?comp_scene=ENC4kGvjdMP4G5hX7i1gYTDrx&customer_channel=a2310197d6e111ee927700163e123e09&cb=__CALLBACK__",
					"channelQRCode": '',
					"linkRemark": '',
				},
				{
					"activityCode": "自营知乎&公众号全量",
					"newMedia": "知乎",
					"accountName": "三文说保险",
					"resourceType": "理财",
					"channelCode": "a63c166dd6e111ee927700163e123e09",
					"channelLink": "https://work.weixin.qq.com/ca/cawcde06bd4de53abf?comp_scene=ENCNrbFPFSQCnVcdKPNKh9Ckz&customer_channel=a63c166dd6e111ee927700163e123e09&cb=__CALLBACK__",
					"channelQRCode": '',
					"linkRemark": '',
				},
				{
					"activityCode": "自营知乎&公众号全量",
					"newMedia": "知乎",
					"accountName": "三文探险",
					"resourceType": "重疾",
					"channelCode": "c612e370d6e111ee927700163e123e09",
					"channelLink": "https://work.weixin.qq.com/ca/cawcde0b4391a2966f?comp_scene=ENC4kGvjdMP4G5hX7i1gYTDrx&customer_channel=c612e370d6e111ee927700163e123e09&cb=__CALLBACK__",
					"channelQRCode": '',
					"linkRemark": '',
				},
				{
					"activityCode": "自营知乎&公众号全量",
					"newMedia": "知乎",
					"accountName": "三文探险",
					"resourceType": "理财",
					"channelCode": "c87285ddd6e111ee927700163e123e09",
					"channelLink": "https://work.weixin.qq.com/ca/cawcde06bd4de53abf?comp_scene=ENCNrbFPFSQCnVcdKPNKh9Ckz&customer_channel=c87285ddd6e111ee927700163e123e09&cb=__CALLBACK__",
					"channelQRCode": '',
					"linkRemark": '',
				},
				{
					"activityCode": "自营知乎&公众号全量",
					"newMedia": "公众号",
					"accountName": "天眼保",
					"resourceType": "重疾",
					"channelCode": "07e1e1f4d6e211ee927700163e123e09",
					"channelLink": "https://work.weixin.qq.com/ca/cawcde0b4391a2966f?customer_channel=07e1e1f4d6e211ee927700163e123e09",
					"channelQRCode": 'gzh_tyb01.zip',
					"linkRemark": 'https://mp.weixin.qq.com/s/1nRmzIjNLPlP9r-8byUN9Q',
				},
				{
					"activityCode": "自营知乎&公众号全量",
					"newMedia": "公众号",
					"accountName": "天眼保",
					"resourceType": "理财",
					"channelCode": "0aae126cd6e211ee927700163e123e09",
					"channelLink": "https://work.weixin.qq.com/ca/cawcde06bd4de53abf?customer_channel=0aae126cd6e211ee927700163e123e09",
					"channelQRCode": 'gzh_tyb02.zip',
					"linkRemark": 'https://mp.weixin.qq.com/s/CJsFJYmlSXudFJyH0qeRvw',
				},
				{
					"activityCode": "自营知乎&公众号全量",
					"newMedia": "公众号",
					"accountName": "读财小生",
					"resourceType": "重疾",
					"channelCode": "67f49b66d6e211ee927700163e123e09",
					"channelLink": "https://work.weixin.qq.com/ca/cawcde0b4391a2966f?customer_channel=67f49b66d6e211ee927700163e123e09",
					"channelQRCode": 'gzh_dcxs01.zip',
					"linkRemark": 'https://mp.weixin.qq.com/s/SgJbi8BXXT5N-lWcqo6_-w',
				},
				{
					"activityCode": "自营知乎&公众号全量",
					"newMedia": "公众号",
					"accountName": "读财小生",
					"resourceType": "理财",
					"channelCode": "6a3bb91cd6e211ee927700163e123e09",
					"channelLink": "https://work.weixin.qq.com/ca/cawcde06bd4de53abf?customer_channel=6a3bb91cd6e211ee927700163e123e09",
					"channelQRCode": 'gzh_dcxs02.zip',
					"linkRemark": 'https://mp.weixin.qq.com/s/Ouvw7vjf3q2_ai3nVZFlog',
				},
				{
					"activityCode": "自营知乎&公众号全量",
					"newMedia": "公众号",
					"accountName": "美华保险咨询",
					"resourceType": "重疾",
					"channelCode": "8956cd7dd6e211ee927700163e123e09",
					"channelLink": "https://work.weixin.qq.com/ca/cawcde0b4391a2966f?customer_channel=8956cd7dd6e211ee927700163e123e09",
					"channelQRCode": 'gzh_mhbxzx01.zip',
					"linkRemark": 'https://mp.weixin.qq.com/s/30xRbBkEj0m0xDrG-O5ZfQ',
				},
				{
					"activityCode": "自营知乎&公众号全量",
					"newMedia": "公众号",
					"accountName": "美华保险咨询",
					"resourceType": "理财",
					"channelCode": "8b9433ccd6e211ee927700163e123e09",
					"channelLink": "https://work.weixin.qq.com/ca/cawcde06bd4de53abf?customer_channel=8b9433ccd6e211ee927700163e123e09",
					"channelQRCode": 'gzh_mhbxzx02.zip',
					"linkRemark": 'https://mp.weixin.qq.com/s/Mfxmf3XBsnkiXHelnj7StQ',
				},
				{
					"activityCode": "自营知乎&公众号全量",
					"newMedia": "公众号",
					"accountName": "美华保险规划",
					"resourceType": "重疾",
					"channelCode": "a3ba1463d6e211ee927700163e123e09",
					"channelLink": "https://work.weixin.qq.com/ca/cawcde0b4391a2966f?customer_channel=a3ba1463d6e211ee927700163e123e09",
					"channelQRCode": 'gzh_tybcp01.zip',
					"linkRemark": 'https://mp.weixin.qq.com/s/suwaxJL9y8VlKG8NVQcoDw',
				},
				{
					"activityCode": "自营知乎&公众号全量",
					"newMedia": "公众号",
					"accountName": "美华保险规划",
					"resourceType": "理财",
					"channelCode": "a68040b7d6e211ee927700163e123e09",
					"channelLink": "https://work.weixin.qq.com/ca/cawcde06bd4de53abf?customer_channel=a68040b7d6e211ee927700163e123e09",
					"channelQRCode": 'gzh_tybcp02.zip',
					"linkRemark": 'https://mp.weixin.qq.com/s/WgGvWOOslwzwNfQSEOM7XA',
				},
				{
					"activityCode": "自营知乎&公众号全量",
					"newMedia": "公众号",
					"accountName": "公众号-医疗险",
					"resourceType": "重疾",
					"channelCode": "4beffac8682d11f08aaf00163e1ccaeb",
					"channelLink": "https://work.weixin.qq.com/ca/cawcde0b4391a2966f?customer_channel=4beffac8682d11f08aaf00163e1ccaeb",
					"channelQRCode": 'gzh_ylx01.zip',
					"linkRemark": 'https://mp.weixin.qq.com/s/KQm3R24K2eNRFV9Jpyslhw',
				},
				{
					"activityCode": "自营知乎&公众号全量",
					"newMedia": "公众号",
					"accountName": "公众号-医疗险",
					"resourceType": "理财",
					"channelCode": "523e10a4682d11f08aaf00163e1ccaeb",
					"channelLink": "https://work.weixin.qq.com/ca/cawcde06bd4de53abf?customer_channel=523e10a4682d11f08aaf00163e1ccaeb",
					"channelQRCode": '',
					"linkRemark": '',
				},
				{
					"activityCode": "自营小红书全量",
					"newMedia": "小红书",
					"accountName": "美华保险服务",
					"resourceType": "重疾",
					"channelCode": "70ff1b07d6e311ee927700163e123e09",
					"channelLink": "https://work.weixin.qq.com/ca/cawcde0b4391a2966f?customer_channel=70ff1b07d6e311ee927700163e123e09",
					"channelQRCode": 'redBook_meihua01.zip',
					"linkRemark": '',
				},
				{
					"activityCode": "自营小红书全量",
					"newMedia": "小红书",
					"accountName": "美华保险服务",
					"resourceType": "理财",
					"channelCode": "73ba17a7d6e311ee927700163e123e09",
					"channelLink": "https://work.weixin.qq.com/ca/cawcde06bd4de53abf?customer_channel=73ba17a7d6e311ee927700163e123e09",
					"channelQRCode": 'redBook_meihua02.zip',
					"linkRemark": '',
				},
				{
					"activityCode": "自营小红书全量",
					"newMedia": "小红书",
					"accountName": "三文 | 美华保险服务",
					"resourceType": "重疾",
					"channelCode": "a173df63d6e311ee927700163e123e09",
					"channelLink": "https://work.weixin.qq.com/ca/cawcde0b4391a2966f?customer_channel=a173df63d6e311ee927700163e123e09",
					"channelQRCode": 'redBook_sanwen01.zip',
					"linkRemark": '',
				},
				{
					"activityCode": "自营小红书全量",
					"newMedia": "小红书",
					"accountName": "三文 | 美华保险服务",
					"resourceType": "理财",
					"channelCode": "a3bbec25d6e311ee927700163e123e09",
					"channelLink": "https://work.weixin.qq.com/ca/cawcde06bd4de53abf?customer_channel=a3bbec25d6e311ee927700163e123e09",
					"channelQRCode": 'redBook_sanwen02.zip',
					"linkRemark": '',
				},
				{
					"activityCode": "自营小红书全量",
					"newMedia": "小红书",
					"accountName": "天眼保测评",
					"resourceType": "重疾",
					"channelCode": "e09f7738d6e311ee927700163e123e09",
					"channelLink": "https://work.weixin.qq.com/ca/cawcde0b4391a2966f?customer_channel=e09f7738d6e311ee927700163e123e09",
					"channelQRCode": 'redBook_beibei01.zip',
					"linkRemark": '',
				},
				{
					"activityCode": "自营小红书全量",
					"newMedia": "小红书",
					"accountName": "天眼保测评",
					"resourceType": "理财",
					"channelCode": "e2dd0648d6e311ee927700163e123e09",
					"channelLink": "https://work.weixin.qq.com/ca/cawcde06bd4de53abf?customer_channel=e2dd0648d6e311ee927700163e123e09",
					"channelQRCode": 'redBook_beibei02.zip',
					"linkRemark": '',
				},
				{
					"activityCode": "自营小红书全量",
					"newMedia": "小红书",
					"accountName": "一芯讲大公司保险",
					"resourceType": "重疾",
					"channelCode": "82bd068a70ac11ef8aaf00163e1ccaeb",
					"channelLink": "https://work.weixin.qq.com/ca/cawcde0b4391a2966f?customer_channel=82bd068a70ac11ef8aaf00163e1ccaeb",
					"channelQRCode": 'redBook_yixin01.zip',
					"linkRemark": '',
				},

				{
					"activityCode": "自营小红书全量",
					"newMedia": "小红书",
					"accountName": "一芯讲大公司保险",
					"resourceType": "理财",
					"channelCode": "e973370e70ac11ef8aaf00163e1ccaeb",
					"channelLink": "https://work.weixin.qq.com/ca/cawcde06bd4de53abf?customer_channel=e973370e70ac11ef8aaf00163e1ccaeb",
					"channelQRCode": 'redBook_yixin02.zip',
					"linkRemark": '',
				},
				{
					"activityCode": "自营小红书全量",
					"newMedia": "小红书",
					"accountName": "维尼家庭保险规划",
					"resourceType": "重疾",
					"channelCode": "52f4fe8d70ad11ef8aaf00163e1ccaeb",
					"channelLink": "https://work.weixin.qq.com/ca/cawcde0b4391a2966f?customer_channel=52f4fe8d70ad11ef8aaf00163e1ccaeb",
					"channelQRCode": 'redBook_weini01.zip',
					"linkRemark": '',
				},
				{
					"activityCode": "自营小红书全量",
					"newMedia": "小红书",
					"accountName": "维尼家庭保险规划",
					"resourceType": "理财",
					"channelCode": "623c360a70ad11ef8aaf00163e1ccaeb",
					"channelLink": "https://work.weixin.qq.com/ca/cawcde06bd4de53abf?customer_channel=623c360a70ad11ef8aaf00163e1ccaeb",
					"channelQRCode": 'redBook_weini02.zip',
					"linkRemark": '',
				},
				{
					"activityCode": "自营腾讯全量",
					"newMedia": "腾讯",
					"accountName": "信息流广告",
					"resourceType": "重疾",
					"channelCode": "75a2edb8dace11eeaf0f00163e123e09",
					"channelLink": "https://work.weixin.qq.com/ca/cawcde2eba44d28030?customer_channel=75a2edb8dace11eeaf0f00163e123e09",
					"channelQRCode": '',
					"linkRemark": '',
				},
				{
					"activityCode": "自营腾讯全量",
					"newMedia": "腾讯",
					"accountName": "信息流广告",
					"resourceType": "理财",
					"channelCode": "783c1712dace11eeaf0f00163e123e09",
					"channelLink": "https://work.weixin.qq.com/ca/cawcde5911e3677943?customer_channel=783c1712dace11eeaf0f00163e123e09",
					"channelQRCode": '',
					"linkRemark": '',
				},
				{
					"activityCode": "自营腾讯全量",
					"newMedia": "腾讯",
					"accountName": "搜索广告",
					"resourceType": "重疾",
					"channelCode": "7aecb3b1dace11eeaf0f00163e123e09",
					"channelLink": "https://work.weixin.qq.com/ca/cawcde2eba44d28030?customer_channel=7aecb3b1dace11eeaf0f00163e123e09",
					"channelQRCode": '',
					"linkRemark": '',
				},
				{
					"activityCode": "自营腾讯全量",
					"newMedia": "腾讯",
					"accountName": "搜索广告",
					"resourceType": "理财",
					"channelCode": "7e239e34dace11eeaf0f00163e123e09",
					"channelLink": "https://work.weixin.qq.com/ca/cawcde5911e3677943?customer_channel=7e239e34dace11eeaf0f00163e123e09",
					"channelQRCode": '',
					"linkRemark": '',
				},


				{
					"activityCode": "自营梅园移交",
					"newMedia": "其他",
					"accountName": "全量",
					"resourceType": "重疾",
					"channelCode": "688bc051d22a11ef8aaf00163e1ccaeb",
					"channelLink": "https://work.weixin.qq.com/ca/cawcde575b9fbfca54?customer_channel=688bc051d22a11ef8aaf00163e1ccaeb",
					"channelQRCode": '',
					"linkRemark": '',
				},
				{
					"activityCode": "自营梅园移交",
					"newMedia": "其他",
					"accountName": "全量",
					"resourceType": "理财",
					"channelCode": " ",
					"channelLink": "https://work.weixin.qq.com/ca/cawcde20d8f0b4f864",
					"channelQRCode": '',
					"linkRemark": '',
				},




				{
				"activityCode": "自营上海移交",
					"newMedia": "其他",
					"accountName": "全量",
					"resourceType": "重疾",
					"channelCode": "c81f37c9d21c11ef8aaf00163e1ccaeb",
					"channelLink": "https://work.weixin.qq.com/ca/cawcde6e55919351da?customer_channel=c81f37c9d21c11ef8aaf00163e1ccaeb",
					"channelQRCode": '',
					"linkRemark": '',
				},
				
				{
					"activityCode": "自营上海移交",
					"newMedia": "其他",
					"accountName": "全量",
					"resourceType": "理财",
					"channelCode": " ",
					"channelLink": "https://work.weixin.qq.com/ca/cawcdef0f4181228bc",
					"channelQRCode": '',
					"linkRemark": '',
				},


				{
					"activityCode": "自营官网",
					"newMedia": "官网",
					"accountName": "百度  ",
					"resourceType": "重疾",
					"channelCode": "e09182ece47e11ef8aaf00163e1ccaeb",
					"channelLink": "https://work.weixin.qq.com/ca/cawcde0b4391a2966f?customer_channel=e09182ece47e11ef8aaf00163e1ccaeb",
					"channelQRCode": '',
					"linkRemark": '',
				},
				{
					"activityCode": "自营官网",
					"newMedia": "官网",
					"accountName": "百度  ",
					"resourceType": "理财",
					"channelCode": "e8f9c1d3e47e11ef8aaf00163e1ccaeb",
					"channelLink": "https://work.weixin.qq.com/ca/cawcde06bd4de53abf?customer_channel=e8f9c1d3e47e11ef8aaf00163e1ccaeb",
					"channelQRCode": '',
					"linkRemark": '',
				},


				{
					"activityCode": "自营线下广告",
					"newMedia": "其他",
					"accountName": "小雨伞大黄蜂  ",
					"resourceType": "重疾",
					"channelCode": "ec609922e9b811ef8aaf00163e1ccaeb",
					"channelLink": "https://work.weixin.qq.com/ca/cawcde64a057debad1?customer_channel=ec609922e9b811ef8aaf00163e1ccaeb",
					"channelQRCode": '',
					"linkRemark": '',
				},
				{
					"activityCode": "自营线下广告",
					"newMedia": "其他",
					"accountName": "小雨伞大黄蜂  ",
					"resourceType": "理财",
					"channelCode": "f8310af2e9b811ef8aaf00163e1ccaeb",
					"channelLink": "https://work.weixin.qq.com/ca/cawcdea6ba8e9a841d?customer_channel=f8310af2e9b811ef8aaf00163e1ccaeb",
					"channelQRCode": '',
					"linkRemark": '',
				},

			






			]
			$('#newMedium').datagrid('loadData', newMediumList); //将数据绑定到datagrid
		}



		function QRCodeDown(val, row, index) {
			if (row.channelQRCode != '') {
				return '<a  href="/upload/mediaLinkCode/' + row.channelQRCode + '" >点击下载' + row.channelQRCode + ' </a>';
			}

		}
		//合并单元格
		$.extend($.fn.datagrid.methods, {
			autoMergeCells: function (jq, fields) {
				return jq.each(function () {
					var target = $(this);
					if (!fields) {
						fields = target.datagrid("getColumnFields");
					}
					var rows = target.datagrid("getRows");
					var i = 0,
						j = 0,
						temp = {};
					for (i; i < rows.length; i++) {
						var row = rows[i];
						j = 0;
						for (j; j < fields.length; j++) {
							var field = fields[j];
							var tf = temp[field];
							if (!tf) {
								tf = temp[field] = {};
								tf[row[field]] = [i];
							} else {
								var tfv = tf[row[field]];
								if (tfv) {
									tfv.push(i);
								} else {
									tfv = tf[row[field]] = [i];
								}
							}
						}
					}
					$.each(temp,
						function (field, colunm) {
							$.each(colunm,
								function () {
									var group = this;

									if (group.length > 1) {
										var before, after, megerIndex = group[0];
										for (var i = 0; i < group.length; i++) {
											before = group[i];
											after = group[i + 1];
											if (after && (after - before) == 1) {
												continue;
											}
											var rowspan = before - megerIndex + 1;
											if (rowspan > 1) {
												target.datagrid('mergeCells', {
													index: megerIndex,
													field: field,
													rowspan: rowspan
												});
											}
											if (after && (after - before) != 1) {
												megerIndex = after;
											}
										}
									}
								});
						});
				});
			}
		});
	</script>
</head>

<body>
	<div style="margin-left:0%">
		<table id="newMedium" class="easyui-datagrid" title="新媒体" style="width:auto;height:auto"
			data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone">
			<thead>
				<tr>
					<th data-options="field:'activityCode',width:120">渠道活码</th>
					<th data-options="field:'newMedia',width:60">渠道类型</th>
					<th data-options="field:'accountName',width:120">流量来源</th>
					<th data-options="field:'resourceType',width:60">资源类型</th>
					<th data-options="field:'channelCode',width:230">渠道码</th>
					<th data-options="field:'channelLink',width:980">渠道链接</th>
					<th data-options="field:'channelQRCode',width:180,formatter:QRCodeDown">二维码下载</th>
					<th data-options="field:'linkRemark'">备注</th>

				</tr>
			</thead>
		</table>
		<br>
	</div>
</body>





</html>