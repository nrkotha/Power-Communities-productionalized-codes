<#if user.registered>
<#assign userId = user.id />
<#assign userName = user.login />
<#assign image = rest("/users/id/"+userId+"/profiles/avatar/size/profile").image />
<div class="lia-panel lia-panel-standard StringDisplayTaplet Chrome lia-component-custom-quicklinks">
<div class="lia-decoration-border">
<div class="lia-decoration-border-top">
<div> </div>
</div>
<div class="lia-decoration-border-content">
<div>
<div class="lia-panel-heading-bar-wrapper">
<#if settings.name.get("profile.language") == "en">
<div class="lia-panel-heading-bar"><span class="lia-panel-heading-bar-title">Welcome,<br />
<span class="lia-user-name">${userName}</span>
<#elseif settings.name.get("profile.language") == "fr">
<div class="lia-panel-heading-bar"><span class="lia-panel-heading-bar-title">Bienvenue,<br />
<span class="lia-user-name">${userName}</span>
</span></#if></div>

</div>
<div class="lia-panel-content-wrapper">
<div class="lia-panel-content"> 
<#if !(image.@null[0]?? && image.@null=="true")> <a href="${user.webUi.url}" class="lia-user-avatar" title="${text.format('profile.module.about.title')}"><span><img src="${image.url}" alt="Avatar" /></span></a> </#if>
<ul class="lia-list-standard">
<li>
<@component id="users.action.my-profile-settings" />
</li>
<li>
<@component id="admin.action.switch-user" />
</li>
<li>
<@component id="users.action.logout" />
</li>
</ul>
<@component id="notificationfeed.widget.indicator"/>
<@component id="notes.widget.summary-new-window" />
</div>
</div>
</div>
</div>
<div class="lia-decoration-border-bottom">
<div> </div>
</div>
</div>
</div>
<#else>
<@component id="community.widget.quick-links" />
</#if>