<#include "common_utils.ftl" />
<#assign customDateFormat = "MM/dd/yyyy h:mm:a" />
<#assign showLabel = false />
<#if (page.name == "PostPage" || page.name == "EditPage") && underEventCategory() && isTopicMessage() >
      <#assign showLabel = true />
		<#attempt>
			<#assign startDate = env.context.form.field.control.value?number?number_to_datetime?string['${customDateFormat}'] />	
		<#recover>
			<#assign startDate = "" />
		</#attempt>
      <input class="lia-form-microsoftmsg-start-datetime-input lia-form-type-text lia-form-input-horizontal" 
        id="${env.context.form.field.control.id}" name="${env.context.form.field.control.name}" 
        value="${(env.context.form.field.control.value)!""}"  type="text" style="display:none" /> 
      <input id="s_dateid1" onchange="update_s_e2();" value="${decompose(startDate,1)}" 
        class="lia-form-type-text lia-form-input-horizontal" type="text" />
      <select id="s_hourid1" onchange="update_s_e2();" >
        <#list 1..12 as x>
          <option ${decompose( startDate,2, x)} >${x}</option>
        </#list>
      </select>
      <select id="s_minid1" onchange="update_s_e2();" >
        <option ${decompose(startDate,3, 1)} >00</option>
        <option ${decompose(startDate,3, 2)} >15</option>
        <option ${decompose(startDate,3, 3)} >30</option>
        <option ${decompose(startDate,3, 4)} >45</option>
      </select>
      <select id="s_amid1" onchange="update_s_e2();" >
       <option ${decompose(startDate,4, 1)} >AM</option>
       <option ${decompose(startDate,4, 2)} >PM</option>
      </select>
</#if>
<#if !showLabel>
  <style>
    .lia-form-microsoft-msg-start-date-entry { display: none }
  </style>
</#if>