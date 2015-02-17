(function($){
$.tdash=function(){
    return $.tdash;
}
	
$.fn.extend({tdash:function(){
	var u=new $.tdash;
	u.jquery=this;
	return u;
}});
	
$.tdash._import=function(name,fn){
	$.tdash[name]=function(){
		var ret=fn.apply($.tdash,arguments);
		return ret?ret:$.tdash;
	}
}
	
$.each({
	alert: function(text){
		alert(text);		
	},
	makeSortable: function(name,items){

        $( "#"+name ).sortable({
            placeholder: "ui-state-highlight",
            items: items
        });

	},
	saveOrder: function(name,items,attr,url){


        if (url.indexOf('?') === false) {
            url = url + '?';
        } else {
            url = url + '&';
        }

        var ids = '';

        $("#"+name+" "+items).each(function(i,e){
            console.log(i);
            if (i != 0) {
                ids = ids  + ",";
            }
            ids = ids  + $(e).attr(attr);
        });


        url = url + 'action=refresh_order&ids=' + ids;

        console.log(ids);
        $(this).univ().ajaxec(url);


	}

},$.tdash._import);

})(jQuery);