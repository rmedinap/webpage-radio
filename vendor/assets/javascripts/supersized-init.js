jQuery(function($){
				
  $.supersized({
				
  // Functionality
    slide_interval          :   3000,		// Length between transitions
    transition              :   1, 			// 0-None, 1-Fade, 2-Slide Top, 3-Slide Right, 4-Slide Bottom, 5-Slide Left, 6-Carousel Right, 7-Carousel Left
    transition_speed		:	700,		// Speed of transition
															   
					// Components							
    slide_links				:	'blank',	// Individual links for each slide (Options: false, 'num', 'name', 'blank')
  slides:  	[	
	{image : '/javascripts/libs/bgstretcher-2/demo/images/sample-1.jpg', title : 'Image Credit: Maria Kazvan', thumb : 'http://buildinternet.s3.amazonaws.com/projects/supersized/3.2/thumbs/kazvan-1.jpg', url : 'http://www.nonsensesociety.com/2011/04/maria-kazvan/'},
{image : '/javascripts/libs/bgstretcher-2/demo/images/sample-2.jpg', title : 'Image Credit: Maria Kazvan', thumb : 'http://buildinternet.s3.amazonaws.com/projects/supersized/3.2/thumbs/kazvan-1.jpg', url : 'http://www.nonsensesociety.com/2011/04/maria-kazvan/'},																									]

					
				});
		    });

