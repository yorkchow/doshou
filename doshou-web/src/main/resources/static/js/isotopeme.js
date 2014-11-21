jQuery(function($) {
	$(document).ready(function() {
		$(function() {
			var $container = $('#mainmasonry');
			$container.imagesLoaded(function() {
				$container.isotope({
				
					
					masonry:{
					itemSelector: '#masonryme',
					isFitWidth: true,
					isResizable: true,
					animate: true,
										
					}
				});
				

			});
		}); //end function var call
		
		
		
		$(function() {
			var $container = $('#mainmasonry');
			$container.infinitescroll({
			
				navSelector: '.pagination-load-more',
				// selector for the paged navigation 
				
				nextSelector: '.pagination-me a',
				// selector for the NEXT link (to page 2)
				
				itemSelector: '#masonryme',
				// selector for all items you'll retrieve
				
				behavior: 'twitter', //twitter for button
				
				
				loading: {
					finished: undefined,
					finishedMsg: null,
					img: '', 
					msg: null,
					msgText: null,
					selector: null,
					speed: 'fast',
					start: null
					
				}
				
			}, //end infinite
			// trigger Masonry as a callback

			function(newElements) {
				// hide new items while they are loading
				var $newElems = $(newElements).css({
					opacity: 0
				});
				// ensure that images load before adding to masonry layout
				$newElems.imagesLoaded(function() {
					// show elems now they're ready
					$newElems.animate({
						opacity: 1
					});
					$container.isotope('appended', $newElems, true);
				});
				//CALLBACKS HERE


            $(".fit-vids").fitVids();



            $('.opac').mouseover(function() {
                $(this).stop(true).delay(0).animate({
                    opacity: 0.90
                }, 'fast');
            }).mouseout(function() {
                $(this).stop(true).delay(0).animate({
                    opacity: 1
                }, 'fast');
            });



				//END CALLBACKS
			});
		});
		//close jquery
	});
});

