</center><div id="fixed-banner">
	<div id="cookie-banner"></div>
 <#-- ${settings.name.get("layout.urlfetcher_header_flow")} -->


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
${settings.name.get("layout.urlfetcher_header_flow_ios")}
<#else>
${settings.name.get("layout.urlfetcher_header_flow")}
</#if>

</div>
	

<#-- MC-242 updating header with UFH header and footer -->
<#-- <#include "uhf_config.ftl"/>
${settings.name.get(uhfKeys("flow_header"))} --><center>
<#if coreNode.id == "FlowCommunity" >
    <div class="lia-hero-section lia-content">
        <div class="container">
            <h2 class="welcome-title">Welcome to the Community</h2>
            <div class="banner-search-form">
                <@component id="common.widget.search-form" />
            </div>
            <ul class="linkList linkList-horizontal linkList-topics">
                <li>Topics</li>
                <li><a class="button button-featured" href="/t5/Microsoft-Flow-Community/ct-p/FlowCommunity">Flow</a></li>
                <li>
                    <a class="button button-featured" href="/t5/forums/filteredbylabelpage/board-id/FlowForum/label-name/general%20questions">
                        General questions
                    </a>
                </li>
                <li>
                    <a class="button button-featured" href="/t5/forums/filteredbylabelpage/board-id/FlowForum/label-name/creating%20flows">
                        Creating flows
                    </a>
                </li>
                <li>
                    <a class="button button-featured" href="/t5/forums/filteredbylabelpage/board-id/FlowForum/label-name/using%20flows">
                        Using flows
                    </a>
                </li>
                <li>
                    <a class="button button-featured" href="/t5/forums/filteredbylabelpage/board-id/FlowForum/label-name/connecting%20to%20data">
                        Connecting to data
                    </a>
                </li>
                <li>
                    <a class="button button-featured" href="/t5/forums/filteredbylabelpage/board-id/FlowForum/label-name/mobile%20apps">
                        Mobile Apps
                    </a>
                </li>
            </ul>
        </div>
    </div>
</#if><@liaBody /></center>${settings.name.get("layout.urlfetcher_footer_flow")} 
<#-- MC-242 updating header with UFH header and footer -->
<#-- <#include "uhf_config.ftl"/>
${settings.name.get(uhfKeys("flow_footer"))} -->

<center>