<#if coreNode.id == "RD_Events" && page.name == "CategoryPage">
        <#attempt>
		<#assign rolesA = [] />
		<#assign title = "Sign in to create an event"/>
		<#assign class="disabled"/>
		<#if !user.anonymous>
			<#assign userRole = restadmin("/users/id/${user.id}/roles").roles.role />
			<#list userRole as role >
				<#assign rolesA = rolesA + [role.name] />
			</#list>
			<#if !rolesA?seq_contains("Event Author")>
			   <#assign title = "This field requires special permissions. Learn More"/>
			   <#assign class="disabled"/>
			<#else>
			   <#assign title = "Create an event."/>
               <#assign class=""/> 
			</#if>
		</#if>	
		<#recover>
		    <#assign class=""/>
			<#assign rolesA = [] />
		</#attempt>
		<div class="custom-create-post">
				<a class="${class}" href="/t5/forums/postpage/board-id/Events" >Create an Event</a>
		</div>
		<div class="exclamation-circle">
		   <span title="${title}" class="lia-fa-icon lia-fa-exclamation-circle "></span>
		</div>
		<style>
			.custom-create-post{
				display: inline-block;
				vertical-align: middle;
				width: 17%;
			}
			.BreadCrumb.crumb-line.lia-breadcrumb.lia-component-common-widget-breadcrumb{
				display: inline-block;
				vertical-align: middle;
				width: 80%;
			}
			.custom-create-post a.disabled {
				pointer-events: none;
				opacity: 0.5;
			}
			.exclamation-circle {
				display: inline-block;
			}
			.lia-fa-exclamation-circle:before {
				content: "\f06a";
				font-family: FontAwesome;
				margin-left: 5px;
				color: #3F56D3;
			}
		</style>
</#if>