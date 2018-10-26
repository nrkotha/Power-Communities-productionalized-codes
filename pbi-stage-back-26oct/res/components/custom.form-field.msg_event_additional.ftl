<#include "common_utils.ftl" />

 <style>
#lia-body .lia-form-microsoft-msg-event-additional-entry,
  #lia-body .lia-form-microsoft-msg-event-metadata-entry,
  #lia-body .lia-form-microsoft-msg-event-status-entry{
    display:none;
  }
 </style>
<#assign showLabel = false />
<#if (page.name == "PostPage" || page.name == "EditPage") && underEventCategory() && isTopicMessage() >
  
      <#assign showLabel = true />
      <textarea class="lia-form-microsoftmsg-event-summary-input lia-form-type-text lia-form-input-vertical" id="${env.context.form.field.control.id}" name="${env.context.form.field.control.name}" >${(env.context.form.field.control.value)!""}</textarea>

</#if>
<#if !showLabel>
  <style>.lia-form-microsoft-msg-event-summary-entry{ display: none }</style>
</#if>