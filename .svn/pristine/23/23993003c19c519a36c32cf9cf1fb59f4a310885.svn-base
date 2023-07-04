
	/**
	 * 屏蔽微信浏览器打开网页分享菜单, 使用时只需要引入该js即可
	 */
	function onBridgeReady(){
	 	WeixinJSBridge.call('hideOptionMenu');
	}
	
	if (typeof WeixinJSBridge == "undefined"){
	    if( document.addEventListener ){
	        document.addEventListener('WeixinJSBridgeReady', onBridgeReady, false);
	    }else if (document.attachEvent){
	        document.attachEvent('WeixinJSBridgeReady', onBridgeReady); 
	        document.attachEvent('onWeixinJSBridgeReady', onBridgeReady);
	    }
	}else{
	    onBridgeReady();
	}
