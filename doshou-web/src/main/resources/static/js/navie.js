jQuery(function($) {
	$(document).ready(function() {
		var flag = false;
		$(window).scroll(function() {
			if ($(window).scrollTop() >= 100 && flag == false) {
				flag = true;
				//do what you want
				$('.header-wrap').stop().animate({
					height: '60px'
				}, 'fast', 'swing');
				$('.logo-name').stop().animate({
					lineHeight: '60px'
				}, 'fast', 'swing');

				$('.sf-menu-primary a').stop().animate({
					paddingTop: '19px',
					paddingBottom: '19px'
				}, 'fast', 'swing');
				$('.sf-menu-primary ul').stop().animate({
					marginTop: '-15px'
				}, 'fast', 'swing');
				$('.logo img').stop().animate({
					height: '60px',
					width:'auto'
				}, 'fast', 'swing');
				$('.responsive-trig').stop().animate({
					top: 10
				}, 'fast', 'swing');
			}
			if ($(window).scrollTop() <= 100 && flag == true) {
				flag = false;
				//do what you want
				$('.header-wrap').stop().animate({
					height: '90px'
				}, 'fast', 'swing');
				
				$('.logo-name').stop().animate({
					lineHeight: '90px'
				}, 'fast', 'swing');


				$('.sf-menu-primary a').stop().animate({
					paddingTop: '34px',
					paddingBottom: '34px'
				}, 'fast', 'swing');
				$('.sf-menu-primary ul').stop().animate({
					marginTop: '15px'
				}, 'fast', 'swing');
				$('.logo img').stop().animate({
					height: '90px',
					width: 'auto'
				}, 'fast', 'swing');
				$('.responsive-trig').stop().animate({
					top: 25
				}, 'fast', 'swing');
			}
		}); /*ending this js file now */
	});
});