<!-- gz.event-custom-message-page -->
<div class="lia-quilt-column lia-quilt-column-24">
  <div class="lia-quilt-column lia-quilt-column-24 event-user">
    <div class="event-user-avtar">
      <@component id="author"/>
    </div>
    <span class="event-user-name">
      <a href="">${env.context.message.author.login}</a></span>
    <span class="event-posted-date">on ${env.context.message.postDate?string["MM/dd/yy"]} at ${env.context.message.postDate?string["HH:mm "]}</span>
    <div class="event-user-rank"><@component id="author-rank"/></div>
  </div>
  <div class="event-body lia-quilt-column-24"><@component id="body"/></div>
  <div class="event-actions lia-quilt-column-24">
  	<@component id="actions"/> 
   	<@component id="quickreply"/>
    <@component id="message-view.widget.action-menu" renderOrder="message-action-menu"/> 
    <@component id="share-button"/> 
    </div>
  <#if env.context.message.uniqueId == page.context.message.uniqueId && !user.anonymous>
  <div class="event-custom-quicky-reply lia-quilt-column-24">
  	<#attempt>
  		<#assign userAvatar = rest("2.0", "/search?q=" + "select avatar from users where id = '${user.id}'"?url).data.items />
  	<#recover>
  	</#attempt>
  	<div class="event-user-login">
  		<#list userAvatar as getAvatar>
  		<a href="/t5/user/viewprofilepage/user-id/${user.id}">
  			<img class="lia-user-avatar-message" title="" alt="${user.login}" src="${getAvatar.avatar.profile}">
			</a>
			</#list>
  	</div>
    <div class="text-area-container">
      <textarea class="post_message" placeholder="Write a comment..."></textarea>
    </div>
    <div class="button-container" style="position:relative;">
      <div class="done_message" style="display:none;"></div>
      <div class="ajax_loader" style="display:none;">
        <div class="c-progress f-indeterminate-local f-progress-large" role="progressbar" tabindex="0">
        <span></span>
        <span></span> 
        <span></span> 
        <span></span> 
        <span></span> 
      </div>
      </div>
      <input title="" class="lia-button lia-button-primary lia-button-Submit-action" value="Post" name="submitContext" type="submit">
    </div>
  </div>
  </#if>
</div>
