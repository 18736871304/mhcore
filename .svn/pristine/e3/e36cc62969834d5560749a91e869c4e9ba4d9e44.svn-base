/**
 * Created by sks on 2017/9/4.
 */
var ls = window.localStorage
var Lstorage={
	  getItem:function(key) {
		    try {
		      return JSON.parse(ls.getItem(key))
		    } catch (err) {
		      return null
		    }
		  },
		  setItem:function(key, val) {
		    ls.setItem(key, JSON.stringify(val))
		  },
		  clear:function() {
		    ls.clear()
		  },
		  keys:function() {
		    return ls.keys()
		  },
		  removeItem:function(key) {
		    ls.removeItem(key)
		  }
}

