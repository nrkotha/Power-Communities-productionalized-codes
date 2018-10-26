<#compress>
	<#if !user.anonymous>
		<#attempt>
			<#assign post_message = http.request.parameters.name.get("post_message", '') />
			<#assign message_id = http.request.parameters.name.get("message_id", '') />
			<#assign message_subject = http.request.parameters.name.get("message_subject", '') />
			<#assign setReply = restadmin('/messages/id/${message_id}/reply?message.subject=${message_subject?url}&message.body=${post_message?url}&message.subscribe_type=thread') />
				<#if setReply.@status == "success">
					{"status":"success", "response": "${setReply.message.id}#M${setReply.message.board_id}"}
					<#assign setMessageStatus = restadmin('/messages/id/${setReply.message.id}/read/mark') />
				<#else>
					{"status":"error", "response": "error"}
				</#if>
			<#recover>
				{"status":"error", "response": "error"}
			</#attempt>
	<#else>
		{"status":"error", "response": "logged out"}
	</#if>
</#compress>