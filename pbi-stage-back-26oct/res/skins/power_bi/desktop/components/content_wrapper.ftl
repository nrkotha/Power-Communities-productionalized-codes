</center>
<#-- Commenting following line as part of MC-255 -->
<div id="fixed-banner">
<div id="cookie-banner"></div>

    <#-- MC-441: Change header if mobileclient is iOS -->
    <#-- ${settings.name.get("layout.microsoftbi_header")} -->
    <#assign mobClient = http.request.cookies.name.get("mobileClient").getValue()!""/>

    <#if mobClient != "ios">
        <#assign cookies = http.response.cookies />
        <#list cookies as cookie,value>
            <#if cookie == "mobileClient">
                <#assign mobClient = value.getValue()/>
            </#if>
        </#list>
    </#if>

    <#if mobClient == "ios">
        ${settings.name.get("layout.microsoftbi_header_ios")}
    <#else>
        ${settings.name.get("layout.microsoftbi_header")}
    </#if>
</div>
<#-- MC-255 Start: updating header with UFH header and footer -->
<#-- <#include "uhf_config.ftl"/>
<div class="uhf-extension-scope" data-bi-id="2-id-DIV" data-bi-name="0-2-layer-DIV">
 ${settings.name.get(uhfKeys("powerbi_header"))} 
</div> -->
<#-- MC-255 UHF Header End -->
<center>

<#-- MC-171 dynamic changing powerbi embeded link -->
<@liaAddScript>
;(function($){
	try {
		<#assign env = config.getString("phase", "prod") />
		<#if env == "stage">
			var powerBiEmbedURL = "https://powerbi-staging.microsoft.com/en-us/power-bi-embedded/";
		<#else>
			var powerBiEmbedURL = "https://powerbi.microsoft.com/en-us/power-bi-embedded/";
		</#if>
		$(".navigation .menu-drop li:contains('Power BI Embedded') a").attr("href",powerBiEmbedURL);
	}catch(e) {
		
	}
})(LITHIUM.jQuery);
</@liaAddScript>


<div class="pbi-custom-secondary-nav">
    <div class="container">
        <div class="secondary-nav-item"><a href="/">Home</a></div>
        <div class="secondary-nav-item">
            <a href="${community.urls.tapestryPrefix}/Forums/ct-p/Forums">Forums</a>
        </div>
        <div class="secondary-nav-item">
            <a href="https://ideas.powerbi.com/forums/265200-power-bi?WT.mc_id=Community">Ideas</a>
        </div>
        <div class="secondary-nav-item">
            <a href="${community.urls.tapestryPrefix}/Events/ct-p/Events">Events</a>
        </div>
        <div class="secondary-nav-item">
            <#-- MC-78 Prod URL update by iTalent -->
            <#assign env = config.getString("phase", "prod") />
            <#if env == "stage">
            <a href="${community.urls.tapestryPrefix}/Groups/ct-p/groups">User Groups</a>
            <#else>
                <a href="https://aka.ms/powerusergroups">User Groups</a>
            </#if>
        </div>
        <div class="secondary-nav-item">
            <a href="${community.urls.tapestryPrefix}/Community-Blog/bg-p/community_blog">Community Blog</a>
        </div>
    </div>
</div>
<@liaBody /></center>
<#-- commenting following line as part of MC-255 -->
${settings.name.get("layout.microsoftbi_footer")} 
<#-- MC-255 updating header with UFH header and footer -->
<#-- <#include "uhf_config.ftl"/>
<div class="uhf-extension-scope" data-bi-id="4-id-DIV" data-bi-name="0-4-layer-DIV">

${settings.name.get(uhfKeys("powerbi_footer"))} 
</div> -->

<@liaAddScript>
;(function($){
	$(document).ready(function() {
        /* Start: This code is added by iTalentdigital as part of MC-419 */
        $('<li class="lia-tabs email-tab lia-tabs-inactive"><span ><a class="lia-link-navigation privacy-link tab-link lia-custom-event" href="/t5/custom/page/page-id/data_privacy_compliance">Privacy</a></span></li>').insertAfter($('.close-account-tab')); 
        /* End: This code is added by iTalentdigital as part of MC-419 */
	})


})(LITHIUM.jQuery)
</@liaAddScript>
<center>