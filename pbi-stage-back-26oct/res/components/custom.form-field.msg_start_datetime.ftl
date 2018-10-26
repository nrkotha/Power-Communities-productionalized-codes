<#include "common_utils.ftl" />

<#assign showLabel = false />
<#if user.registered && (page.name == "PostPage" || page.name == "EditPage") && underEventCategory() && isTopicMessage() >
      
      <#assign showLabel = true />
      <input class="lia-form-microsoftmsg-start-datetime-input lia-form-type-text lia-form-input-horizontal" id="${env.context.form.field.control.id}" name="${env.context.form.field.control.name}" value="${(env.context.form.field.control.value)!""}"  type="text" style="display:none" /> 

      <input id="s_dateid" onchange="update_s_el();" value="${decompose( (env.context.form.field.control.value)!"",1)}" class="lia-form-type-text lia-form-input-horizontal" type="text" />

      <select id="s_hourid" onchange="update_s_el();" >
        <#list 1..12 as x>
          <option ${decompose( (env.context.form.field.control.value)!"",2, x)} >${x}</option>
        </#list>
      </select>

      <select id="s_minid" onchange="update_s_el();" >
        <option ${decompose( (env.context.form.field.control.value)!"",3, 1)} >00</option>
        <option ${decompose( (env.context.form.field.control.value)!"",3, 2)} >15</option>
        <option ${decompose( (env.context.form.field.control.value)!"",3, 3)} >30</option>
        <option ${decompose( (env.context.form.field.control.value)!"",3, 4)} >45</option>
      </select>

      <select id="s_amid" onchange="update_s_el();" >
       <option ${decompose( (env.context.form.field.control.value)!"",4, 1)} >AM</option>
       <option ${decompose( (env.context.form.field.control.value)!"",4, 2)} >PM</option>
      </select>

   
</#if>
<#if !showLabel>
  <style>
    .lia-form-microsoft-msg-start-datetime-entry { display: none }
  </style>
</#if>