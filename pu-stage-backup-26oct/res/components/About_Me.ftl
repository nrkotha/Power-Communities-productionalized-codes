<#macro liaCustomPanel key="" title="" additionalClasses="" viewAll="">
<div class="lia-panel lia-panel-standard <#if key?trim?has_content> custom-component-${key}</#if> ${additionalClasses!""}">
  <div class="lia-decoration-border">
    <div class="lia-decoration-border-top">
      <div></div>
    </div>
    <div class="lia-decoration-border-content">
      <div>
        <div class="lia-panel-heading-bar-wrapper">
          <div class="lia-panel-heading-bar">
            <span class="lia-panel-heading-bar-title"><#if title?trim?has_content >${text.format(title)}</#if></span>
          </div>
        </div>
        <div class="lia-panel-content-wrapper">
          <div class="lia-panel-content">
<#nested>
            <#if viewAll?? && viewAll?trim?has_content>
            <div class="lia-view-all">
              <a class="lia-link-navigation view-all-link" href="${viewAll!""}">${text.format("general.View_All")}</a>
            </div>
            </#if>
          </div>
        </div>
      </div>
    </div>
    <div class="lia-decoration-border-bottom">
      <div></div>
    </div>
  </div>
</div>
</#macro>


<#assign pageUser = page.context.user/>
<#assign restroot = "/users/id/${pageUser.id}" />
<#assign biography = restadmin("${restroot}/profiles/name/biography").value/>
<#assign rank = rest("${restroot}/ranking/").ranking/>
<#assign location = restadmin("${restroot}/profiles/name/location").value/>

<#assign tumblrUrl = restadmin("${restroot}/settings/name/profile.tumblr").value/>
<#assign facebookUrl = restadmin("${restroot}/settings/name/profile.facebook").value/>
<#assign instagramUrl = restadmin("${restroot}/settings/name/profile.instagram").value/>
<#assign twitterUrl = restadmin("${restroot}/settings/name/profile.twitter").value/>
<#assign pinterestUrl = restadmin("${restroot}/settings/name/profile.pinterest").value/>
<#assign vineUrl = restadmin("${restroot}/settings/name/profile.vine").value/>
<#assign snapchatUrl = restadmin("${restroot}/settings/name/profile.snapchat").value/>
<#assign lineUrl = restadmin("${restroot}/settings/name/profile.line").value/>
<#assign gPlusUrl = restadmin("${restroot}/settings/name/profile.g_plus_url").value/>

<@liaCustomPanel key="about-me" title="custom.about-me">

<div class="visit_info">

    <div class="img_icons">
        <#if facebookUrl!="" && utils.html.stripper.from.gdata.strip(facebookUrl)?starts_with("http")>
        <a href="${utils.html.stripper.from.gdata.strip(facebookUrl)}" target="_blank"><img alt="" src="${asset.get("/html/assets/facebook.png")}" /></a>
        </#if>
        <#if twitterUrl!="" && utils.html.stripper.from.gdata.strip(twitterUrl)?starts_with("http")>
        <a href="${utils.html.stripper.from.gdata.strip(twitterUrl)}" target="_blank"><img alt="" src="${asset.get("/html/assets/twitter.png")}" /></a>
        </#if>
        <#if instagramUrl!="" && utils.html.stripper.from.gdata.strip(instagramUrl)?starts_with("http")>
        <a href="${utils.html.stripper.from.gdata.strip(instagramUrl)}" target="_blank"><img alt="" src="${asset.get("/html/assets/instagram.png")}" /></a>
        </#if>
        <#if gPlusUrl!="" && utils.html.stripper.from.gdata.strip(gPlusUrl)?starts_with("http")>
            <a href="${utils.html.stripper.from.gdata.strip(gPlusUrl)}?rel=author" target="_blank"><img alt="" src="${asset.get("/html/assets/googlep.png")}" /></a>
        </#if>
        <#if pinterestUrl!="" && utils.html.stripper.from.gdata.strip(pinterestUrl)?starts_with("http")>
        <a href="${utils.html.stripper.from.gdata.strip(pinterestUrl)}" target="_blank"><img alt="" src="${asset.get("/html/assets/pinterest.png")}" /></a>
        </#if>

        <#if tumblrUrl!="" && utils.html.stripper.from.gdata.strip(tumblrUrl)?starts_with("http")>
        <a href="${utils.html.stripper.from.gdata.strip(tumblrUrl)}" target="_blank"><img alt="" src="${asset.get("/html/assets/tumblr.png")}" /></a>
        </#if>

        <#if snapchatUrl!="" && utils.html.stripper.from.gdata.strip(snapchatUrl)?starts_with("http")>
        <a href="${utils.html.stripper.from.gdata.strip(snapchatUrl)}" target="_blank"><img alt="" src="${asset.get("/html/assets/snapchat.png")}" /></a>
        </#if>
        <#if vineUrl!="" && utils.html.stripper.from.gdata.strip(vineUrl)?starts_with("http")>
        <a href="${utils.html.stripper.from.gdata.strip(vineUrl)}" target="_blank"><img alt="" src="${asset.get("/html/assets/vine.png")}" /></a>
        </#if>
        <#if lineUrl!="" && utils.html.stripper.from.gdata.strip(lineUrl)?starts_with("http")>
        <a href="${utils.html.stripper.from.gdata.strip(lineUrl)}" target="_blank"><img alt="" src="${asset.get("/html/assets/line.png")}" /></a>
        </#if>
    </div>
</div>

<div class="post_wrap">
       <@component id="common.widget.user-avatar" user="${pageUser.id}" avatarDisplaySize="profile" />
<div class="text_wrap">
        <h3>${pageUser.login}</h3>

        <#if (rank.display.left_image?? && rank.display.left_image?size gt 0 && rank.display.left_image.url?has_content)>
            <img title="${rank.name}" alt="${rank.name}" src="${rank.display.left_image.url}" />
        </#if>
        ${rank.name}
        <#if (rank.display.right_image?? && rank.display.right_image?size gt 0 && rank.display.right_image.url?has_content)>
            <img title="${rank.name}" alt="${rank.name}" src="${rank.display.right_image.url}" />
        </#if>
    </span>
    <span class="channelName">${location}</span>
    <div>
        <#if user.id == pageUser.id>
            <a class="edit_button" href="/t5/user/myprofilepage/tab/personal-profile">${text.format("custom.about-me.edit-profile")}</a>
        </#if>
    </div>
</div>

</div>
<div class="bio-wrapper">
   ${biography}
</div>
</@liaCustomPanel >