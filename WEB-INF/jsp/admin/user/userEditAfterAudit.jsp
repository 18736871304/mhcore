<%@ page contentType="text/html;charset=utf-8"%>
<html>
<%@ include file="/WEB-INF/common/include.jsp"%>

<head>
	<script type="text/javascript" src="baidu_ue/ueditor.config.js"></script>
	<!-- 编辑器源码文件 -->
	<script type="text/javascript" src="baidu_ue/ueditor.all.js"></script>
	<title></title>
	<link rel="stylesheet" href="../../../../css/inputbox/line6.css?v=202302">

  <link rel="stylesheet" href="../../../../js/usertypeIn/cropper.min.css" type="text/css" />
  <link rel="stylesheet" href="../../../../js/usertypeIn/ImgCropping.css" type="text/css" />
  <script src="../../../../js/usertypeIn/cropper.min.js"></script>

  <style>
    .htmleaf-container{
      display: flex;
    }
    #clipArea {
      padding: 0 30px 30px 0;
      height: 300px;
    }
    #file{
      background: #fff;
    }
    #view {
      margin-left: 20px;
      background-color: #eee !important;
    }
    .tailoring-container .tailoring-content {
          position: absolute;
          width: 768px;
          height: 560px;
          background: #fff;
          z-index: 1002;
          left: 50%;
          top: 50%;
          margin-left: -384px;
          margin-top: -280px;
          border-radius: 10px;
          box-shadow: 0 0 10px #000;
          padding: 10px;
        }
  </style>

	<script>
     //弹出图片裁剪框
     function replaceImg(idName) {
          $('#tailoringImg').cropper("destroy");//销毁cropper
          img = idName
          $(".tailoring-container").toggle();
          if (idName == "photo_url01") {
            $('#tailoringImg').cropper({
              viewMode: 0,//限制裁切框不能超出图片的范围
              aspectRatio: 300 / 400,//默认比例
              preview: '.previewImg',//预览视图
              guides: true,  //裁剪框的虚线(九宫格)
              autoCropArea: 1,  //0-1之间的数值，定义自动剪裁区域的大小，默认0.8
              // movable: false, //是否允许移动图片
              dragCrop: false,  //是否允许移除当前的剪裁框，并通过拖动来新建一个剪裁框区域
              movable: false,  //是否允许移动剪裁框
              resizable: false,  //是否允许改变裁剪框的大小
              zoomable: false,  //是否允许缩放图片大小
              mouseWheelZoom: false,  //是否允许通过鼠标滚轮来缩放图片
              rotatable: true,  //是否允许旋转图片
              dragMode: "none",//仅拖动裁剪框
              // fixedNumber: [7, 5],//截图框的宽高比例
              crop: function (e) {
              }
            });
          } else {
            $('#tailoringImg').cropper({
              viewMode: 0,//限制裁切框不能超出图片的范围
              aspectRatio: 475 / 300,//默认比例
              preview: '.previewImg',//预览视图
              guides: true,  //裁剪框的虚线(九宫格)
              autoCropArea: 1,  //0-1之间的数值，定义自动剪裁区域的大小，默认0.8
              // movable: false, //是否允许移动图片
              dragCrop: false,  //是否允许移除当前的剪裁框，并通过拖动来新建一个剪裁框区域
              movable: false,  //是否允许移动剪裁框
              resizable: false,  //是否允许改变裁剪框的大小
              zoomable: false,  //是否允许缩放图片大小
              mouseWheelZoom: false,  //是否允许通过鼠标滚轮来缩放图片
              rotatable: true,  //是否允许旋转图片
              dragMode: "none",//仅拖动裁剪框
              // fixedNumber: [7, 5],//截图框的宽高比例
              crop: function (e) {
              }
            });
          }
        }
        let img = ''//用来判断点击的哪个
        //图像上传
        function selectImg(file) {
          if (!file.files || !file.files[0]) {
            file.files[0] = {}
            // return;
          }
          var reader = new FileReader();
          reader.onload = function (evt) {
            var replaceSrc = evt.target.result;
            //更换cropper的图片
            $('#tailoringImg').cropper('replace', replaceSrc, false);//默认false，适应高度，不失真
          }
          reader.readAsDataURL(file.files[0]);
        }
        //裁剪后的处理
        function sureCut() {
          if ($("#tailoringImg").attr("src") == null) {
            return false;
          } else {
            var cas = $('#tailoringImg').cropper('getCroppedCanvas');//获取被裁剪后的canvas
            var base64url = cas.toDataURL('image/png'); //转换为base64地址形式
            var file = base64toFile(base64url)
            $('#tailoringImg').cropper("destroy");
            imgUpload(file)
            // //关闭裁剪框
            closeTailor();
          }
        };
        // 关闭裁剪框
        function closeTailor() {
          $(".tailoring-container").toggle();
        }
        // 旋转
        function rotateBtn() {
          $('#tailoringImg').cropper("rotate", 45);
        }
        //复位
        function resetBtn() {
          $('#tailoringImg').cropper("reset");
        }
        //换向
        var flagX = true;
        function resetBtn() {
          if (flagX) {
            $('#tailoringImg').cropper("scaleX", -1);
            flagX = false;
          } else {
            $('#tailoringImg').cropper("scaleX", 1);
            flagX = true;
          }
          flagX != flagX;
        };

        function base64toFile(dataurl) {
          let arr = dataurl.split(',');
          let mime = arr[0].match(/:(.*?);/)[1];
          // suffix是该文件的后缀
          let suffix = mime.split('/')[1];
          console.log(suffix)
          // atob 对经过 base-64 编码的字符串进行解码
          let bstr = atob(arr[1]);
          // n 是解码后的长度
          let n = bstr.length;
          // Uint8Array 数组类型表示一个 8 位无符号整型数组 初始值都是 数子0
          let u8arr = new Uint8Array(n);
          // charCodeAt() 方法可返回指定位置的字符的 Unicode 编码。这个返回值是 0 - 65535 之间的整数
          while (n--) {
            u8arr[n] = bstr.charCodeAt(n);
          }
          // new File返回File对象 第一个参数是 ArraryBuffer 或 Bolb 或Arrary 第二个参数是文件名
          // 第三个参数是 要放到文件中的内容的 MIME 类型
          return new File([u8arr], `1.png`, {
            type: mime,
          });
        }


			var imgUrl={}
		function imgUpload(fileData) {
			var formData = new FormData();
			formData.append("myFile", fileData);
			$.ajax({
				url: 'impUpload.do',
				type: "post",
				async: true,
				data: formData,
				contentType: false,
				processData: false,
				success: function (data) {
				
					var obj = JSON.parse(data);
          $('#' + img).attr("src", 'https://insure.meihualife.com' + obj.message)
              $('#' + img).css('display', 'block')
              if (img == 'photo_url01') {
                imgUrl.photourl = obj.message
              } else if (img == 'photo_url02') {
                imgUrl.idcardfronturl = obj.message
              } else if (img == 'photo_url03') {
                imgUrl.idcardbankurl = obj.message
              } else if (img == 'photo_url04') {
                imgUrl.degreeurl = obj.message
              } else if (img == 'photo_url05') {
                imgUrl.othercertifyurl = obj.message
              }
				},
				error: function (data) {},
				beforeSend: function () {
					showDiv();
				},
				complete: function () {
					closeShow();
				}
			});
		}

	

		var inputList;
		var checkList;
		var psd_checkList;


		window.onload = function () {


			initDataGrid($('#userList'));

			inputList = [
				//$('#usercode'),
				$('#realname'),
				$('#mobilenumber'),
				$('#cardno'),
				$('#phoneno'),

				$('#organcode'),
				$('#teamid'),
				$('#usergrade'),
				//$("#entrydate"),
				$('#password'),

				$('#certifno'),
				$('#position'),

				$('#rgtprovince'),
				$('#rgtcity'),
				$('#rgtcountry'),

				$('#nationality'),
				$('#marriage'),
				$('#polityvisage'),
				$('#degree'),
				$('#graduateschool'),
				$('#speciality'),
				$('#isdorm'),
				$('#familylinker'),
				$('#familyrelation'),
				$('#familylinkphone'),
				$('#contracttype'),
				//$('#contractenddate'),
				$('#bankcardno'),
				// $('#fileName01'),
				// $('#fileName02'),
				// $('#fileName03'),
				// $('#fileName04'),
				// $('#fileName05'),
				$('#dimissiondate'),
				$('#reason')
			];

			checkList = [
				//$('#usercode'),

			];

			psd_checkList = [
				$('#password'),
				$('#psdconfirm')
			];

			disComBox($('#nationality'), "nationality", null);
			disComBox($('#marriage'), "marriage", null);
			disComBox($('#polityvisage'), "polityvisage", null);
			disComBox($('#degree'), "degree", null);
			disComBox($('#contracttype'), "contracttype", null);
			disComBox($('#isdorm'), "yesno", null);
			disComBox($('#familyrelation'), "familyrelation", null);
			disComBox($('#usergrade'), "usergrade", null);
			disComBox($('#position'), "position", null);
			disComBox($('#rgtprovince'), "province", null);

			initUserQuery("('02','04','09')")
			dlgTeamInit();
			userDetailDlgInit();
			
			var usercode_url = "user/getUserCode.do";
			displayCombox($('#usercode_combox'), null, usercode_url, "dd_key", "dd_value");
			
			$('#menudisplaydlg').dialog('close');
			$('#usercode_combox').next(".combo").hide();
			$('#reason').val("");
		}

		function aftercodeselect(comboxid) {
			if (comboxid.attr("id") == "rgtprovince") {
				disrgtcity(comboxid.combobox('getValue'));
			} else if (comboxid.attr("id") == "rgtcity") {
				disrgtcountry(comboxid.combobox('getValue'))
			} else {
				organAfterSelect(comboxid);
			}
		}

		function disrgtcity(provinceStr) {
			var tParam = new Object();
			tParam.province = provinceStr;

			var tturl1 = "policy/getCity.do";

			displayCombox($('#rgtcity'), tParam, tturl1, "dd_key", "dd_value");
		}

		function disrgtcountry(cityStr) {
			var tParam = new Object();
			tParam.city = cityStr;

			var tturl1 = "policy/getCountry.do";

			displayCombox($('#rgtcountry'), tParam, tturl1, "dd_key", "dd_value");
		}


		function selectone() {
			var row = $('#userList').datagrid('getSelected');

			$('#userid').val(row.userid);
			//$('#usercode').val(row.usercode);
			$('#realname').val(row.realname);
			$('#mobilenumber').val(row.mobilenumber);
			$('#cardno').val(row.cardno);
			$('#organcode').val(row.organcode);

			$('#teamid').val(row.teamid);
			$('#teamname').val(row.teamname);

			dealorgan(row);
			$('#phoneno').combobox('setValue', row.phoneno);
			$('#usercode_combox').combobox('setValue', row.usercode);
			$('#usercode_txt').val(row.usercode);

			$('#usergrade').combobox('setValue', row.usergrade);
			$('#entrydate').datebox('setValue', row.entrydate);

			$('#certifno').val(row.certifno);
			$('#position').combobox('setValue', row.position);

			$('#rgtprovince').combobox('setValue', row.rgtprovince);
			disrgtcity(row.rgtprovince);
			$('#rgtcity').combobox('setValue', row.rgtcity);
			disrgtcountry(row.rgtcity);
			$('#rgtcountry').combobox('setValue', row.rgtcountry);

			$('#nationality').combobox('setValue', row.nationality);
			$('#marriage').combobox('setValue', row.marriage);
			$('#polityvisage').combobox('setValue', row.polityvisage);
			$('#degree').combobox('setValue', row.degree);
			$('#graduateschool').val(row.graduateschool);
			$('#speciality').val(row.speciality);
			$('#isdorm').combobox('setValue', row.isdorm);

			$('#familylinker').val(row.familylinker);
			$('#familyrelation').combobox('setValue', row.familyrelation);
			$('#familylinkphone').val(row.familylinkphone);
			$('#contracttype').combobox('setValue', row.contracttype);
			$('#contractenddate').datebox('setValue', row.contractenddate);
			$('#bankcardno').val(row.bankcardno);


			imgUrl.photourl = row.photourl;
			imgUrl.idcardfronturl = row.idcardfronturl;
			imgUrl.idcardbankurl = row.idcardbankurl;
			imgUrl.degreeurl = row.degreeurl;
			imgUrl.othercertifyurl = row.othercertifyurl;



			if (row.photourl != null && row.photourl != "") {
				$('#photo_url01').attr('src', row.photourl);
				$('#photo_url01').css('display','block');
			}

			if (row.idcardfronturl != null && row.idcardfronturl != "") {
				$('#photo_url02').attr('src', row.idcardfronturl);
				$('#photo_url02').css('display','block');
			}

			if (row.idcardbankurl != null && row.idcardbankurl != "") {
				$('#photo_url03').attr('src', row.idcardbankurl);
				$('#photo_url03').css('display','block');
			}

			if (row.degreeurl != null && row.degreeurl != "") {
				$('#photo_url04').attr('src', row.degreeurl);
				$('#photo_url04').css('display','block');
			}

			if (row.othercertifyurl != null && row.othercertifyurl != "") {
				$('#photo_url05').attr('src', row.othercertifyurl);
				$('#photo_url05').css('display','block');
			}

			$('#dimissiondate').datebox('setValue', row.dimissiondate);
			$('#reason').val(row.reason);
		}

		function saveSuss() {
			clearCarData();
			$('#userList').datagrid('reload');
		}

		function clearCarData() {
			$('#entrydate').datebox('setValue', "");
			$('#contractenddate').datebox('setValue', "");

			$('#photo_url01').attr('src', '');
			$('#photo_url01').css('display','none');

			$('#photo_url02').attr('src', '');
			$('#photo_url02').css('display','none');

			$('#photo_url03').attr('src', '');
			$('#photo_url03').css('display','none');

			$('#photo_url04').attr('src', '');
			$('#photo_url04').css('display','none');

			$('#photo_url05').attr('src', '');
			$('#photo_url05').css('display','none');

			cleardata(inputList);
			$('#password').val("123456");
			$('#psdconfirm').val("123456");
			$('#teamname').val("");

			$('#reason').val("");
		}

		function useredit() {
			var row = $('#userList').datagrid('getSelected');

			if (row == null) {
				$.messager.alert('操作提示', '请选中要修改的数据！', 'error');
				return;
			}

			if (!checknotnull(checkList)) {
				return;
			}
			
			var tUserCode = getHtmlUserCode();
			if(tUserCode==null||tUserCode=="")
			{
				$.messager.alert('操作提示', '请输入用户编码！', 'error');
				return;
			}

			var tparam = prepareparam(inputList);
			
			if(tparam.bankcardno.length!=19)
			{
				$.messager.alert('操作提示', '工资卡卡号应该是19位！', 'error');
				return;
			}
			
			tparam.photourl = imgUrl.photourl;
			tparam.idcardfronturl = imgUrl.idcardfronturl;
			tparam.idcardbankurl = imgUrl.idcardbankurl;
			tparam.degreeurl = imgUrl.degreeurl;
			tparam.othercertifyurl = imgUrl.othercertifyurl;
			tparam.usercode = tUserCode;
			
			if (checkUserIdno()) {
				tparam.sex = getSexByIDNo($('#cardno').val());
				tparam.birthday = getBirthdatByIdNo($('#cardno').val())
			} else {
				return;
			}

			if (tparam.phoneno == null || tparam.phoneno == '') {
				tparam.phoneno = $('#phoneno').combobox('getText');
			}

			tparam.oldusercode = row.usercode;
			tparam.oldorgancode = row.organcode;
			tparam.usertype = row.typecode;

			tparam.entrydate = $('#entrydate').datebox("getValue");
			tparam.contractenddate = $('#contractenddate').datebox("getValue");

			tparam.userid = row.userid;
			tparam.toserialno = row.toserialno;

			ajaxdeal("user/userUpdate.do", tparam, null, null, saveSuss);
			//userquery();
		}

		function dealorgan(row) {
			var phoneno = $('#phoneno').combobox('getText');

			var tParam = new Object();
			tParam.organcode = row.organcode;

			var tturl = "user/getPhoneNo.do";
			displayCombox($('#phoneno'), tParam, tturl, "dd_key", "dd_value");
			$('#phoneno').combobox('setValue', phoneno);
			
			if(row.organcode=="100100101"
			 ||row.organcode=="100100102"
			 ||row.organcode=="100100103")
			{
				$('#usercode_combox').next(".combo").show();
				$('#usercode_txt').hide();
			}
			else
			{
				$('#usercode_combox').next(".combo").hide();
				$('#usercode_txt').show();
			}
		}

		function uploaduserphoto() {
			var myImage = userphoto.getDialog("insertimage");
			myImage.open();
		}

		function uploadidcardfront() {
			var myImage = idcardfront.getDialog("insertimage");
			myImage.open();
		}

		function uploadidcardback() {
			var myImage = idcardback.getDialog("insertimage");
			myImage.open();
		}

		function uploaddegree() {
			var myImage = degreephoto.getDialog("insertimage");
			myImage.open();
		}

		function uploadothercertify() {
			var myImage = othercertify.getDialog("insertimage");
			myImage.open();
		}

		function checkUserIdno() {
			if (checkCardId($('#cardno').val())) {
				return true;
			} else {
				$('#cardno').val("");
				return false;
			}
		}
		
		function getHtmlUserCode()
		{
			if($('#organcode').val()=="100100101"
			 ||$('#organcode').val()=="100100102"
			 ||$('#organcode').val()=="100100103")
			{
				return $('#usercode_combox').combobox('getValue');
			}
			else
			{
				return $('#usercode_txt').val();
			}
		}
	</script>
	<style>
		.img_photo {
			background-color: rgb(224, 235, 255);
			text-align: left;
			width: 11.5%;
			font-size: 10pt;
			height: 1.85rem;
			line-height: 1.8rem
		}

		#photo_url01,
		#photo_url02,
		#photo_url03,
		#photo_url04,
		#photo_url05 {
			display: none;
		}

		.upload-box {
			margin-left: 0.3rem;
		}
	</style>
