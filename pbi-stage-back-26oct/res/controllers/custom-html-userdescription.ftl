<#assign uname = http.request.parameters.name.get("uname", "") />

<#if uname?matches("([a-zA-Z0-9-_]+)")>
	<#attempt>
		<#assign userQuery = "SELECT id,login,view_href,avatar,rank.name,kudos_received.sum(weight),messages.count(*),kudos_received,solutions_authored.count(*) FROM users WHERE login = '${uname}'"/>

		<#assign apiVersion = "2.0"/>
		<#assign queryResult = restadmin(apiVersion, "/search?q=" + userQuery?url("UTF-8") + "&restapi.response_style=view").data.items![] />	
		<#if (queryResult?size > 0)>
			<#assign userDetails = queryResult[0]/>
			<div class="custom-user-tooltip">
				<div class="custom-user-avatar">
					<div class="col-md-3 col-sm-3 col-xs-3"><img class="popup-img" src="${userDetails.avatar.message}"/></div>
					<div class="col-md-8 col-sm-8 col-xs-8">
						<p class="popup-user">${userDetails.login}</p>
						<p class="popup-txt">${userDetails.rank.name}</p>
					</div>
					<div style="clear:both"></div>
				</div>
				<div style="clear:both"></div>
				<div class="popup-details">
				  <div class="popup-inner-details">
					  <div class="">
						<#if (userDetails.messages.count > 0)>
							<#assign totalPosts = userDetails.messages.count/>
<#else>
<#assign totalPosts = 0/>
						</#if>
<p><span class="popup-count">${totalPosts}</span><br/><span class="popup-countMsg">posts</span></p>
					  </div>
					  <div class="">
						<#if (userDetails.solutions_authored.count > 0)>
							<#assign totalSol = userDetails.solutions_authored.count/>
<#else>
							<#assign totalSol = 0/>

						</#if>
<p><span class="popup-count">${totalSol}</span><br/><span  class="popup-countMsg">solutions</span></p>
					  </div>
					  <div class="">
						<#if (userDetails.kudos_received.sum.weight > 0)>
							 <#assign totalKudos = userDetails.kudos_received.sum.weight/>
<#else>
<#assign totalKudos = 0/>
						</#if>
<p><span class="popup-count">${totalKudos}</span><br/><span  class="popup-countMsg">likes</span></p>
					   </div>
					   <div style="clear:both"></div>
				  </div>
			       <div style="clear:both"></div>
				</div>
				<div style="clear:both"></div>
				<div class="popup-views">
					<a class="viewProfile" href="${userDetails.view_href}">View Profile</a>
					<a class="sendMsg" href="/t5/notes/privatenotespage/tab/compose/note-to-user-id/${userDetails.id}">Send message</a>
					<div style="clear:both"></div>
				</div>
			</div>
		</#if>
	<#recover>

	</#attempt>
</#if>
  
