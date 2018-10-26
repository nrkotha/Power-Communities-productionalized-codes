<#attempt>
	<#assign categoryId = "events" />
	<#assign pageSize = 1000 />
	<#assign noOfPages = 1 />
	<#assign customDateFormat = "MM/dd/yyyy h:mm:a" />
	<#assign roles = restadmin("/users/id/" + user.id  +"/roles").roles.role />
	<#assign user_roles = [] />
	<#list roles as role>
		<#assign user_roles = user_roles + role.name />
	</#list>
	<#if user_roles?seq_contains("Administrator")?string("true", "false") == "true">
		<#assign eventPostsCount = restadmin("/categories/id/${categoryId}/topics/recent/count").value?number />
		<#if eventPostsCount gt pageSize>
			<#assign noOfPages = (eventPostsCount/pageSize) />
		</#if>
		<#list 1..noOfPages as pageNo>
			<#assign eventPosts = restadmin("/categories/id/${categoryId}/topics/recent?page_size=${pageSize}&page=${pageNo}").messages.message />
			<#if eventPosts?has_content>
				<#list eventPosts as post>
					<#attempt>
						<#assign msgStartDatetime = (restadmin("/messages/id/${post.id}/metadata/key/microsoft.msg_start_day").value)!"" />
						<#if msgStartDatetime?length gt 0>
							${text.format("message.id.title")}: ${post.id} 
							${text.format("chat.calendar.start_date.title")}: ${msgStartDatetime}
							<#assign setStartDate = restadmin("/messages/id/${post.id}/metadata/key/microsoft.msg_start_datetime/set?value=${(msgStartDatetime?trim?number?number_to_datetime?string['${customDateFormat}'])?url('UTF-8')}").metadata_association />
							${text.format("general.Time")}: ${restadmin("/messages/id/${post.id}/metadata/key/microsoft.msg_start_datetime").value}
						</#if>
						<#assign msgEndDatetime = (restadmin("/messages/id/${post.id}/metadata/key/microsoft.msg_end_day").value)!"" />
						<#if msgEndDatetime?length gt 0>
							${text.format("message.id.title")}: ${post.id} 
							${text.format("chat.calendar.end_date.title")}: ${msgEndDatetime}
							<#assign setEndDate = restadmin("/messages/id/${post.id}/metadata/key/microsoft.msg_end_datetime/set?value=${(msgEndDatetime?trim?number?number_to_datetime?string['${customDateFormat}'])?url('UTF-8')}").metadata_association />
							${text.format("general.Time")}: ${restadmin("/messages/id/${post.id}/metadata/key/microsoft.msg_end_datetime").value}
						</#if>
						${"\n"}
					<#recover>
						${text.format("error.exception.title")}: ${text.format("message.id.title")}:${post.id} 
						${.error}
					</#attempt>
				</#list>
			</#if>
		</#list>
	</#if>
<#recover>
	${.error}
</#attempt>
