$.fn.orderedGrid = function(submit_url, options){
	var self = this;

	var fixHelper = function(e, ui) {
		ui.children().each(function() {
			$(this).width($(this).width());
		});
		return ui;
	};


	options = $.extend({}, {
		placeholder: "ui-state-highlight",
		cursor: "move",
		helper: fixHelper,
		update: function(event, ui) {

			var order = [];
            self.find('tbody>tr').each(function(){
                order.push($(this).attr('data-id'));
            });

	        region=self;
            if(region.data('ajaxec_loading'))return this.successMessage('Please Wait');
            region.data('ajaxec_loading',true);

            var cogs=$('<div id="banner-loader" class="atk-banner atk-cells atk-visible"><div class="atk-cell atk-align-center atk-valign-middle"><div class="atk-box atk-inline atk-size-zetta atk-banner-cogs"></div></div></div>');
            cogs.appendTo('body');

			$.ajax({
				data: $.param({ 'order': order }),
				method: 'POST',
				url: submit_url
			}).done(function(ret) {
	            cogs.remove();
	            region.data('ajaxec_loading',false);

            	try{
                	eval(ret);
	            }catch(e){
	                w=window.open(null,null,'height=400,width=700,location=no,menubar=no,scrollbars=yes,status=no,titlebar=no,toolbar=no');
	                if(w){
	                    w.document.write('<h5>Error in AJAXec response: '+e+'</h5>');
	                    w.document.write(ret);
	                    w.document.write('<center><input type=button onclick="window.close()" value="Close"></center>');
	                }else{
	                    console.log("Error in ajaxec response", e,ret);
	                    showMessage("Error in AJAXec response: "+e+"\n"+ret);
	                }
                }

			});
		}
	}, options);

	this.sortable(options);
};
