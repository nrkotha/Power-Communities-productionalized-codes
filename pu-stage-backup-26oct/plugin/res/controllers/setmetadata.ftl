<response>
<#-- Return error if user is anonymous -->
<#if !user.anonymous>
     <#assign hasRole = false />
    <#list restadmin("/users/id/${user.id?c}/roles").roles.role as role>
        <#if role.name?? && (role.name == "uhfparser")>
            <#assign hasRole = true />
            <#break>
        </#if> 
    </#list>


    <#assign mode = http.request.parameters.name.get("mode", "")/>
    <#assign data = http.request.parameters.name.get("data", "")?html/>

    <#if mode != "" && hasRole>    <#-- start (mode) -->
        
        <#switch mode>  
            <#case "head">    
                <status>
                   ${restadmin("/settings/name/layout.uhf_head_powerapps/set?value=${data?url}").@status}
                </status>
            <#break>
                                       
            <#default>
                  <error id="TZ-400">invalid mode : mode = ${mode} for user ${user.id}</error>                    
        </#switch>
    <#else>
        <error id="TZ-400"> Mode not found= mode = ${mode} for user ${user.id}</error>
        <validModes>head</validModes>
    </#if> <#-- start (mode) -->
 
<#else>
    <error id="TZ-403">Unautherized access</error>
</#if>
</response>