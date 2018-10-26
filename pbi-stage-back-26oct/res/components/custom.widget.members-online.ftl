<#include "common_utils.ftl" />
<@generateComponentContent componentTitle="" className="custom-user-online-container" >
<section class=""><!-- container -->
  <article id="membersOnline">
    <div class="col-md-12">
    	<div id="slider1">
		   <#assign onlineQuery = "SELECT count(*) FROM users WHERE online_status = 'online'"/>
		   <#assign onlineCount=restadmin("2.0", "/search?q=" + onlineQuery?url("UTF-8")).data.count/>
		   <div class="online-view">
			   <div class="col-md-6"><span> Users online <span class="online-count">(${onlineCount})</span></span></div>
			   <div class="col-md-6"><a href="/t5/forums/usersonlinepage">View All</a></div>
			   <div style="clear:both"></div>
		   </div>   
    	   <div class="online-users"><@component id="users.widget.users-avatars-online" /></div>
    	</div>
	</div>
	<div style="clear:both"></div>
  </article>
</section><!-- container /-->
</@generateComponentContent>
