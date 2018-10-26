<#-- MC-255 keep old head JS code as it is because of dependency on carousal -->
${settings.name.get("layout.microsoftbi_head")} 
<#-- <#include "layout.microsoftbi_head.ftl"/> -->

<#-- MC-255 Start: updating header with UHFheader and footer -->
<#-- <#include "uhf_config.ftl"/>
${settings.name.get(uhfKeys("powerbi_head"))?replace("scode","script")} --> 
<#-- <#include "uhf_head.ftl"/> -->

<script>
 // Add social banner

window.SocialBannerHelper = {
		        "follow-twitter": "Follow this page on Twitter",
		        "share-twitter": "Share this page on Twitter",
		        "follow-rss": "Follow this page on RSS",
		        "follow-youtube": "Follow this page on Youtube",
		        "twitter-path": "${asset.get('/html/assets/twitter.svg')}",
		        "rss-path": "${asset.get('/html/assets/rss.svg')}",
		        "youtube-path":"${asset.get('/html/assets/youtube.svg')}",

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


                var followPlatforms = [
                { id: "twitter", url: "https://twitter.com/MSPowerBI", imagePath: window.SocialBannerHelper["twitter-path"], accessibilityText: window.SocialBannerHelper["follow-twitter"], class: "uhf-social-icon" },
 { id: "facebook", url: "https://www.facebook.com/microsoftbi?fref=ts", imagePath: window.SocialBannerHelper["facebook-path"], accessibilityText: window.SocialBannerHelper["follow-facebook"], class: "uhf-social-icon" },
            { id: "youtube", url: "https://youtube.com/c/MSPowerApps", imagePath: window.SocialBannerHelper["youtube-path"], accessibilityText: window.SocialBannerHelper["follow-youtube"], class: "uhf-social-icon" },
{ id: "newsletter", url: "https://powerbi.microsoft.com/newsletter/", imagePath: window.SocialBannerHelper["newsletter-path"], accessibilityText: window.SocialBannerHelper["follow-newsletter"], class: "uhf-social-icon" },
        ];
</script> 
<#-- <@uhfClienSideJS/> -->

<#-- MC-255 end -->
<style>

    @font-face {
      font-family: 'Segoe UI';
      src: url('//powerbi.microsoft.com/fonts/sundog/light/latest.eot');
      src: local("Segoe UI Light"), url('//powerbi.microsoft.com/fonts/sundog/light/latest.eot?#iefix') format('embedded-opentype'), url('//powerbi.microsoft.com/fonts/sundog/light/latest.woff') format('woff'), url('//powerbi.microsoft.com/fonts/sundog/light/latest.ttf') format('truetype'), url('//powerbi.microsoft.com/fonts/sundog/light/latest.svg#web') format('svg');
      font-style: normal;
      font-weight: 200;
    }
    @font-face {
      font-family: 'Segoe UI';
      src: url('//powerbi.microsoft.com/fonts/sundog/semilight/latest.eot');
      src: local("Segoe UI Semilight"), url('//powerbi.microsoft.com/fonts/sundog/semilight/latest.eot?#iefix') format('embedded-opentype'), url('//powerbi.microsoft.com/fonts/sundog/semilight/latest.woff') format('woff'), url('//powerbi.microsoft.com/fonts/sundog/semilight/latest.ttf') format('truetype'), url('//powerbi.microsoft.com/fonts/sundog/semilight/latest.svg#web') format('svg');
      font-style: normal;
      font-weight: 300;
    }
    @font-face {
      font-family: 'Segoe UI';
      src: url('//powerbi.microsoft.com/fonts/sundog/normal/latest.eot');
      src: local("Segoe UI"), url('//powerbi.microsoft.com/fonts/sundog/normal/latest.eot?#iefix') format('embedded-opentype'), url('//powerbi.microsoft.com/fonts/sundog/normal/latest.woff') format('woff'), url('//powerbi.microsoft.com/fonts/sundog/normal/latest.ttf') format('truetype'), url('//powerbi.microsoft.com/fonts/sundog/normal/latest.svg#web') format('svg');
      font-style: normal;
      font-weight: 400;
    }
    @font-face {
      font-family: 'Segoe UI';
      src: url('//powerbi.microsoft.com/fonts/sundog/semibold/latest.eot');
      src: local("Segoe UI Semibold"), url('//powerbi.microsoft.com/fonts/sundog/semibold/latest.eot?#iefix') format('embedded-opentype'), url('//powerbi.microsoft.com/fonts/sundog/semibold/latest.woff') format('woff'), url('//powerbi.microsoft.com/fonts/sundog/semibold/latest.ttf') format('truetype'), url('//powerbi.microsoft.com/fonts/sundog/semibold/latest.svg#web') format('svg');
      font-style: normal;
      font-weight: 600;
    }
    @font-face {
      font-family: 'Segoe UI';
      src: url('//powerbi.microsoft.com/fonts/sundog/bold/latest.eot');
      src: local("Segoe UI Bold"), url('//powerbi.microsoft.com/fonts/sundog/bold/latest.eot?#iefix') format('embedded-opentype'), url('//powerbi.microsoft.com/fonts/sundog/bold/latest.woff') format('woff'), url('//powerbi.microsoft.com/fonts/sundog/bold/latest.ttf') format('truetype'), url('//powerbi.microsoft.com/fonts/sundog/bold/latest.svg#web') format('svg');
      font-style: normal;
      font-weight: 700;
    }
    @font-face {
      font-family: 'DIN';
      src: url('//powerbi.microsoft.com/fonts/din/light/latest.eot');
      src: local("DIN Light"), url('//powerbi.microsoft.com/fonts/din/light/latest.eot?#iefix') format('embedded-opentype'), url('//powerbi.microsoft.com/fonts/din/light/latest.woff') format('woff'), url('//powerbi.microsoft.com/fonts/din/light/latest.ttf') format('truetype');
      font-style: normal;
      font-weight: 200;
    }
    @font-face {
      font-family: 'DIN';
      src: url('//powerbi.microsoft.com/fonts/din/normal/latest.eot');
      src: local("DIN UI"), url('//powerbi.microsoft.com/fonts/din/normal/latest.eot?#iefix') format('embedded-opentype'), url('//powerbi.microsoft.com/fonts/din/normal/latest.woff') format('woff'), url('//powerbi.microsoft.com/fonts/din/normal/latest.ttf') format('truetype');
      font-style: normal;
      font-weight: 400;
    }
    @font-face {
      font-family: 'powrmdl2';
      src: url('//powerbi.microsoft.com/fonts/powrmdl2/powrmdl2.eot');
      src: local("powrmdl2"), url('//powerbi.microsoft.com/fonts/powrmdl2/powrmdl2.eot?#iefix') format('embedded-opentype'), url('//powerbi.microsoft.com/fonts/powrmdl2/powrmdl2.woff') format('woff'), url('//powerbi.microsoft.com/fonts/powrmdl2/powrmdl2.ttf') format('truetype'), url('//powerbi.microsoft.com/fonts/powrmdl2/powrmdl2.svg#web') format('svg');
      font-style: normal;
      font-weight: 400;
    }

</style>
<!-- Favicon -->
<link rel="icon" type="image/x-icon" href="${asset.get("/html/assets/favicon.png")}"/>
<@component id="Custom.Head.TwitterCardMeta" />
