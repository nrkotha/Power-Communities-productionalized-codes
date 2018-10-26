<#include "common_utils.ftl" />

<#assign showLabel = false />
<#if user.registered && (page.name == "PostPage" || page.name == "EditPage") && underEventCategory() >
	<#list restadmin("/users/id/${user.id?c}/roles").roles.role as role>
		<#if role.name?? && (role.name == "Moderator" || role.name == "Administrator")>
			<#assign showLabel = true />
			<input class="lia-form-microsoftmsg-event-country-input lia-form-type-text lia-form-input-vertical" id="${env.context.form.field.control.id}" name="${env.context.form.field.control.name}" value="${(env.context.form.field.control.value)!""}" placeholder="${text.format("microsoft.msg_event_country.placeholder")}" type="text" />
		</#if>
	</#list>
</#if>
<#if !showLabel>
	<style>
          .lia-form-microsoft-msg-event-country-entry { display: none }
        </style>
<#else>
	<style>
          .lia-form-microsoft-msg-event-country-entry .lia-form-label-wrapper{ display: none }
        </style>
</#if>