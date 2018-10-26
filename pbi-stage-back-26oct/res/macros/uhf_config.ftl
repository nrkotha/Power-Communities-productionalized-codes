<#-- UHF Header and Footer Settings -->
<#function uhfKeys name>
	<#assign uhfKeyInfo = {
		"flow_head":"layout.uhf_head_flow",
		"flow_header":"layout.uhf_header_flow",
		"flow_footer":"layout.uhf_footer_flow",
		"powerapps_head":"layout.uhf_head_powerapps",
		"powerapps_header":"layout.uhf_header_powerapps",
		"powerapps_footer":"layout.uhf_footer_powerapps",
		"powerbi_head":"layout.uhf_head_powerbi",
		"powerbi_header":"layout.uhf_header_powerbi",
		"powerbi_footer":"layout.uhf_footer_powerbi",
		"flowUrl":"https://uhf.microsoft.com/en-us/shell/xml/MSFLow?headerId=MSFlowHeader&footerId=MSFlowFooter&targeting=win10;mobile"?url,
		"powerAppsURL":"https://uhf.microsoft.com/en-us/shell/xml/MSPowerApps?headerId=MSPowerAppsHeader&footerId=MSPowerAppsFooter"?url,
		"powerBIURL":"https://uhf.microsoft.com/en-us/shell/xml/MSPowerBI?headerId=MSPowerBIHeader&footerId=MSPowerBIFooter"?url

	}/>
	<#return uhfKeyInfo[name]/>
</#function>


<#-- JS code that require to overrside Sign-In and Sign-Out URLs -->
<#macro uhfClienSideJS>

	<style>
		.withOutMSCC{
		  position: fixed !important;
		  top: 0px !important;
		  width: 100%
		}

		.withMSCC{
		  position: fixed !important;
		  top: 45px !important;
		  width: 100%
		}

		
		<#if !user.anonymous>
		div#meControl, #uhfSignInButtonCategoryMenu, #uhfsignupfree,#mobile-uhfsignupfree, #uhfsignupfreebutton, #mobile-uhfSignInButtonCategoryMenu, #mobile-uhfSignUpFreeButton{
			display:none !important;
		}
		</#if>
		.uhf-social-share .m-social.f-share {
    display: none !important;
}
section#footerArea{
    background-color: #eaeaea;
}
	</style>

	<script>
		(function (window) {
			var shellOptions = {   
		        meControlOptions: { 
		            rpData: 
		            { 
		                msaInfo: 
		                { 
		                    // signInUrl: '${settings.name.get("community.signon_url")}?${settings.name.get("config.sso_qs_param")}=${http.request.url?url}', 
		                    signInUrl:'${webUi.getUserLoginPageUrl(http.request.url)}',
		                    signOutUrl: '${webUi.getUserLogoutPageUrl(http.request.url)}' 
		                } 
		            }
                	
		        } 
		    }; 

		    // If msCommonShell already exists, load it
		    if (window.msCommonShell) {
		    	
		        window.msCommonShell.load(shellOptions); 
		    } else {
		        // Load the me control once msCommonShell is ready
		        window.onShellReadyToLoad = function () {
		            window.onShellReadyToLoad = null;
		            window.msCommonShell.load(shellOptions); 

		        };
		    } 

		})(window); 
	</script>

	<@liaAddScript>
		window.SocialBannerResources = {
	        "social-media-banner-label": "Social media links",
	        "follow-this-page-label": "Follow this page",
	        "share-this-page-label": "Share this page"
	    }

		window.SocialBannerHelper = {
	        "follow-twitter": "Follow this page on Twitter",
	        "share-twitter": "Share this page on Twitter",
	        "follow-facebook": "Follow this page on Facebook",
	        "follow-newsletter": "Subscribe to newsletter",
	        "follow-youtube": "Follow this page on Youtube",
	        "twitter-path": "${asset.get('/html/assets/twitter.svg')}",
	        "facebook-path": "${asset.get('/html/assets/facebook.svg')}",
	        "youtube-path": "${asset.get('/html/assets/youtube.svg')}",
	        "newsletter-path": "${asset.get('/html/assets/newsletter.svg')}"
	    }


              

		 ;(function($){
			$("#mobile-uhfSignInButtonCategoryMenu").attr("href","${webUi.getUserLoginPageUrl(http.request.url)}");
			$("#uhfSignInButtonCategoryMenu").attr("href","${webUi.getUserLoginPageUrl(http.request.url)}");
			$("#mobile-uhfsignupfreebutton").attr("href","${webUi.getUserRegistrationPageUrl(http.request.url)}");
			$("#uhfsignupfreebutton").attr("href","${webUi.getUserRegistrationPageUrl(http.request.url)}");
			try {
				 
				$("#uhfsignupfree").attr("href","${webUi.getUserRegistrationPageUrl(http.request.url)}");
				$("#mobile-uhfsignupfree").attr("href","${webUi.getUserRegistrationPageUrl(http.request.url)}");

			} catch (e){

			}


			function integrateUhf() {
		        
		        
		        // Add redirect functionality
		        // handleRedirectUrl($("#streamuhfsigninbutton"), "https://web.microsoftstream.com/", true);
		        // handleRedirectUrl($("#mobile-streamuhfsigninbutton"), "https://web.microsoftstream.com/", true);

		    

		         var sharePlatforms = []; 
		         

		        prependSocialBanner(followPlatforms, sharePlatforms, $("#footerArea"), window.SocialBannerResources);


	    	}

		    $(document).ready(integrateUhf);

 		})(LITHIUM.jQuery); 
 		;(function($){
		 	function enableFixedNavigation(e,stickyClass) { 
		 		function a() { 
		 			return Math.max(document.documentElement.clientWidth, window.innerWidth || 0) 
		 		} 
		 		function i() { 
		 			return $(".js-global-head").offset().top + $(".js-global-head").innerHeight() 
		 		} 
		 		function t(e) { 
		 			if (l) for (var a = 0; a < l.length; a++) l[a].toggle(e) 
		 		} 
		 		var l = e, 
		 		n = $(".js-cat-head"), 
		 		s = ($("#headerArea").innerHeight(), $("<div/>")), r = function () { var e = $(window).scrollTop(); a() > 767 && e >= i() ? n.hasClass(stickyClass) || (t(!0), n.addClass(stickyClass), s.height(n.innerHeight())) : (t(!1), n.removeClass(stickyClass), s.height(0)) }; s.insertBefore(n), r(), $(window).on("scroll", r), 
		 		$(window).on("resize", r), $(window).on("orientationchange", r) 
		 	}
 			enableFixedNavigation([$("#uhfSignInButtonCategoryMenu")],"withOutMSCC");
 		})(LITHIUM.jQuery); 
	</@liaAddScript>
</#macro>
