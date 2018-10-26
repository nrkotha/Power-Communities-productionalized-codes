<#-- 
	iTrack: MC-67 by iTalent
	Title: custom.widget.board-browser-list
	Desscription: This component displays boards list for a given category 
	Parameters:
-->
 
<#-- <@liaMarkupCache ttl="10000" variation="node" anonymousOnly="true" /> -->
<@compress single_line=true>
<#include "common_utils.ftl" />

<#assign commonData = coreNode.settings.name.get("customcontent.3_text")!""/>
<#if commonData =="">
    <#assign commonData  = {}/>
<#else>
<#attempt>
    <#assign commonData  = commonData?eval/>
<#recover>
</#attempt>
</#if>
	<#assign category="" iStyle=""/>
	<#assign category = env.context.component.getParameter("category")!"" />
	<#assign iStyle = env.context.component.getParameter("iStyle")!"" />
	<#assign limit = env.context.component.getParameter("limit")!"4" />
	<#assign filter = env.context.component.getParameter("filter")!"" />


	<#assign restQuery = "SELECT id,title,description,view_href,parent_category.title,parent_category.view_href,messages.count(*) FROM boards"/>
	<#if iStyle!="">
		<#assign restQuery = restQuery + " conversation_style='"+iStyle+"'"/>
	</#if>
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
	<#if filter !="">
		<#if filter =="posts">
			<#assign restQuery = restQuery +" ORDER BY messages.count(*) DESC"/>
		<#elseif filter =="views">
			<#assign restQuery = restQuery +" ORDER BY views DESC"/>
		<#elseif filter =="position">
			<#assign restQuery = restQuery +" ORDER BY position ASC"/>
		<#else>
			<#assign restQuery = restQuery +" ORDER BY depth DESC"/>
		</#if>
	</#if>
	<#if restQuery !="">	<#-- Start (Empty Query) -->
		<#assign restQuery = restQuery + " LIMIT 2000"/>
		<#assign apiVersion = "2.0"/>
		<#assign queryResult = rest(apiVersion, "/search?q=" + restQuery?url("UTF-8") + "&restapi.response_style=view").data.items![] />
		<#if (queryResult?size > 0)>	<#-- Start (empty Boards) -->
			<@generateComponentContent componentTitle="" className="custom-boards-list" >
			<!-- <div class="custom-event-boards-list"> -->
				<!-- Events -->
			    <article id="events" class="eventsboards_list"> <!-- container -->
				  <article>
<div class="header_bottom">
				    <div class="col-md-6" id="skip_content">
					  <div>
					  	<#if (queryResult[0].parent_category?has_content)>
					  		<h2 class="forums">${queryResult[0].parent_category.title} <span class="layer">(${queryResult?size?c})</span></h2>
						<#else>
							<h2 class="data-stories">Community</h2>
						</#if>
               
					  </div>
					</div>
					<#if (queryResult[0].parent_category?has_content)>
					<div class="col-md-6">
					   <div class="view-all">
		                 <a href="${queryResult[0].parent_category.view_href}">View All</a>
					   </div>
					</div>
					</#if>
