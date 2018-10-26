<#assign showAdvance= env.context.component.getParameter("showAdvance")!"false" />
<#assign defToComm= env.context.component.getParameter("defToComm")!"true" />
<#assign hideGran= env.context.component.getParameter("hideGran")!"true" />
<div id="customSearchBar">

<#if showAdvance=="default">
<@component id="common.widget.search-bar"/>
<#else>
<@component id="common.widget.search-bar" defaultToCommunity=defToComm showAdvancedSearchLink=showAdvance hideGranularity=hideGran/>
</div>
</#if>