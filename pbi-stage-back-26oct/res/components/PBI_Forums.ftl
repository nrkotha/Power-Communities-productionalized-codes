<#assign x= rest("2.0b","/search?q=" + "SELECT title FROM boards where parent_category.id = 'forums'"?url) />

<div id="pbi_forums">
<div class="pbi-box-title pbi-bg-black"><h3>Forums</h3></div>
<#list x.data.items as message > 
<h4 class="pbi-forums-title" target="_blank">${message.title }</h4>
</#list>
</div>