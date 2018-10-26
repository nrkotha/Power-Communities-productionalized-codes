<#include "common_utils.ftl" />

<script src="${asset.get('/html/assets/jquery.simplePagination.js')}" type="text/javascript"></script>
<!-- Get component parameters page nuber and no of posts-->
<!-- Get component parameters type and page number-->
<#--<#if webuisupport.path.parameters.name.get("page")??>
    <#assign pageNumber=webuisupport.path.parameters.name.get("page", 1 )>
<#else>
    <#assign pageNumber=1 />
</#if> -->
<#assign pageNumber=http.request.parameters.name.get("page")!"1">
<#assign pageNumber = pageNumber?number/>
<#attempt>
    <#assign nofpost=settings.name.get("layout.messages_per_page_linear")?number!16/>
<#recover>
    <#assign nofpost=16 />
</#attempt>

<#assign type=env.context.component.getParameter("type")!"recent">
<#assign offsetVal = nofpost*(pageNumber-1)/>
<#assign messageQuery = "" countQuery=""/>
<#if coreNode.nodeType == "category">	
	<#assign messageQuery = messageQuery+"FROM messages WHERE ancestor_categories.id = '${coreNode.id}'"/>
<#elseif coreNode.nodeType == "board">
	<#assign messageQuery = messageQuery+ "FROM messages WHERE board.id = '${coreNode.id}'"/>
<#else>
</#if>

<#if type == "popular">
	<#assign messageQuery = messageQuery+ " AND kudos.sum(weight) > 0 ORDER BY kudos.sum(weight) DESC LIMIT ${nofpost} OFFSET ${offsetVal}"/>
<#elseif type == "trending">
			<#assign now = datesupport.now />
	<#assign nowMs = now.millisecondsAsString />
				<#assign tMonthsMS = now.addMonth(-2).millisecondsAsString />



	<#assign messageQuery = messageQuery+ " AND kudos.sum(weight) > 0 AND post_time > ${tMonthsMS} AND post_time < ${nowMs} ORDER BY kudos.sum(weight) desc, post_time DESC LIMIT ${nofpost} OFFSET ${offsetVal}"/>
<#else>
	<#-- recent -->	
</#if>
<#assign countQuery = "SELECT count(*) "+messageQuery/>
<#assign messageQuery = "SELECT id,subject,view_href,replies.count(*),kudos.sum(weight),view_href,author.login,author.avatar,author.view_href,metrics.views,post_time_friendly,post_time "+messageQuery/>

<#assign apiVersion = "2.0"/>
	<#assign totalPosts = rest(apiVersion, "/search?q=" + countQuery?url("UTF-8") + "&restapi.response_style=view").data.count!0 />	
	<#assign queryResult = rest(apiVersion, "/search?q=" + messageQuery?url("UTF-8") + "&restapi.response_style=view").data.items![] />	
	<#if (queryResult?size > 0)>
		<ul class= "custom-message-list-display">
			<#list queryResult as message>
				<article> <!-- repeat this article -->
				   <div class="category-Widget">
				        <div class="bg-category-Widget">
							<h2><a href="${message.view_href}">${message.subject}</a></h2>
							<span class="category-dateTime">
								   <#if message.post_time_friendly??>
										${message.post_time_friendly} ago
									<#else>
										${message.post_time?datetime?string}
									</#if>
							</span>
							<span class="category-username"><span class="category-by">by</span><a href="${message.author.view_href}">${message.author.login}</a></span>

							<div style="clear:both"></div>
						</div>
						<div class="layer-img">
							<figure>  
								<img class="layer" src="${asset.get('/html/assets/likes.png')}">
								<span>${kformat(message.kudos.sum.weight?number)}</span>
							</figure> 
							<figure>  
								<img class="layer" src="${asset.get('/html/assets/comments.png')}">
								<span>${kformat(message.replies.count?number)}</span>
							</figure> 
							<figure>  
								<img class="layer" src="${asset.get('/html/assets/views.png')}">
								<span>${kformat(message.metrics.views?number)}</span>
							</figure> 
							<div style="clear:both"></div>
						</div>
						<div style="clear:both"></div>
					</div>
					<div style="clear:both"></div>
				</article> <!-- repeat this article /-->
				<div style="clear:both"></div>
			</#list>
			<div style="clear:both"></div>
		</ul>
		<div style="clear:both"></div>
	</#if>
<!-- Build the paging control -->
<#if (type =="popular")||(type == "trending")>
    <#if totalPosts?? && totalPosts gt 1>
       <#-- <#assign customPager=webuisupport.paging.pageableItem.setCurrentPageNumber(pageNumber).setItemsPerPage(nofpost).setTotalItems(totalPosts).setPagingMode("enumerated").build />
        <div class="lia-component-custom-cards-message-list-paging">
            <@component id="common.widget.pager" pageableItem=customPager />
        </div> -->
        <div id="custom-pagination">
		</div>
		<script>
(function($){
			$("#custom-pagination").pagination({
	        items: ${totalPosts},
	        itemsOnPage: ${nofpost},
			prevText:"<",
			nextText:">",
			currentPage:${pageNumber},
			hrefTextPrefix:"?type=${type}&page=",
			displayedPages:4,
			edges:1,
	        //cssStyle: 'light-theme'
	    });
    })(jQuery);
</script>
    </#if>
</#if>	