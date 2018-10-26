<div class="audience">
    <div class="event-label">
    <label>**Audience</label>
  </div>
  <div class="event-field">
    <select id="e_target_audience" multiple style="height: 92px;">
      <option value="">Select Audience</option>
      <#list audience_array as audience>
        <#assign selected = "" />
        <#if article_teaser != ''> 
        <#assign e_target_audience_array = article_teaser?eval['PrimaryTargetAudience']?split(',') />
        <#list e_target_audience_array as e_target_audience>
          <#if e_target_audience == audience.title>
          <#assign selected = "selected" />
          <#break>
        </#if>
        </#list>
        </#if>
       <option value="${audience.title}" ${selected}>${audience.title}</option>
      </#list>
    </select>
  </div>
</div>