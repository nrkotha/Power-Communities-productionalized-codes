<#-- Get required events count -->
<#function countPosts>
	<#local posts = [] />
	<#local noOfPostsToFetch = 1000 />
    <#local sourceBoard=coreNode.id />
    <#if sourceBoard=="oxcrx34285"> <!-- for preview only -->
        <#local sourceBoard="PBIShowcase" />
    </#if>

	<#local query = "SELECT id, view_href, kudos.sum(weight) FROM messages WHERE board.id = '${sourceBoard}' AND depth=0 ORDER BY kudos.sum(weight) DESC LIMIT ${noOfPostsToFetch}" />
	<#local queryResult = rest('2.0', '/search?q=' + query?url('UTF-8')) />
	<#if queryResult.status == "success" && queryResult.data?? && queryResult.data?has_content>
        <#return queryResult.data.size />
    <#else>
    	<#return 0 />
	</#if>
</#function>

<#if webuisupport.path.parameters.name.get("page")?? >
	<#assign pageNumber = webuisupport.path.parameters.name.get("page", "1")>
<#else>
	<#assign pageNumber = 1 />
</#if>

<#attempt>
    <#assign postsPerPage=settings.name.get("layout.messages_per_page_linear")?number!16 />
<#recover>
    <#assign postsPerPage="16" />
</#attempt>
  
<#attempt>
	<#assign totalPosts =  countPosts()?number />
<#recover>
    <#assign totalPosts = 0 />
</#attempt>

<#assign customPager = webuisupport.paging.pageableItem.setCurrentPageNumber(pageNumber?number).setItemsPerPage(postsPerPage?number).setTotalItems(totalPosts).setPagingMode("enumerated").build />

<div class="lia-component-custom-cards-message-list-paging">
    <@component id="common.widget.pager" pageableItem=customPager/>    
</div>