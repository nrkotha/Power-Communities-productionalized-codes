<#assign messages = rest("/topics/style/blog/recent?page_size=3").messages />
<div class="lia-panel lia-panel-standard custom-uservoice-ideas">
  <#if messages.message?size gt 0>
    <div class="lia-panel-heading-bar-wrapper">
	<div class="lia-panel-heading-bar">
      <span class="lia-panel-heading-bar-title">${text.format("custom.component.latest_three_blog_articles.title")}</span>
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
          <span class="author">${posted_by_label} <#if ((posted_by_userid != "") && (posted_by_userid != "Anonymous"))><@component id="common.widget.user-name" user="conv:${message.author.login}" /></#if></span>
        </div>
      </div>
      <div class="custom-article-teaser">
        <#if message.teaser?length gt 0>
          ${message.teaser}
          <span class="custom-read-more"><a href="${message.@view_href}">${text.format("custom.component.latest_three_blog_articles.read_more")}</a></span></br>
        </#if>		
      </div>
    </div>
  </#list>
</div>