<!-- Online members -->
<style>
.user-online-container .UserAvatar.lia-user-avatar {
    position: relative;
}
.user-online-container .UserAvatar.lia-user-avatar::after {
	content: " ";
    background-color: #38d487;
    border: solid 2px #ffffff;
    display: inline-block;
    width: 15px;
    height: 15px;
    border-radius: 50px;
	position:absolute;
	top: 22px;
    left: 25px;
}
.user-online-container .UserAvatar .lia-user-avatar-message {
	width: 36px;
    height: 36px;
    border-radius: 50px;
}
.user-online-container .lia-panel-heading-bar-wrapper {
	display: none
}
</style>
<#include "common_utils.ftl" />
<@generateComponentContent componentTitle="" className="user-online-container" >
<section class=""><!-- container -->
  <article id="membersOnline" class=""> <!-- container -->
    <div class="col-md-3 -members-online">
    	<#assign onlineQuery = "SELECT count(*) FROM users WHERE online_status = 'online'"/>
    	<#assign onlineCount=restadmin("2.0", "/search?q=" + onlineQuery?url("UTF-8")).data.count/>
	   <span>${onlineCount} members online</span>
	</div>
    <div class="col-md-9">
    	<div id="slider1">
    		<@component id="users.widget.users-avatars-online" />
    	</div>
	</div>
	<div style="clear:both"></div>
  </article>
</section><!-- container /-->
</@generateComponentContent>