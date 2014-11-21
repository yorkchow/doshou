 jQuery(function ($) {
 	$(document).ready(function () {
 		jQuery(function ($) {
 			$(".fit-vids").fitVids();
 		});
 		jQuery(function ($) {
 			$('.pagination-load-more a').click(function () {
 				$('.pagination-span-load').fadeIn(200).delay(1800).fadeOut(200);
 			});
 		}); /*start of the guts for jquery*/
 		jQuery(function ($) {
 			$('.social-icons li a').tooltip();
 		});
 		jQuery(function ($) {
 			$('.opac').mouseover(function () {
 				$(this).stop(true).delay(0).animate({
 					opacity: 0.90
 				}, 'fast');
 			}).mouseout(function () {
 				$(this).stop(true).delay(0).animate({
 					opacity: 1
 				}, 'fast');
 			});
 		});
 		jQuery(function ($) {
 			$('div.nivoSlider').mouseover(function () {
 				$('.nivo-directionNav a').stop(true).delay(0).animate({
 					opacity: 0.7
 				}, 'fast');
 			}).mouseout(function () {
 				$('.nivo-directionNav a').stop(true).delay(0).animate({
 					opacity: 0
 				}, 'fast');
 			});
 		});
 		
 		
 		
 		
 		
 		jQuery(".post-like a").click(function () {
 			heart = jQuery(this);
 			// Retrieve post ID from data attribute
 			post_id = heart.data("post_id");
 			// Ajax call
 			jQuery.ajax({
 				type: "post",
 				url: ajax_var.url,
 				data: "action=post-like&nonce=" + ajax_var.nonce + "&post_like=&post_id=" + post_id,
 				success: function (count) {
 					// If vote successful
 					if (count != "already") {
 						heart.addClass("voted");
 						heart.siblings(".count").text(count).fadeIn(500);
 					}
 				}
 			});
 			return false;
 		});
 		jQuery(function ($) {
 			$('#simple-menu').sidr({
 				name: 'sidr',
 				side: 'left' // By default
 			});
 			$('#simple-close').sidr({
 				name: 'sidr',
 				side: 'left'
 			});
 		});
 		//end this        
 	});
 });