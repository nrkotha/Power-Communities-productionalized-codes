	<#--

	PowerPoint Gallery Banner 
	iTrack : MC – 10.  

 -->
<#--
 
	Description: 
		This component is created to display a banner above the PowerPoint gallery grid structure in Forum Page. 

	Activities:
    	1. Displays a banner which is uploaded in Studio assets          

-->


<div class="lia-panel lia-panel-showcase-banner">
<#if skin.id == "powerapps_responsive">
		<img src="${asset.get("/html/assets/welcometothepowerpointgallery.jpg")}" alt=${asset.get("/html/assets/welcometothepowerpointgallery.jpg")?split("/")[5]?split(".")[0]}>
	<#elseif skin.id == "flow_responsive">
		<img src="${asset.get("/html/assets/welcometothepowerpointgallery.jpg")}" alt=${asset.get("/html/assets/welcometothepowerpointgalleryy.jpg")?split("/")[5]?split(".")[0]}>
	<#elseif skin.id == "stream_skin">
		<img src="${asset.get("/html/assets/Stream_PowerPointGallery_Banner.jpg")}" />
	<#else>
	
	</#if>

</div>