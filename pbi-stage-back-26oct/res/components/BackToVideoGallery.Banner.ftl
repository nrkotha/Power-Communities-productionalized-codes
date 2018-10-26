<#--

	Back to Video Story Gallery
	iTrack : It is created to address iTrack PBI – 1988. 
 -->
<#--
 
	Description: 
		This component is created to display a video gallery banner below the discussion in Forum Topic Page for users to navigate to gallery page. 
-->

<div class="lia-panel lia-panel-showcase-banner">
    <#-- Adding this condition as part of iTrack MC-182 -->
    <#if coreNode.id == "DataInsightsSummit2017OnDemand"> 
	<a href="/t5/xx/bd-p/${coreNode.id}">
	    <img src="${asset.get("/html/assets/msdis_ondemand_back BOTTOM BANNER.png")}" />
	</a>	
	<#else>
	<a href="/t5/xx/bd-p/${coreNode.id}">
<!-- Start: This gallery image is changed by iTalent as part of iTarck MC- 443 -->
		<!-- <img src="${asset.get("/html/assets/PBI_Showcase_v3_RETURN.png")}" /> -->
 <!-- End: This gallery image is changed by iTalent as part of iTarck MC- 443 -->
                <img src="${asset.get("/html/assets/Webinar-Video-Gallery.jpg")}" />
    </a>
	</#if>
</div>