$(function(){

  $('.tabs-jobs').tabs();
  $('.timeline .event .atk-box-small').each(function(){
    var h = $(this).outerHeight();
    $(this).css("margin-top", -h/2);
  });
  $('.testimonial-carousel-mask').royalSlider({
    autoHeight: true,
    arrowsNav: true,
    arrowsNavAutoHide: false,
    controlsInside: false,
    controlNavigation: 'none',
    loop: true,
    navigateByClick: false,
    sliderDrag: false,
    sliderTouch: false,
    sliderSpacing: 0,
    thumbs: {
      drag: false
    },
    autoPlay: {
      delay: 4000,
      enabled: true,
      pauseOnHover: true
    }
  });

  var mapheight = $('.contact-sidebar').outerHeight();
  $('.map').height(mapheight);


$(window).resize(function() {
  var contentHeight = $('.content').height();
  var sidebarHeight = $('.sidebar').height();
  if ( contentHeight > sidebarHeight ) {
    $('.sidebar aside').height(contentHeight);
  }
});

$(window).trigger('resize');


});
