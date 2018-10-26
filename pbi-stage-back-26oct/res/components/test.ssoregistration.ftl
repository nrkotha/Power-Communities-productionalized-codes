<#assign metrics = restadmin("/users/id/${user.id}/metrics").metrics />
 
    <#list metrics.metric as value>
      <#if value.@name == "page_views">
        <#assign page_views = value />
      </#if>
      <#if value.@name == "logins">
        <#assign logins = value />
      </#if>
    </#list>

<#assign isWelcomeShown = usercache.get("isWelcomeShown","0") />
<#attempt>
<#assign isFromSSO = http.request.referrer?contains("ssoregistrationpage")?c />
<#recover>
<#assign isFromSSO = false />
</#attempt>
<script> 
console.log("user: ${user.id} | logins: ${logins} | page views: ${page_views} | isWelcomeShown: ${isWelcomeShown} | isFromSSO: ${isFromSSO}");
</script>
 

