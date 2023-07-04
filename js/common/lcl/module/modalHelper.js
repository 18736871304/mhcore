function modalHelper() {
	var scrollTop;
	var bodyCls = 'modal-open'
	return {
		//打开弹窗
		afterOpen: function() {
			scrollTop = document.scrollingElement.scrollTop;
			document.body.classList.add(bodyCls);
			document.body.style.top = -scrollTop + 'px';
		},
		//关闭弹窗
		beforeClose: function() {
			document.body.classList.remove(bodyCls);
			// scrollTop lost after set position:fixed, restore it back.
			document.body.style.top = 0;
			document.scrollingElement.scrollTop = scrollTop;
		}
	}
}