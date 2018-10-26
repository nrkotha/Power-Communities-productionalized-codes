<@compress single_line=true>
<#attempt>
<#assign customDateFormat = "MM/dd/yyyy h:mm:a" />
<#assign dateToConvert = http.request.parameters.name.get("dateToConvert", "") />
${dateToConvert?datetime["${customDateFormat}"]?long?c}
<#recover>
  ${.error}
</#attempt>
</@compress>