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


<div class="lia-panel lia-panel-showcase-banner">
    <#--Adding this code as part of iTrack MC-183 -->
    <#if coreNode.id == "DataInsightsSummit2017OnDemand">
	<img src="${asset.get("/html/assets/msdis_ondemand TOP BANNER.png")}" />
	<#else>
	<img src="${asset.get("/html/assets/VideoGallery_Main.jpg")}" />
	</#if>
</div>