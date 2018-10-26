<#if coreNode.id=="PBIShowcase" && page.name=="ForumTopicPage" && page.context.message??>
	<#if page.context.message.bodyRaw??>
	
		<#assign msg_body_clean=page.context.message.bodyRaw?replace('<SPAN\\sclass="reportid\\shidden">.*</SPAN>','','ri') />
		<#assign msg_body="${msg_body_clean}" />
	
		<#if msg_body?length gt 200>
			<#assign msg_body_trunc="${utils.html.truncate(197, msg_body, '...')}" />
		<#else>
			<#assign msg_body_trunc="${msg_body}" />
		</#if>
		
		<#assign msg_body_strip="${utils.html.stripper.from.gdata.strip(msg_body_trunc)}" />
		
		<#assign card_desc="${msg_body_strip?replace('\r\n|\n',' ','r')}" />
	<#else>
		<#assign card_desc="" />
	</#if>
	
	<#assign query="SELECT url FROM attachments WHERE message.id = '${page.context.message.uniqueId}' LIMIT 1" />
	<#assign queryResult=rest("2.0", "/search?q=" + query?url("UTF-8")) />
	
	<#if queryResult.status=="success" && queryResult.data?? && queryResult.data?has_content && queryResult.data.items?? && queryResult.data.items?has_content>
		<#list queryResult.data.items as item>
			<#if item??>
				<#assign attach=item />
			</#if>
		</#list>
	</#if>
	
	<#if attach??>
		<#assign card_image="${attach.url}" />
	<#else>
		<#assign card_image="" />
	</#if>

	<meta name="twitter:card" content="summary" />
	<meta name="twitter:title" content="${page.context.message.subject}" />
	<meta name="twitter:description" content="${card_desc}" />
	<meta name="twitter:image" content="${card_image}" />
	<meta name="twitter:url" content="${http.request.url}" />
</#if>