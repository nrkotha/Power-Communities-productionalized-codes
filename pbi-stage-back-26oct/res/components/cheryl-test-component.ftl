<#assign users=restadmin("/roles/id/3/users").users />
    <#list users as users>
    	<div>
	   <#list users.user.email as u>
           <span>Admin: </span>
	       ${u}
               </br>
	   </#list>
	</div>
    </#list>