</div>
					<div style="clear:both"></div>
				  </article>
				  <#macro placeBoardTile board_l imgURL_l>
				  	<#assign isPostsinWeek = false/>

						<article class="col-md-3 col-sm-6 col-xs-12 last-ele">
						    <div class="cmBlog-Widget">
						       <div class="bg-communityBlog">
									<figure class="mask-copy">  
										<img class="bitmap" alt="${board_l.title}" src="${imgURL_l}">
									</figure>
									<div class="data-user-info">
										<span ><a href="${board_l.view_href}" class="data-info">${board_l.title}</a></span>
										<span class="description">${board_l.description}</span>
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
							<span class="postscount">${board_l.messages.count} <span style="margin-left:5px">posts</span></span>
									 <#assign readCount = rest("/boards/id/${board_l.id}/messages/read/count").value/>
										<#if (board_l.messages.count-readCount?number > 0)>
									<span class="tag-bgbtn <#if !isPostsinWeek><#else>-new </#if>"><span class="">${board_l.messages.count-readCount?number} new</span></span>
										</#if>
								    </div>
								</div>
								
							</div>
		  				</article>
				  </#macro>
				 
				  <#list queryResult as board>
				  <#assign boardImage = asset.get('/html/assets/board-'+board.id+'.png')/>
				  <#assign noBoardImage = asset.get('/html/assets/image_unavailable.png')/>
    					<#if (board?index >= limit?number)>
    						<#break>
    					</#if>
				  		 <#--<#if commonData.boardThumbnail?? && commonData.boardThumbnail[board.id]??>
				  			<#assign boardImage = commonData.boardThumbnail[board.id]/>
				  		<#else>
					  		<#assign boardImage = asset.get('/html/assets/image_unavailable.png')/>
				  		 </#if>-->

				  		<#if boardImage??>
				  		<@placeBoardTile board_l=board imgURL_l=boardImage/>
				  		<#else>
                        <@placeBoardTile board_l=board imgURL_l=noBoardImage/>
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
<style type="text/css">
.eventsboards_list .mask-copy img{
width: 100%;
    border-bottom: solid 1px #ccc;
    height: 154px;
}
#lia-body .eventsboards_list h2.forums {
    font-size: 30px;
    font-weight: 300;
    color: #2b2b2b;
}
#lia-body .eventsboards_list .data-user-info{
margin-bottom:0px;
}
.eventsboards_list .col-md-3 {
    width: 270px;
    margin-right: 30px;
    margin-bottom: 30px;
}
.eventsboards_list .cmBlog-Widget {
    box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.04);
    border: solid 1px #ccc;
    min-height: 390px;
position: relative;
}
.eventsboards_list .view-all a {
    font-size: 18px;
    color: #986f0b;
    font-weight: normal;
}
.eventsboards_list .view-all {
    float: right;
}
.eventsboards_list .data-user-info {
    padding: 24px 24px 18px 24px;
    height: auto;
}
.eventsboards_list .username{
font-size: 15px;
height: 46px;
line-height: 24px;
width: 100%;
display: block;
color: #767676;
}
#lia-body .eventsboards_list .data-info{
    color: #2b2b2b !important;
font-size: 18px;
}
.eventsboards_list .username a{
font-size: 15px;
color: #986f0b;

}
.eventsboards_list .description{
display: block;
    margin-bottom: 12px;
font-size: 15px;
  font-weight: normal;
  font-style: normal;
  font-stretch: normal;
  line-height: 20px;
  letter-spacing: normal;
  text-align: left;
  color: #767676;
display: -webkit-box;
    max-width: 100%;
    height: 4em;
    -webkit-line-clamp: 3;
    -webkit-box-orient: vertical;
    overflow: hidden;
    text-overflow: ellipsis;

}
.eventsboards_list .posts {
    padding: 0px 22px 18px;
position: absolute;
    bottom: 0;
}
#lia-body .data-user-info .data-info{
height: 1.5em;
}
.eventsboards_list .data-info{
display: block;
margin-bottom:12px !important;
}
.eventsboards_list .data-info a{
font-size: 18px;
 color: #2b2b2b !important;
}
.eventsboards_list .posts .postscount{
font-size: 20px;
  font-weight: 300;
  font-style: normal;
  font-stretch: normal;
  line-height: normal;
  letter-spacing: normal;
  text-align: left;
  color: #767676;
}
.eventsboards_list .posts .tag-bgbtn{
width: 71px;

line-height: 20px;
padding:2px 14px;
  border-radius: 12px;
  background-color: #f2c811;
font-size: 12px;
  font-weight: normal;
  font-style: normal;
  font-stretch: normal;
  line-height: normal;
  letter-spacing: normal;
  text-align: center;
  color: #2b2b2b;
margin-left:24px;
display: inline-block;
}
.eventsboards_list  h1.forums {
    font-size: 30px;
    font-weight: 300;
    color: #2b2b2b;
}
.eventsboards_list  h1.forums .layer{
color: #767676;
font-size: 18px;
}
@media only screen and (max-width: 768px){
.eventsboards_list .col-md-3 {
    width: 50%;
    margin-right: 0;
    margin-bottom: 30px;
}
}
@media only screen and (max-width: 580px){
.eventsboards_list .col-md-3 {
    width: 100%;  
  
}
}
</style>

