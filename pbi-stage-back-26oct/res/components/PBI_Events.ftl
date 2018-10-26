<#assign x= rest("2.0b","/search?q=" + "SELECT id,title FROM boards where parent_category.id = 'Events' ORDER BY position ASC"?url) />



<div id="pbi_events">
<div class="pbi-box-title pbi-bg-black"><h3>Events</h3></div>
<#list x.data.items as message > 

<h4 class="pbi-events-title" target="_blank">${message.title }</h4>
<#assign y = rest("2.0b","/search?q="+ "SELECT subject,view_href FROM messages WHERE board.id = '${message.id}' AND depth = 0 ORDER BY post_time DESC LIMIT 1"?url)/>
<#list y.data.items as _y>
<div class="pbi-events-latest-topic"><span class="pbi-events-latest-topic-text">Latest Topic - </span><a class="pbi-events-latest-topic-link" href="${_y.view_href}" target="_self" >${_y.subject}</a></div>
</#list>
</#list>
</div>