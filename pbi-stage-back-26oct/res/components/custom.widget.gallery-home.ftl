<div class="custom-widget-gallery-home">
	<#assign queryResult = rest("/categories/id/${coreNode.id}/boards").boards![] />
	<#if (queryResult?size > 0)>	<#-- Start (empty Boards) -->
		<#list queryResult.board as board>
			 <@component id="custom.widget.gallery-showcase" actID="${board.id}" limit="4" type="board"/>
		</#list>
	</#if> <#-- End (empty Boards) -->
</div>