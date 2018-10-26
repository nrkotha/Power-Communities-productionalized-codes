<#assign groups=rest("/groups/list").groups />
<div class="lia-panel" id="pug-list">

<div class="lia-panel-heading-bar-wrapper"><div class="lia-panel-heading-bar lia-bg-black"><span class="lia-panel-heading-bar-title">Power BI User Groups</span></div></div>
<div class="pug-s" >
<#list groups.group as group>
<a href="${community.urls.tapestryPrefix}/${group.id}/gp-p/${group.id}">${group.title}</a>
</#list>
</div>
</div>
