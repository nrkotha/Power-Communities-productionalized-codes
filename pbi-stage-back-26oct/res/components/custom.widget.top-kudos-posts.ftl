<#include "common_utils.ftl" />
<@generateComponentContent componentTitle="" className="custom-most-liked-widget" >

<!-- <div class="custom-most-liked-widget">  -->
	<#assign iStyle = env.context.component.getParameter("iStyle")!""/> 
	<#assign now = datesupport.now />
	<#assign nowMs = now.millisecondsAsString />
	<#assign beforeMS = ""/> 
	<#assign topKudosTime =  settings.name.get("profile.kudos_message_leaderboard_time")!'one_week' />
	<#switch topKudosTime>
		<#case "one_day">
			<#assign beforeMS = now.addDay(-1).millisecondsAsString />
		<#break>
		<#case "one_week">
			<#assign beforeMS = now.addWeek(-1).millisecondsAsString />
		<#break>
		<#case "one_month">
			<#assign beforeMS = now.addMonth(-1).millisecondsAsString />
		<#break>
		<#case "six_months">
			<#assign beforeMS = now.addMonth(-6).millisecondsAsString />
		<#break>
		<#case "one_year">
			<#assign beforeMS = now.addYear(-1).millisecondsAsString />
		<#break>
		<#case "all">
			<#assign beforeMS = "" />
		<#break>
		<#default>
			<#assign beforeMS = now.addWeek(-1).millisecondsAsString />
	</#switch>
	<#assign topKudosCount = settings.name.get("layout.kudos-leaderboard-module-messages-list-size")/>
	<#if topKudosCount == "">
		<#assign topKudosCount = "5"/>
	</#if>
	<#assign basePath = ""/>
	<#assign allKudoPostPath = "/t5/kudos/kudosleaderboardpage/timerange/${topKudosTime}/page/1/tab/posts"/>
	<#if coreNode.nodeType == "category">
		<#assign basePath = 'AND category.id = "${coreNode.id}"'/>
		<#assign allKudoPostPath = "/t5/kudos/kudosleaderboardpage/category-id/${coreNode.id}/timerange/${topKudosTime}/page/1/tab/posts"/>
	<#elseif coreNode.nodeType == "board">
		<#assign basePath = 'AND board.id = "${coreNode.id}"'/>
		<#assign allKudoPostPath = "/t5/kudos/kudosleaderboardpage/board-id/${coreNode.id}/timerange/${topKudosTime}/page/1/tab/posts"/>
	</#if>
	<#if iStyle !="">
		<#assign basePath = basePath+' AND conversation.style = "${iStyle}" AND depth = 0'/>
	</#if>
	<#assign timeQuery = ""/>
	<#if iStyle != "blog">
			<#assign timeQuery = "AND post_time > ${beforeMS} AND post_time < ${nowMs}"/>
	</#if>

	<#assign kudosQuery = 'SELECT id,subject,author,post_time,post_time_friendly,view_href,board.id,board.title,board.view_href,board.conversation_style FROM messages WHERE kudos.sum(weight) > 0 ${timeQuery} ${basePath} ORDER BY kudos.sum(weight) desc, post_time DESC LIMIT ${topKudosCount?number}'/>
	<#assign apiVersion = "2.0"/>
	<#assign queryResult = rest(apiVersion, "/search?q=" + kudosQuery?url("UTF-8") + "&restapi.response_style=view").data.items![] />
	<#if (queryResult?size > 0)>
	<article>
		<article>
		    <div class="col-md-6">
			  <div>
			  	<#if iStyle == "blog">
	                <h1 class="liked-posts">Top Blogs </h1>
			  	<#else>
                	<h1 class="liked-posts">Most Liked Posts </h1>
                </#if>
			  </div>
			</div>
			<div class="col-md-6">
			   <div class="view-all">
                 <h2><a href="${allKudoPostPath}">View All</a></h2>
			   </div>
			</div>
			<div style="clear:both"></div>
		</article>

		<#list queryResult as message>
		<article> <!-- repeat this article -->
			<div class="col-md-6">
			  <div class="forum-title">
			    <h2><a href="${message.view_href}">${message.subject}</a></h2>
				<p>					
				  <span>${message.board.conversation_style}:</span>
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
				<p><a href="${message.author.view_href}">${message.author.login}</a></p>
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