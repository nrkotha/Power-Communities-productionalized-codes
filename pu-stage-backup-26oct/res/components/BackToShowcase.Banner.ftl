<div class="lia-panel lia-panel-showcase-banner">
    	<a href="/t5/xx/bd-p/${coreNode.id}">
		<#if skin.id == "powerapps_responsive">
			<img src="${asset.get("/html/assets/PowerApps_VideoGallery_RETURN.jpg")}" alt="Back To Gallery" />
		<#elseif skin.id == "flow_responsive">
			<img src="${asset.get("/html/assets/Flow_VideoGallery_RETURN.jpg")}"alt="Back To Gallery" />
		<#elseif skin.id == "stream_skin">
			<img src="${asset.get("/html/assets/Stream_VideoGallery_RETURN.jpg")}" alt="Back To Gallery"/>
		<#else>
		<img src="${asset.get("/html/assets/PBI_Showcase_v3_RETURN.png")}" />
		</#if>
</a>
</div>