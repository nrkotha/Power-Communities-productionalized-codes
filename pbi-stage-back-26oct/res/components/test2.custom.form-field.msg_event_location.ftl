<#include "common_utils.ftl" />
<#include "alp_dump.ftl" />


id="${env.context.form.field.control.id}" <br />
name="${env.context.form.field.control.name}" <br />
value="${env.context.form.field.control.value}" <br />
class="${env.context.form.field.control.class}" <br />

<@dump env.context.form.field.control "env.context.form.field.control" />
<@dump env.context.form.field "env.context.form.field" />
<@dump env.context.form "env.context.form" />

<@dump page.context "page.context" />
<@dump env.context "env.context" />
<@dump page.context.message "page.context.message" />
<@dump env.context.message "env.context.message" />
<@dump env "env" />
<@dump coreNode "coreNode" />
page.context.message.id ${(page.context.message.id)!""} <br />
env.context.message.id ${(env.context.message.id)!""} <br />

<#assign showLabel = false />
<#if user.registered && (page.name == "PostPage" || page.name == "EditPage") && underEventCategory() >
	<#list restadmin("/users/id/${user.id?c}/roles").roles.role as role>
		<#if role.name?? && (role.name == "Moderator" || role.name == "Administrator")>
			<#assign showLabel = true />
			<input class="lia-form-microsoftmsg-event-location-input lia-form-type-text lia-form-input-vertical" id="microsoftmsg_event_location" name="microsoftmsg_event_location" placeholder="${text.format("microsoft.msg_event_location.placeholder")}" type="text"></textarea>
		</#if>
	</#list>
</#if>
<#if !showLabel>
	<style>.lia-form-microsoft-msg-event-location-entry{ display: none }</style>
</#if>