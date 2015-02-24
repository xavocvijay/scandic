(function($){
$.scandic=function(){
    return $.scandic;
}
	
$.fn.extend({scandic:function(){
	var u=new $.scandic;
	u.jquery=this;
	return u;
}});
	
$.scandic._import=function(name,fn){
	$.scandic[name]=function(){
		var ret=fn.apply($.scandic,arguments);
		return ret?ret:$.scandic;
	}
}
	
$.each({
	alert: function(text){
		alert(text);		
	}

},$.scandic._import);

})(jQuery);