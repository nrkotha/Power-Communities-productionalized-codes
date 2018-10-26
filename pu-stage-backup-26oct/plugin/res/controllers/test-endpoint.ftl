<#assign categoryId = "events" />
<#assign pageSize = 1000 />
<#assign noOfPages = 1 />
<#attempt>
	<#assign eventPostsCount = rest("/categories/id/${categoryId}/posts/recent/count").value?number />
	<#if eventPostsCount gt pageSize>
		<#assign noOfPages = (eventPostsCount/pageSize) />
	</#if>
	<#list 1..noOfPages as pageNo>
		<#assign eventPosts = rest("/categories/id/${categoryId}/posts/recent?page_size=${pageSize}&page=${pageNo}").messages.message />
		<#if eventPosts?has_content>
			<#list eventPosts as post>
               ${post.id}
				<#attempt>
					<#assign msgStartDatetime = rest("/messages/id/${post.id}/metadata/key/microsoft.msg_start_day").value />
					<#if msgStartDatetime != "" || msgStartDatetime.@null[0]??>
						Messade Id: ${post.id} 
						
						<#assign setStartDate = rest("/messages/id/${post.id}/metadata/key/microsoft.msg_start_day/set?value=${.now?string['MM/dd/yyyy hh:mm:a']?datetime['MM/dd/yyyy hh:mm:a']?long?c}").metadata_association />
						New Time: ${rest("/messages/id/${post.id}/metadata/key/microsoft.msg_start_day").value}
					</#if>
					<#assign msgEndDatetime = rest("/messages/id/${post.id}/metadata/key/microsoft.msg_end_day").value />
                  msgEndDatetime: ${msgEndDatetime}
					<#if msgEndDatetime != "" || msgEndDatetime.@null[0]??>
						Messade Id: ${post.id} 
						
						<#assign setEndDate = rest("/messages/id/${post.id}/metadata/key/microsoft.msg_end_day/set?value=${.now?string['MM/dd/yyyy hh:mm:a']?datetime['MM/dd/yyyy hh:mm:a']?long?c}").metadata_association />
						New Time: ${rest("/messages/id/${post.id}/metadata/key/microsoft.msg_end_day").value}
					</#if>
				<#recover>
					Error processing message id : ${post.id} 
                    ${.error}
				</#attempt>
			</#list>
		</#if>
	</#list>
<#recover>
	${.error}
</#attempt>
