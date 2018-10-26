<#include "common_utils.ftl" />
<@generateComponentContent componentTitle="" className="custom-latest-posts-widget" >
<!-- <div class="custom-latest-posts-widget"> -->
	<#-- Capturing Interaction Style -->
	<#assign iStyle = env.context.component.getParameter("iStyle")!""/>
	<#assign topRecentCount = settings.name.get("layout.recent-messages-module-list-size","5")/>
	<#assign basePath = "" recentPostQuery = ""/>
	
	<#assign allRecentPostPath = "/t5/forums/recentpostspage/post-type/message"/>
	<#if coreNode.nodeType == "category">
		<#assign basePath = 'WHERE category.id = "${coreNode.id}"'/>
		<#assign allRecentPostPath = allRecentPostPath+"/category-id/${coreNode.id}"/>
	<#elseif coreNode.nodeType == "board">
		<#assign basePath = 'WHERE board.id = "${coreNode.id}"'/>
		<#assign allRecentPostPath = allRecentPostPath+"/board-id/${coreNode.id}"/>
	</#if>
	<#if iStyle !="">
		<#if basePath =="">
			<#assign basePath = basePath + "WHERE"/>
		<#else>
				<#assign basePath = basePath + " AND"/>
		</#if>
		<#assign basePath = basePath + ' conversation.style = "${iStyle}" AND depth = 0'/>
		<#if iStyle == "tkb">
			<#assign recentPostQuery = 'SELECT id,subject,is_solution,author,post_time,post_time_friendly,view_href,board.id,board.title,board.view_href,board.conversation_style FROM messages ${basePath} ORDER BY conversation.last_post_time DESC LIMIT ${topRecentCount?number}'/>
		</#if>
	</#if>
	<#if recentPostQuery =="">
		<#assign recentPostQuery = 'SELECT id,subject,is_solution,author,post_time,post_time_friendly,view_href,board.id,board.title,board.view_href,board.conversation_style FROM messages ${basePath} ORDER BY post_time DESC LIMIT ${topRecentCount?number}'/>
	</#if>
	<#assign apiVersion = "2.0"/>
	<#assign queryResult = rest(apiVersion, "/search?q=" + recentPostQuery?url("UTF-8") + "&restapi.response_style=view").data.items![] />
	<#if (queryResult?size > 0)>

	
<!-- Latest posts -->
      <article>
	    <article>
		    <div class="col-md-6">
			  <div>
                <h1 class="latest-posts">Latest Posts</h1>
			  </div>
			</div>
			<div class="col-md-6">
			   <div class="view-all">
                 <h2><a href="${allRecentPostPath}">View All</a></h2>
			   </div>
			</div>
			<div style="clear:both"></div>
		</article>
		
		<#list queryResult as message>
	    <article> <!-- repeat this article -->
			<div class="col-md-6">
			  <div class="forum-title">
			  	<#if message.is_solution>
					<img class="lia-img-message-type-solution lia-fa-message lia-fa-type lia-fa-solution" title="Solution" alt="Solution" aria-label="Solution" id="display_47" src="${skin.images.message_type_solution.url}">
				</#if>
			    <h2><a href="${message.view_href}">${message.subject}</a></h2>
				<p>					
				  <span>${message.board.conversation_style}: </span>
			       <a href="${message.board.view_href}">${message.board.title}</a>
			    </p>
			  </div>
			</div>
			<div class="col-md-6">
			   <div class="posts">
				<span class="data-shaping-modeli">
					<span>
						<#if message.post_time_friendly??>
							${message.post_time_friendly}
						<#else>
							${message.post_time?datetime?string}
						</#if>
					</span>
				</span>
<#if message.author.login !="">
				<p><a href="${message.author.view_href}">${message.author.login}</a></p>
</#if>
			   </div>
			</div>
			<div style="clear:both"></div>
		</article> <!-- repeat this article /-->
		</#list>

		<div style="clear:both"></div>
      </article>

	
	</#if>
<!--</div> -->
</@generateComponentContent>

