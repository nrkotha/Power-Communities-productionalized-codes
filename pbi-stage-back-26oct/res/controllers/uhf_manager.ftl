<#compress>
<response>
<#-- Return error if user is anonymous -->
<#if !user.anonymous>

     <#assign hasRole = false />
     <#-- User should have uhfparser or Administrator role to perform any uhf activites in metadata -->
    <#list restadmin("/users/id/${user.id?c}/roles").roles.role as role>
        <#if role.name?? && role.name == "Administrator">
            <#assign hasRole = true />
            <#break>
        </#if> 
    </#list>
    <#assign mode = http.request.parameters.name.get("mode", "")/>
    <#assign data = http.request.parameters.name.get("data", "")?html/>


    <#if mode != "" && hasRole>    <#-- start (mode) -->
        <#include "uhf_config.ftl"/>
        <#macro UpdateSetting key>
        <#if data !="">
            <status>
            ${restadmin("/settings/name/${key}/set?value=${data?url}").@status}
            </status>
            <#else>
                <url>${"/restapi/vc/settings/name/${key}/set"?url}</url>
            </#if>
        </#macro>

        <#macro getSetting key>
            <value>
               ${restadmin("/settings/name/"+key).value?url}
            </value>
        </#macro>

        <#switch mode>
            <#case "flow_url">
                 <url>    
                ${uhfKeys("flowUrl")}
                </url>
            <#break>

            <#case "powerapps_url">
                <url>    
                    ${uhfKeys("powerAppsURL")}               
                </url>
            <#break>

            <#case "powerbi_url">
                <url>    
                    ${uhfKeys("powerBIURL")}               
                </url>
            <#break>

            <#-- GET methods -->
            <#case "get_flow_head">    
                <@getSetting key=uhfKeys("flow_head")/>
            <#break>

            <#case "get_flow_header">    
                <@getSetting key=uhfKeys("flow_header")/>
            <#break>

            <#case "get_flow_footer">    
                <@getSetting key=uhfKeys("flow_footer")/>
            <#break>

            <#case "get_powerapps_head">    
                <@getSetting key=uhfKeys("powerapps_head")/>
            <#break>

            <#case "get_powerapps_header">    
                <@getSetting key=uhfKeys("powerapps_header")/>
            <#break>

            <#case "get_powerapps_footer">    
                <@getSetting key=uhfKeys("powerapps_footer")/>
            <#break>

            <#case "get_powerbi_head">    
                <@getSetting key=uhfKeys("powerbi_head")/>
            <#break>

            <#case "get_powerbi_header">    
                <@getSetting key=uhfKeys("powerbi_header")/>
            <#break>

            <#case "get_powerbi_footer">    
                <@getSetting key=uhfKeys("powerbi_footer")/>
            <#break>

            <#-- POST methods -->                  
            <#case "update_flow_head">    
                <@UpdateSetting key=uhfKeys("flow_head")/>
            <#break>

            <#case "update_flow_header">    
                <@UpdateSetting key=uhfKeys("flow_header")/>
            <#break>

            <#case "update_flow_footer">    
                <@UpdateSetting key=uhfKeys("flow_footer")/>
            <#break>

            <#case "update_powerapps_head">    
                <@UpdateSetting key=uhfKeys("powerapps_head")/>
            <#break>

            <#case "update_powerapps_header">    
                <@UpdateSetting key=uhfKeys("powerapps_header")/>
            <#break>

            <#case "update_powerapps_footer">    
                <@UpdateSetting key=uhfKeys("powerapps_footer")/>
            <#break>

            <#case "update_powerbi_head">    
                <@UpdateSetting key=uhfKeys("powerbi_head")/>
            <#break>

            <#case "update_powerbi_header">    
                <@UpdateSetting key=uhfKeys("powerbi_header")/>
            <#break>

            <#case "update_powerbi_footer">    
                <@UpdateSetting key=uhfKeys("powerbi_footer")/>
            <#break>
                                       
            <#default>
                  <error>invalid mode : mode = ${mode}</error>   
            <#break>                 
        </#switch>
    <#else>
        <#if !hasRole>
            <error> uhfparser role is missing for user ${user.id}</error>
        <#else>
            <error> Mode not found= mode = ${mode} </error>
            <validModes>flow_url,powerapps_url,powerbi_url,get_flow_head,get_flow_header,get_flow_footer,get_powerapps_head,get_powerapps_header,get_powerapps_footer,get_powerbi_head,get_powerbi_header,get_powerbi_footer,update_flow_head,update_flow_header,update_flow_footer,update_powerapps_head,update_powerapps_header,update_powerapps_footer,update_powerbi_head,update_powerbi_header,update_powerbi_footer</validModes>
        </#if>
    </#if> <#-- start (mode) -->
 
<#else>
    <error id="TZ-403">Unautherized access</error>
</#if>
</response>
</#compress>