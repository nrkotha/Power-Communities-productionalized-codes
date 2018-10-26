<#-- ${settings.name.get("layout.urlfetcher_head")} -->
<#include "layout.urlfetcher_head.ftl"/>

<style>
    /*fonts*/
    @font-face {
        font-family: wf_segoe-ui_light;
        src: url('//powerapps.microsoft.com/fonts/sundog/light/latest.eot');
        src: local("Segoe UI Light"),
            url('//powerapps.microsoft.com/fonts/sundog/light/latest.eot?#iefix') format('embedded-opentype'),
            url('//powerapps.microsoft.com/fonts/sundog/light/latest.woff') format('woff'),
            url('//powerapps.microsoft.com/fonts/sundog/light/latest.ttf') format('truetype'),
            url('//powerapps.microsoft.com/fonts/sundog/light/latest.svg#web') format('svg');
        .font-light();
        font-style: normal;
    }

    @font-face {
        font-family: wf_segoe-ui_semilight;
        src: url('//powerapps.microsoft.com/fonts/sundog/semilight/latest.eot');
        src: local("Segoe UI Semilight"),
            url('//powerapps.microsoft.com/fonts/sundog/semilight/latest.eot?#iefix') format('embedded-opentype'),
            url('//powerapps.microsoft.com/fonts/sundog/semilight/latest.woff') format('woff'),
            url('//powerapps.microsoft.com/fonts/sundog/semilight/latest.ttf') format('truetype'),
            url('//powerapps.microsoft.com/fonts/sundog/semilight/latest.svg#web') format('svg');
        .font-semilight();
        font-style: normal;
    }

    @font-face {
        font-family: wf_segoe-ui_normal;
        src: url('//powerapps.microsoft.com/fonts/sundog/normal/latest.eot');
        src: local("Segoe UI"),
            url('//powerapps.microsoft.com/fonts/sundog/normal/latest.eot?#iefix') format('embedded-opentype'),
            url('//powerapps.microsoft.com/fonts/sundog/normal/latest.woff') format('woff'),
            url('//powerapps.microsoft.com/fonts/sundog/normal/latest.ttf') format('truetype'),
            url('//powerapps.microsoft.com/fonts/sundog/normal/latest.svg#web') format('svg');
        .font-normal();
        font-style: normal;
    }

    @font-face {
        font-family: wf_segoe-ui_semibold;
        src: url('//powerapps.microsoft.com/fonts/sundog/semibold/latest.eot');
        src: local("Segoe UI Semibold"),
            url('//powerapps.microsoft.com/fonts/sundog/semibold/latest.eot?#iefix') format('embedded-opentype'),
            url('//powerapps.microsoft.com/fonts/sundog/semibold/latest.woff') format('woff'),
            url('//powerapps.microsoft.com/fonts/sundog/semibold/latest.ttf') format('truetype'),
            url('//powerapps.microsoft.com/fonts/sundog/semibold/latest.svg#web') format('svg');
        .font-semibold();
        font-style: normal;
    }

    @font-face {
        font-family: wf_segoe-ui_bold;
        src: url('//powerapps.microsoft.com/fonts/sundog/bold/latest.eot');
        src: local("Segoe UI Bold"),
            url('//powerapps.microsoft.com/fonts/sundog/bold/latest.eot?#iefix') format('embedded-opentype'),
            url('//powerapps.microsoft.com/fonts/sundog/bold/latest.woff') format('woff'),
            url('//powerapps.microsoft.com/fonts/sundog/bold/latest.ttf') format('truetype'),
            url('//powerapps.microsoft.com/fonts/sundog/bold/latest.svg#web') format('svg');
        .font-bold();
        font-style: normal;
    }
</style>

<!-- Favicon -->
<link rel="icon" type="image/x-icon" href="${asset.get("/html/assets/favicon.png")}"/>
<@component id="Custom.Head.TwitterCardMeta" />
