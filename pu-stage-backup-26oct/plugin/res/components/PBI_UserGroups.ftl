<#assign x= rest("2.0b","/search?q=" + "SELECT subject,view_href FROM messages where conversation.style =  'group'"?url) />

<div id="pbi_ug">
<div class="pbi-box-title pbi-bg-black"><h3>User Groups</h3></div>
<#list x.data.items as message > 
<a class="pbi-ug-title pbi-a" href="${message.view_href}" target="_blank">${message.subject}</a>
</#list>
</div>