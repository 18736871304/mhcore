var my_url = ''
function getData(type,url, callback,params) {
	// var params = params || {};
    $.ajax({
		type:type,
        async: true,
		url:url,
		data:params,
        //dataType : "jsonp",
        //jsonp: "jsonpCallback",
		success:function(data){
			var obj = JSON.parse(data);
			callback(obj);
		}
    });
};

function getPhoneData(type,url, callback,params) {
	// var params = params || {};
    $.ajax({
		type:type,
        async: true,
		url:url,
		data:params,
        //dataType : "jsonp",
        //jsonp: "jsonpCallback",
		success:function(data){
			//var obj = JSON.parse(data);
			callback(data);
		}
    });
};