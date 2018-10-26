<div class="pbi-box-title pbi-bg-yellow"><h3>Latest Topics</h3></div>

<h2>Recent Blog Articles</h2>
<#-- Make the Community REST API v1 calls to get the messages. Notice that with API v1 we need to make a separate call to get the messages from each board. -->
<#assign recent=rest("/boards/id/Community/topics/recent?page_size=30").messages />

<#list recent.message as t>
<h4>${t.subject}</h4>
</#list>