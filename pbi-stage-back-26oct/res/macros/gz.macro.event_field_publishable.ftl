<div class="IsPublishable">
<div class="event-field">
  <label>Publish Event to events.microsoft.com?</label>
    <input value="True" <#if rolesA?seq_contains("Event Publisher") || rolesA?seq_contains("Administrator")><#else>disabled</#if> id="IsPublishable" <#if article_teaser != '' && article_teaser?eval['IsPublishable'] == "true">CHECKED</#if> class="lia-form-type-text lia-form-input-horizontal full-width" type="checkbox" />
</div>
</div>