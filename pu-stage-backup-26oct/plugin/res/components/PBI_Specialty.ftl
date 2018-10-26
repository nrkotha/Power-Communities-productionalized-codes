<#assign x= rest("2.0b","/search?q=" + "SELECT id,view_href,title FROM boards where parent_category.id = 'Specialty'"?url) />

<div id="pbi_specialty">
<div class="pbi-box-title pbi-bg-black"><h3>Specialty</h3></div>

<#list x.data.items as message >
<a class="pbi-specialty-title" href="${message.view_href}" target="_blank">${message.title}</a>
</#list>
</div>