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
    <link rel="stylesheet" href="/css/common/lcl/common.css?v=20200318">
    <link rel="stylesheet" href="/css/common/lcl/lib/iosSelect.css">
    <link rel="stylesheet" href="/css/insureplan/familyeditplan.css?v=20200403_02">
    
    <style>
    .weui-dialog__btn
    {
    	color: #DC220D;
    }
    
    .weui-dialog__btn.default
    {
    	color: #686868!important;;
    }
    
    </style>
</head>
<body id="footer_wrapper">
<div class="main editplan-page" id="editPlanPage">
    <div class="edit-box" id="#editFormBox">
        <div class="edit-form-box" id="editFormBox">
            <div class="edit-form">
                <div class="edit-form-part">
                    <div class="edit-form-weui-cell weui-cell weui-cell_access weui-cell_select weui-cell_select-after">
                        <div class="weui-cell__hd"><label class="weui-label">保障方案</label></div>
                        <div class="weui-cell__bd edit-form-weui-cell-bd" id="planName">家庭保障方案</div>
                    </div>
                    
                    <div class="edit-form-weui-cell edit-form-cell-row weui-cell" style="padding: 9.5px 15px 9.5px 0;">
                        <div class="weui-cell__hd"><label class="weui-label">客户手机</label></div>
                        <div class="weui-cell__bd">
                            <input id="mobile" class="weui-input" style="text-align: right;" value=""
                                   placeholder="请输入"/>
                        </div>
                    </div>
                </div>
                <div class="edit-family-add">
                    <div class="tab-wrap">
                        <ul class="tab-ul" id="familyTab"></ul>
                    </div>
                    <div class="add-button" id="addPerson">
                        <span class="add-button-icon"><i class="iconfont iconjiahao"></i></span>
                        <span class="add-button-text">添加成员</span>
                    </div>
                </div>
                <div class="edit-form-part hide" id="beibaoren">
                    <div class="edit-form-weui-cell edit-form-cell-row weui-cell" style="padding: 9.5px 15px 9.5px 0;">
                        <div class="weui-cell__hd"><label class="weui-label">被保人姓名</label></div>
                        <div class="weui-cell__bd">
                            <input id="js_input" class="weui-input" style="text-align: right;" value="" placeholder="请输入"/>
                        </div>
                    </div>
                    <div class="edit-form-weui-cell weui-cell weui-cell_access weui-cell_select weui-cell_select-after">
                        <div class="weui-cell__hd"><label class="weui-label">被保人性别</label></div>
                        <div class="weui-cell__bd edit-form-weui-cell-bd" id="selectSex" data-id = ""><span class="edit-form-cell-tips">请选择</span></div>
                    </div>
                    <div class="edit-form-weui-cell weui-cell weui-cell_access weui-cell_select weui-cell_select-after">
                        <div class="weui-cell__hd"><label class="weui-label">被保人年龄</label></div>
                        <div class="weui-cell__bd edit-form-weui-cell-bd" id="selectAge" data-id = "25"><span class="edit-form-cell-tips">请选择</span></div>
                    </div>
                </div>
                <div class="edit-form-part hide" id="iAndPRelation">
                    <div class="edit-form-weui-cell weui-cell weui-cell_access weui-cell_select weui-cell_select-after">
                        <div class="weui-cell__hd edit-form-weui-cell-bd"><label class="weui-label">投保人</label></div>
                    </div>
                    <div class="edit-form-weui-cell weui-cell edit-form-select-button" style="padding:10px 15px 10px 0px;" id="selectappnt" data-id = "">
						
					</div>
                </div>
				
                <div class="edit-form-part hide" id="categrorySection">
                    <div class="categrory">
                        <div class="edit-form-weui-cell weui-cell weui-cell_select weui-cell_select-after risk_selected">
                            <div class="weui-cell__bd">
                                <p class="edit-form-cell-title">险种分类</p>
                            </div>
                            <div class="weui-cell__ft edit-form-cell-tips select-insurance "></div>
                        </div>
                        <div class="edit-form-weui-cell weui-cell edit-form-select-button select-insurance" id="selectInsuranceBox"></div>
                        
		                <div class="edit-form-part hide" id="insurancePreview">
		                    <div class="insurance-preview-box">
		                        <div class="edit-form-weui-cell weui-cell">
		                            <div class="preview-box">
		                                <div class="selected-detail">
		                                    <div class="selected-detail-name"></div>
											<div class="btns risk_dis_opr"><div class="btn-remove" id = 'selectInsurance_delete'>删除</div>&nbsp;|&nbsp;<div class="btn-edit" id = 'selectInsurance_modify'>编辑</div></div>
		                                    <ul class="selected-detail-content" id="selectedDetailContent"></ul>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
		                </div>
                	</div>
                </div>
                <div class="next-button hide" id="nextBtn">
                    <button id="goInsuranceTypeEdit">生成保障方案</button>
                </div>

                <div id="selectBox" class="weui-popup__container popup-bottom">
                    <div class="weui-popup__overlay"></div>
                    <div class="weui-popup__modal">
                        <div class="edit-form-part" id="">
                            <div class="categrory">
                                <div class="edit-form-weui-cell weui-cell">
                                    <div class="weui-cell__bd">
                                        <p class="edit-form-cell-title">险种分类</p>
                                    </div>
                                    <div class="weui-cell__ft edit-form-cell-tips">可多选</div>
                                </div>
                                <div class="edit-form-weui-cell weui-cell edit-form-select-button" id="selectedType">
                                    <button data-selectedinsurancetype="01"
                                            style="margin: 0.5px 10px 0.5px 0;"
                                            class="">
                                        意外险
                                    </button>
                                    <button data-selectedinsurancetype="02"
                                            style="margin: 0.5px 10px 0.5px 0;"
                                            class="">
                                        医疗险
                                    </button>
                                    <button data-selectedinsurancetype="03"
                                            style="margin: 0.5px 10px 0.5px 0;"
                                            class="">
                                        重疾险
                                    </button>
                                    <button data-selectedinsurancetype="04"
                                            style="margin: 0.5px 10px 0.5px 0;"
                                            class="">
                                        人寿险
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="edit-form-box footer_wrapper">
                            <div class="edit-form hide" style="background: #ffffff;" id="yiwaixian">
                                <div class="edit-form-weui-cell weui-cell" style="padding: 9.5px 10px;">
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
                                        <div class="edit-form-weui-cell-bd show-product" id="yiwaixianbaofei">0元</div>
                                    </div>
                                </div>
                            </div>
                            <div class="edit-form hide" style="background: #ffffff;" id="yiliaoxian">
                                <div class="edit-form-weui-cell weui-cell" style="padding: 9.5px 10px;">
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
                                        <div class="edit-form-weui-cell-bd show-product" id="yiliaoxianbaofei">0元</div>
                                    </div>
                                </div>
                            </div>
                            <div class="edit-form hide" style="background: #ffffff;" id="zhongjixian">
                                <div class="edit-form-weui-cell weui-cell" style="padding: 9.5px 10px;">
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
                                        <div class="additional-insurance-list" id="additionalInsurance03">
                                            <!--附加险区域-->
                                        </div>
                                        <div class="edit-form-choose-item hide" id="additionalInsuranceExemption">
                                            <div class="choose-item-title">附加投保人豁免</div>
                                            <div class="edit-form-weui-cell weui-cell edit-form-select-button" id="fujiatoubao"></div>
                                        </div>
                                    </div>
                                    <div class="edit-form-weui-cell weui-cell weui-cell_access weui-cell_select weui-cell_select-after baofei hide">
                                        <div class="weui-cell__hd"><label class="weui-label">保费</label></div>
                                        <div class="edit-form-weui-cell-bd show-product" id="zhongjixianbaofei">0元/年</div>
                                    </div>
                                </div>
                            </div>
                            <div class="edit-form hide" style="background: #ffffff;" id="shouxian">
                                <div class="edit-form-weui-cell weui-cell" style="padding: 9.5px 10px;">
                                    <div class="weui-cell__bd">
                                        <span class="edit-form-cell-title">人寿险</span>
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
                                            <div class="edit-form-weui-cell weui-cell edit-form-select-button" id="shouxianPaymentTime" data-id = 'payendyear'></div>
                                        </div>
                                        <div class="edit-form-choose-item">
                                            <div class="choose-item-title">缴费方式</div>
                                            <div class="edit-form-weui-cell weui-cell edit-form-select-button" id="shouxianPaymentMethod" data-id = 'payintv'></div>
                                        </div>
                                        <div class="edit-form-choose-item">
                                            <div class="choose-item-title">保障期限</div>
                                            <div class="edit-form-weui-cell weui-cell edit-form-select-button" id="shouxianTerm" data-id = 'insureyear'></div>
                                        </div>
                                        <div class="edit-form-choose-item hide" id="additionalInsuranceExemption04">
                                            <div class="choose-item-title">附加投保人豁免</div>
                                            <div class="edit-form-weui-cell weui-cell edit-form-select-button" id="fujiatoubao04"></div>
                                        </div>
                                    </div>
                                    <div class="edit-form-weui-cell weui-cell weui-cell_access weui-cell_select weui-cell_select-after baofei hide">
                                        <div class="weui-cell__hd"><label class="weui-label">保费</label></div>
                                        <div class="edit-form-weui-cell-bd show-product" id="shouxianbaofei">0元/年</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="confirm-button">
                        <button id="savePlanBtn">确定</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="/js/common/lcl/lib/jquery1.12.4.min.js"></script>
<script src="/js/common/lcl/lib/jquery-weui.min.js"></script>
<script src="/js/common/lcl/lib/iosSelect.js"></script>
<script src="/js/insureplan/editplaninfo_familyplan.js?v=20200421_01"></script>
<script src="/js/common/insuCommon.js"></script>
</body>
</html>