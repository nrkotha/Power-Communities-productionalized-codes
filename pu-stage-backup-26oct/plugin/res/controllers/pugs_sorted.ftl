<#assign groups=rest("/groups/list").groups />
<#assign pug_sorted = {}>
<#list groups.group as group>

"Group": "${group.title}",
<#assign matches=group.description?matches( ".*Location: (.*)")>
    <#list matches as m>
        "${m?groups[1]?length}"
            <#if m?groups[1]?length gt 0>
                <#assign pug_sorted = pug_sorted + {"${m?groups[1]}": "${group.title}"}>
            <#else>
            "uknown!"
                <#assign pug_sorted = pug_sorted + {"UnknownLocation": "${group.title}"}>
            </#if>

<#-- <#if pug_sorted[${m?groups[1]}]?? >
"it exists!"
</#if>     -->
"Location": "${m?groups[1]}"
    </#list>
</#list>
<#assign keys = pug_sorted?keys>
<#list keys as key>${key} = ${pug_sorted[key]}; </#list>