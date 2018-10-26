<#assign page_number = webuisupport.path.parameters.name.get("page")!1 />
<#assign results_list_size = 20>
<#assign countq = "select count(*) from messages where c_bug = 'yes'"?url("utf-8") />
<#assign count = rest("2.0","/search?q="+countq).data.count />
<#assign pageable_item = webuisupport.paging.pageableItem.setCurrentPageNumber(page_number)
	.setItemsPerPage(results_list_size)
	.setTotalItems(count)
	.setPagingMode("enumerated").build />
<#assign offset = (page_number-1)*results_list_size />
<#assign query = "select c_bug_notes,board,view_href,subject,author,post_time from messages where c_bug = 'yes' limit ${results_list_size} offset ${offset}"?url("utf-8") />
<#assign reports = rest("2.0","/search?q="+query).data.items />
<@component id="common.widget.pager" pageableItem=pageable_item />
<ul class="lia-list-standard">
<#if reports?size == 0>
<div>No messages marked as a Bug</div>
</#if>
<#list reports as report>
	<#assign board = rest("/boards/id/"+report.board.id).board />
	<li><a href="${report.view_href}">${report.subject}</a> by <a href="${report.author.view_href}">${report.author.login}</a>
		<div><span>${report.post_time?datetime?string}</span> - <a href="${board.@view_href}">${board.title}</a></div>
		<#if report.c_bug_notes??>
			<div>${report.c_bug_notes}</div>
		</#if>
	</li>
</#list>
</ul>
<@component id="common.widget.pager" pageableItem=pageable_item />