<#assign messages = rest("/topics/style/blog/recent?page_size=3").messages />
<div class="lia-panel lia-panel-standard custom-uservoice-ideas">
  <#if messages.message?size gt 0>
    <div class="lia-panel-heading-bar-wrapper ">
	<div class="lia-panel-heading-bar lia-bg-black">
      <span class="lia-panel-heading-bar-title">${text.format("Community Blog")}</span>
    </div>
	</div>
  </#if>
  <#list messages.message as message>
    <#assign posted_by_userid = message.author.login?string />
    <#assign posted_by_label = text.format("custom.component.latest_three_blog_articles.posted_by") />
    <div class="custom-recent-article-wrapper">
      <div class="custom-article-header">		
        <div class="custom-article-subject">
	      <a href="${message.@view_href}">${message.subject}</a>
	    </div>
        <div class="custom-article-posted-by">
<div class="author-img"><img src="message.author.photo" alt="${message.author.login}" />
          <span class="author"> <#if ((posted_by_userid != "") && (posted_by_userid != "Anonymous"))><span>${message.author.login} </span></#if></span>
        </div>
      </div>
      
    </div>
  </#list>
</div>