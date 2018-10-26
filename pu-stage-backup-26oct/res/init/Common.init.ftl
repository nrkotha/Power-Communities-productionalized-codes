<#if page.name !="BizAppsPage">
    <#attempt>
        <#--LIT-60: Custom Maintenance mode Start (will be removed after go live) -->
        <#assign maintenanceUrl = "/t5/custom/page/page-id/site_maintenance_page" />
        
        <#assign isMaint = false/>

        <#if isMaint == true>
            <#if user.anonymous && !http.request.url?contains(maintenanceUrl) && page.name != "UserLoginPage" && page.name !="UserSsoRegistrationPage" && page.name !="UserRegistrationPage">
               ${skin.set("powerusers_responsive")}
                ${http.response.setRedirectUrl(maintenanceUrl)}
            <#elseif user.registered>
                <#assign isAdmin = false />
                <#list restadmin("/users/id/${user.id?c}/roles").roles.role as maintrole>
                    <#if maintrole.name?? && (maintrole.name == "Administrator")> 
                        <#assign isAdmin = true />
                    <#break>
                    </#if>
                </#list>
                <#if !isAdmin && !http.request.url?contains(maintenanceUrl)>
                    ${skin.set("powerusers_responsive")}
                    ${http.response.setRedirectUrl(maintenanceUrl)}
                <#elseif isAdmin && http.request.url?contains(maintenanceUrl)>
                    ${http.response.setRedirectUrl("/")}
                </#if>
            <#else>

            </#if>
<#if http.request.url?contains(maintenanceUrl)>
 ${skin.set("powerusers_responsive")}
</#if>
        </#if>
        <#--Custom Maintenance mode End (will be removed after go live) -->

    <#recover>
    </#attempt>
</#if>




<#if page.name == "CommunityPage">
</#if>

<!-- code for events authorization -->

<#assign oauth = http.session.attributes.name.get("oauth", '') />   
<#assign isTokenExpired = false >
<#if oauth != ''>
     <#if ((oauth?eval['expires_on']?number) - (.now?long/1000)) &lt; 400>
        <#assign isTokenExpired = true >
     </#if> 
</#if>
<#if oauth == "" || isTokenExpired >
    <#assign data = "grant_type=client_credentials%20%20&client_id=ce371927-e793-4cc8-af6d-083ecf2b912c&client_secret=vmOTW4Ot7taJbjesK24oL1Bauvmk0G5e/zeNHgaG6Kw=&resource=https%3A%2F%2Fgeteventservicetest.onmicrosoft.com%2Fgeteventservicetest" />
    <#assign http_client_request = http.client.request("https","login.microsoftonline.com","/microsoft.onmicrosoft.com/oauth2/token").body(data,"application/x-www-form-urlencoded").post() />
    <#if http_client_request.hasError>
        ${http_client_request.error.message}
    <#else>
        ${http.session.setAttribute("oauth", http_client_request.content)}
    </#if> 
</#if>

<#--<#if skin.id !="powerusers_res_v2017">
${http.response.replaceQuilt("Header", "HeaderPage.2017SR")}
${http.response.replaceQuilt("HeaderPageNoTitleNoBreadcrumbs", "HeaderPage.2017SR")}
${http.response.replaceQuilt("HeaderPageNoTitle", "HeaderPage.2017SR")}
<#if page.name == "ErrorPage">
  ${http.response.replaceQuilt("ErrorPage", "ErrorPage.2017SR")}
</#if>
</#if>-->


<#-- Setting skin based upon previous skin -->
<#if page.name !="BizAppsPage">
    <#attempt>
        <#if coreNode.settings.name.get("skin.id")??>
            <#if page.name == "CommunityPage">
                ${skin.set("powerusers_responsive")}
            <#else>
                <#if (coreNode.settings.name.get("skin.id") == "powerusers_responsive")>
                    <#if http.session.getAttribute("skin")??>
                        <#assign skin_id = http.session.getAttribute("skin") />    
                        <#attempt>
                            ${skin.set(skin_id)}
                        <#recover>
                        </#attempt>
                    </#if>
                <#else>
                    <#assign skin = coreNode.settings.name.get("skin.id")/>            
                    ${http.session.setAttribute("skin", skin)}
                </#if>

            </#if>
        </#if>
    <#recover>
    </#attempt>
</#if>

<#if page.name !="BizAppsPage">
    <#-- MC-396: Set mobile client cookie if request is from Powerapps iOS application -->
    <#assign mobileClient = http.request.parameters.name.get("mobileClient","")?html />
    <#if (mobileClient == "ios")>
        <#assign mobCtCookie = http.request.createCookie("mobileClient", "ios") />
        ${mobCtCookie.setMaxAge(3600)} <#--1 hour-->
        ${mobCtCookie.setPath("/")}
        ${mobCtCookie.setDomain(".microsoft.com")}
            ${http.response.addCookie(mobCtCookie)}
    </#if>
</#if>
