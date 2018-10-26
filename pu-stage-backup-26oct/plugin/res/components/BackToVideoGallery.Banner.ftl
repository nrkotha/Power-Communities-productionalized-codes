<#--

	Back to Video Story Gallery
	iTrack : It is created to address iTrack PBI – 1988. 
 -->
<#--
 
	Description: 
		This component is created to display a video gallery banner below the discussion in Forum Topic Page for users to navigate to gallery page. 
-->
<#-- This code is written as part of iTrack MC-191 -->
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
    <#assign backBanner = galleryBanner.VideoGalleryBackBanner />
<#recover>
    <#assign backBanner= "" />
</#attempt>
<div class="lia-panel lia-panel-showcase-banner">
	<a href="/t5/xx/bd-p/${coreNode.id}">
	<#if backBanner != "">
		<img src="${asset.get("${backBanner}")}" />
	<#else>
	<#if skin.id == "powerapps_responsive">
		    <img src="${asset.get("/html/assets/PowerApps_VideoGallery_RETURN.jpg")}" alt="Back To Gallery"/>
		<#elseif skin.id == "flow_responsive">
			<img src="${asset.get("/html/assets/Flow_VideoGallery_RETURN.jpg")}"alt="Back To Gallery" />
		<#elseif skin.id == "stream_skin">
			<img src="${asset.get("/html/assets/Stream_VideoGallery_RETURN.jpg")}"alt="Back To Gallery" />
		<#else>
		</#if>
	</#if>	
    </a>
</div>