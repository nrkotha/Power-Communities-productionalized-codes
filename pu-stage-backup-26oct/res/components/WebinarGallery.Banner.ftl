<#--

	Webinar Gallery Banner 
	iTrack : MC – 13.  

 -->
<#--
 
	Description: 
		This component is created to display a banner above the Webinar gallery grid structure in Forum Page. 

	Activities:
    	1. Displays a banner which is uploaded in Studio assets          

-->


<div class="lia-panel lia-panel-showcase-banner">
	<#if skin.id == "powerapps_responsive">
		<img src="${asset.get("/html/assets/PowerApps_WebinarGallery_Banner.png")}" />
	<#elseif skin.id == "flow_responsive">
		<img src="${asset.get("/html/assets/welcometothewebinargallery.png")}" alt=${asset.get("/html/assets/welcometothewebinargallery.png")?split("/")[5]?split(".")[0]}>
		
	<#else>
	<img src="${asset.get("/html/assets/Stream_WebinarGallery_Banner.png")}" />
	</#if>
</div>