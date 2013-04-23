// HOME SLIDER
    jQuery(document).ready(function($) {
      $('.royalSlider').royalSlider({
        autoPlay: {
        // autoplay options go gere
        enabled: true,
        pauseOnHover: true,
        stopAtAction: false
      },
      block: {
      // animated blocks options go gere
        fadeEffect: false,
        moveEffect: 'bottom',
        delay: 500,
        speed: 150,
        easing:'easeOutSine'
      },
      arrowsNav: true,
      allowCSS3: true,
      arrowsNavAutoHide: false,
      fadeinLoadedSlide: false,
      controlNavigationSpacing: 0,
      controlNavigation: 'bullets',
      imageScaleMode: 'none',
      imageAlignCenter:false,
      blockLoop: true,
      loop: true,
      numImagesToPreload: 6,
      transitionType: 'move',
      keyboardNavEnabled: true,
      sliderDrag: true,
      sliderTouch: true,
      keyboardNavEnabled: true,
      });
  
    // custom script for stereosonica
    function add_numbers_to_slides() {
      bullet =  $('.rsDefault .rsBullet');
      numbers = new Array('01', '02','03','04','05','06','07','08','09','10','11', '12');
      bullet.each(function() {
        $(this).find('span').text(numbers[$(this).index()]);
      });
    }
  
    add_numbers_to_slides();
  
  
    });  // END OF DOCUMENT READY
  
  
  
  
