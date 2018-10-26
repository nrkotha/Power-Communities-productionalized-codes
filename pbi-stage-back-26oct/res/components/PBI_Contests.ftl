<#assign x= rest("2.0b","/search?q=" + "SELECT id,title,view_href FROM boards where parent_category.id = 'contests' ORDER BY views DESC"?url) />

<div id="pbi_contests">
<div class="pbi-box-title pbi-bg-black"><h3>Contests</h3></div>
<#list x.data.items as message > 
<h4 class="pbi-contests-title" href="${message.view_href}" target="_blank">${message.title}</h4>
<#assign y = rest("2.0b","/search?q="+"SELECT subject,view_href FROM messages WHERE board.id = '${message.id}' AND depth = 0 ORDER BY post_time DESC LIMIT 1"?url)/>


<div class="pbi-contest-latesttopic">
<#list y.data.items as message1 > 
<a class="pbi-contests-latesttopic-link" href="${message1.view_href}">${message1.subject}</a>
</#list>
</div>

</#list>
</div>