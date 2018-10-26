</center><div id="fixed-banner">
	<div id="cookie-banner"></div>

 <#-- ${settings.name.get("layout.urlfetcher_header")}  -->

<#-- MC-396: Change header if mobileclient is iOS -->
<#assign mobClient = http.request.cookies.name.get("mobileClient").getValue()!""/>

<#if mobClient != "ios">
	<#assign cookies = http.response.cookies />
	<#list cookies as cookie,value>
		<#if cookie == "mobileClient">
			<#assign mobClient = value.getValue()/>
		</#if>
	</#list>
</#if>

<#if mobClient == "ios">
${settings.name.get("layout.urlfetcher_header_ios")}
<#else>
 ${settings.name.get("layout.urlfetcher_header")}
</#if>

</div>

<#-- MC-242 updating header with UFH header and footer -->
<#-- <#include "uhf_config.ftl"/>
${settings.name.get(uhfKeys("powerapps_header"))} -->

<center>
<#if coreNode.id == "PowerApps1" >
    <div class="lia-hero-section lia-content">
        <div class="container">
            <h2 class="welcome-title">Welcome to the Community</h2>
            <div class="banner-search-form">
                <@component id="common.widget.search-form" />
            </div>
            <ul class="linkList linkList-horizontal linkList-topics">
                <li>Topics</li>
                <li><a class="button button-featured" href="/t5/Power-Apps-Community/ct-p/PowerApps1">PowerApps</a></li>
                <li>
                    <a class="button button-featured" href="/t5/forums/filteredbylabelpage/board-id/PowerAppsForum1/label-name/general%20questions">
                        General questions
                    </a>
                </li>
                <li>
                    <a class="button button-featured" href="/t5/forums/filteredbylabelpage/board-id/PowerAppsForum1/label-name/creating%20apps">
                        Creating apps
                    </a>
                </li>
                <li>
                    <a class="button button-featured" href="/t5/forums/filteredbylabelpage/board-id/PowerAppsForum1/label-name/using%20apps">
                        Using apps
                    </a>
                </li>
                <li>
                    <a class="button button-featured" href="/t5/forums/filteredbylabelpage/board-id/PowerAppsForum1/label-name/flows">
                        Flows
                    </a>
                </li>
                <li>
                    <a class="button button-featured" href="/t5/forums/filteredbylabelpage/board-id/PowerAppsForum1/label-name/connecting%20to%20data">
                        Connecting to data
                    </a>
                </li>
            </ul>
        </div>
    </div>
  </#if><@liaBody /></center>
${settings.name.get("layout.urlfetcher_footer")} 
<#-- MC-242 updating header with UFH header and footer -->
<#-- <#include "uhf_config.ftl"/>
${settings.name.get(uhfKeys("powerapps_footer"))} -->
<center>