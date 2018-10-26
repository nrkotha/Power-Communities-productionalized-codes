<#assign showLabel = false />
<#if user.registered && (page.name == "PostPage" || page.name == "EditPage") >
	<#list restadmin("/users/id/${user.id?c}/roles").roles.role as role>
		<#if role.name?? && (role.name == "Moderator" || role.name == "Administrator")>
			<#assign showLabel = true />
			<textarea class="lia-form-microsoftmsg-notes-input lia-form-type-text lia-form-input-vertical" id="microsoftmsg_notes" name="microsoftmsg_notes" >${(env.context.form.field.control.value)!""}</textarea>
		</#if>
	</#list>
</#if>
<#if !showLabel>
	<style>.lia-form-microsoft-msg-notes-entry{ display: none }</style>
</#if>