<#assign showLabel = false />

<#if user.registered && (page.name == "PostPage" || page.name == "EditPage") >
	<#list restadmin("/users/id/${user.id?c}/roles").roles.role as role>
		<#if role.name?? && (role.name == "Moderator" || role.name == "Administrator")>
			<#assign showLabel = true />

			<#assign aValue=(env.context.form.field.control.value)!"" />
			<#assign noSelected = "" />
			<#assign yesSelected = "" />
			<#if aValue == "no">
				<#assign noSelected = "selected" />
			<#elseif aValue == "yes">
				<#assign yesSelected = "selected" />
			</#if>

			<select class="lia-form-microsoftisbug-input" id="microsoftisbug" name="microsoftisbug">
			<option title="No" value="no" ${noSelected}>No</option>
			<option title="Yes" value="yes" ${yesSelected}>Yes</option>
			</select>
		</#if>
	</#list>
</#if>
<#if !showLabel>
	<style>.lia-form-microsoft-isbug-entry{ display: none }</style>
</#if>


