<div class="lia-panel lia-panel-showcase-banner">
	<#if skin.id == "powerapps_responsive">
		<img src="${asset.get("/html/assets/welcometothedatastories.png")}" alt=${asset.get("/html/assets/welcometothedatastories.png")?split("/")[5]?split(".")[0]}>
	<#elseif skin.id == "flow_responsive">
		<img src="${asset.get("/html/assets/welcometothedatastoriesgallery.png")}" alt=${asset.get("/html/assets/welcometothedatastoriesgallery.png")?split("/")[5]?split(".")[0]}>
	<#elseif skin.id == "stream_skin">
		<img src="${asset.get("/html/assets/Stream_Showcase_v3_MAIN.png")}" />
	<#else>
	<img src="${asset.get("/html/assets/PBI_Showcase_v3_MAIN.png")}" />
	</#if>
</div>
