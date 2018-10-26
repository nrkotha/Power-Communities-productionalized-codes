<#--

	Video Story Gallery Banner 
	iTrack : PBI – 1988. 

 -->
<#--
 
	Description: 
		This component is created to display a banner above the video gallery grid structure in Forum Page. 

	Activities:
    	1. Displays a banner which is uploaded in Studio assets          

-->
<#-- This Code was written as part of iTrack MC-191 -->
<#assign galleryBanner = coreNode.settings.name.get("customcontent.9_text")!""/>
<#if galleryBanner =="">
	<#assign galleryBanner  = {}/>
<#else>
<#attempt>
	<#assign galleryBanner  = galleryBanner?eval/>
<#recover>
</#attempt>
</#if>
<#attempt>
    <#assign topBanner = galleryBanner.VideoGalleryTopBanner />
<#recover>
    <#assign topBanner= "" />
</#attempt>
<div class="lia-panel lia-panel-showcase-banner">
    <#if topBanner != "">
			<img src="${asset.get("${topBanner}")}" />
    <#else>
			<#if skin.id == "powerapps_responsive">
				<img src="${asset.get("/html/assets/welcometothevideogallery.png")}" alt=${asset.get("/html/assets/welcometothevideogallery.png")?split("/")[5]?split(".")[0]}>
			<#elseif skin.id == "flow_responsive">
				<img src="${asset.get("/html/assets/Flow_VideoGallery_Banner.png")}" alt=${asset.get("/html/assets/Flow_VideoGallery_Banner.png")?split("/")[5]?split(".")[0]}>
			<#elseif skin.id == "stream_skin">
				<img src="${asset.get("/html/assets/Stream_VideoGallery_Banner.png")}" />
			<#else>
			
			</#if>
	</#if>		
</div>