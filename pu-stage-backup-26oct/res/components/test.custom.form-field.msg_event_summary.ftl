<#include "alp_dump.ftl" />

<@dump user "user" />
<@dump page "page" />
<@dump coreNode "coreNode" />
<#assign ancestorsReverse = coreNode.ancestors?reverse />
<@dump ancestorsReverse "ancestorsReverse" />
<#assign ancestorReverse = (coreNode.ancestors?reverse[1])!{} />
<@dump ancestorReverse "ancestorReverse" />

<#function underEventCategory>
  <#local eventId = "Events" />
  <#if (coreNode.id)?? && (coreNode.id == eventId) >
    <#return true />
  </#if>
  <#assign ancestorReverse = (coreNode.ancestors?reverse[1])!{} />
  <#if (ancestorReverse.id)?? && (ancestorReverse.id == eventId) >
    <#return true />
  </#if>
  <#return  false />
</#function>

underEventCategory ${underEventCategory()?c}<br />

<#assign showLabel = false />
<#if user.registered && (page.name == "PostPage" || page.name == "EditPage") >
	<#list restadmin("/users/id/${user.id?c}/roles").roles.role as role>
		<#if role.name?? && (role.name == "Moderator" || role.name == "Administrator")>
			<#assign showLabel = true />
			<textarea class="lia-form-microsoftmsg-notes-input lia-form-type-text lia-form-input-vertical" id="${env.context.form.field.control.id}" name="${env.context.form.field.control.name}" value="${env.context.form.field.control.value}" ></textarea>
		</#if>
	</#list>
</#if>
<#if !showLabel>
	<style>.lia-form-microsoft-msg-notes-entry{ display: none }</style>
</#if>