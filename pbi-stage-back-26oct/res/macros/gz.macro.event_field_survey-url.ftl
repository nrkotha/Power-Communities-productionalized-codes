<div class="survey_url">
    <div class="event-label">
     <label>**Survey URL</label>
  </div>
  <div class="event-field">
    <input <#if rolesA?seq_contains("Event Survey") || rolesA?seq_contains("Administrator")><#else>disabled</#if> id="survey_url" <#if article_teaser != '' && article_teaser?eval['SurveyUrl']??>value="${article_teaser?eval['SurveyUrl']}"</#if> class="lia-form-type-text lia-form-input-horizontal full-width" type="text" placeholder="Survey URL" />
  </div>
</div>