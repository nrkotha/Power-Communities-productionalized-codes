<!-- Banner -->
<style>
	/******************  Banner  ***********************/
	.custom-welcome #banner {
	    background: url(${asset.get("/html/assets/custom-welcome-banner.jpg")}) no-repeat;
	    background-size: cover;
	    min-height: 277px;
	}
</style>
<#assign cat = env.context.component.getParameter("category")!"" />
<#include "common_utils.ftl" />
<@generateComponentContent componentTitle="" className="custom-welcome" >
<!-- <div class="custom-welcome"> -->
<section>
	<div id="banner">
		<div class=""> <!-- container -->
			<div class="">
				<div>
				  	<article class="solutions "> <!-- container -->
					   <div class="col-md-12">
						 <h1 class="welcome">Welcome, ${user.login}</h1>
						 <!-- <input class="text-field" placeholder="Ask the community..." type="text"/> -->
<@component id="custom.widget.search" showAdvance="default"/>
						 <div>
						 <#assign basePath = ""/>
						 <#if cat !="">
						 	<#assign basePath = "/categories/id/"+cat/>
						 </#if>
						 <#assign solCount = restadmin("${basePath}/solutions/count").value/>
						 <#assign postCount = restadmin("${basePath}/posts/count").value/>
						 <#assign memberCount = restadmin("${basePath}/users/count").value/>
						   <span>${solCount} solutions</span>
						   <span>${postCount} posts</span>
						   <span>${memberCount} members</span>
						 </div>
					   </div>
					</article>
				</div>
			</div>
		</div>
	</div>
</section>
<!--</div> -->
</@generateComponentContent>
<div style="clear:both"></div>