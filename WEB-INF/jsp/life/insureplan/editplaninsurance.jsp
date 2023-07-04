<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<meta content="yes" name="apple-mobile-web-app-capable">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<meta name="format-detection" content="telephone=no, email=no">
	<meta name="viewport"
		  content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, viewport-fit=cover">
	<title>添加</title>
	<link rel="stylesheet" href="/css/common/lcl/lib/weui.min.css">
    <link rel="stylesheet" href="/css/common/lcl/lib/jquery-weui.min.css">
    <link rel="stylesheet" href="/fonts/lcl/iconfont.css">
    <link rel="stylesheet" href="/css/common/lcl/common.css">
    <link rel="stylesheet" href="/css/common/lcl/lib/iosSelect.css">
	<link rel="stylesheet" href="/css/insureplan/editplan.css">
	<style>
		.edit-box .edit-form-box .edit-form .weui-cell_select-after {
			padding-left: 5px;
		}

		.weui-cell_select .weui-cell__bd:after {
			right: 0;
		}

		.edit-box .edit-form-box .edit-form .edit-box .edit-form-box .edit-form .edit-form-choose-list {
			padding: 10px 0;
			background: #fff;
		}

		.edit-box .edit-form-box .edit-form .edit-form-choose-list .edit-form-choose-item .edit-form-select-button {
			display: flex;
			flex-flow: wrap;
			padding: 0 16px 0 0px;
		}

		.edit-box .edit-form-box .edit-form .edit-form-choose-list .edit-form-choose-item .choose-item-title {
			background: #ffffff;
			padding: 5px 0 0px 0px;
			font-size: 12px;
			color: #3E3C3C;
		}

		.edit-box .edit-form-box .edit-form .edit-form-choose-list .edit-form-choose-item .weui-cell:before {
			content: '';
			display: none;
		}

		.weui-toptips {
			/*position: fixed;*/
			/*z-index: 999999;*/
			border-radius: 0;
			/*opacity: 1;*/
		}
		.baofei {
			display: flex;
			justify-content: space-between;
		}
		.edit-box .edit-form .edit-form-weui-cell .edit-form-cell-tips {
			font-size: 15px;
			color: #686868;
			font-weight: lighter;
		}
	</style>
</head>
<body>

<input style="display:none" id="planid" value="${planid}">

<input style="display:none" id="relatoappnt" value="${relatoappnt}">
<input style="display:none" id="plantype" value="${plantype}">
<input style="display:none" id="risktype" value="${risktype}">
<input style="display:none" id="inssex" value="${inssex}">
<input style="display:none" id="insage" value="${insage}">
<input style="display:none" id="insname" value="${insname}">
<input style="display:none" id="appsex" value="${appsex}">
<input style="display:none" id="appage" value="${appage}">
<input style="display:none" id="appname" value="${appname}">
<input style="display:none" id="mobile" value="${mobile}">

