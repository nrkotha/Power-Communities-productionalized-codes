<#-- MC-242 updating header with UHF header and footer -->
<#-- <#include "uhf_config.ftl"/>
${settings.name.get(uhfKeys("powerapps_head"))?replace("scode","script")} 
<@liaAddScript>
;(function($){
	$(document).ready(function() {
	/*	if (window.hideForMobile !== true) {
	        $("#meControl").css("visibility", "visible");
	        $("#uhfsignupfree").css("visibility", "visible");
	        $("#mobile-uhfsignupfree").css("visibility", "visible");
	        // Sticky navigation
	        enableStickyNavigation([$("#uhfSignInButtonCategoryMenu")]);
	        $("#pricingLink").css("visibility", "visible");
	    } else {
	        $("#pricingLink").parent().addClass("display-none");
	        $("#meControl").addClass("display-none");
	        $("#uhfsignupfree").addClass("display-none");
	        $("#mobile-uhfsignupfree").addClass("display-none");
	        enableStickyNavigation();
	    }

	    if (window.showFindConsultingServices === true) {
	        $("#findConsultingServicesLink").css("visibility", "visible");
	    } else {
	        $("#findConsultingServicesLink").parent().addClass("display-none");
	    } */
	})
})(LITHIUM.jQuery); 
</@liaAddScript>

<script>
window.SocialBannerHelper = {
		        "follow-twitter": "Follow this page on Twitter",
		        "share-twitter": "Share this page on Twitter",
		        "follow-rss": "Follow this page on RSS",
		        "follow-youtube": "Follow this page on Youtube",
		        "twitter-path": "${asset.get('/html/assets/twitter.svg')}",
		        "rss-path": "${asset.get('/html/assets/rss.svg')}",
		        "youtube-path":"${asset.get('/html/assets/youtube.svg')}",

		}
                var followPlatforms = [
            { id: "rss", url: "https://powerapps.microsoft.com/blog/feed/", imagePath: window.SocialBannerHelper["rss-path"], accessibilityText: window.SocialBannerHelper["follow-rss"], class: "uhf-rss", pictureClass: "uhf-rss-picture" },
            { id: "twitter", url: "https://twitter.com/PowerApps", imagePath: window.SocialBannerHelper["twitter-path"], accessibilityText: window.SocialBannerHelper["follow-twitter"], class: "uhf-social-icon" },
            { id: "youtube", url: "https://youtube.com/c/MSPowerApps", imagePath: window.SocialBannerHelper["youtube-path"], accessibilityText: window.SocialBannerHelper["follow-youtube"], class: "uhf-social-icon" },
        ];
</script>
<@uhfClienSideJS/> -->

${settings.name.get("layout.urlfetcher_head")}

<!-- Favicon -->
<link rel="icon" type="image/x-icon" href="${asset.get("/html/assets/favicon.ico")}"/>

<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link rel="shortcut icon" href="data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7" type="image/gif">

<meta name="google-site-verification" content="zpXHUgaFUrSU9uhguHYkk9WZEfYBE-XMt2c4B6GPQMA" />

<#-- Start: This code is written by iTalent as part of iTrack MC-430 -->
<script src="https://az725175.vo.msecnd.net/scripts/jsll-4.js" type="text/javascript"></script>
				<script type="text/javascript">
				var config = {
				coreData: {
					appId: "PowerUsersCommunity"
					}
					};
					awa.init(config);
					</script>

<#-- End: The code is written by iTalent as part of iTrack MC-430 -->