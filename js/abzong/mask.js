$(document).ready(function() {
	var type='';
	thirdArr = [];
	var initoccObj = occObject.occ;
	for (var i = 0; i < initoccObj.length; i++) {
		for (var j = 0; j < initoccObj[i].child.length; j++) {
			for (var k = 0; k < initoccObj[i].child[j].child.length; k++) {
				thirdArr.push(initoccObj[i].child[j].child[k].codeValue);
				thirdArr.push(initoccObj[i].child[j].child[k].codeName);
			};
		};
	};
	$(".occ").each(function(){
		for (var i = 0;i < thirdArr.length; i++){
			if($(this).length>0){
				if($(this).val() == thirdArr[i]){
					$(this).data("occcode",thirdArr[i-1]);
				}
			}
		}
	})
	$(".occ").click(function(event) {
		if($(this).attr('class').indexOf('occ')>-1){
		if($(this).attr('class').indexOf('tb')>-1){
			type='tb'
//				console.log(type)
		}else{
			type=''
		}
		var that = $(this);
		var third = [];
		layer.open({
		    type: 1,
		    content: 	'<div class="layOcc">'+
		    				'<p>选择职业</p>'+
		    				'<div id="wrapper">'+
								'<div id="scroller">'+
									'<div class="accSearch"><input type="text" style="border:#e2e2e2 solid 1px;" id="search"/><i></i></div><div class="occCon">'+
					    			'</div>'+
					    		'</div>'+
					    	'</div>'+
					    '</div>',
		    anim: 'up',
		    fixed: true,
		    style: 'position:absolute; bottom:0; left:0; width: 100%; height: 75%; border:none; overflow:auto;',
		    success:function(){
				$(".layui-m-layershade,.layui-m-layerchild").on("touchmove",function(e){ 
		            e.preventDefault();  
		        });
		    }
		});
		var html = '';
		// $.getJSON("../json/occup.json",function(data){
			var occObj = occObject.occ;
			for (var i = 0; i < occObj.length; i++) {
				html += '<div class="occLevel"><p class="level01"><i></i>'+occObj[i].codeName+'</p>';
				for (var j = 0; j < occObj[i].child.length; j++) {
					html += '<ul>';
					html += '<h2 class="level02"><i></i>'+occObj[i].child[j].codeName+'</h2><i></i>';
					for (var k = 0; k < occObj[i].child[j].child.length; k++) {
						html += '<li><span class="level03" data-occcode="'+occObj[i].child[j].child[k].codeValue+'" data-occupGrade="'+occObj[i].child[j].child[k].occupGrade+'">'+occObj[i].child[j].child[k].codeName+'</span></li>';
						third.push(occObj[i].child[j].child[k].codeValue);
						third.push(occObj[i].child[j].child[k].codeName);
						third.push(occObj[i].child[j].child[k].occupGrade);
					};
					html += '</ul>';
				};
				html += '</div>';
			};
			$(".occCon").html(html);
			$("#search").on("touchstart",function(event) {
				$(this).focus();
			});
			$(".level01,.level02").click(function(event) {
				$(this).toggleClass("active");
				$(this).parent().toggleClass("active");
			});
			var myScroll;
			function loaded() {
				myScroll = new iScroll('wrapper', { checkDOMChanges: true });
			}
			loaded();
		// },false);
		$("#search").on("input",function(event){
			$(".occCon").html("");
			if($(this).val() != ""){
				//var searchFlag = false;
				var str = '<div class="occLevel"><ul style="display:block;">';
				for (var i = 0; i < third.length; i++) {
					if(third[i].match($(this).val())){
						str += '<li style="display:block;"><span class="level03" style="margin: 0 0.75rem 0 2.2rem;" data-occupGrade="'+third[i+1]+'" data-occcode="'+third[i-1]+'">'+third[i]+'</span></li>';
						//searchFlag = true;
					}
				};
				/*if (!searchFlag) {
					str += '<li style="display:block;"><span style="display: block;margin: 0 0.75rem 0 2.2rem;padding: 0.3rem 0rem;">'+'查无数据...'+'</span></li>';
				};*/
				str += '</ul></div>';
				$(".occCon").html(str);
//				console.log(third)
			}else{
				$(".occCon").html(html);
			};
			$("#search").on("touchstart",function(event) {
				$(this).focus();
			});
			$(".level01,.level02").click(function(event) {
				$(this).toggleClass("active");
				$(this).parent().toggleClass("active");
			});
			
		});
		$(document).on('click','.level03',function(event) {
			if(type==='tb'){
				$('.tb').val($(this).text());
				$('.tb').siblings('#Tb_occupationType').val($(this).data("occupgrade"));
//				console.log($('#Tb_occupationType').val(),11111)
				$('.tb').data("occcode",$(this).data("occcode"));
				layer.closeAll();
			}else{
				$('.bb').val($(this).text());
				$('.bb').siblings('#occupationType').val($(this).data("occupgrade"));
//				console.log($('#Tb_appntOccupation3').val(),11111)
				$('.bb').data("occcode",$(this).data("occcode"));
				layer.closeAll();
			}
			
		});
		/*$(".closeLay").click(function(event) {
			layer.closeAll();
		});*/
	}
	});
});