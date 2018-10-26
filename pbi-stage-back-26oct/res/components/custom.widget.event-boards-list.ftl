<#attempt>
<#-- 
	iTrack: MC-67 by iTalent
	Title: custom.widget.board-browser-list
	Desscription: This component displays boards list for a given category 
	Parameters:
-->
 
<#-- <@liaMarkupCache ttl="10000" variation="node" anonymousOnly="true" /> -->
<@compress single_line=true>
<#include "common_utils.ftl" />


	<#assign category="" iStyle=""/>
	<#assign category = env.context.component.getParameter("category")!"" />
	<#assign iStyle = env.context.component.getParameter("iStyle")!"" />
		<#assign limit = env.context.component.getParameter("limit")!"4" />

	<#assign restQuery = "SELECT id,title,description,view_href,parent_category.title,parent_category.view_href,messages.count(*) FROM boards"/>
	<#if iStyle!="">
		<#assign restQuery = restQuery + " conversation_style='"+iStyle+"'"/>
	</#if>
	<#if category == "">
		<#if coreNode.nodeType == "community">
			<#assign restQuery = restQuery+ " WHERE depth=1"/>
		<#elseif coreNode.nodeType == "category">
			<#assign restQuery = restQuery + " WHERE ancestor_categories.id='"+coreNode.id+"' and depth=2"/>
		<#else>
			<#assign restQuery = ""/>
		</#if>
	<#else>
		<#assign restQuery = restQuery + " WHERE ancestor_categories.id='"+category +"' and depth=2"/>
	</#if>
	<#if restQuery !="">	<#-- Start (Empty Query) -->
		<#assign restQuery = restQuery+ " ORDER BY position ASC"/>	
		<#assign restQuery = restQuery + " LIMIT "+limit/>
		<#assign apiVersion = "2.0"/>
		<#assign queryResult = rest(apiVersion, "/search?q=" + restQuery?url("UTF-8") + "&restapi.response_style=view").data.items![] />
		<#if (queryResult?size > 0)>	<#-- Start (empty Boards) -->
			<@generateComponentContent componentTitle="" className="custom-event-boards-list" >
			<!-- <div class="custom-event-boards-list"> -->
				<!-- Events -->
			    <article id="events" class=""> <!-- container -->
				  <article>
<div class="header_bottom">
				    <div class="col-md-6">
					  <div>
					  	<#if (queryResult[0].parent_category?has_content)>
					  		<h2 class="data-stories">${queryResult[0].parent_category.title}</h2>
						<#else>
							<h2 class="data-stories">Community</h2>
						</#if>
               
					  </div>
					</div>
					<#if (queryResult[0].parent_category?has_content)>
					<div class="col-md-6">
					   <div class="view-all">
		                 <h2><a href="${queryResult[0].parent_category.view_href}">View All</a></h2>
					   </div>
					</div>
					</#if>
</div>
					<div style="clear:both"></div>
				  </article>
				  <#macro placeBoardTile board_l imgURL_l>
				  	<#assign isPostsinWeek = false/>

						<article class="col-md-4 col-sm-4 col-xs-12">
						    <div class="cmBlog-Widget">
						       <div class="bg-communityBlog">
									<figure class="mask-copy">  
										<img class="bitmap" alt="${board_l.title}" src="${imgURL_l}">
									</figure>
									<div class="data-user-info">
										<span class="data-info"><a href="${board_l.view_href}">${board_l.title}</a></span><br/>
										<#attempt>
										    <#assign latestMsz = rest("/boards/id/${board_l.id}/threads/latest?restapi.response_style=view")/>
											<#if (latestMsz.@status == "success") && (latestMsz.thread.messages.topic.@view_href?has_content)>
												<span class="username">Latest: <span style="color: #986f0b"><a href="${latestMsz.thread.messages.topic.@view_href}">${latestMsz.thread.messages.topic.subject}</a></span></span>
												
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
									<div class="posts">
									 	<span class="-posts">${board_l.messages.count} <span style="margin-left:5px">events</span></span>
									 <#assign readCount = rest("/boards/id/${board_l.id}/messages/read/count").value/>
										<#if (board_l.messages.count-readCount?number > 0)>
											<span class="tag-bg <#if !isPostsinWeek>-old<#else>-new </#if>"><span class="">${board_l.messages.count-readCount?number} new</span></span>
										</#if>
								    </div>
								</div>
								
							</div>
		  				</article>
				  </#macro>
				  <#assign fixedBoardList = ["Community","OnDemandEvents","Microsoft"]/>
<div >
				  <#list queryResult as board>
				  		<#assign eventImage = asset.get('/html/assets/event-'+board.id+'.png')/>
				  		

				  		<#if category == "Events">
				  			<#if fixedBoardList?seq_contains(board.id)>
				  				 <@placeBoardTile board_l=board imgURL_l=eventImage/>
				  			</#if>
				  		<#else>
				  			 <@placeBoardTile board_l=board imgURL_l=eventImage/>
				  		</#if>
					</#list>
</div>
				  <div style="clear:both"></div>
			    </article>
				<!-- Events /-->
      				
			<!--</div> -->
</@generateComponentContent>

		</#if>	<#-- End (empty Boards) -->
	</#if>	<#-- End (Empty Query) -->
</@compress>
<#recover>
</#attempt>