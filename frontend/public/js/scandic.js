$(function(){
  /*Technology Stack First and Second Child ignore*/
  $(".technology-stack .technology-stack-left").not(':first').css('margin-top','4em');
  $(".technology-stack .technology-stack-right").not(':first').css('margin-top','4em');
 
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
  resizeUpdate();
  $('.header .icon-nav').click(function(){
    $('.nav-mobile').slideToggle(150);
    $(this).toggleClass('active');
  });
  $('.tooltip').tooltip({
    position: { my: "center", at: "bottom+30" }
  });

});

$(window).resize(function() {
    if(this.resizeTO) clearTimeout(this.resizeTO);
    this.resizeTO = setTimeout(function() {
        resizeUpdate();
    }, 500);
});


function resizeUpdate() {
  /*technology Stack block height start*/
  var maxHeight = 0;
  $(".technology-stack .atk-box").each(function() {
    if ($(this).outerHeight() > maxHeight) {
      maxHeight = $(this).outerHeight();
    }
  }).height(maxHeight);
  /*technology Stack block height end*/

  console.log('resized!');
  contentHeight = $('.content').height();
  sidebarHeight = $('.sidebar aside').height();
  if ( contentHeight > sidebarHeight ) {
    $('.sidebar aside').height(contentHeight);
  } else {
    $('.sidebar aside').css("height", "auto");
  }

  techStack1 = $('.technology-stack .step-1:first-child .atk-box');
  techStack2 = $('.technology-stack .step-1:first-child + .step-1 .atk-box');
  $(techStack1).css('height', 'auto');
  $(techStack2).css('height', 'auto');
  techStack1Height = $(techStack1).outerHeight();
  techStack2Height = $(techStack2).outerHeight();
  if ( techStack1Height > techStack2Height ) {
    $(techStack1).outerHeight(techStack1Height);
    $(techStack2).outerHeight(techStack1Height);
  } else {
    $(techStack1).outerHeight(techStack2Height);
    $(techStack2).outerHeight(techStack2Height);
  }

  jobTab1 = $('.tabs-jobs .ui-tabs-nav li:first-child a');
  jobTab2 = $('.tabs-jobs .ui-tabs-nav li:first-child+li a');
  $(jobTab1).css('height', 'auto');
  $(jobTab2).css('height', 'auto');
  jobTab1Height = $(jobTab1).outerHeight();
  jobTab2Height = $(jobTab2).outerHeight();
  if ( jobTab1Height > jobTab2Height ) {
    $(jobTab1).outerHeight(jobTab1Height);
    $(jobTab2).outerHeight(jobTab2Height);
  } else {
    $(jobTab1).outerHeight(jobTab2Height);
    $(jobTab2).outerHeight(jobTab2Height);
  }

  $('.contact-sidebar .atk-box').css("height", "auto");
  contactSidebarHeight = $('.contact-sidebar .atk-box').outerHeight();
  contactSidebarHeight = Math.ceil(contactSidebarHeight);
  $('.map').height(contactSidebarHeight);
  $('.contact-sidebar .atk-box').outerHeight(contactSidebarHeight);

}

