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
	},
	makeSortable: function(name,items){

        $( "#"+name ).sortable({
            placeholder: "ui-state-highlight",
            items: items,
            cursor: "move"
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

},$.scandic._import);

})(jQuery);