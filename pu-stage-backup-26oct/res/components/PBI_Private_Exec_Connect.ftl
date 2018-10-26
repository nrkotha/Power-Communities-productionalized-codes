<#assign x= rest("2.0b","/search?q=" + "SELECT title,view_href FROM boards where parent_category.id =  'PrivateExecConnect'"?url) />

<div id="pbi_pec">
<div class="pbi-box-title pbi-bg-black"><h3>Private-Exec-Connect</h3></div>
<#list x.data.items as message > 
<a class="pbi-pec-title" href="${message.view_href}" target="_blank">${message.title}</a>
</#list>
</div>