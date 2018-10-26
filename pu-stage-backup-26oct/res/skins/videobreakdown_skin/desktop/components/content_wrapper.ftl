<#assign env = config.getString("phase", "prod") />
<#if env == "stage">
	<#-- Add Stage categories here to enable Hero Banner -->
	<#assign catHeroBanList = ["VideoBreakdownCommunity"]/>
<#else>
	<#-- Add Prod Categories here to enable Hero Banner -->
	<#assign catHeroBanList = ["VideoIndexerCommunity"]/>
</#if>

<#include "layout.urlfetcher_header_videobreakdown.ftl" />
<!--</center>${settings.name.get("layout.urlfetcher_header_videobreakdown")}<center>-->
<#list catHeroBanList as catid>
	<#if coreNode.id == catid >
	    <div class="lia-hero-section lia-content">
	        <div class="container">
	            <h2 class="welcome-title">Welcome to the Community</h2>
	            <div class="banner-search-form">
	                <@component id="common.widget.search-form" />
	            </div>
	            
	        </div>
	    </div>
	</#if>
</#list>
<@liaBody /><#include "layout.urlfetcher_footer_videobreakdown.ftl" />
<!--</center>${settings.name.get("layout.urlfetcher_footer_videobreakdown")}<center>-->