<div class="main editplan-page" id="editPlanPage">
	<div class="edit-box" id="editType">
		<div class="edit-form-box footer_wrapper" id="footer_wrapper">
			<div class="edit-form hide" style="background: #ffffff;" id="yiwaixian">
				<div class="edit-form-weui-cell weui-cell" style="padding: 9.5px 16px;">
					<div class="weui-cell__bd">
						<span class="edit-form-cell-title">意外险</span>
					</div>
				</div>
				<div class="edit-form-weui-cell weui-cell weui-cell_access weui-cell_select weui-cell_select-after title-border"></div>
				<div style="padding: 0 10px;">
					<div class="edit-form-weui-cell weui-cell weui-cell_access weui-cell_select weui-cell_select-after">
						<div class="weui-cell__hd"><label class="weui-label">保险公司</label></div>
						<div class="weui-cell__bd edit-form-weui-cell-bd show-componeny edit-form-cell-tips"
							 data-company="" id="yiwaixianCompany">请选择</div>
					</div>
					<div class="edit-form-weui-cell weui-cell weui-cell_access weui-cell_select weui-cell_select-after">
						<div class="weui-cell__hd"><label class="weui-label">险种名称</label></div>
						<div class="weui-cell__bd edit-form-weui-cell-bd show-product edit-form-cell-tips" id="yiwaixianchanpin">请选择</div>
					</div>
					<div class="edit-form-choose-list edit-form-weui-cell weui-cell weui-cell_access weui-cell_select weui-cell_select-after" style="padding-bottom: 10px;">
						<div class="edit-form-choose-item">
							<div class="choose-item-title">保险金额</div>
							<div class="edit-form-weui-cell weui-cell edit-form-select-button" id="yiwaixianMoneyButton" data-id = 'yw'></div>
						</div>
					</div>
					<div class="edit-form-weui-cell weui-cell weui-cell_access weui-cell_select weui-cell_select-after baofei hide">
						<div class="weui-cell__hd"><label class="weui-label">保费</label></div>
						<div class="edit-form-weui-cell-bd show-product" id="yiwaixianbaofei">98元</div>
					</div>
				</div>
			</div>
			<div class="edit-form hide" style="background: #ffffff;" id="yiliaoxian">
				<div class="edit-form-weui-cell weui-cell" style="padding: 9.5px 16px;">
					<div class="weui-cell__bd">
						<span class="edit-form-cell-title">医疗险</span>
					</div>
				</div>
				<div class="edit-form-weui-cell weui-cell weui-cell_access weui-cell_select weui-cell_select-after title-border"></div>
				<div style="padding: 0 10px;">
					<div class="edit-form-weui-cell weui-cell weui-cell_access weui-cell_select weui-cell_select-after">
						<div class="weui-cell__hd"><label class="weui-label">保险公司</label></div>
						<div class="weui-cell__bd edit-form-weui-cell-bd show-componeny edit-form-cell-tips"
							 data-company="" id="yiliaoxianCompany">请选择</div>
					</div>
					<div class="edit-form-weui-cell weui-cell weui-cell_access weui-cell_select weui-cell_select-after">
						<div class="weui-cell__hd"><label class="weui-label">险种名称</label></div>
						<div class="weui-cell__bd edit-form-weui-cell-bd show-product edit-form-cell-tips" id="yiliaoxianchanpin">请选择</div>
					</div>
					<div class="edit-form-choose-list edit-form-weui-cell weui-cell weui-cell_access weui-cell_select weui-cell_select-after" style="padding-bottom: 10px;">
						<div class="edit-form-choose-item">
							<div class="choose-item-title">保险金额</div>
							<div class="edit-form-weui-cell weui-cell edit-form-select-button" id="yiliaoxianMoneyButton" data-id = 'yl'></div>
						</div>
					</div>
					<div class="edit-form-weui-cell weui-cell weui-cell_access weui-cell_select weui-cell_select-after baofei hide">
						<div class="weui-cell__hd"><label class="weui-label">保费</label></div>
						<div class="edit-form-weui-cell-bd show-product" id="yiliaoxianbaofei">98元</div>
					</div>
				</div>
			</div>
			<div class="edit-form hide" style="background: #ffffff;" id="zhongjixian">
				<div class="edit-form-weui-cell weui-cell" style="padding: 9.5px 16px;">
					<div class="weui-cell__bd">
						<span class="edit-form-cell-title">重疾险</span>
					</div>
				</div>
				<div class="edit-form-weui-cell weui-cell weui-cell_access weui-cell_select weui-cell_select-after title-border"></div>
				<div style="padding: 0 10px;">
					<div class="edit-form-weui-cell weui-cell weui-cell_access weui-cell_select weui-cell_select-after">
						<div class="weui-cell__hd"><label class="weui-label">保险公司</label></div>
						<div class="weui-cell__bd edit-form-weui-cell-bd show-componeny edit-form-cell-tips" id="zhongjixiancompany">请选择</div>
					</div>
					<div class="edit-form-weui-cell weui-cell weui-cell_access weui-cell_select weui-cell_select-after">
						<div class="weui-cell__hd"><label class="weui-label">险种名称</label></div>
						<div class="weui-cell__bd edit-form-weui-cell-bd show-product edit-form-cell-tips" id="zhongjixianchanpin">请选择</div>
					</div>
					<div class="edit-form-weui-cell weui-cell edit-form-cell-row" style="padding: 0;">
						<div class="edit-form-weui-cell weui-cell" style="padding: 0;"></div>
					</div>
					<div class="edit-form-choose-list  edit-form-weui-cell weui-cell_access weui-cell_select weui-cell_select-after" style="padding-bottom: 10px;">
						<div class="edit-form-choose-item">
							<div class="choose-item-title">保险金额</div>
							<div class="edit-form-weui-cell weui-cell edit-form-select-button" id="moneyButton" data-id = 'zj'></div>
						</div>
						<div class="edit-form-choose-item">
							<div class="choose-item-title">缴费年期</div>
							<div class="edit-form-weui-cell weui-cell edit-form-select-button" id="paymentTime" data-id = 'payendyear'></div>
						</div>
						<div class="edit-form-choose-item">
							<div class="choose-item-title">缴费方式</div>
							<div class="edit-form-weui-cell weui-cell edit-form-select-button" id="paymentMethod" data-id = 'payintv'></div>
						</div>
						<div class="edit-form-choose-item">
							<div class="choose-item-title">保障期限</div>
							<div class="edit-form-weui-cell weui-cell edit-form-select-button" id="term" data-id = 'insureyear'></div>
						</div>
						<div class="additional-insurance-list" id="additionalInsurance">
							<!--附加险区域-->
						</div>
						<div class="edit-form-choose-item hide" id="additionalInsuranceExemption">
							<div class="choose-item-title">附加投保人豁免</div>
							<div class="edit-form-weui-cell weui-cell edit-form-select-button" id="hmtoubao"></div>
						</div>
					</div>
					<div class="edit-form-weui-cell weui-cell weui-cell_access weui-cell_select weui-cell_select-after baofei hide">
						<div class="weui-cell__hd"><label class="weui-label">保费</label></div>
						<div class="edit-form-weui-cell-bd show-product" id="zhongjixianbaofei">98元</div>
					</div>
				</div>
			</div>
			
			<div class="edit-form hide" style="background: #ffffff;" id="shouxian">
            	<div class="edit-form-weui-cell weui-cell" style="padding: 9.5px 16px;">
                	<div class="weui-cell__bd">
                    	<span class="edit-form-cell-title">寿险</span>
                    </div>
                </div>
                <div class="edit-form-weui-cell weui-cell weui-cell_access weui-cell_select weui-cell_select-after title-border"></div>
                <div style="padding: 0 10px;">
                	<div class="edit-form-weui-cell weui-cell weui-cell_access weui-cell_select weui-cell_select-after">
                    	<div class="weui-cell__hd"><label class="weui-label">保险公司</label></div>
                        <div class="weui-cell__bd edit-form-weui-cell-bd show-componeny edit-form-cell-tips" id="shouxiancompany">请选择</div>
                    </div>
                    <div class="edit-form-weui-cell weui-cell weui-cell_access weui-cell_select weui-cell_select-after">
                    	<div class="weui-cell__hd"><label class="weui-label">险种名称</label></div>
                        <div class="weui-cell__bd edit-form-weui-cell-bd show-product edit-form-cell-tips" id="shouxianchanpin">请选择</div>
                    </div>
                    <div class="edit-form-weui-cell weui-cell edit-form-cell-row" style="padding: 0;">
                    	<div class="edit-form-weui-cell weui-cell" style="padding: 0;"></div>
                    </div>
                    <div class="edit-form-choose-list  edit-form-weui-cell weui-cell_access weui-cell_select weui-cell_select-after" style="padding-bottom: 10px;">
                    	<div class="edit-form-choose-item">
                        	<div class="choose-item-title">保险金额</div>
                            <div class="edit-form-weui-cell weui-cell edit-form-select-button" id="shouxianMoneyButton" data-id = 'sx'></div>
                         </div>
						<div class="edit-form-choose-item">
                        	<div class="choose-item-title">缴费年期</div>
                            <div class="edit-form-weui-cell weui-cell edit-form-select-button" id="shouxianPaymentTime" data-id = 'sx_payendyear'></div>
                        </div>
                        <div class="edit-form-choose-item">
                        	<div class="choose-item-title">缴费方式</div>
                            <div class="edit-form-weui-cell weui-cell edit-form-select-button" id="shouxianPaymentMethod" data-id = 'sx_payintv'></div>
                        </div>
                        <div class="edit-form-choose-item">
                        	<div class="choose-item-title">保障期限</div>
                            <div class="edit-form-weui-cell weui-cell edit-form-select-button" id="shouxianTerm" data-id = 'sx_insureyear'></div>
                        </div>
                    </div>
                    <div class="edit-form-weui-cell weui-cell weui-cell_access weui-cell_select weui-cell_select-after baofei hide">
                    	<div class="weui-cell__hd"><label class="weui-label">保费</label></div>
                        <div class="edit-form-weui-cell-bd show-product" id="shouxianbaofei">0元/年</div>
                    </div>
                </div>
            </div>
			
			<div class="next-button">
				<button id="savePlanBtn">保存并生成计划书</button>
			</div>
		</div>
	</div>
</div>
<script src="/js/common/lcl/lib/jquery1.12.4.min.js"></script>
<script src="/js/common/lcl/lib/jquery-weui.min.js"></script>
<script src="/js/common/lcl/lib/iosSelect.js"></script>
<script src="/js/insureplan/editplaninsurance.js?v=20200421_01"></script>
</body>
</html>
