<#-- UHF Header and Footer Settings -->
<#function uhfKeys name>
	<#assign uhfKeyInfo = {
		"flow_head":"layout.uhf_head_flow",
		"flow_header":"layout.uhf_header_flow",
		"flow_footer":"layout.uhf_footer_flow",
		"powerapps_head":"layout.uhf_head_powerapps",
		"powerapps_header":"layout.uhf_header_powerapps",
		"powerapps_footer":"layout.uhf_footer_powerapps",
		"flowUrl":"https://uhf.microsoft.com/en-us/shell/xml/MSFLow?headerId=MSFlowHeader&footerId=MSFlowFooter&targeting=win10;mobile"?url,
		"powerAppsURL":"https://uhf.microsoft.com/en-us/shell/xml/MSPowerApps?headerId=MSPowerAppsHeader&footerId=MSPowerAppsFooter"?url
	}/>
	<#return uhfKeyInfo[name]/>
</#function>


<#-- JS code that require to overrside Sign-In and Sign-Out URLs -->
<#macro uhfClienSideJS>
	<script src="${asset.get("/html/assets/uhfscripts.min.js")}"></script>
<link rel="stylesheet" href="//assets.onestore.ms/cdnfiles/external/mwf/long/v1/v1.22.0/css/mwf-west-european-default.min.css">

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

		#uhfSignInButtonCategoryMenu{
		  display:none;
		}
		<#if !user.anonymous>
		div#meControl, #uhfSignInButtonCategoryMenu, #uhfsignupfree,#mobile-uhfsignupfree, #uhfsignupfreebutton, #mobile-uhfSignInButtonCategoryMenu, #mobile-uhfSignUpFreeButton{
			display:none !important;
		}
		</#if>
		/*-- UHF Styles (Start) --*/
		.c-dialog#get-started .section-bottom05 {
		  padding-bottom: 60px;
		}
		.c-dialog .c-text-field {
		  color: black;
		}
		.section-bottom05,
		.padding-bottom05 {
		  padding-bottom: 60px;
		}
		.modal {
		  overflow-y: hidden;
		  max-height: 100%;
		  opacity: initial;
		}
		.padding-size0 {
		  padding-top: 0;
		  padding-bottom: 0;
		}
		.bapi-signup .c-button {
		  margin-top: 18px;
		}
		.bapi-text-slate16 {
		  color: #FFFFFF;
		}
		.button.c-button.bapi-text-uppercase,
		a.c-button.bapi-text-uppercase,
		button.c-button[type=submit].bapi-text-uppercase {
		  padding-top: 11px;
		  padding-bottom: 11px;
		}
		.bapi-text-uppercase {
		  text-transform: uppercase;
		}
		.bapi-text-slate16 {
		  color: #FFFFFF;
		}
		.c-heading3 {
		  margin-bottom: 0;
		}
		.c-universal-footer {
		  margin-top: 0;
		}
		.field-validation-error {
		  font-size: 12px;
		  color: #ba141a;
		}
		.input[type="text"].input-validation-error {
		  border-color: #ba141a !important;
		}
		.sticky {
		  position: fixed !important;
		  width: 100%;
		  left: 0;
		  top: 0;
		  z-index: 100;
		  border-top: 0;
		  transition: all 2s linear;
		}
		.uhf-social-share {
		  padding-top: 15px;
		  padding-bottom: 15px;
		}
		.uhf-social-share ul,
		.uhf-social-share li {
		  list-style: none;
		}
		.uhf-social-share .m-social.f-share {
		    display:none !important;
		}
		@media only screen and (min-width: 899px) and (max-width: 1083px) {
		  .uhf-social-share {
		    width: 90%;
		  }
		}
		@media only screen and (min-width: 540px) {
		  .uhf-social-share .m-social.f-share {
		    float: right;
		    display:none !important;
		  }
		}
		@media only screen and (max-width: 898px) {
		  .uhf-social-share {
		    padding-left: 40px;
		    padding-right: 40px;
		  }
		}
		@media only screen and (max-width: 539px) {
		  .uhf-social-share {
		    padding-left: 12px;
		    padding-right: 12px;
		  }
		}
		.m-social {
		  margin-top: 0 !important;
		}
		.m-social > ul > li > a img {
		  height: 32px;
		  width: 32px;
		}
		/* UHF Styles End -->
		/* UHF styles override Start */
		footer.c-uhff {
		  margin-top: 0 !important;
		}
		.display-none {
		  display: none !important;
		}
		#uhfSignInButtonCategoryMenu {
		  display: none;
		}
		.uhf-rss {
		  width: 20px !important;
		}
		.uhf-youtube {
		  width: 24px !important;
		  height: 24px !important;
		  margin: 4px;
		}
		.m-social ul,
		.m-social li {
		  padding-left: 0;
		  margin-bottom: 0;
		  list-style-type: none;
		}
		#headerArea img,
		#headerArea svg,
		#headerArea video {
		  fill: none;
		}
		#footerArea {
		  background-color: white;
		}
		/* UHF styles override End */
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
		        "follow-rss": "Follow this page on RSS",
		        "follow-youtube": "Follow this page on Youtube",
		        "twitter-path": "${asset.get('/html/assets/twitter.svg')}",
		        "rss-path": "${asset.get('/html/assets/rss.svg')}",
		        "youtube-path":"${asset.get('/html/assets/youtube.svg')}",

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
