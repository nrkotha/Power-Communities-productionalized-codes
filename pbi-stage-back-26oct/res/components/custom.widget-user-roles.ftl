<#-- This component is created by iTalent as part of the iTarck MC-412 -->
<#-- Description: This component will display the roles of the user if user is not admin -->
<#attempt>
<#include "common_utils.ftl"/>
<#-- This Component is developed as part of iTarck-MPC-255 which displays the list roles for a particular user who have logined in-->
<#if user.registered && !user.anonymous && page.context.user.id == user.id>
	<#assign isAdmin = false/>
	<#assign userRoles = restadmin("/users/id/${user.id?c}/roles").roles.role/>
	<#if userRoles?? && (userRoles?size >0)>
		<#list userRoles as role>
			<#if role.name?? && ((role.name == "Administrator") || (role.name == "Moderator"))>
				<#assign isAdmin = true/>
			   	<#break>
	  		</#if>
		</#list>
	</#if>
	<#if !isAdmin && (userRoles?size>0)>
		<@generateComponentContent className="custom_roles_component" componentTitle="My Roles" componentStyle="">
			<table class="lia-list-slim">
				<tbody>
					<#list userRoles as rolelist>
					<tr class="lia-list-row">
						<td class="lia-data-cell-primary lia-data-cell-text">
							${rolelist.name}
						</td>
					</tr>	
					</#list>
				</tbody>
			</table>		
		</@generateComponentContent>
	</#if>
</#if>
<#recover>
</#attempt>