 <!-- Blog -->
 <#include "common_utils.ftl" />
<#assign actID = env.context.component.getParameter("actID")!coreNode.id/>
<#assign type = env.context.component.getParameter("type")!"" />
<#assign limit = env.context.component.getParameter("limit")!"3" />
<#-- scope is recent/kudos -->
<#assign scope = env.context.component.getParameter("scope")!"recent" />

<#assign apiVersion = "2.0"/>
<#assign nodeQuery = "" postQuery="" recentAPI="/topics/recent?page_size=${limit}&restapi.response_style=view"/>
<#if scope == "kudos">
	<#assign recentAPI="/kudos/leaderboard/top-messages?max_age=all&page_size=${limit}&restapi.response_style=view"/>
</#if>
<#if (type == "category") || (type=="" && coreNode.nodeType == "category")>
	<#assign nodeQuery = "SELECT title,view_href FROM categories WHERE id='${actID}'"/>
	<#assign recentAPI = "/categories/id/"+actID+recentAPI/>
<#elseif (type == "board") || (type == "" && coreNode.nodeType == "board")>
	<#assign nodeQuery = "SELECT title,view_href FROM boards WHERE id='${actID}'"/>
	<#assign recentAPI = "/boards/id/"+actID+recentAPI/>
<#else>
</#if>
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
<@generateComponentContent componentTitle="" className="custom-recent-posts" >

<!-- <div class="custom-recent-posts">	-->	
<article id="communityBlog" class=""> <!-- container -->
  <article>
    <div class="col-md-6">
	  <div>
        <h1 class="community-blog">${nodeDetails.title}</h1>
	  </div>
	</div>
	<div class="col-md-6">
	   <div class="view-all">
         <h2><a href="${nodeDetails.href}">View All</a></h2>
	   </div>
	</div>
	<div style="clear:both"></div>
  </article>

	<#assign recentResult = rest(recentAPI).messages.message/>

	<#list recentResult as item>
		<#assign postQuery = "SELECT author.login,author.avatar,author.view_href,conversation.messages_count FROM messages WHERE id='${item.id}'"/>
	<#assign postResult = rest(apiVersion, "/search?q=" + postQuery?url("UTF-8") + "&restapi.response_style=view").data.items![] />
		<#assign postResult = postResult[0]/>
		<article class="col-md-4 col-sm-4 col-xs-12">
		    <div class="cmBlog-Widget">
		       <div class="bg-communityBlog">
					<figure class="user-profile">  
						<img class="bitmap lia-user-avatar-message" title="${postResult.author.login}" src="${postResult.author.avatar.message}">
					</figure>
					<div class="user-info">
						<a href="${postResult.author.view_href}"><span class="username">${item.author.login}</span></a><br/>
						<#if item.post_time.@view_friendly_date !="">
							<span class="date-posted">${item.post_time.@view_friendly_date}</span>
						<#else>
						<span class="date-posted">${item.post_time.@view_date}</span>
						</#if>
					</div>
					<div style="clear:both"></div>
					<p class="text-Analytics-in-Po"><a href="${item.@view_href}">${item.subject}</a></p>
				</div>
				<hr class="line"/>
				<div class="layer-img">
					<figure>  
						<img class="layer" src="${asset.get('/html/assets/likes.png')}">
						<span>
							${item.kudos.count}
						</span>
					</figure> 
					<figure>  
						<img class="layer" src="${asset.get('/html/assets/comments.png')}">
						<span>${postResult.conversation.messages_count}</span>
					</figure> 
					<figure>  
						<img class="layer" src="${asset.get('/html/assets/views.png')}">
						<span>${item.views.count}</span>
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
<!--  Blog /-->