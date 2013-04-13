$(window).load(function(){
  var $container = $('#noticias-listado');
  
  $container.imagesLoaded(function() {
    $container.isotope({
    //  sortBy : 'random',
      layoutMode: 'masonry',
    //  transformsEnabled: false,
    });
  });

  $('#noticias-botones a').click(function(){
    var selector = $(this).attr('data-filter');
    $container.isotope({ filter: selector });
    return false;
  });






//  var $container = $('#portafolio-listado');
//  $container.isotope({
//    itemSelector : '.element'
//  });
//  var $optionSets = $('#options .option-set'),
//  $optionLinks = $optionSets.find('a');
//  $optionLinks.click(function(){
//    var $this = $(this);
//
//    // don't proceed if already selected
//    if ( $this.hasClass('selected') ) {
//      return false;
//    }
//    var $optionSet = $this.parents('.option-set');
//    $optionSet.find('.selected').removeClass('selected');
//    $this.addClass('selected');
//
//    // make option object dynamically, i.e. { filter: '.my-filter-class' }
//    var options = {},
//    key = $optionSet.attr('data-option-key'),
//    value = $this.attr('data-option-value');
//
//    // parse 'false' as false boolean
//    value = value === 'false' ? false : value;
//    options[ key ] = value;
//
//    if ( key === 'layoutMode' && typeof changeLayoutMode === 'function' ) {
//      // changes in layout modes need extra logic
//      changeLayoutMode( $this, options )
//    } else {
//      // otherwise, apply new options
//      $container.isotope( options );
//    }
//    return false;
//  });






});

