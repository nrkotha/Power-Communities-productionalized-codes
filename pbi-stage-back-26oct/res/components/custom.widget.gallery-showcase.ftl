<#attempt>
<#include "common_utils.ftl" />
<!-- Data Stories -->
<#assign actID = env.context.component.getParameter("actID")!"" />
<#assign type = env.context.component.getParameter("type")!"" />
<#assign limit = env.context.component.getParameter("limit")!"3" />
<#assign labels = env.context.component.getParameter("labels")!"" />
<#-- scope is recent/kudos -->
<#assign scope = env.context.component.getParameter("scope")!"recent" />

<#assign apiVersion = "2.0"/>
<#assign nodeQuery = "" postQuery=""/>
<#assign postQuery = "SELECT id,subject,kudos.sum(weight),conversation.last_post_time_friendly,topic.view_href,conversation.messages_count,author.login,author.avatar,author.view_href,metrics.views FROM messages WHERE"/>
<#if type == "category">
	<#assign nodeQuery = "SELECT title,view_href FROM categories WHERE id='${actID}'"/>
	<#assign postQuery = postQuery + " category.id='${actID}'"/>
<#elseif type == "board">
	<#assign nodeQuery = "SELECT title,view_href FROM boards WHERE id='${actID}'"/>
	<#assign postQuery = postQuery + " board.id='${actID}'"/>
<#else>
	
</#if>
<#if labels!= "">
	<#assign liqlFeatured="AND labels.text in ('" + labels + "' )" />
	<#assign postQuery = postQuery + liqlFeatured/>
</#if>

    <#assign orderBy="conversation.last_post_time" />
<#if scope=="recent">
    <#assign orderBy="conversation.last_post_time" />
<#elseif scope=="kudos">
    <#assign orderBy="kudos.sum(weight)" />
<#else>

</#if>

	<#assign postQuery = postQuery+ " AND depth=0 ORDER BY ${orderBy} DESC LIMIT ${limit}"/>
<#assign nodeDetails = {
	"title":"Community",
	"href":"#"
}/>
<#if nodeQuery!="">
	<#assign queryResult = rest(apiVersion, "/search?q=" + nodeQuery?url("UTF-8") + "&restapi.response_style=view").data.items![] />
	<#if (queryResult?size > 0)>
		<#assign nodeDetails = {
			"title":queryResult[0].title,
			"href":queryResult[0].view_href
		}/>	
	</#if>
</#if>
<@generateComponentContent componentTitle="" className="custom-gallery-showcase" >
<!-- <div class="custom-gallery-showcase"> -->
<!-- Data Stories -->
	    <article id="datastories" class=""> <!-- Container -->
		  <article>
		    <div class="col-md-6">
			  <div>
                <span class="data-stories" role="heading">${nodeDetails.title}</span>
			  </div>
			</div>
			<div class="col-md-6">
			   <div class="view-all">
                 <span><a href="${nodeDetails.href}">View All</a></span>
			   </div>
			</div>
			<div style="clear:both"></div>
		  </article>
		  
  	<#assign recentResult = rest(apiVersion, "/search?q=" + postQuery?url("UTF-8") + "&restapi.response_style=view").data.items![] />
	<#list recentResult as item>
		<#assign post_image = asset.get('/html/assets/image_unavailable.png')/>
		<#attempt>
            <#assign attachmentUrl=getAttachedImage(item.id) />
        <#recover>
        </#attempt>

        <#attempt>
	        <#if attachmentUrl?? && attachmentUrl?has_content>
	            <#assign post_image=attachmentUrl />
	        <#else>
	        	<#assign thImage=restadmin("/messages/id/${post.id}/uploads/images/index/0").image />
	            <#if thImage?? && thImage.url??>
	                <#assign post_image=thImage.url />
	            <#else>
	                <#assign post_image="" />
	            </#if>
	        </#if>
        <#recover>

        </#attempt>

	  	<article class="col-md-3 col-sm-6 col-xs-12 last-ele">
		    <div class="cmBlog-Widget">
		       <div class="bg-communityBlog">
					<figure class="mask-copy">  
						<img class="bitmap" alt="Gallerie Image" src="${post_image}">
					</figure>
					<div class="data-user-info">
						<span ><a href="${item.topic.view_href}" class="data-info">${item.subject}</a></span>
						<span class="username">by <a href="${item.author.view_href}">${item.author.login}</a></span>
					</div>
				</div>
				<hr class="line"/>
				<div class="layer-img">
					<figure>  
						<img class="layer" alt="likes" src="${asset.get('/html/assets/likes.png')}">
						<span>
							${item.kudos.sum.weight}
						</span>
					</figure> 
					<figure>  
						<img class="layer" alt="comments" src="${asset.get('/html/assets/comments.png')}">
						<span>${item.conversation.messages_count-1}</span>
					</figure> 
					<figure>  
						<img class="layer" alt="views" src="${asset.get('/html/assets/views.png')}">
						<span>${item.metrics.views}</span>
					</figure> 
					<div style="clear:both"></div>
				</div>
			</div>
		</article>
	</#list>
  <div style="clear:both"></div>
</article>
<!--</div> -->
</@generateComponentContent>
<!-- Data Stories /-->
<#recover>
</#attempt>