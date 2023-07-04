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
        /*#editFormBox .weui-half-screen-dialog {*/
        /*border-top-left-radius: 0;*/
        /*border-top-right-radius: 0;*/
        /*}*/
        #editFormBox .weui-half-screen-dialog__hd {
            height: 4em;
        }
        #editFormBox .weui-btn_primary {
            background-color: #dc220d;
        }

        .weui-toptips {
            /*position: fixed;*/
            /*z-index: 999999;*/
            border-radius: 0;
            /*opacity: 1;*/
        }
        #editFormBox .weui-cell_select-after {
            padding-left: 0;
        }
        #editFormBox .weui-input {
            font-size: 15px;
        }

        #editFormBox .weui-cell_select .weui-cell__bd:after {
            right: 0;
        }

    </style>
</head>
<body id="footer_wrapper">
<input style="display:none" id="method" value="${method}">
<input style="display:none" id="planid" value="${planid}">
<div class="main editplan-page" id="editPlanPage">
    <div class="edit-box" id="#editFormBox">
        <div class="edit-form-box" id="editFormBox">
            <div class="edit-form">
                <div class="edit-form-part">
                    <div class="edit-form-weui-cell weui-cell weui-cell_access weui-cell_select weui-cell_select-after">
                        <div class="weui-cell__hd"><label class="weui-label">保障方案</label></div>
                        <div class="weui-cell__bd edit-form-weui-cell-bd" id="planName"><span class="edit-form-cell-tips">请选择</span></div>
                    </div>
                    
                    <div class="edit-form-weui-cell edit-form-cell-row weui-cell" style="padding: 9.5px 15px 9.5px 0;">
                        <div class="weui-cell__hd"><label class="weui-label">客户手机</label></div>
                        <div class="weui-cell__bd">
                            <input id="mobile" class="weui-input" style="text-align: right;" value=""
                                   placeholder="请输入"/>
                        </div>
                    </div>
                </div>
                <div class="edit-form-part">
                    <div class="edit-form-weui-cell edit-form-cell-row weui-cell" style="padding: 9.5px 15px 9.5px 0;">
                        <div class="weui-cell__hd"><label class="weui-label">被保人姓名</label></div>
                        <div class="weui-cell__bd">
                            <input id="js_input" class="weui-input" style="text-align: right;" value=""
                                   placeholder="请输入"/>
                        </div>
                    </div>
                    <div class="edit-form-weui-cell weui-cell weui-cell_access weui-cell_select weui-cell_select-after">
                        <div class="weui-cell__hd"><label class="weui-label">被保人性别</label></div>
                        <div class="weui-cell__bd edit-form-weui-cell-bd" id="selectSex"><span class="edit-form-cell-tips">请选择</span></div>
                    </div>
                    <div class="edit-form-weui-cell weui-cell weui-cell_access weui-cell_select weui-cell_select-after">
                        <div class="weui-cell__hd"><label class="weui-label">被保人年龄</label></div>
                        <div class="weui-cell__bd edit-form-weui-cell-bd" id="selectAge"><span class="edit-form-cell-tips">请选择</span></div>
                    </div>
                </div>
                <div class="edit-form-part">
                    <div class="edit-form-weui-cell weui-cell weui-cell_access weui-cell_select weui-cell_select-after">
                        <div class="weui-cell__hd"><label class="weui-label">投保人是被保人的</label></div>
                        <div class="weui-cell__bd edit-form-weui-cell-bd" id="relation"><span class="edit-form-cell-tips">请选择</span></div>
                    </div>
                </div>
                <div class="edit-form-part hide" id="insuredInfo">
                    <div class="edit-form-weui-cell edit-form-cell-row weui-cell" style="padding: 9.5px 15px 9.5px 0;">
                        <div class="weui-cell__hd"><label class="weui-label">投保人姓名</label></div>
                        <div class="weui-cell__bd">
                            <input id="insuredName" class="weui-input" style="text-align: right;" value=""
                                   placeholder="请输入"/>
                        </div>
                    </div>
                    <div class="edit-form-weui-cell weui-cell weui-cell_access weui-cell_select weui-cell_select-after">
                        <div class="weui-cell__hd"><label class="weui-label">投保人性别</label></div>
                        <div class="weui-cell__bd edit-form-weui-cell-bd" id="selectInsuredSex"><span class="edit-form-cell-tips">请选择</span></div>
                    </div>
                    <div class="edit-form-weui-cell weui-cell weui-cell_access weui-cell_select weui-cell_select-after">
                        <div class="weui-cell__hd"><label class="weui-label">投保人年龄</label></div>
                        <div class="weui-cell__bd edit-form-weui-cell-bd" id="selectInsuredAge"><span class="edit-form-cell-tips">请选择</span></div>
                    </div>
                </div>
                <div class="edit-form-part hide" id="categrorySection">
                    <div class="categrory">
                        <div class="edit-form-weui-cell weui-cell">
                            <div class="weui-cell__bd">
                                <p class="edit-form-cell-title">险种分类</p>
                            </div>
                            <div class="weui-cell__ft edit-form-cell-tips">可多选</div>
                        </div>
                        <div class="edit-form-weui-cell weui-cell edit-form-select-button" id="selectedType">
                            
                            <button data-selectedinsurancetype="01" id = "risktype01"
                                    style="margin: 0.5px 10px 0.5px 0;"
                                    class="">
                                	意外险
                            </button>
                            
                            <button data-selectedinsurancetype="02" id = "risktype02"
                                    style="margin: 0.5px 10px 0.5px 0;"
                                    class="">
                                	医疗险
                            </button>
                            
                            <button data-selectedinsurancetype="03" id = "risktype03"
                                    style="margin: 0.5px 10px 0.5px 0;"
                                    class="">
                                	重疾险
                            </button>
                            
                            <button data-selectedinsurancetype="04" id = "risktype04"
                                    style="margin: 0.5px 10px 0.5px 0;"
                                    class=""> 
                                	人寿险
                            </button>
                        </div>
                    </div>
                </div>
                <div class="next-button">
                    <button id="goInsuranceTypeEdit">下一步</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="/js/common/lcl/lib/jquery1.12.4.min.js"></script>
<script src="/js/common/lcl/lib/jquery-weui.min.js"></script>
<script src="/js/common/lcl/lib/iosSelect.js"></script>
<script src="/js/insureplan/editplaninfo.js?v=20200402_01"></script>
<script src="/js/common/insuCommon.js"></script>
</body>
</html>
