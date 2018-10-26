<#--

	Back to Video Story Gallery
	iTrack : It is created to address iTrack PBI – 1988. 
 -->
<#--
 
	Description: 
		This component is created to display a video gallery banner below the discussion in Forum Topic Page for users to navigate to gallery page. 
-->

<div class="lia-panel lia-panel-showcase-banner">
	<a href="/t5/xx/bd-p/${coreNode.id}">
		<#if skin.id == "powerapps_responsive">
			<img src="${asset.get("/html/assets/PowerApps_VideoGallery_RETURN.jpg")}" alt="Back To Gallery" />
		<#elseif skin.id == "flow_responsive">
			<img src="${asset.get("/html/assets/Flow_VideoGallery_RETURN.jpg")}" alt="Back To Gallery"/>
		<#elseif skin.id == "stream_skin">
			<img src="${asset.get("/html/assets/Stream_VideoGallery_RETURN.jpg")}" alt="Back To Gallery" />
		<#else>
		
		</#if>
    </a>
</div>