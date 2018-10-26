<#-- Get required events count -->
<#function countEvents>
	<#local eventsToSort = [] />
	<#local noOfPostsToFetch = 1000 />
	<#local sourceBoards = "'Microsoft','Community','Events'"/>
	<#local query = "SELECT id, c_start_date, c_end_date FROM messages WHERE board.id IN (${sourceBoards}) AND depth=0 LIMIT ${noOfPostsToFetch}" />
	<#local queryResult =  rest('2.0', '/search?q=' + query?url('UTF-8')) />
	<#if queryResult.status == "success" && queryResult.data?? && queryResult.data?has_content && queryResult.data.items?? && queryResult.data.items?has_content>
		<#list queryResult.data.items as event>
			<#if event.c_start_date?? && event.c_start_date?has_content && event.c_start_date?length gt 0 && event.c_end_date?? && event.c_end_date?has_content && event.c_end_date?length gt 0>
				<#local eventsToSort = eventsToSort + [event] />
			</#if>
		</#list>
	</#if>
    <#return eventsToSort?size />
</#function>

<#if webuisupport.path.parameters.name.get("page")?? >
	<#assign pageNumber = webuisupport.path.parameters.name.get("page", "1")>
<#else>
	<#assign pageNumber = 1 />
</#if>

<#assign eventsPerPage = 10 />
  
<#attempt>
	<#assign totalEvents =  countEvents()?number />
<#recover>
    <#assign totalEvents = 0 />
</#attempt>

<#assign customPager = webuisupport.paging.pageableItem.setCurrentPageNumber(pageNumber?number).setItemsPerPage(eventsPerPage?number).setTotalItems(totalEvents).setPagingMode("enumerated").build />

<div class="lia-component-custom-most-recent-events-paging">
    <@component id="common.widget.pager" pageableItem=customPager/>    
</div>