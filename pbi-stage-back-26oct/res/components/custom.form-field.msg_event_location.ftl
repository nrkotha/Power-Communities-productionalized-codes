<#include "common_utils.ftl" />

<#assign showLabel = false />
<#if (page.name == "PostPage" || page.name == "EditPage") && underEventCategory() && isTopicMessage() >
	
			<#assign showLabel = true />

			<#assign event_custimization = http.session.attributes.name.get("event_custimization", '') />
     		<#if event_custimization == 'true'>	
				<#attempt>
				  <#assign message_details = rest("2.0","/search?q=" + "Select c_event_metadata FROM messages WHERE id = '${page.context.thread.topicMessage.uniqueId}'"?url).data.items[0] />
				  <#assign metaData = message_details.c_event_metadata?replace("<[^>]*>","", "r") />
				<#recover>
				  <#assign metaData = "" />
				</#attempt>

					<#assign inpersonClass = "">
					<#assign onlineClass = "">

					<#if page.name == "EditPage" && metaData!= '' && metaData?eval['Category']?? && metaData?eval['Category'] == "Online">
						<#assign onlineClass = "active">
					 <#else>
						<#assign inpersonClass = "active">
					 </#if> 

                    <div class="event-list-tabs">
					    <ul class="event-tab-list">
							<li id="in-person" class="${inpersonClass}" >In Person</li>
							<li id="online" class="${onlineClass}">Online</li>
						</ul>
					</div>
			</#if>

			<input class="lia-form-microsoftmsg-event-location-input lia-form-type-text lia-form-input-vertical" id="${env.context.form.field.control.id}" name="${env.context.form.field.control.name}" value="${(env.context.form.field.control.value)!""}" placeholder="${text.format("microsoft.msg_event_location.placeholder")}" type="text" />
</#if>
<#if !showLabel>
	<style>.lia-form-microsoft-msg-event-location-entry{ display: none }</style>
</#if>