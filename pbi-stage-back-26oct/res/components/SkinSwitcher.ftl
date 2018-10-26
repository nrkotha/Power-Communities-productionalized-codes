<#-- MC-76: A/B Testinmg Skin & Page Switcher created by iTalent -->
<#assign hasABTestRole = false />
<#assign roleList = usercache.get("roleList", "") />
<#if roleList?has_content>	<#-- Start (Role List from cache) --> 
	<#list roleList as role>
      <#if role.roleName?? && role.roleName?matches("AB Testers")>
        <#assign hasABTestRole = true />
        <#break>
      </#if>
    </#list>
    <#if hasABTestRole> <#-- Start (AB Testeres) -->
		<style>
			.skin-switcher {
				float: right;
margin-right:5px;
			}
			.skin-switcher span {
			    color: grey;
			}
			.skin-switcher a:nth-child(1){
				<#if skin.id!="power_bi_redesign">
					color:#F2C811 !important;
				<#else>
					color: grey !important;
					pointer-events: none;
			   		cursor: default;
				</#if>
			}
			.skin-switcher a:nth-child(3){
				<#if skin.id == "power_bi_redesign">
					color:#F2C811 !important;
				<#else>
					color: grey !important;
					pointer-events: none;
			   		cursor: default;
				</#if>
			}
		</style>
		<div class="skin-switcher">Switch To: <a href="?req=beta">Beta</a> <span>|</span> <a href="?req=default">Default</a>
	</#if>	<#-- End (AB Testeres) -->
</#if>	<#-- End (Role List from cache) --> 