</head>

<body>
	<%@ include file="/WEB-INF/jsp/admin/team/teamDlg.jsp"%>
	<%@ include file="/WEB-INF/jsp/admin/user/userDetailDlg.jsp"%>
	<div style="margin-left:0%">
		<%@ include file="/WEB-INF/common/query/user/userCommonQuery.jsp"%>
		<br>
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" id="userListQuery" onclick="userListQuery()">查询</a>
		<br>
		<br>
		<table id="userList" class="easyui-datagrid" title="人员信息" style="width:auto;height:auto"
			data-options="rownumbers:true,singleSelect:true,pagination:true,onClickRow: selectone">
			<thead>
				<tr>
					<%@ include file="/WEB-INF/common/column/organ/organList.jsp"%>
					<%@ include file="/WEB-INF/common/column/user/userList.jsp"%>
				</tr>
			</thead>
		</table>
		<br>
		<table class="common">
			<tr>
				<td class="reprot_title_4">
					所属团队
				</td>
				<td class="report_common_4">
					<input class="txt" name="teamname" id="teamname" notnull="所属团队" readonly
						onclick="disuTeamDlg($('#teamid'),$('#teamname'),$('#organcode'),null,'9999','dealorgan');">
					<input class="txt" hidden name="teamid" id="teamid" notnull="所属团队">
					<input class="txt" hidden name="organcode" id="organcode" readonly notnull="所属团队">
				</td>

				<td class="reprot_title_4">
					人员编号
				</td>
				<td class="report_common_4">
					<input class="txt" name="usercode_txt" id="usercode_txt">
					<select editable="false" class="easyui-combobox" style="width:160%" name="usercode_combox" id="usercode_combox"></select>
				</td>

				<td class="reprot_title_4">
					人员姓名
				</td>
				<td class="report_common_4">
					<input class="txt" name="realname" id="realname" notnull="人员姓名">
				</td>
				<td class="reprot_title_4">
					手机号码
				</td>
				<td class="report_common_4">
					<input class="txt" name="mobilenumber" id="mobilenumber" notnull="手机号码">
				</td>
			</tr>
			
			<tr>
				<td class="reprot_title_4">
					户籍所在省
				</td>
				<td class="report_common_4">
					<select  editable="false" class="easyui-combobox" style="width:160%" name="rgtprovince"
						id="rgtprovince" notnull="户籍所在省">
					</select>
				</td>
				<td class="reprot_title_4">
					户籍所在市
				</td>
				<td class="report_common_4">
					<select  editable="false" class="easyui-combobox" style="width:160%" name="rgtcity" id="rgtcity"
						notnull="户籍所在市">
					</select>
				</td>
				<td class="reprot_title_4">
					户籍所在县
				</td>
				<td class="report_common_4">
					<select  editable="false" class="easyui-combobox" style="width:160%" name="rgtcountry"
						id="rgtcountry" notnull="户籍所在县">
					</select>
				</td>
				<td class="reprot_title_4">
					民族
				</td>
				<td class="report_common_4">
					<select class="easyui-combobox" style="width:160%" name="nationality" id="nationality" notnull="民族">
					</select>
				</td>
			</tr>

			<tr>
				<td class="reprot_title_4">
					身份证号码
				</td>
				<td class="report_common_4">
					<input class="txt" name="cardno" id="cardno" notnull="身份证号码" onblur="checkUserIdno()">
				</td>

				<td class="reprot_title_4">
					婚姻状况
				</td>
				<td class="report_common_4">
					<select class="easyui-combobox" style="width:160%" panelHeight="auto" name="marriage" id="marriage"
						notnull="婚姻状况">
					</select>
				</td>

				<td class="reprot_title_4">
					政治面貌
				</td>
				<td class="report_common_4">
					<select class="easyui-combobox" style="width:160%" panelHeight="auto" name="polityvisage"
						id="polityvisage" notnull="政治面貌 ">
					</select>
				</td>
				<td class="reprot_title_4">
					学历
				</td>
				<td class="report_common_4">
					<select class="easyui-combobox" style="width:160%" panelHeight="auto" name="degree" id="degree"
						notnull="学历">
					</select>
				</td>
			</tr>

			<tr>
				<td class="reprot_title_4">
					毕业院校
				</td>
				<td class="report_common_4">
					<input class="txt" name="graduateschool" id="graduateschool" notnull="毕业院校">
				</td>

				<td class="reprot_title_4">
					所学专业
				</td>
				<td class="report_common_4">
					<input class="txt" name="speciality" id="speciality" notnull="所学专业">
				</td>
				<td class="reprot_title_4">
					职岗
				</td>
				<td class="report_common_4">
					<select class="easyui-combobox" style="width:160%" panelHeight="auto" name="position" id="position"
						notnull="职岗">
					</select>
				</td>
			</tr>

			<tr>
				<td class="reprot_title_4">
					执业登记号
				</td>
				<td class="report_common_4">
					<input class="txt" name="certifno" id="certifno" notnull="执业登记号">
				</td>

				<td class="reprot_title_4">
					下团队日期
				</td>
				<td class="report_common_4">
					<input class="easyui-datebox" style="width: 160%" id="entrydate" name="entrydate" notnull="下团队日期">
				</td>
				<td class="reprot_title_4">
					分机号码
				</td>
				<td class="report_common_4">
					<select class="easyui-combobox" style="width:160%" name="phoneno" id="phoneno" notnull="分机号码">
					</select>
				</td>
			</tr>

			<tr hidden>
				<td class="reprot_title_4">
					是否住宿舍
				</td>
				<td class="report_common_4">
					<select class="easyui-combobox" style="width:160%" panelHeight="auto" name="isdorm" id="isdorm"
						notnull="是否住宿舍">
					</select>
				</td>
			
				<td class="reprot_title_4">
					职能级别
				</td>
				<td class="report_common_4">
					<select class="easyui-combobox" style="width:160%" panelHeight="auto" name="usergrade"
						id="usergrade" notnull="职能级别">
					</select>
				</td>

				<td class="reprot_title_4">
					合同类型
				</td>
				<td class="report_common_4">
					<select class="easyui-combobox" style="width:160%" panelHeight="auto" name="contracttype"
						id="contracttype" notnull="合同类型 ">
					</select>
				</td>

				<td class="reprot_title_4">
					合同到期日
				</td>
				<td class="report_common_4">
					<input class="easyui-datebox" style="width: 160%" id="contractenddate" name="contractenddate"
						notnull="合同到期日">
				</td>
			</tr>

			<tr>
				<td class="reprot_title_4">
					家庭联系人
				</td>
				<td class="report_common_4">
					<input class="txt" name="familylinker" id="familylinker" notnull="家庭联系人">
				</td>
				
				<td class="reprot_title_4">
					家庭关系
				</td>
				<td class="report_common_4">
					<select class="easyui-combobox" style="width:160%" panelHeight="auto" name="familyrelation"
						id="familyrelation" notnull="家庭关系">
					</select>
				</td>

				<td class="reprot_title_4">
					家庭联系电话
				</td>
				<td class="report_common_4">
					<input class="txt" name="familylinkphone" id="familylinkphone" notnull="家庭联系电话">
				</td>
				<td class="reprot_title_4">
					工资卡卡号
				</td>
				<td class="report_common_4">
					<input class="txt" name="bankcardno" id="bankcardno" notnull="工资卡卡号">
				</td>
			</tr>
		</table>
		<div style="margin-top:20px;display: flex;width: 80%;">
			<div class="img_photo">人员照片</div>
			<div class="upload-box">
				<input type='text' name='textfield' id='textfield01' class='upload-txt' />
				<button id="file-view" onclick="replaceImg('photo_url01')" class="smsbutton">浏览...</button>
			</div>
		</div>
		<img src="" id='photo_url01' width="300" height="400" />

   <!--图片裁剪框 start-->
   <div style="display: none" class="tailoring-container">
    <div class="black-cloth" onclick="closeTailor(this)"></div>
    <div class="tailoring-content">
      <div class="tailoring-content-one">
        <label title="上传图片" for="chooseImg" class="al-btn choose-btn">
          <input type="file" accept="image/jpg,image/jpeg,image/png" name="file" id="chooseImg" class="hidden"
            onchange="selectImg(this)">
          选择图片
        </label>
        <div class="close-tailoring" onclick="closeTailor(this)">×</div>
      </div>
      <div class="tailoring-content-two">
        <div class="tailoring-box-parcel">
          <img id="tailoringImg">
        </div>
        <!-- <div class="preview-box-parcel">
          <p>图片预览：</p>
          <div class="square previewImg"></div>
          <div class="circular previewImg"></div>
        </div> -->
      </div>
      <div class="tailoring-content-three">
        <button class="al-btn cropper-reset-btn" onclick="resetBtn()">复位</button>
        <button class="al-btn cropper-rotate-btn" onclick="rotateBtn()">旋转</button>
        <button class="al-btn cropper-scaleX-btn" onclick="resetBtn()">换向</button>
        <button class="al-btn sureCut" onclick="sureCut()" id="sureCut">确定</button>
      </div>
    </div>
  </div>
  <!--图片裁剪框 end-->

		<div style="margin-top:0px;display: flex;width: 80%;">
			<div class="img_photo">身份证正面</div>
			<div class="upload-box">
				<input type='text' name='textfield' id='textfield02' class='upload-txt' />
				<button id="file-view" onclick="replaceImg('photo_url02')" class="smsbutton">浏览...</button>
			</div>
		</div>
		<img src="" id='photo_url02' width="475" height="300" />

		<div style="margin-top:0px;display: flex;width: 80%;">
			<div class="img_photo">身份证反面</div>
			<div class="upload-box">
				<input type='text' name='textfield' id='textfield03' class='upload-txt' />
				<button id="file-view" onclick="replaceImg('photo_url03')" class="smsbutton">浏览...</button>
			</div>
		</div>
		<img src="" id='photo_url03' width="475" height="300" />

		<div style="margin-top:0px;display: flex;width: 80%;">
			<div class="img_photo">学历证明</div>
			<div class="upload-box">
				<input type='text' name='textfield' id='textfield04' class='upload-txt' />
				<button id="file-view" onclick="replaceImg('photo_url04')" class="smsbutton">浏览...</button>
			</div>
		</div>
		<img src="" id='photo_url04' width="475" height="300" />

		<div style="margin-top:0px;display: flex;width: 80%;">
			<div class="img_photo">其他证明文件</div>
			<div class="upload-box">
				<input type='text' name='textfield' id='textfield05' class='upload-txt' />
				<button id="file-view" onclick="replaceImg('photo_url05')" class="smsbutton">浏览...</button>
			</div>
		</div>
		<img src="" id='photo_url05' width="475" height="300" />
		<table class="common">
			<tr>
				<td class="reprot_title_4" style="width: 9.4%;">
					离职时间
				</td>
				<td class="report_common_4" style="width: 15.5%;">
					<input class="easyui-datebox" style="width:160%" panelHeight="auto" name="dimissiondate"
						id="dimissiondate" notnull="离职时间">
				</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>

			<tr>
				<td class="reprot_title_4">
					离职原因
				</td>
				<td class="report_common_4" colspan="2">
					<textarea notnull="离职原因" class="txt" style="width: 320px;height: auto;" id="reason" name="reason">
				</textarea>
				</td>
			</tr>
		</table>

		<table style="width: 61%;" hidden>
			<tr>
				<td class="title">
					密码
				</td>
				<td class="common">
					<input class="txt" name="password" id="password" type=password notnull="密码" value="123456">
				</td>
				<td class="title">
					密码确认
				</td>
				<td class="common">
					<input class="txt" name="psdconfirm" id="psdconfirm" type=password notnull="确认密码" value="123456">
				</td>
			</tr>
		</table>
		<script id="uploaduserphoto_s" name="uploaduserphoto_s" type="text/plain">
		</script>
		<script id="idcardfront_s" name="idcardfront_s" type="text/plain">
		</script>
		<script id="idcardback_s" name="idcardback_s" type="text/plain">
		</script>
		<script id="degreeurl_s" name="degreeurl_s" type="text/plain">
		</script>
		<script id="othercertifyurl_s" name="othercertifyurl_s" type="text/plain">
		</script>
		<br>
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'" id="useredit"
			onclick="useredit()">人员修改</a>
	</div>
</body>

</html>