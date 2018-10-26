<#if (user.anonymous == false) && (user.registration.complete == true)>
     <#if env.context.message??>
<style>
.custom-social-share-menu .social-hover{
    display:none;
}
.custom-social-share-menu a.social-share{
    text-decoration:none;
}

.custom-social-share-menu a.social-share:hover{
    text-decoration:none;
}

.custom-social-share-menu .social-share.social-linkedin img:hover {
    content: url(/html/assets/linkedin_color.png);
}

.custom-social-share-menu .social-share.social-facebook img:hover {
    content: url(/html/assets/facebook_color.png);
}

.custom-social-share-menu .social-share.social-twitter img:hover {
    content: url(/html/assets/twitter_color.png);
}


</style>

<div class= custom-social-share-menu lia-social-share linkList linkList-horizontal">
    <a href="http://www.linkedin.com/shareArticle?mini=true&url=${env.context.message.webUi.url}" class="social-share social-linkedin">
        <img class="social-default" src="/html/assets/linkedin_blk.png" alt="LinkedIn" />
        <img class="social-hover" src="/html/assets/linkedin_color.png" alt="LinkedIn" />
    </a>
    <a href="http://www.facebook.com/share.php?u=${env.context.message.webUi.url}" class="social-share social-facebook">
        <img class="social-default" src="/html/assets/facebook_blk.png" alt="Facebook" />
        <img class="social-hover" src="/html/assets/facebook_color.png" alt="Facebook" />
    </a>
    <a href="http://twitter.com/share?text=Check out this page: ${env.context.message.subject} %23PowerBI&url=${env.context.message.webUi.url}" class="social-share social-twitter">
        <img class="social-default" src="/html/assets/twitter_blk.png" alt="Twitter" />
        <img class="social-hover" src="/html/assets/twitter_color.png" alt="Twitter" />
    </a>
</div>

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
<#else>
</#if>
</#if>
