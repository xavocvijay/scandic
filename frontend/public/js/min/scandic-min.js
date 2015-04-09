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
    }
  });


  // Disable scroll zooming and bind back the click event
  var onMapMouseleaveHandler = function (event) {
    var that = $('#gmap_canvas');

    that.on('click', onMapClickHandler);
    that.off('mouseleave', onMapMouseleaveHandler);
    that.find('iframe').css("pointer-events", "none");
  }

  var onMapClickHandler = function (event) {
    var that = $(this);

    // Disable the click handler until the user leaves the map area
    that.off('click', onMapClickHandler);

    // Enable scrolling zoom
    that.find('iframe').css("pointer-events", "auto");

    // Handle the mouse leave event
    that.on('mouseleave', onMapMouseleaveHandler);
  }



});

