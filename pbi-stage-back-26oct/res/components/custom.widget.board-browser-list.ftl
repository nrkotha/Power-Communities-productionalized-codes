<#attempt>

<#-- 
	iTrack: MC-67 by iTalent
	Title: custom.widget.board-browser-list
	Desscription: This component displays boards list for a given category 
	Parameters:
-->
 <#include "common_utils.ftl" />

<#-- <@liaMarkupCache ttl="10000" variation="node" anonymousOnly="true" /> -->
<@compress single_line=true>

	<#assign category="" iStyle=""/>
	<#assign category = env.context.component.getParameter("category")!"" />
	<#assign iStyle = env.context.component.getParameter("iStyle")!"" />
	<#assign limit = env.context.component.getParameter("limit")!"2000" />
	<#assign restQuery = "SELECT id,title,description,view_href,parent_category.title,parent_category.view_href,messages.count(*) FROM boards"/>
	
	<#if category == "">
		<#if coreNode.nodeType == "community">
			<#assign restQuery = restQuery+ " WHERE depth=1"/>

		<#elseif coreNode.nodeType == "category">
			<#assign restQuery = restQuery + " WHERE ancestor_categories.id='"+coreNode.id+"'"/>
		<#else>
			<#assign restQuery = ""/>
		</#if>
	<#else>
		<#assign restQuery = restQuery + " WHERE parent_category.id='"+category +"'"/>
	</#if>
	<#if iStyle!="">
		<#assign restQuery = restQuery + " AND conversation_style='"+iStyle+"'"/>
	</#if>
	<#if restQuery !="">	<#-- Start (Empty Query) -->
		<#assign restQuery = restQuery+ " ORDER BY position ASC"/>	
		<#assign restQuery = restQuery + " LIMIT 2000"/>
		<#assign apiVersion = "2.0"/>
		<#assign queryResult = rest(apiVersion, "/search?q=" + restQuery?url("UTF-8") + "&restapi.response_style=view").data.items![] />
		<#if (queryResult?size > 0)>	<#-- Start (empty Boards) -->

			<@generateComponentContent componentTitle="" className="custom-board-browser-list" >
				<section><!-- container-->
      				<article id="forums"><!-- forums -->
	    				<article>
		  					<div class="col-md-6">
			  					<div>
								  	
								  	<#if (category !="" && queryResult[0].parent_category?has_content)>
										<h2 class="forums">${queryResult[0].parent_category.title} <span class="layer">(${queryResult?size?c})</span></h2>
									<#elseif coreNode.nodeType == "category">
										<h2 class="forums">${coreNode.title}
 <span class="layer">(${queryResult?size?c})</span></h2>
									<#else>
									 <h2 class="forums">Community <span class="layer">(${queryResult?size?c})</span></h2>
									</#if>
               
			  					</div>
							</div>
							<#if (queryResult[0].parent_category?has_content)>
								<div class="col-md-6">
<#if category !="">
			   						<div class="view-all">

                 						<a href="${queryResult[0].parent_category.view_href}">View All</a>
			   						</div>
</#if>
								</div>
							</#if>
							<div style="clear:both"></div>
						</article>
	    				
	    				<#list queryResult as board>
	    					<#if (board?index >= limit?number)>
	    						<#break>
	    					</#if>
	    					<#assign isPostsinWeek = false/>
		    				<article> <!-- repart this article -->
								<div class="col-md-6">
								  	<div class="forum-title">
									    <a href="${board.view_href}"><h2>${board.title}</h2></a>
									    <p class="data-shaping-modeli">${board.description}</p>
									    <#attempt>
										    <#assign latestMsz = rest("/boards/id/${board.id}/threads/latest?restapi.response_style=view")/>
											<#if (latestMsz.@status == "success") && (latestMsz.thread.messages.topic.@view_href?has_content)>
												<span class="latest">Latest: </span>
												<a href="${latestMsz.thread.messages.topic.@view_href}"><span class="latest-Sed-posuere">${latestMsz.thread.messages.topic.subject}</span></a>
												<#assign latestPostTime = ""/>
												<#list latestMsz.thread.messages.linear.message as msg>
												<#if (latestPostTime !="") && (latestPostTime?datetime('iso') gt msg.last_edit_time?datetime('iso'))>

												<#else>
												<#assign latestPostTime = msg.last_edit_time/>
												</#if>

												</#list>
												<#assign updTimeMs= datesupport.setDate(latestPostTime?datetime("iso")).millisecondsAsString?number />
												<#assign currentMs= datesupport.setDate(.now?iso_utc?datetime("iso")).millisecondsAsString?number />
												<#if (currentMs-updTimeMs) <= 604800000>
													<#assign isPostsinWeek = true/>
												</#if>
											</#if>	
										<#recover>

										</#attempt>
								  	</div>
								</div>
								<div class="col-md-6">
								   	<div class="posts">
								   		<#assign readCount = rest("/boards/id/${board.id}/messages/read/count").value/>
										<#if (board.messages.count-readCount?number > 0)>
                    <#--Adding this code to change the 1000 and above values to k/M formats -->
											<span class="tag-bg <#if !isPostsinWeek>-old<#else>-new</#if>"><span class="">${kformat(board.messages.count-readCount?number)} new</span></span>
										</#if>
									 	<span class="-posts">${kformat(board.messages.count?number)} <span>posts</span></span>
								   	</div>
								</div>
								<div style="clear:both"></div>
							</article> <!-- repart this article /-->
							<div style="clear:both"></div>
						</#list>
      				</article><!-- forums / -->
				</section><!-- container/ -->
				
			</@generateComponentContent>

		</#if>	<#-- End (empty Boards) -->
	</#if>	<#-- End (Empty Query) -->
</@compress>
<#recover>
</#attempt>