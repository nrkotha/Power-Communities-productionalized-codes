<#include "common_utils.ftl" />

<#assign showLabel = false />
<#if (page.name == "PostPage" || page.name == "EditPage") && underEventCategory() && isTopicMessage() >
	
			<#assign showLabel = true />
			<input class="lia-form-microsoftmsg-event-location-input lia-form-type-text lia-form-input-vertical" id="${env.context.form.field.control.id}" name="${env.context.form.field.control.name}" value="${(env.context.form.field.control.value)!""}" placeholder="${text.format("microsoft.msg_event_location.placeholder")}" type="text" />
</#if>
<#if !showLabel>
	<style>.lia-form-microsoft-msg-event-location-entry{ display: none }</style>
</#if>