${settings.name.get("layout.microsoftbi_head")}

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
<#if page.name == "CommunityPage">
<div class="skip_div">
	<a href="#skip_content" class="skip">Skip to main content</a>
</div>
</#if>