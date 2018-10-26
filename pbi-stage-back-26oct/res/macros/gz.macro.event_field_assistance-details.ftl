<div class="assistance_details">
  <div class="event-label">
   <label>Event Assistance Details</label>
  </div>
  <div class="event-field">
    <input <#if rolesA?seq_contains("Event Assistance") || rolesA?seq_contains("Administrator")><#else>disabled</#if> id="assistance_details" <#if article_teaser != '' && article_teaser?eval['AssistanceDetails']??>value="${article_teaser?eval['AssistanceDetails']}"</#if> class="lia-form-type-text lia-form-input-horizontal full-width" type="text" placeholder="Assitance Details" />
  </div>
</div>