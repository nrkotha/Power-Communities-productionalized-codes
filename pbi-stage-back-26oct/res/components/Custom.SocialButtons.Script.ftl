<@liaAddScript>
	(function ($) {
		'use strict';

		var FACEBOOK_WIDTH = 560,
			FACEBOOK_HEIGHT = 330,
			TWITTER_WIDTH = 560,
			TWITTER_HEIGHT = 260,
			LINKEDIN_WIDTH = 560,
			LINKEDIN_HEIGHT = 450;

		function openFacebookPopup() {
			/* jshint validthis:true */
/* Adding replace as part of SDL activities (http to https) */
			return !window.open(this.href.replace("http://","https://"), 'Facebook', 'width=' + FACEBOOK_WIDTH + ',height=' + FACEBOOK_HEIGHT);
		}

		function openTwitterPopup() {
			/* jshint validthis:true */
/* Adding replace as part of SDL activities (http to https) */
			return !window.open(this.href.replace("http://","https://"), 'Twitter', 'width=' + TWITTER_WIDTH + ',height=' + TWITTER_HEIGHT);
		}

		function openLinkedInPopup() {
/* Adding replace as part of SDL activities (http to https) */
			return !window.open(this.href.replace("http://","https://"), 'Linkedin', 'width=' + LINKEDIN_WIDTH + ',height=' + LINKEDIN_HEIGHT);
		}

		$('body').on('click', '.social-share.social-facebook', openFacebookPopup);
		$('body').on('click', '.social-share.social-twitter', openTwitterPopup);
		$('body').on('click', '.social-share.social-linkedin', openLinkedInPopup);

		$('.lia-menu-bar.lia-menu-bar-top .lia-menu-bar-buttons').html($('.lia-message-custom-social-buttons'))
	})(LITHIUM.jQuery);
</@liaAddScript>