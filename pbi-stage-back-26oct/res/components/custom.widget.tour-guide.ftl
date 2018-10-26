<#assign info = env.context.component.getParameter("info")!"" />
	<#assign iStyle = env.context.component.getParameter("iStyle")!"" />
<#include "common_utils.ftl" />
<@generateComponentContent componentTitle="" className="custom-tour-guide" >
<!-- <div class="custom-tour-guide"> -->
	<#if info=="true">
		<div class="custom-cat-info col-md-12">
					<span class="community-stats">Community stats</span>
<div style="clear:both"></div>
			<#assign basePath = ""/>
			<#if coreNode.nodeType =="category">
				<#assign basePath = "/categories/id/"+coreNode.id/>
			<#elseif coreNode.nodeType =="board">
				<#assign basePath = "/boards/id/"+coreNode.id/>
			<#else>
			</#if>
			<#assign styleAPIPath = ""/>
			<#-- <#if iStyle !="" && coreNode.nodeType !="board">
				<#assign styleAPIPath = "/style/"+iStyle/>
			</#if> -->
			<#assign solCount = ""/>
			<#if iStyle == "forum">
			<#assign solCount = restadmin("${basePath}/solutions${styleAPIPath}/count").value/>
			</#if>
			<#assign kudoCount = restadmin("${basePath}/kudos${styleAPIPath}/count").value/>
			<#assign postCount = restadmin("${basePath}/posts${styleAPIPath}/count").value/>
			<div class="box"><p class="guide-posts"><strong>${kformat(kudoCount?number)}</strong></p> <p class="guide-count">likes</p></div>
			<#if solCount !="">
			<div class="box"><p class="guide-posts"><strong>${kformat(solCount?number)}</strong></p><p class="guide-count">solutions</p></div>
			</#if>
			<div class="box"><p class="guide-posts"><strong>${kformat(postCount?number)}</strong></p> <p class="guide-count">posts</p></div>
			
			<div style="clear:both"></div>
	   	</div>
	</#if>
	<div class="new-community col-md-12">
		<p>New to the community?</p>
		<p><a href="https://powerbi.microsoft.com/en-us/guided-learning/" target="_blank">Take the tour to get started > </a></p>
	</div>
<!--</div> -->
</@generateComponentContent>
<div style="clear:both"></div>

<#if page.name == "TkbArticlePage">
	<@liaAddScript>
	  (function($){
	   $('.lia-CommentEditor-form').appendTo('.ComponentToggler.lia-component-comments .lia-decoration-border-content .lia-panel-heading-bar-wrapper');
	})(LITHIUM.jQuery);
	</@liaAddScript>
</#if>